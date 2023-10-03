Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E8163D
	for <oe-lkp@lists.linux.dev>; Tue,  3 Oct 2023 01:57:10 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1dd26c41fc8so78577fac.1
        for <oe-lkp@lists.linux.dev>; Mon, 02 Oct 2023 18:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696298230; x=1696903030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O00OPeBX0OAQavpWTikv1KaJprJXcYLW3QJEgWJmVgY=;
        b=XrttO42FJ3UP8c1ty5nJerckiLixgDDHgjek76OMFtbWeRBm/jNgVMzFXdGRMO37vP
         4waeZ+XELr1czVB3U0grX2cmLO4dzSZBaky1+Z8WmTEqcrPT6QGZsxPqZNFLJaG4STvP
         pB+CyVUuULH7yPPZE4EoU2gp/OCXmgzBh2Oprzy49OeHd/pe23CqkwWy7+puJjXYlVVH
         5wjzobVHw7n7+DiK8aVdSntvUAIlvstlAFqKZMyW94HiTvzaMZuwM/0Idap/QLoxah4F
         n+3Xt9su7rNjEef2JQYlQsH5pU+QhLuq8pijPdvHqRnrg+7jblqF5ilVG4TOjolv5Q2b
         mKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696298230; x=1696903030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O00OPeBX0OAQavpWTikv1KaJprJXcYLW3QJEgWJmVgY=;
        b=xRzMbwhxp3vK7abXjUHK9wOhR9HfoYmktw/zs0kM1mh/iFxpZczfXp+S8QjQ6F7W9O
         O6vo7vvYCUSWzRdQDg49qDO53M+pagnRKp6MDGiBAtpLuHj11mk0sGsYv2TYbAGdfaGA
         JkWIchK2aB6N3maZApXzdYlWrkBytNKlBBT3+ocAOl+eWCkhi2hWPKb6HNL9vxkg/Ldl
         1AHepPC+eqx+O8T/ZHqpUYgDA69qSDM81oQz8qi8/AVaZHTqkpdDKmC8wpHc0SiElWtq
         MrpWM8sfJrjyQB6YIrEgGxryxcIbOlSG/o7kypRgZQuKNz7PhOhHSqkJ4z/4BFyY4wAC
         JZjw==
X-Gm-Message-State: AOJu0YxfY2a/xOaxVZgpYPPuxKrZmMcr+tANuxj0W/qaUtu6uM6ztt3G
	RL0X/id7rteuvknyOwzjJT8=
X-Google-Smtp-Source: AGHT+IGMJhd67lE+Kn9AwqiETrIu/sIPojytQz9RjEUQ8PA8jl9s9zZ3r6SHYmG4F1v3iGBhsR75mg==
X-Received: by 2002:a05:6870:9707:b0:1d5:f814:56a3 with SMTP id n7-20020a056870970700b001d5f81456a3mr15700234oaq.2.1696298229848;
        Mon, 02 Oct 2023 18:57:09 -0700 (PDT)
Received: from node202.. ([209.16.91.231])
        by smtp.gmail.com with ESMTPSA id f22-20020a9d7b56000000b006b9443ce478sm22803oto.27.2023.10.02.18.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 18:57:09 -0700 (PDT)
From: Reuben Hawkins <reubenhwk@gmail.com>
To: amir73il@gmail.com
Cc: willy@infradead.org,
	chrubis@suse.cz,
	mszeredi@redhat.com,
	brauner@kernel.org,
	lkp@intel.com,
	linux-fsdevel@vger.kernel.org,
	oliver.sang@intel.com,
	viro@zeniv.linux.org.uk,
	oe-lkp@lists.linux.dev,
	ltp@lists.linux.it,
	Reuben Hawkins <reubenhwk@gmail.com>
Subject: [PATCH v4] vfs: fix readahead(2) on block devices
Date: Mon,  2 Oct 2023 20:57:04 -0500
Message-Id: <20231003015704.2415-1-reubenhwk@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Readahead was factored to call generic_fadvise.  That refactor added an
S_ISREG restriction which broke readahead on block devices.

In addition to S_ISREG, this change checks S_ISBLK to fix block device
readahead.  There is no change in behavior with any file type besides block
devices in this change.

Fixes: 3d8f7615319b ("vfs: implement readahead(2) using POSIX_FADV_WILLNEED")
Signed-off-by: Reuben Hawkins <reubenhwk@gmail.com>
---
 mm/readahead.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index e815c114de21..6925e6959fd3 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -735,7 +735,8 @@ ssize_t ksys_readahead(int fd, loff_t offset, size_t count)
 	 */
 	ret = -EINVAL;
 	if (!f.file->f_mapping || !f.file->f_mapping->a_ops ||
-	    !S_ISREG(file_inode(f.file)->i_mode))
+	    (!S_ISREG(file_inode(f.file)->i_mode) &&
+	    !S_ISBLK(file_inode(f.file)->i_mode)))
 		goto out;
 
 	ret = vfs_fadvise(f.file, offset, count, POSIX_FADV_WILLNEED);
-- 
2.34.1

