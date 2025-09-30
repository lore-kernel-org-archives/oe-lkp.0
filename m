Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EFB2D2381
	for <oe-lkp@lists.linux.dev>; Tue, 30 Sep 2025 23:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759275007; cv=none; b=bCsOxl3zB6LktyCotO0WdMg8CNXJqTX94zk1E5ZRET91pQhlCLXmSYuDqJeSyY9g3k9OczzNrewBOKm9tuaAzUy4tCkGVKmgtgH2vYwUkGGgQunJ+9ECcUeA4EGUEE+Rfqkm7YwgII7zNQOlfYwtd7a3p90q2cbjU90VBTakzE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759275007; c=relaxed/simple;
	bh=gWZTJSIIbrP380uCP//L36Rf0RBfgxrLDVwOgWvpHuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox+FDR2m3jQc5Gd6DNBnFl9fvS/mlx7/y0rXuBkAfUsf0UvdBWqyWI77wycstaJ2bP7G/Vj5sXHpHibcVAeAImhYxljdhnwVAxfDxQJ6FyWqomYgIhSEHlKBVTj1Oc7SlBQmzQE3l0jZWGI+OdiW3i/kyHrncDUuAiiYc3XIhcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEXBvlMo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEXBvlMo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3f0134ccc0cso4432287f8f.1
        for <oe-lkp@lists.linux.dev>; Tue, 30 Sep 2025 16:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759275004; x=1759879804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKocoFyhYs5voJ1j0rINOqN8fPDxe4oLJZbuE7DLMzA=;
        b=YEXBvlMoFhM/w4tKzergMztzT6L3i8p3Y90u7AKWZRyPTNRe1IajE/nZjxQpPYW93q
         Ct5Xzjn730SwC2dUUH1Bll++UJoFMFGAUhGX/c4CwVY98Ij1URQ/zQqDTB6wnFqcqko4
         StAkwkO0Y52yAxL4q/l6qyrXgvN52qRgI7WRea2IJTZrMlSIeWXzxTVEfkGh63lVKxNg
         JzmZoCuD/pKhA6kNwjllhiMLSlaHoNirVYBT1qzOl7OPc8QBjmqxNFz34qwAXbSfUp87
         IWnHNhLCYuimiE8ny6E+a6LnKjhcnl2OjDXXpGyf8V/25I4BEcouqlLDqXaZ5zDEyBsF
         0/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759275004; x=1759879804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKocoFyhYs5voJ1j0rINOqN8fPDxe4oLJZbuE7DLMzA=;
        b=RIVMpAHZ3tbq/+M5pZHhXZ/dVldgNxTJxlb2TbuATYUCCP/su+BRZkWiEDxXU8JBxS
         M4yUyKciEbg8kp5ND6qbTYkgiopOAAyFDkyjjS15NnfAhY0Rh6tmT171wSp4Z1SC8JVc
         MbUTYoKohMMGm7YwlrLJ/14YV0ucNOlxWrhdYeL6LM6RrpOYFu8UFHbzlhvpQPyW0yZW
         0l+l635EsEMAICuE4HFdeelKZCZZs+AwOkUcawKGiE4u7ECl/+xaMHCccn9DXVmUbKuY
         W/L37xPdEtCAgrAsacsp/BvED4Fx0Q8Pj4o+ygSdj5VWyCZECuVfsor/sV4F9IblzxRd
         6Cww==
X-Forwarded-Encrypted: i=1; AJvYcCXOiNo7QT66fgNae7tBfS0z1uOsmHysiOjuygZOSWtDUJI13EDdVw4IgMLF9ZVqONwXdIcu88A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx7uLFhj8ykj8gVwPmFE/8x0rACT58UqbW990YuTZOo7boIa3z
	02XLCnKE75A5ztgPJQHy7b1jesnwMV2s+49srbpzBCw+RGl3EF3m7jXI
X-Gm-Gg: ASbGncu4sM93nmEpbbFzWerMqMfQUl+ZCFW2QBvY12zA9gD6bT/nyjL6OnoUwJZyib0
	/pIqgJOwlTJ1NgYCzRWSA8krNMA2AS1xz1mXxbULVibJwmdSLQSzIBX7ZDFM2L4V/PZkNNrNwaB
	i3Vs3Wg+Dl+IfHCDSWGfAwy0+Xzo54lLQ3ZoP8LrlO+fKCIyWhuMulHNdUKeLlWyeTO1XF0Ypzt
	gHstUJuNNCkGoBL5Bv9mC3R+1pSr4l9R84StIGKdFYNzMURRsqACcDkdbCYX2vvdIafcBFHnhkS
	clfTIWDjZ5ahopsqZ/RBtJnVYiCWBuVfd3y7FcMFDcn7LAcQhpf060cASewcziLtRG05AHFAmut
	a09EiQyROjRrDoxXaInXKsUXSXlGncsVU1ixujtGSESZGSaNW0yMfMp9EzhiP7FAdia+oE4pTBE
	tRa3y9NkYvYVge3SXnC8hJFQ==
X-Google-Smtp-Source: AGHT+IGrlrBcqkdbjFn8gHHNIH9V5H/OJUSkp8w+fjG+KJIkz3Qh/I+P4TAxPxRIKI9Oo1ZDCt+OuA==
X-Received: by 2002:a05:6000:2381:b0:3ec:e0d0:60e5 with SMTP id ffacd0b85a97d-425577f0a74mr1070502f8f.15.1759275003933;
        Tue, 30 Sep 2025 16:30:03 -0700 (PDT)
Received: from f.. (cst-prg-21-74.cust.vodafone.cz. [46.135.21.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb2eesm25156984f8f.12.2025.09.30.16.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 16:30:03 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	josef@toxicpanda.com,
	oe-lkp@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	ltp@lists.linux.it,
	oliver.sang@intel.com,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH] f2fs: don't call iput() from f2fs_drop_inode()
Date: Wed,  1 Oct 2025 01:29:57 +0200
Message-ID: <20250930232957.14361-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202509301450.138b448f-lkp@intel.com>
References: <202509301450.138b448f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iput() calls the problematic routine, which does a ->i_count inc/dec
cycle. Undoing it with iput() recurses into the problem.

Note f2fs should not be playing games with the refcount to begin with,
but that will be handled later. Right now solve the immediate
regression.

Fixes: bc986b1d756482a ("fs: stop accessing ->i_count directly in f2fs and gfs2")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202509301450.138b448f-lkp@intel.com
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2619cbbd7d2d..26ec31eb8c80 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1769,7 +1769,7 @@ static int f2fs_drop_inode(struct inode *inode)
 			sb_end_intwrite(inode->i_sb);
 
 			spin_lock(&inode->i_lock);
-			iput(inode);
+			atomic_dec(&inode->i_count);
 		}
 		trace_f2fs_drop_inode(inode, 0);
 		return 0;
-- 
2.43.0

