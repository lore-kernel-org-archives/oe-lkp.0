Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D989194AD1
	for <oe-lkp@lists.linux.dev>; Mon, 17 Feb 2025 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799059; cv=none; b=QVudBZtw3ddKk6IWOUAdQJzsSsmJkgSj4/Nr+IRQ7tzUBNcsjTxpZQpnumrvUCIhrZC9uP2/KanquFV5fdjCSztYsPVl9hJSONdkkN8SXnobwKedPR1yFg3woQ/LAs8heWEZAFmhqyWuwHVUQmcvCHgOom+mVWZncK7hXC4E2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799059; c=relaxed/simple;
	bh=Ci1COuX6Tex2zAyW3UWO2Ew42J/7mVCWOO5StT0eol4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FvYVWj+k0U/CddvPOavSTbtJcEKY/A5zMWIM+jB7y62e9EUcLA5vsVsRCBi8xR3EWvuJQse8mstgSNGhNrQNOH1l5CvG2Nd2v45JsT6FUuuqT+hITWRM1yq2rkWVw175F2I01b5GMDDtfn4f9WncRWA0g3D26SuLztinfdemWJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGsUIfCi; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGsUIfCi"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-471bb02fc88so37775381cf.3
        for <oe-lkp@lists.linux.dev>; Mon, 17 Feb 2025 05:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739799056; x=1740403856; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fOEexKTjiuD42jQvv3hpmelca47VqT1a18N1JHI7NKg=;
        b=NGsUIfCi+PtUt4eXV6bKkrXxdgukw83tyTaIlQP7PcxXXF5QxXjT1EFFs1WVSvzjoD
         5Foov83WXTRAUoHFMcW6CntH5M7wDbrV6SnOx+cTCoZPKabl4QFjoNS8FeyCmXw0BN1C
         57b2Lz709f6nMUAAoaLoLxJi9RlcYCLgqJTGfMKdU56PvaF0qSHUYk5tiZIBfm4RrZoF
         SLE3YqUlFITZn9/+dR/EtrdHc7uTAZRA0bdbwX+ro9dEjKLJ/e6jXfjo3CT3ifMkJThK
         UbXfcv9FpVIw/hpdqUmscrcWMFV2bkgT+UMwWEhtnEuTgyXkQoXUVLLIv9CcasQvdbSM
         Rc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739799056; x=1740403856;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOEexKTjiuD42jQvv3hpmelca47VqT1a18N1JHI7NKg=;
        b=ZVo9vFEoyt9hcngfg8kYHRHh7bUHcIuJQkIS7wsKxn1fVJslOXwi9SPetUlE7I1wJG
         M3kE5ztqcFZjMYDtIgusrQBPsxS27qjNYkoT1QTszxb43GCsxIDpRzcBPG+wYZy0vx6d
         uVLA7KHc+ktOjn4OSr9vApcJha2G/bljWyfjgcB+yyrtm48cMCU5ta2Sj3KE9kxW7uja
         ILl5PX03vWpKrjMonhRbpx+wIytSP9Z81aXM7EEf5t1KE/gRAURDRzoAtMfV3Sdf1t3r
         /HUAOyl4Zw7AzbmfAYrUmCvnVdehJAqTxsZ8mdaCNgb25SFftAZaOzO2f+nwg9lp4psS
         cSbg==
X-Forwarded-Encrypted: i=1; AJvYcCWO8r7GgLVVgVuP0hXXX2rVFCA9lEy+d2m/Jn2qCzzA4mEjo5K23YYA+A8OV0G31NBaxbsUHzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNbn502rmKWdINLuOdUVXdRn13XbkguE9O7T6+OgjSkE611a2E
	8nB7xLv+XPJSZp8p4R1S4N1uHOsYKtGFZPGEHIrHWeSdKQu4eHmN
X-Gm-Gg: ASbGncvZQ69QxFiGeG6d1LydWauIgZjheCQ9qaTsmKCQFylTK4nndro6VuT5kx9OG11
	qsLRksDloW+2xGGxszSZ5j5kc5ZFeznmERqjSkubYPxLlLY0TFXDJLWnntQ9xr0+vKXeVQRoTKB
	B2pMADeA6m0iIuOdpWDknKVP8GNxZYCkm6pqGEvDQRrXe0+324lzzLIYkOxqrq8uIc2sNeB+Q5K
	gVyocH3CyRgvRp9UBYQ8mIMnB3a9gXG1KRhtCGySUUnROt3t/BSUayoge04ymV0hzylMcZYydeS
	BxyKKvRvMW750fOWnrD4r3+uFFLkYJzQHrpEdQ==
X-Google-Smtp-Source: AGHT+IEkw/9PhCElM+wJh8NDgNHcMXUDbkc1rj0rJlwgZQWlmQuqZS5NCUWmW4yM2EuXqdVXAhgkwQ==
X-Received: by 2002:ac8:574f:0:b0:471:ac91:966b with SMTP id d75a77b69052e-471dbcc1cfdmr158394571cf.2.1739799056010;
        Mon, 17 Feb 2025 05:30:56 -0800 (PST)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:a82e:ca05:346d:c94f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471c2af3722sm47732511cf.49.2025.02.17.05.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:30:55 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 17 Feb 2025 08:30:44 -0500
Subject: [PATCH] selftets: lib: remove reference to prime_numbers
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-fix-prime-numbers-v1-1-eb0ca7235e60@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAQ6s2cC/x2MSwqAMAwFryJZG7CBKngVceEn1SxaJUURinc3u
 BzevCmQWYUz9FUB5VuyHMnA1RUs+5Q2RlmNgRryDbkOgzx4qkTGdMWZNWPwNjrvZ6IW7Hcqm/Q
 3h/F9P133EwRjAAAA
X-Change-ID: 20250217-fix-prime-numbers-f5202155b226
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 oliver.sang@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Remove a leftover shell script reference from commit 313b38a6ecb4
("lib/prime_numbers: convert self-test to KUnit").

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202502171110.708d965a-lkp@intel.com
Fixes: 313b38a6ecb4 ("lib/prime_numbers: convert self-test to KUnit")
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 tools/testing/selftests/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lib/Makefile b/tools/testing/selftests/lib/Makefile
index c52fe3ad8e98..66dcbe2e39fa 100644
--- a/tools/testing/selftests/lib/Makefile
+++ b/tools/testing/selftests/lib/Makefile
@@ -4,5 +4,5 @@
 # No binaries, but make sure arg-less "make" doesn't trigger "run_tests"
 all:
 
-TEST_PROGS := printf.sh bitmap.sh prime_numbers.sh scanf.sh
+TEST_PROGS := printf.sh bitmap.sh scanf.sh
 include ../lib.mk

---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250217-fix-prime-numbers-f5202155b226

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

