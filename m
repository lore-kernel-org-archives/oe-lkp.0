Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CD41F130A
	for <oe-lkp@lists.linux.dev>; Sat, 10 May 2025 01:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746840991; cv=none; b=NGLTVXAsOoIM5qZ8SgyQNKb1asg9UP0wsLy5itRxKR4V3QWcLykeRdcD53RJ1hnUFKSzbJqCwiTB3FWAGCLNHRijb4P/NsJCntr8mda0zGKkx6Q5MlFqnvb/xxb2fyYQPRwzGV0BwNMI/D+7VUdi36uklKIVS0W3CyDyDVXmdmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746840991; c=relaxed/simple;
	bh=JqYUP0gYITpwIO56NDGK79wZtTPw/VgY4gE78t6lC9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eX5Ju4spoQm5+A3zNO++DIK+PnJ1JJRgfx8aXXZkXplBbouQSHafWm6lCqbN8IieeHpYX4+bTJD6eSTFf7U6cES2DkkcaGkrO1myfZOuAjrCQJ5QMCk7XSxPeXdmf5SvaiMjHp1EsEpZFLIfTlp9IBtuaWXKWn3slUequ6+umIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqpdGa5/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqpdGa5/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so2373984a12.3
        for <oe-lkp@lists.linux.dev>; Fri, 09 May 2025 18:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746840989; x=1747445789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wD9SkKboBNMZ2NtG53GX3UU3m+Xh67ccGkM3pd0hqvQ=;
        b=QqpdGa5/QGdDHnziUSJtOwajSQ2R+3i2+N9GudDZ6zfYs3f9jKNbugP0aXUfVrx2UG
         2AuEHwHjjmcjLizu5Y0vTwKcOAwBvleimNg0m8TTd/X4IaxyjExRBOCrXSOCSb/xfTEh
         SJyxSQhYQVvradNTrkhftCauemQeyvBIuq9OQhkZ83zAFLf9ewxhP9shZMu2hrHkgE8L
         +BDpiGehluP5qQzmRA7M76mAKUxeNvER14s4ueRkRZi8liCcFz9Q5bbeERa478Xm5GmH
         KyoNK3ZZ4OkNgEZuGyuXahb0WDHOiiTaYuBAUIpyJrxb9VoNJ7FIa+mtMUNUgQHfqnPQ
         TitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746840989; x=1747445789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wD9SkKboBNMZ2NtG53GX3UU3m+Xh67ccGkM3pd0hqvQ=;
        b=aNVXQMLRfxZ1yZhFBvznDGNRBsGEbrVvq5yiVA9mBWI4A62eDOWZhKfMJAUfSUusxw
         3QyZiZEMHjNX2RL+Xkrh0KE8l/jAAnvkoJqyuHEUG89tN67D6bTJwI4np7DmRV94C+Xj
         6VKdrz+yVDcesQqLAPEA8JTCd8W2VqCRvQ101ftG4w8yv1tMFfMoOQ5f7JBnvN5ph1Qp
         ghttwvEXaOwukp89PeL8B+blIMcSYPgP3aZy5/j6hMfKtygr+hwuTiBeUrvwyI7f6utG
         pALA6etM+xtHyvAbXqLjS8zOzKIIOe2PIBeGyYmdPhsL5SaI7YL5khEEYXi5XOvT7wZW
         nQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrNtZ9sTQoesvVHEFihau4LhU26mkrwVB61/zPg4g6vh+R4rBk/hgu4HRytj63NV5hgFb4us8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz45tBX0CEzXf8w/VAiTmkPJqBs5NYutyEULFL8D89l0ox+uqc8
	o178HEqqpouKMVLOcEDxYPC8KpuffDmtZaftPyPcCsD5aVcM6ZPK
X-Gm-Gg: ASbGncsaX6Wt/R3JNjoIcxAQJz+hSS8IlJqsKH+OVLo0RF3IN36am8EJZRg7DWq9JrR
	DykWjtVwNGT4wwIF17eOqe2UQQA088636n1b2L/2V3OpwsGFX908wgMJfP/6HCYaK4kYRp5v7NP
	aZprIyXyO6QGpm+iVkrJ147c35JGJ2Vi4LHmisnxCWBZK/eJ3mVn0MFr1kwJg2FLRN98/IMKadr
	H4cYUn1hDBpNTIT+VFcASNvjpb8Um9gQTLlHVlcm08UXMKtJXafbOiNfBCDmCukI64dBBq5UE6R
	Tsgii3a1Wh5jzIYeoqxbRhc4VFb6bro1t8kWOp5BcvVPvMGqZFmnbP7Y1pgRYnmN5Okc65SNFAF
	G3WGfqTasJfhoO4WFdKIZY17BbT9OsIDe+kF8Zg==
X-Google-Smtp-Source: AGHT+IENg0QA4pDDrAf5YXcYOBv5jJnYgaomoJkaWvWaHINOGGkwFUMAt+vGF529iQB2hgnXBoY+FQ==
X-Received: by 2002:a17:903:1904:b0:22e:4d64:821f with SMTP id d9443c01a7336-22fc8b56982mr61314845ad.20.1746840988708;
        Fri, 09 May 2025 18:36:28 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm23902965ad.125.2025.05.09.18.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:36:28 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: john.ogness@linutronix.de,
	pmladek@suse.com
Cc: Jason@zx2c4.com,
	gregkh@linuxfoundation.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	ryotkkr98@gmail.com
Subject: [PATCH] rslib: Add scheduling points during the test
Date: Sat, 10 May 2025 10:35:15 +0900
Message-Id: <20250510013515.69636-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test has been prone to softlockup but stayed unnoticed because
of the printk calls during the test resets the soflockup watchdog by
calling touch_nmi_watchdog(). With the commit b63e6f60eab4 ("serial:
8250: Switch to nbcon console"), the printk calls no longer suppress
the softlockup and warnings can be observed more evidently that shows
the test needs more scheduling points.

Provide scheduling points by adding cond_resched() for each test
iteration on their up to/beyond error correction capacity.

Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
---

Hi!

The discussion on how the printk was preventing
the softlockup can be found here [0].

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/all/202501221029.fb0d574d-lkp@intel.com/
---
 lib/reed_solomon/test_rslib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/reed_solomon/test_rslib.c b/lib/reed_solomon/test_rslib.c
index 75cb1adac..322d7b0a8 100644
--- a/lib/reed_solomon/test_rslib.c
+++ b/lib/reed_solomon/test_rslib.c
@@ -306,6 +306,8 @@ static void test_uc(struct rs_control *rs, int len, int errs,
 
 		if (memcmp(r, c, len * sizeof(*r)))
 			stat->dwrong++;
+
+		cond_resched();
 	}
 	stat->nwords += trials;
 }
@@ -400,6 +402,8 @@ static void test_bc(struct rs_control *rs, int len, int errs,
 		} else {
 			stat->rfail++;
 		}
+
+		cond_resched();
 	}
 	stat->nwords += trials;
 }
-- 
2.34.1

