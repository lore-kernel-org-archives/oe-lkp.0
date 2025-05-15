Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E52580C9
	for <oe-lkp@lists.linux.dev>; Thu, 15 May 2025 03:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747281142; cv=none; b=gYuU0D26YNdyalIzvzlynu4lWx/jLYsX6xzHguGXRY+evvH+3scSzjp3zjVQD9tF+p91XBk5YsRz6yQkYncZi0rFIcPn1MhpoPu2VRFugNAbPAqOkhnI/N1RY5i4D1EYuSPX9OXUDJ6X2LNxGVoadWimK/UjVNXyt9YFqfWjaBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747281142; c=relaxed/simple;
	bh=fA5WjGl8OzCwdqaIDKpGiFrGKSy4SNccRFrd0ME3Z7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sOQohsWcOnPCtcCGnkAoj7qFINrBk88gysgdVpEQQOGIcbxBq/oV+4/iTLSTZ43vZd8VtD7DUMn4WZdxIFwAwgUhc14SfR4avyexiMCuVj0DlSLSElzrB4K24X2mtXrGTSKjBOD9OCGNED3OAluZ96fjwP+9vPVudWx5d3Phun0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4ktpbXz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4ktpbXz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22fa414c497so5889345ad.0
        for <oe-lkp@lists.linux.dev>; Wed, 14 May 2025 20:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747281140; x=1747885940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxUHbPUHgnMm/JVb3wKb9mNsMs1RzSv1R7MGL5FIcTg=;
        b=O4ktpbXzKJNTvgNa2yQhuK4LyBDrhWv1rLQS5n2JDil68yggQU/6fRZLLetsS+IdCW
         CBICpcnlfAtM5AljygM0kiQg6GD6ZMSUyeKRQYDQbZYN1mxZdphOaKRfLHsryD7cqT8W
         o3w4Ve+6IBvk/t0dhxi0G4lblRK27CHS4lcYj/ucp5Ggc8hHOn5ASFNxv8uBdzxvmejH
         40yqw9dL5XWBclY9aqkvM4T9nWYM00RW0MyXDmoEUBVwv53QjwXaWyBtnP1ixH60ks9H
         MSJQ8x28xmFLixantXK3XmtHLVEvcDSh2S7TWFbm2rG7RBuuwihSOUfareFuFwQICgxG
         W+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747281140; x=1747885940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxUHbPUHgnMm/JVb3wKb9mNsMs1RzSv1R7MGL5FIcTg=;
        b=nYfszrRJXYszWHpjI3BtSBIHktWDBNOg7U91nxIw1gJu0TXYU2ltUPqU23AHoW1QAO
         A+Px2MC2NfIMO1G6A9V224ZmVuuv0Aoj16QplBKigItCP09vYeWN7Rb5xEZfUqNXaY0V
         o/IBwijK8PuwnCxn8hBPxfNYuXxRI2+l7pLHY82p7Ig+FXWNi+5WgOZLskXZdaaOxBsN
         akUhUviv65aM6A0Eh4D7/SODj0PNsPO6hum8vRWOJDXkNXCg3QLHgQskam6B73IGTDDS
         6JUZ4lrPbaikO7r0KJb7JudNAqJUjVsyto5GzBVrYdO3D9LAKPzj4U7cJgq7HcQnX+L6
         759Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1Cr81+xvnmWrvgFNPTnUYtp5kN2bvZNNgxHlwA3sDvzPRkb/3TrFOaj8egWxmZWAA3bqgdqY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcjz4vctGEzDr8wmA0eibzs0YhgzHcn7CRtk9Di6Tbs1wcjZ20
	YP9M2d/YdcLSHGq9HkJ3ZVaB2c/ttl4QN/niaFjMHnf00jncSCj8
X-Gm-Gg: ASbGncsnecRhI/SQ0W2RAzg4Ldern/P/2CH3d7iBwMfnacoiX4Ypc1tl2TR4NwHqyVG
	s2bEOZ99VVoP7wCTIvSy0Yas2dlfIIl1vBLVltXguk3M8n9erY4X3Hy1c2mKDyCd2nlNbGTXPKD
	VPmEOS1GrACzYLKXPl26wGdMc3eFBwmHQBZwLDpThLFEU11BSrFBIs4dBrXtcV2342fcInb5oyp
	W0lQdAqX8gmIkx6CwGgUfZdowdC5fgSVd6xicvCdSIOl7fG/t8rND1OWCuulKPf0OvjLHHHZ7fH
	tRyrISWy7pyR9k7EqjBRS1N01yQgl87wlnRhDcjZNkk4IJ/rXtHzuyGLtq8Lydv2j0YPaK5Esza
	ydVRRntfVpyXL2Y2pbaYUdg==
X-Google-Smtp-Source: AGHT+IEP1XoHBuHE270i0ZfYjYgbUDh2B4NmjzG24AtfqEoOZjen9Q8A09oNwnEn8CwSDeYSqf0PqQ==
X-Received: by 2002:a17:903:983:b0:22c:33b2:e420 with SMTP id d9443c01a7336-231b6034100mr12332745ad.7.1747281140467;
        Wed, 14 May 2025 20:52:20 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.local.valinux.co.jp (vagw.valinux.co.jp. [210.128.90.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7540c8csm108162985ad.5.2025.05.14.20.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 20:52:20 -0700 (PDT)
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
Subject: [PATCH v2] rslib: Add scheduling points during the test
Date: Thu, 15 May 2025 12:51:51 +0900
Message-Id: <20250515035151.38575-1-ryotkkr98@gmail.com>
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

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202501221029.fb0d574d-lkp@intel.com
Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---

Changes since v1:
[1] https://lore.kernel.org/linux-serial/20250510013515.69636-1-ryotkkr98@gmail.com/

- Add Reviewed-by by John and Petr.
- Add Reported-by by kernel test robot <oliver.sang@intel.com>.
- Add Closes and its link.

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

