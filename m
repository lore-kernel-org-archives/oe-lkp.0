Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1CF1A23AA
	for <oe-lkp@lists.linux.dev>; Mon, 24 Feb 2025 04:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740372199; cv=none; b=FEfUAg43n2zEIDxsoYfg3vI3/+KcCYZ0xNBrYMpXtggZdhoqbGc+LNfZyybPEROhrQidLINYYeoJqmvkcz3jsVSh4BQwsa3Noc7ttrnDXbhyTuLOAMeRlFMcgeC/RaiD2WRh863VyPw9N2/hWs0DE7Gx+s4Pl8Q5jLrHNh2ifB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740372199; c=relaxed/simple;
	bh=wWzZAmRR4kWrwyMPYjkUlV/8tv0FxjZZSfATo39C9fE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QkwVCwKmfUBC57tbuyjErOIYDKpCfdVp/6XvDR+G3hihB2n0oYHVhMxISqlo4WpUFWyO8yPKCSYjpgNthq+pDSb7TKbCEjrpFDyOBC6yPa54zQqOeQ+P1s2lE2ztU8qFFMggvrXK08OTQoAoJmY5co71KToYmR3lzq6zDFEZYiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNpb3buV; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNpb3buV"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-471fe5e0a80so34767281cf.1
        for <oe-lkp@lists.linux.dev>; Sun, 23 Feb 2025 20:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740372194; x=1740976994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TCu7u98k6eSO2x3h8Jk7eAX/GSVZfduiAYOujt8ShbY=;
        b=eNpb3buVcEZ2KR9EweDTtBxLAU9+q5vT9DB222eexAQIBJSanfA351RVAHbQDWamxk
         oTxvcEb2IvXueTEui4LeoNap4VeKU4zxzg3ZBoPrgFU6TJ4Z+w8HEIFkojdGidYt9V9C
         wnWWSwDUB7K1acb8rteLCHh3L2LbUG2mlPnGMrKDvW+w9O1ndPLA+S+ATasyXaFBXcZ2
         FAEHWwdzwPthT1viIh4+lo2gm7ixETbR3stIRlO03i3myIfMm8NzamH3xvV6HbdhJaKd
         uuu2WzGD0qc3aIL8VaEdMUqKSCSIBnrZ6p8sN+10VLRjAZks1WQpI+1rqVxE6mx0BLpX
         2LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740372194; x=1740976994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCu7u98k6eSO2x3h8Jk7eAX/GSVZfduiAYOujt8ShbY=;
        b=IIDJK+3CJ067rYJ3NxIuPlW7SUdXF+lEVl7K5AJ1D5R+AIx2WQpJAu7xODmhO+PWzp
         CHudQXFr97sCl3uFr+kHzfepg0zpLqkuHsDbtUTrCkxfTVgfCQWRURN57D+EYx1WhF+B
         WGj0zovc59Nr7IcHrjmM5Cml4Uk76Ir10Y6eS4c1O268VRy6QwAaZouNc/zMKL0/XlP5
         tBmEH473uXLOSWWQcV47oJ67OTyJXaJce7zlRzYXNKTqy9HWK/c5Ioe2ZHurSW5OqQJq
         2yPAM3cwjqeB5sDrOWkb+BwM386YXoHZqsfhpjSfaUyD+3ON63/cOveeARDbNm5McsfV
         uAdw==
X-Forwarded-Encrypted: i=1; AJvYcCUcWj+vCQ9lEJSPpL2oaHTOoYmDhJFISQ1eVZLqSD5RArJqO6txoLQ++Z+FRH9eJCEjy+aDeFo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu0f0G8TjGeA18zUHspud3tjZHd1XKFmODEIOA1Bp6ejxwenYh
	AoK+GimvxROwFKx+QXskW1lG/IkQTbdcXRUdnvBeaZRxTWK1jl2q
X-Gm-Gg: ASbGncsO/blBoxp4vrO6vYav4SYTBRJUsacooIy4hmUoq2LG8e8AA5R/b4fZxPLifZq
	9JWRskCT/swM6smTCCTZHkeicecgWfy1OyhJliwrJZNjA6A9WWdS7BoENco7NF6xbnJS8oLUNpw
	NAUCmkcAwtxNKaAf8SEITL9zjApYdLlrt6e0B+2oFnQfMgXeMyUhc1WhyHcKBC2iqk2Zw3qhV4I
	qIaF8m78mWe6xtD5ObUwvp4Q70t2C4G9dpow8KL6hNp8wlGEr8pbZIcr6SFs7DUh10X6dLikzYe
	2q0KYVJb6gKNilazmSgGWEWnkObVpnxzSvPXJoMQEyZ5lCOoExow8Zd7TohA4YBBhIsxbuxLDyT
	I87TlJyJQspAD9ES/
X-Google-Smtp-Source: AGHT+IHuLivU+/6K+5NgpAn4ukWUm2u3d7P3jIpzJlCVSJmjVBGKc/zkgBvjgALEBM8NXY8R8hsp4A==
X-Received: by 2002:ac8:5a04:0:b0:472:58b:463d with SMTP id d75a77b69052e-47224716682mr159802281cf.5.1740372194078;
        Sun, 23 Feb 2025 20:43:14 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471f33415e5sm88185561cf.41.2025.02.23.20.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 20:43:13 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2C6D3120006A;
	Sun, 23 Feb 2025 23:43:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 23 Feb 2025 23:43:13 -0500
X-ME-Sender: <xms:4fi7Z7sw_N3Xs1MC51S63Ug0hzXE5Rs6Xv1Xs4AU6duB8RNuVG0nCQ>
    <xme:4fi7Z8fdgnbwsO-1sU3lze8aeSxzKhzx66hMj1UXoNXrKqm1lyyKbmG1KyIvtb6sN
    oVRXK46muYrNnNtbA>
X-ME-Received: <xmr:4fi7Z-yPzQWYhkNDpVBMiy9qXMBvH0M2Qzsn9U6UwTBKxRUa8AJ6TR3z4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejjeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeu
    heelhfeivdegffejgfetuefgheeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopeholhhivhgvrhdrshgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtohepphgruhhl
    mhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnkhhurhdrrgdrrghrohhrrg
    esohhrrggtlhgvrdgtohhmpdhrtghpthhtohepohgvqdhlkhhpsehlihhsthhsrdhlihhn
    uhigrdguvghvpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhope
    hpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvuggvrhhi
    tgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:4fi7Z6O7R8ImAhyOSJOcH7PKonGqoMVSlE2CbiCdQ5dFsp3YHfn8lg>
    <xmx:4fi7Z78ap7vWDwEfeLGLQ39przRAEflmndmdgk6crVrYkk96P2PCLA>
    <xmx:4fi7Z6WZKNOm_i6XWFK4Rn35Oka0el7xx684sMh7Ie8TNM32Rg81PQ>
    <xmx:4fi7Z8c6DY_tZzVf-PUZt3hEgyp961o3Hh_6fnBqqMCnzRWNYlIBEA>
    <xmx:4fi7Z5edlZWmvzyqoDVfXNQRa8b5RJzyL7ZXZ-q8T5mPCd9tGsNi01ma>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Feb 2025 23:43:12 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	oe-lkp@lists.linux.dev,
	lkp@intel.com,
	Peter Zijlstra <peterz@infradead.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	rcu@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 1/2] rcutorture: Update rcutorture_one_extend_check() for lazy preemption
Date: Sun, 23 Feb 2025 20:43:09 -0800
Message-Id: <20250224044310.14373-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <Z7v4MytjhhBZkG4S@Mac.home>
References: <Z7v4MytjhhBZkG4S@Mac.home>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Paul E. McKenney" <paulmck@kernel.org>

The rcutorture_one_extend_check() function's last check assumes that
if cur_ops->readlock_nesting() returns greater than zero, either the
RCUTORTURE_RDR_RCU_1 or the RCUTORTURE_RDR_RCU_2 bit must be set, that
is, there must be at least one rcu_read_lock() in effect.

This works for preemptible RCU and for non-preemptible RCU running in
a non-preemptible kernel.  But it fails for non-preemptible RCU running
in a preemptible kernel because then RCU's cur_ops->readlock_nesting()
function, which is rcu_torture_readlock_nesting(), will return
the PREEMPT_MASK mask bits from preempt_count().  The result will
be greater than zero if preemption is disabled, including by the
RCUTORTURE_RDR_PREEMPT and RCUTORTURE_RDR_SCHED bits.

This commit therefore adjusts this check to take into account the case
fo non-preemptible RCU running in a preemptible kernel.

[boqun: Fix the if condition and add comment]

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202502171415.8ec87c87-lkp@intel.com
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/rcu/rcutorture.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index d26fb1d33ed9..280bff706017 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1873,6 +1873,8 @@ static void rcu_torture_reader_do_mbchk(long myid, struct rcu_torture *rtp,
 #define ROEC_ARGS "%s %s: Current %#x  To add %#x  To remove %#x  preempt_count() %#x\n", __func__, s, curstate, new, old, preempt_count()
 static void rcutorture_one_extend_check(char *s, int curstate, int new, int old, bool insoftirq)
 {
+	int mask;
+
 	if (!IS_ENABLED(CONFIG_RCU_TORTURE_TEST_CHK_RDR_STATE))
 		return;
 
@@ -1902,8 +1904,16 @@ static void rcutorture_one_extend_check(char *s, int curstate, int new, int old,
 	WARN_ONCE(cur_ops->extendables &&
 		  !(curstate & (RCUTORTURE_RDR_PREEMPT | RCUTORTURE_RDR_SCHED)) &&
 		  (preempt_count() & PREEMPT_MASK), ROEC_ARGS);
-	WARN_ONCE(cur_ops->readlock_nesting &&
-		  !(curstate & (RCUTORTURE_RDR_RCU_1 | RCUTORTURE_RDR_RCU_2)) &&
+
+	/*
+	 * non-preemptible RCU in a preemptible kernel uses "preempt_count() &
+	 * PREEMPT_MASK" as ->readlock_nesting().
+	 */
+	mask = RCUTORTURE_RDR_RCU_1 | RCUTORTURE_RDR_RCU_2;
+	if (!IS_ENABLED(CONFIG_PREEMPT_RCU))
+		mask |= RCUTORTURE_RDR_PREEMPT | RCUTORTURE_RDR_SCHED;
+
+	WARN_ONCE(cur_ops->readlock_nesting && !(curstate & mask) &&
 		  cur_ops->readlock_nesting() > 0, ROEC_ARGS);
 }
 
-- 
2.39.5 (Apple Git-154)

