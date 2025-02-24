Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3041AAE2E
	for <oe-lkp@lists.linux.dev>; Mon, 24 Feb 2025 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740372199; cv=none; b=TZeGJc5jZt493JYS9OqekAOj/B7NAI7lHZp9ynkv3ZmZR9I8NyRdBO04Jm4Md62IBtQabBr8tLkw09FkGIrdxzmOiicuHKlKtoUy5I24t72wTR+B1J2pWaKtebGvDHlBGHoz+OLNJOtOef18OaPCLXUfmYTOFKCiR3LWHUhnciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740372199; c=relaxed/simple;
	bh=DCpT12y5iABPXJogLv/iS8tsEGReP23KAJetFgd3HaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H84Tdj3aH3ivW4rqixZEazEGnJihSwbeiG7nxCOXlTfBOf7jaI1itc1Jk5qo2BX0xe41uyKmGHydpfjL0MxnZoPcTzy2pZ6CBn8Ui3loA+5xLSfRc9m7D/e7VdcXuQP72iTovdHgJNZopjGlttxnHTM5byy/dPvJcMbE13/eTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIWIRboq; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIWIRboq"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c08fc20194so718758685a.2
        for <oe-lkp@lists.linux.dev>; Sun, 23 Feb 2025 20:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740372195; x=1740976995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YgJlvUcrCnk4Px28zeJAYzHwYl+dJt5tTj1CIQ5lvao=;
        b=YIWIRboqK3ykheie/PvVLK5kpbW4tU74O5eeOdHnbLhuZVRrxTLbMWNyHOJ3yArQN3
         LtZTcxgAQG9V6E2qWuon8vNw41pncPArvVPUmMi24wSuT/GsaEV3aFYnVtCUQigrA+lA
         Y68Q0m5FtejpCHMbwh4FxowazBen2QYKcxfBB41roUSjh+WEWTGDI13mfjzvBmC0qAO7
         ZMA+24Gd83E3zYkduOE8YGZPWwvUFqcQbAmrUnpO+JV8d6aBBc1fiAC1E7HB7ZMeA/ui
         96nfIsMqqFCNksSdO15F06umSLsanmp+1PyHbDv4XLmOs3wfuSK9z0RbQwMbA9hhE1Mj
         Ac4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740372195; x=1740976995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgJlvUcrCnk4Px28zeJAYzHwYl+dJt5tTj1CIQ5lvao=;
        b=wBKgEz7F9bQv91aR/ZcrZQv7ZX5AxHIY/Om65u8Qp/M8TRbWA36APgW3kiLuZm/7PQ
         zUyA7Kbf24OjXfJbVJIeA7LND//KDoYN65ZDZoBtbflBkCu+21qSKHM8b7s/zx63PnLJ
         md0Gl+oF4QOAb1yHc3GJrvyKcz28e4c+rFu303J843YBtwIFNCtGo9idAs8muBOjt4kI
         nmR42luvDt3IOgtp7E2MWniHXBa/hcxWK9h6dZtu34/CfUKJfdm8ayk9KEpTtkcy3yOy
         Zn6G/zX9ZWwjyqaIHJ4M7QP+fpR6p/gPHD7uwLaO/x6CR6/e/GRmqJgtKx+BQ+5N2jBY
         RRRA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1faRCZ4ZolBQ5F1xyzwxHHN56b+C2ogUxGDZLLPhiamTq2nMLP4f7eIwkhKKAKRNQMBeDe4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDId79jVcKvpyXuKga52MMRzSmHo0M8mn8Uv9yWzvABwhqN9Ky
	YCeh6NFdWmmaQVZ34LCC6FTzbteoIeZ+vl/P1GiN8AQrDKiQsW6yNexz8w==
X-Gm-Gg: ASbGncukuxTNi0GVQL7yWd3EvRqOb/nelzED0523uNcAkJRQH1tkGQYQw4VEj7GWKjJ
	NuY1/gOvXt2euyfKbmQ3xPyWBXme4kV7N9ybYiTRF2nk0PRKtwnegxPCsRH3ldiuo6BbnBviv9K
	JlAhzHrtpul8wuUMo4BbBbwB/uqPNmolBjaw405ZzAQOwmHJJwU8cW6e3BFNqnZSvl/t7tH5ejE
	ciZ+y5wTjyRvghjG/2Y+YmxNLtb2MWM1SgrtSTTbfMRljkqeMKGD5ntcA9hlZNzoXUJYR65cO7Z
	4YrYQxJyR1/90I9c/8Sa99SvcA+6azJUpcxOm4M9GzLjeUzr4BUXvR163CSb0hg9IAXfHF34/Ud
	4ArfU3VxztSPj8sMR
X-Google-Smtp-Source: AGHT+IHS9+jNMo1GQfaJagEheVTBWOidCeWDjc8eISITAFSDWoITb4z2932ycfJh1KoNWHhNuPWriw==
X-Received: by 2002:a05:620a:4486:b0:7c0:b1f3:b4b4 with SMTP id af79cd13be357-7c0ceef74cdmr1480032785a.15.1740372195286;
        Sun, 23 Feb 2025 20:43:15 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0a49c29bfsm886093785a.45.2025.02.23.20.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 20:43:14 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8FF85120006A;
	Sun, 23 Feb 2025 23:43:14 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 23 Feb 2025 23:43:14 -0500
X-ME-Sender: <xms:4vi7Z7Egz8DbRg-p9rZWo0IcBDNzX4pSsxyAQHpppGtZ5_0zpYtqow>
    <xme:4vi7Z4UNshhPZnw_qYtIz6VeOtTCCZv7tWX_ReGQJ7HhKqQ4CjsS2MBN0vfXAVE1b
    gD9pHFHv1UFox6J1A>
X-ME-Received: <xmr:4vi7Z9KX8T8KvFxSCyVW8PPSoV_BDBHqva4G4BzqfLj06A7k6UiNbh7LSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejjeekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfev
    ffeiueejhfeuiefggeeuheeggefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeelpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopeholhhivhgvrhdrshgrnhhgsehinhhtvghlrd
    gtohhmpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghnkhhurhdrrgdrrghrohhrrgesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepoh
    gvqdhlkhhpsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhkphesihhn
    thgvlhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvg
    hnghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:4vi7Z5G8v57U_AtDAMMnvnN99XVGfo3wkuT8zEL1VAEbT9oiRT-wmQ>
    <xmx:4vi7ZxVU_aq7gyoLAzzVIiCAF-u-PsX8tO8120TMM6aytf7XyFEUrw>
    <xmx:4vi7Z0NHqqGzTPQaVHrd0aPxED4DsXBmgqwo8FCGEq4BhBcowCf_IA>
    <xmx:4vi7Zw0b6A932iD_i4Pc5EDg_-7Me3Oi10f_kEb9Ua28OY4N-e6I1g>
    <xmx:4vi7Z2X_zYxKkGxmOITXtYg3ULt_1KakIhQsDG0YE-KKPztSD0eU1nrj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Feb 2025 23:43:14 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	oe-lkp@lists.linux.dev,
	lkp@intel.com,
	Peter Zijlstra <peterz@infradead.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	rcu@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH v2 2/2] rcutorture: Update ->extendables check for lazy preemption
Date: Sun, 23 Feb 2025 20:43:10 -0800
Message-Id: <20250224044310.14373-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250224044310.14373-1-boqun.feng@gmail.com>
References: <Z7v4MytjhhBZkG4S@Mac.home>
 <20250224044310.14373-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rcutorture_one_extend_check() function's second last check assumes
that "preempt_count() & PREEMPT_MASK" is non-zero only if
RCUTORTURE_RDR_PREEMPT or RCUTORTURE_RDR_SCHED bit is set.

This works for preemptible RCU and for non-preemptible RCU running in
a non-preemptible kernel.  But it fails for non-preemptible RCU running
in a preemptible kernel because then rcu_read_lock() is just
preempt_disable(), which increases preempt count.

This commit therefore adjusts this check to take into account the case
fo non-preemptible RCU running in a preemptible kernel.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/rcu/rcutorture.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 280bff706017..4cae119dece8 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1901,8 +1901,16 @@ static void rcutorture_one_extend_check(char *s, int curstate, int new, int old,
 	WARN_ONCE(cur_ops->extendables &&
 		  !(curstate & (RCUTORTURE_RDR_BH | RCUTORTURE_RDR_RBH)) &&
 		  (preempt_count() & SOFTIRQ_MASK), ROEC_ARGS);
-	WARN_ONCE(cur_ops->extendables &&
-		  !(curstate & (RCUTORTURE_RDR_PREEMPT | RCUTORTURE_RDR_SCHED)) &&
+
+	/*
+	 * non-preemptible RCU in a preemptible kernel uses preempt_disable()
+	 * as rcu_read_lock().
+	 */
+	mask = RCUTORTURE_RDR_PREEMPT | RCUTORTURE_RDR_SCHED;
+	if (!IS_ENABLED(CONFIG_PREEMPT_RCU))
+		mask |= RCUTORTURE_RDR_RCU_1 | RCUTORTURE_RDR_RCU_2;
+
+	WARN_ONCE(cur_ops->extendables && !(curstate & mask) &&
 		  (preempt_count() & PREEMPT_MASK), ROEC_ARGS);
 
 	/*
-- 
2.39.5 (Apple Git-154)

