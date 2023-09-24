Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B10F653
	for <oe-lkp@lists.linux.dev>; Sun, 24 Sep 2023 05:08:59 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3adcae1e9f6so694767b6e.0
        for <oe-lkp@lists.linux.dev>; Sat, 23 Sep 2023 22:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695532138; x=1696136938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iihM7fNHraKjWmXna1UvLf+5E692wDKvi6IGfIk1b2A=;
        b=X09TNqxxWoPLl6ZeKcGAt9DmCjCbNVG/VOVBSGvQZruwGranUSVmFYdLXL1usohK5x
         g5EYCCxgbF6i7dEWgp1+tVbsap08TGNMgyOEfbd+Mmy88rn5doNFNHZZGkSMkylbPGSh
         pY7/o/C4XtX3n8iAOnGtN/mHdvlFJgAcBe8j0A+FukAYLBdp7iLwdxOylHnbUueyR8+w
         eEFu4ZJfSWdJdr+BFkCsfoLeeON8B8OFzgqGL8XRowMuqmTe5ghQ+aA51ymnecvwUBAC
         XkyXviS38yjE6A+HTMm/sO+KjuNCn1526Q6h3vNq3i+T63KOE80gSlNIZTH9IKikGLB8
         t57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695532138; x=1696136938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iihM7fNHraKjWmXna1UvLf+5E692wDKvi6IGfIk1b2A=;
        b=hT+y1A4Z9VvhND3uX9c0+3FEYmFOdF8lsus5XA/shK5VGkA8rgjWYEo6grI1xQcDfX
         dFVi08AXMS/TDgSslA7QRqkHe9FnQZrkHKRF5m66JIl1CRMna6XKDw5drG8FXxhivByp
         rZe5TcdNtS+lnaJrU5N+Ho/atQAejY1T0J2eUZoycdLCM1wTgg8X2iaMmq2tsCY8nQoi
         hN8AQfwle0zE4IOKeU1qunUzg1jyqqQcrNX9eHfPEEcKw6veYMywwMV5YrENZ2nQ93MJ
         mhYqAqSSkTD0+DCSzUAyZsiMxOgXf6wVPa8dmyi1QoWpiCb7+lxnnDNmYWGN702JJmKW
         I3lA==
X-Gm-Message-State: AOJu0Yz0VuvEy3g8uLZUBIZ1GH4wlfGC/OeqmuiSrnnn8xTALHybKbwA
	18jEYdBT/knMdPHn/Wr9bqE=
X-Google-Smtp-Source: AGHT+IEWXTeY45Kdzy/4A5emiEePpYA2DmqOJKpzmWxay/53yMaIrDRx8U2UFxT52j4G3C6Eq9gUjw==
X-Received: by 2002:a05:6870:c105:b0:1d6:790f:2007 with SMTP id f5-20020a056870c10500b001d6790f2007mr3151863oad.4.1695532138132;
        Sat, 23 Sep 2023 22:08:58 -0700 (PDT)
Received: from node202.. ([209.16.91.231])
        by smtp.gmail.com with ESMTPSA id dk7-20020a0568303b0700b006b96aee5195sm1350018otb.11.2023.09.23.22.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 22:08:57 -0700 (PDT)
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
	Reuben Hawkins <reubenhwk@gmail.com>,
	Jan Kara <jack@suse.cz>
Subject: [PATCH v3] vfs: fix readahead(2) on block devices
Date: Sun, 24 Sep 2023 00:08:46 -0500
Message-Id: <20230924050846.2263-1-reubenhwk@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Readahead was factored to call generic_fadvise.  That refactor added an S_ISREG
restriction which broke readahead on block devices.

This change swaps out the existing restrictions with an FMODE_LSEEK check to
fix block device readahead.

The readahead01.c and readahead02.c tests pass in ltp/testcases/...

Fixes: 3d8f7615319b ("vfs: implement readahead(2) using POSIX_FADV_WILLNEED")
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Reuben Hawkins <reubenhwk@gmail.com>
---
 mm/readahead.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index e815c114de21..0ff6fffe3c84 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -734,8 +734,7 @@ ssize_t ksys_readahead(int fd, loff_t offset, size_t count)
 	 * on this file, then we must return -EINVAL.
 	 */
 	ret = -EINVAL;
-	if (!f.file->f_mapping || !f.file->f_mapping->a_ops ||
-	    !S_ISREG(file_inode(f.file)->i_mode))
+	if (!(f.file->f_mode & FMODE_LSEEK))
 		goto out;
 
 	ret = vfs_fadvise(f.file, offset, count, POSIX_FADV_WILLNEED);
-- 
2.34.1

