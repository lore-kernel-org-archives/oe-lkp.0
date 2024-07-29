Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CA78B4E
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jul 2024 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722245774; cv=none; b=PCME5OVrUtLmqnwaEc4BYIek61DxrKjkfpnSNog0cQpvRo60FxaLRo1g5ZlsfjiOQXqe9kc5olLWaMi0LO7uuXlNjk5PbjBQ1kLKWuiTQblSHVHoIgj+n3+b693fjE3C1hF3VkcER7j2zMZKrmjDWhKVBCT/7AC4Of59Q+0Zk+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722245774; c=relaxed/simple;
	bh=63aU7mj9fqLapM3jDmnSJl5KSiycWwWq22p4OXw3GGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kW9Df3nVV6bDzYKGCNDRGeu374D7TXz4cmlBiPRQEW50l9dUSdEtRhXrAWY0M/Bx8AGekKHWVHjAOlML3LCHEpFZAHuhel1hSchqdeWkNyz55/dKOBPdYqFiJXtll1hcQS9ZBmqSugVBHokJrMNgvmZIj+rykk6azoEKyGrGQKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MmMdrmEv; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MmMdrmEv"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a869e3e9dfso9345a12.0
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jul 2024 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722245770; x=1722850570; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6d72j4m/DpNbImW85Yz95FX2UHa2MMdK+SLSOWiCuU=;
        b=MmMdrmEvRaOyro09SteVvOKx9SzofDgv4NvGX8tQMC3ix6aDbqqdNncC/3JbuGXFgu
         RK9unG18BELQEjD2nRzs9cGPQ5AoWGyrDf2g3HkIwmwdbXIr+cqwGYYZXpJVexkI7Ay5
         m2xVQ6/vFN+q9XqJEYEKiwdaFTRizGBJsyFWppoR/QDc2USBumuUthT6M+MlMlBvWT/e
         JyNpT8gHA0wlPsCIrIcclZpXPREp4Z1f9V+ylbe5qxo2tCP5cetK02OK+EOAZYCkdmW0
         p5/U1Bidt+vSVTLxZGqiTyXat0wUZuxiSE+lgF5TOMHRaU7VcE2vUk+sZF/3BC17Pu2D
         G9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722245770; x=1722850570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6d72j4m/DpNbImW85Yz95FX2UHa2MMdK+SLSOWiCuU=;
        b=moN3NggO3PObgA6ApzH5W2EM2TdA+EZBALnj9/5jizfilHZ5+u3CrQOykMNuxQwWto
         0a7OqR/37lZwGGQTS8jt1kZdhxIWwi3cCgroyHB++7cX8zfrYaLCAqa9nnMDQmVo835j
         8eGaDxzl/PCjpzC0aTv9pPX4lySKb7ZE+uGVxRFZ0gCyV6ujTl0lJUV9ruoyc1tkQJmG
         Jtjc0gHTblNXTtxwA4iin7Uz6TJzbWtA82wqVAWJHCOYPSzuJW/3Iux6VtcYZKqiYVO2
         b6C9f/N3HxnFclh96FM4PzBQcQ8KhEA3jG+5/LIHkHAlDhNvjm1M2bHWzJMVOG0tFIc6
         57aw==
X-Gm-Message-State: AOJu0YyHcy+QUa4IzOjxtSjbdedR4Og8tq4lGk5P47qr+p8tP+8zqXXQ
	2chOqfsCAwr2sUDHLMrWvIcvhKdj2nn5D2Mbhbj0BuVFM2NrsYdWugx3fmrotz0k6V3e4UqBIJT
	dy3brJ9vgfQDv2aC6AeYpf+Vld4DU7GCDVL7M
X-Google-Smtp-Source: AGHT+IHIalkoSjjp2apZbUL+ktnbNq14bxnRbYJrgr13JMNilJIlYG7fFwHvB01L6Q79TEDXbONhTSJvZffj+lRli98=
X-Received: by 2002:a05:6402:354d:b0:57c:c3a7:dab6 with SMTP id
 4fb4d7f45d1cf-5b033c83768mr260452a12.3.1722245769876; Mon, 29 Jul 2024
 02:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240725-kasan-tsbrcu-v3-2-51c92f8f1101@google.com> <202407291014.2ead1e72-oliver.sang@intel.com>
In-Reply-To: <202407291014.2ead1e72-oliver.sang@intel.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 29 Jul 2024 11:35:32 +0200
Message-ID: <CAG48ez3H8VoesiWPoSzcnHHYEADndmK9Nwae=JL3d6JfdpjNUg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] slub: Introduce CONFIG_SLUB_RCU_DEBUG
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>, 
	Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 6:37=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
> kernel test robot noticed "WARNING:possible_circular_locking_dependency_d=
etected" on:
>
> commit: 17049be0e1bcf0aa8809faf84f3ddd8529cd6c4c ("[PATCH v3 2/2] slub: I=
ntroduce CONFIG_SLUB_RCU_DEBUG")
> url: https://github.com/intel-lab-lkp/linux/commits/Jann-Horn/kasan-catch=
-invalid-free-before-SLUB-reinitializes-the-object/20240726-045709
> patch link: https://lore.kernel.org/all/20240725-kasan-tsbrcu-v3-2-51c92f=
8f1101@google.com/
> patch subject: [PATCH v3 2/2] slub: Introduce CONFIG_SLUB_RCU_DEBUG
[...]
> [  136.014616][    C1] WARNING: possible circular locking dependency dete=
cted

Looking at the linked dmesg, the primary thing that actually went
wrong here is something in the SLUB bulk freeing code, we got multiple
messages like:

```
 BUG filp (Not tainted): Bulk free expected 1 objects but found 2

 --------------------------------------------------------------------------=
---

 Slab 0xffffea0005251f00 objects=3D23 used=3D23 fp=3D0x0000000000000000
flags=3D0x8000000000000040(head|zone=3D2)
 CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.10.0-00002-g17049be0e1bc #1
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.16.2-debian-1.16.2-1 04/01/2014
 Call Trace:
  <IRQ>
  dump_stack_lvl+0xa3/0x100
  slab_err+0x15a/0x200
  free_to_partial_list+0x2c9/0x600
[...]
  slab_free_after_rcu_debug+0x169/0x280
[...]
  rcu_do_batch+0x4a4/0xc40
  rcu_core+0x36e/0x5c0
  handle_softirqs+0x211/0x800
[...]
  __irq_exit_rcu+0x71/0x100
  irq_exit_rcu+0x5/0x80
  sysvec_apic_timer_interrupt+0x68/0x80
  </IRQ>
  <TASK>
  asm_sysvec_apic_timer_interrupt+0x16/0x40
 RIP: 0010:default_idle+0xb/0x40
 Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 90 90 eb 07 0f 00 2d 17 ae 32 00 fb f4 <fa> c3
cc cc cc cc cc 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
 RSP: 0018:ffff888104e5feb8 EFLAGS: 00200282
 RAX: 4c16e5d04752e300 RBX: ffffffff813578df RCX: 0000000000995661
 RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffffff813578df
 RBP: 0000000000000001 R08: ffff8883aebf6cdb R09: 1ffff11075d7ed9b
 R10: dffffc0000000000 R11: ffffed1075d7ed9c R12: 0000000000000000
 R13: 1ffff110209ca008 R14: ffffffff87474e68 R15: dffffc0000000000
  ? do_idle+0x15f/0x400
  default_idle_call+0x6e/0x100
  do_idle+0x15f/0x400
  cpu_startup_entry+0x40/0x80
  start_secondary+0x129/0x180
  common_startup_64+0x129/0x1a7
  </TASK>
 FIX filp: Object at 0xffff88814947e400 not freed
```

Ah, the issue is that I'm NULL as the tail pointer to do_slab_free()
instead of passing in the pointer to the object again. That's the
result of not being careful enough while forward-porting my patch from
last year, it conflicted with vbabka's commit 284f17ac13fe ("mm/slub:
handle bulk and single object freeing separately")... I'll fix that up
in the next version.


I don't think the lockdep warning is caused by code I introduced, it's
just that you can only hit that warning when SLUB does printk...

> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240729/202407291014.2ead1e72-ol=
iver.sang@intel.com
