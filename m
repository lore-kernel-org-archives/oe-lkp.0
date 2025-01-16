Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355411F1508
	for <oe-lkp@lists.linux.dev>; Thu, 16 Jan 2025 23:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070303; cv=none; b=u8/SJHsrS83+0t4+/UtpseMtWOBn1/a1QXQVz8YYGluN0Uu7PrXyOyfmf9BSDpmNN9u7Bvdc1F2tZ4GOub7o4phDwAv9XHRoSupV/UALDip6mWNROA0V6Vd/STyWVUhY/WhgZ64sB/A648rkeUfJktM5wB9+F+wUTHFoL9LRwnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070303; c=relaxed/simple;
	bh=hq053wCczSep4pog8PyRvX1uXQesjz1LYfIZmU46ay4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZT+5hRDI4tJvdmdP5MeKcYp7b5K2lq2egHpuTyWoE3ztQI+UOMWxNhbmruuCcDjPQ8HNuabN5iwAXw9Xcr61Vy8NqWwZjCWoDKzMLHxVeuIqskALMQCkvvJ8xuBp/7/oWyqX9gEM7Ngr4djSAQWqchbOuRzybjqNdoe22Q9RX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BoE4vEpB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IGM4PeUD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BoE4vEpB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IGM4PeUD"
Date: Fri, 17 Jan 2025 00:31:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737070298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=USXXQStO4BUX31DzeD+ErR+YBx8OZwsvUmnU9tbNu0U=;
	b=BoE4vEpBXd5FbXavO+cqg0Avn04oVYDw/kbqMpOgh5XyFpyHLKheNVW/vWz9jZoouKtMIo
	bJaofIiCmYj7rcxtZ7MeU5VIAtAwJYYaot/ik/OxzU0aIizB+LiQtZcFAIUJQGG6jGZTrb
	Gui1mSWbfZe4/c4fvugTWT3Oxsx5SNYfmUQ7GmqHIP+AuYgSbY5vt6k01JW6WAvRnMqBOA
	jG0K8pSR5ppvhQzAUWVgpckjJ4qh2ihy8RAYxe9RiNYsnaOGORDNOzyqUH7oYxJ3xgtp47
	OtMIqoMEkEtG3zH7Lpt93AHBXEU04YbfiQ377K3fZpkrQ0RX7DvPKqadlBfgUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737070298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=USXXQStO4BUX31DzeD+ErR+YBx8OZwsvUmnU9tbNu0U=;
	b=IGM4PeUDhFfMoeEYhe+gujv2zN7HxofFLThudukNt1bRuHYBqViuB9AuBbEPq+3tN7N3Qa
	NZtZrQT1zAOEPdAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [bigeasy-staging:futex_local_v6] [futex]  865221325b:
 WARNING:at_lib/rcuref.c:#rcuref_put_slowpath
Message-ID: <20250116233137.v8s-FDdH@linutronix.de>
References: <202412311453.9d7636a2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202412311453.9d7636a2-lkp@intel.com>

On 2024-12-31 16:41:41 [+0800], kernel test robot wrote:
> kernel test robot noticed "WARNING:at_lib/rcuref.c:#rcuref_put_slowpath" =
on:
>=20
> commit: 865221325b6a45c5d0777614ccad2e49aa82722b ("futex: Resize local fu=
tex hash table based on number of threads.")
> https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_lo=
cal_v6
=E2=80=A6
> [  184.841511][T52159] rcuref - imbalanced put()
> [  184.841536][T52159] WARNING: CPU: 64 PID: 52159 at lib/rcuref.c:267 rc=
uref_put_slowpath+0x66/0x70
> [  184.944417][T52159] CPU: 64 UID: 0 PID: 52159 Comm: 1_aux Tainted: G S=
                 6.13.0-rc3-00011-g865221325b6a #1
=E2=80=A6
> [  184.972898][T52159] RIP: 0010:rcuref_put_slowpath+0x66/0x70
=E2=80=A6
> [  185.095270][T52159] Call Trace:
> [  185.099146][T52159]  <TASK>
> [  185.144224][T52159]  futex_hash_put+0x2c/0x30
> [  185.149286][T52159]  futex_wait_queue+0x4a/0xb0
> [  185.154497][T52159]  __futex_wait+0x146/0x1b0
> [  185.165341][T52159]  futex_wait+0x6c/0x130
> [  185.175497][T52159]  do_futex+0x11d/0x1f0

after hours of yelling and cursing:

      ref  =3D 0 (via rcuref_init(ref, 1))
 T1                                      T2
 rcuref_put(ref)
 -> atomic_add_negative_release(-1, ref)                                   =
      # ref -> 0xffffffff
 -> rcuref_put_slowpath(ref)
                                         rcuref_get(ref)
                                         -> atomic_add_negative_relaxed(1, =
&ref->refcnt)
                                           -> return true;                 =
      # ref -> 0

                                         rcuref_put(ref)
                                         -> atomic_add_negative_release(-1,=
 ref) # ref -> 0xffffffff
                                         -> rcuref_put_slowpath()

    -> cnt =3D atomic_read(&ref->refcnt);                                  =
        # cnt -> 0xffffffff / RCUREF_NOREF
    -> atomic_try_cmpxchg_release(&ref->refcnt, &cnt, RCUREF_DEAD))        =
      # ref -> 0xe0000000 / RCUREF_DEAD
       -> return true
                                           -> cnt =3D atomic_read(&ref->ref=
cnt);   # cnt -> 0xe0000000 / RCUREF_DEAD
                                           -> if (cnt > RCUREF_RELEASED)   =
      # 0xe0000000 > 0xc0000000
                                             -> WARN_ONCE(cnt >=3D RCUREF_R=
ELEASED, "rcuref - imbalanced put()")

Sebastian
