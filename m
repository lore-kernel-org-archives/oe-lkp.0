Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695445C600
	for <oe-lkp@lists.linux.dev>; Tue, 20 Feb 2024 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708416191; cv=none; b=YGfmw+bSPI7x0tYloWjAl8q/meAA9rZXr77MnFy4wzGM5hncEAPRPuZq7t3GqfdVI4jmpba9STo577mVUdxk4r5A7vOb1EH/RLLyyO4ZsgndKoJklw54EY1V9gGfty5SZsfuuLRYBI9I+Z25qztJfejuDJLq7n8GKcm/e4YDApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708416191; c=relaxed/simple;
	bh=9/tlsQMBkfjjKLI9eGKfgWphyzXWhPtK20nWQDbPC9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WK9iySzXBf5jOalbCFdKzlNS4fFF1k+Ut8qDACW4dJBhkQ9lB66N7bmmJw7b2PtojIPVi344Fy6zJCSm7uvLlFqN3+zfYDoqoxGA5rYV0ct4T2t3DzHQznZh0I/9Ae15aA8FiPUxJK0HuZXwz1D+Lw5D2Q3sAIf+9satCyptZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ct0GmfJq; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ct0GmfJq"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7d2e1a0337bso2530260241.3
        for <oe-lkp@lists.linux.dev>; Tue, 20 Feb 2024 00:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708416187; x=1709020987; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8cERgU0ZSCW6FWHFRH3BebgYcwtul5dolkTErrkCLA=;
        b=Ct0GmfJqxQA9f00MtWZy+TXigLJuJawFxJxtxDudPM+JTb0SyZ+fYRxv2r9g/fgyQ1
         jomXWD3LQtiUvC7WYtdAY5zt8O/89N+rV37q+UEVcX3DGFLXZkFf0typd6wd7VvoTcsy
         E1J3C/Tn+2g4dcDHpp6S+7e+k980wCOnWfdTfABc1b+zebSIUi7sknZkdkd8+YUNrWP+
         BZmwpQGHK8DzWwQf5f3qxmNMx8zhW+Am4/dWtayn1JqNhPdAVDqsvDJz61qf2UZ29Ic5
         N4MwUO0TMMbKx7hHs5TpIByL8/IksJycO7FDjPC3dnOAUHxcpm8Xg2Os3dD54SDXNURt
         IN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708416187; x=1709020987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8cERgU0ZSCW6FWHFRH3BebgYcwtul5dolkTErrkCLA=;
        b=f9Bffu3xCZh4dfpAboGb+87ASayVEzrZsayJMeVIn0Xupvx9lYyOhvlw1jVHeq2s5v
         YZBzIItuS+jOPGMg+32zY479JaAxpkc8fYYaHt+MN9NSBpfs7OC2f9qX08aLFcXF5sZZ
         Fmqa5VvmhdIAzTqT7j5Aq7Vjv1aewsVAUoLoeIyowxq7KbEON8PeW5WQ4umluBoUteb6
         jtOnPdr85V8H344upV6WMc0Xhm+4Hc/G6f8AMP0d064DT9Y3c45A+8t/LsOTzk1n45BI
         lxTBlH+OigUUaRxvIJB4zYAcCzaTUjB235mzudJnuQCAff+ayLZw3TFSwb/eOtfXsbMk
         Z7Cw==
X-Gm-Message-State: AOJu0YzxowBad7Z76HZ2q5PQVs80enW/aD4q0WAswctIHiLyp/xlsGyx
	Fj1dj0Atttb9RKWRZcVFlLCWb+G/0KVsi+zlMNpVZWbUduBhJFIjH2Bv0MVYf9xO5RWOp8PKQMs
	leFZ5Kz8Roz5x6S+JddQlS823DXSpGISjWMDY
X-Google-Smtp-Source: AGHT+IHCY45ImoK8ekSyrT6/DLUYhFKBJDrM3udG68+Od7iJhRKR3MiCxjlUk1plcTgb4AuccfyMMculuYJkx51wdOo=
X-Received: by 2002:a67:eb94:0:b0:46e:c865:6b4a with SMTP id
 e20-20020a67eb94000000b0046ec8656b4amr11196789vso.34.1708416186959; Tue, 20
 Feb 2024 00:03:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402201506.b7e4b9b6-oliver.sang@intel.com>
In-Reply-To: <202402201506.b7e4b9b6-oliver.sang@intel.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Feb 2024 09:02:28 +0100
Message-ID: <CANpmjNNGCkfFBNiSsc+DOm1EDzXZoNLQy_jnEZjt9WuxP5aayw@mail.gmail.com>
Subject: Re: [linux-next:master] [kasan] 187292be96: WARNING:suspicious_RCU_usage
To: kernel test robot <oliver.sang@intel.com>, "Paul E. McKenney" <paulmck@kernel.org>, RCU <rcu@vger.kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Vlastimil Babka <vbabka@suse.cz>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 08:35, kernel test robot <oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> we noticed this is a revert commit, below report is for an issue we observed
> on this commit but not on its parent. just FYI.
>
> 113edefd366346b3 187292be96ae2be247807fac1c3
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     dmesg.WARNING:suspicious_RCU_usage
>
>
> kernel test robot noticed "WARNING:suspicious_RCU_usage" on:
>
> commit: 187292be96ae2be247807fac1c3a6d89a7cc2a84 ("kasan: revert eviction of stack traces in generic mode")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

This commit didn't touch rcutorture or the rcu subsystem in any way,
so I currently don't understand how rcutorture would be affected.
While stackdepot has started to use RCU, this already happened in a
previous commit, and this particular commit actually reduced RCU usage
(no more evictions and re-allocations of stacktraces).

The only explanation I have is that it improved performance of a
KASAN-enabled kernel (which the config here has enabled) so much that
previously undiscovered issues have now become much more likely to
occur.

[+Cc rcu folks]

> in testcase: rcutorture
> version:
> with following parameters:
>
>         runtime: 300s
>         test: cpuhotplug
>         torture_type: busted_srcud
>
>
>
> compiler: clang-17
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202402201506.b7e4b9b6-oliver.sang@intel.com
>
>
> [  292.513535][  T653] WARNING: suspicious RCU usage
> [  292.514923][  T653] 6.8.0-rc4-00126-g187292be96ae #1 Not tainted
> [  292.516369][  T653] -----------------------------
> [  292.517743][  T653] kernel/rcu/rcutorture.c:1983 suspicious rcu_dereference_check() usage!
> [  292.519310][  T653]
> [  292.519310][  T653] other info that might help us debug this:
> [  292.519310][  T653]
> [  292.523130][  T653]
> [  292.523130][  T653] rcu_scheduler_active = 2, debug_locks = 1
> [  292.525644][  T653] no locks held by rcu_torture_rea/653.
> [  292.526974][  T653]
> [  292.526974][  T653] stack backtrace:
> [  292.529271][  T653] CPU: 0 PID: 653 Comm: rcu_torture_rea Not tainted 6.8.0-rc4-00126-g187292be96ae #1
> [  292.530780][  T653] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [  292.532329][  T653] Call Trace:
> [  292.533524][  T653]  <TASK>
> [ 292.534696][ T653] dump_stack_lvl (lib/dump_stack.c:?)
> [ 292.535941][ T653] ? __cfi_dump_stack_lvl (lib/dump_stack.c:98)
> [ 292.537221][ T653] ? lockdep_rcu_suspicious (kernel/locking/lockdep.c:6712)
> [ 292.538523][ T653] rcu_torture_one_read (kernel/rcu/rcutorture.c:?) rcutorture
> [ 292.539887][ T653] ? __cfi_lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4312)
> [ 292.541226][ T653] ? rcu_torture_timer (kernel/rcu/rcutorture.c:1955) rcutorture
> [ 292.542621][ T653] ? __cfi_rcu_torture_timer (kernel/rcu/rcutorture.c:2055) rcutorture
> [ 292.544012][ T653] ? init_timer_key (include/linux/lockdep.h:135 include/linux/lockdep.h:142 include/linux/lockdep.h:148 kernel/time/timer.c:847 kernel/time/timer.c:867)
> [ 292.545262][ T653] rcu_torture_reader (kernel/rcu/rcutorture.c:2093) rcutorture
> [ 292.546579][ T653] ? __cfi_rcu_torture_reader (kernel/rcu/rcutorture.c:2076) rcutorture
> [ 292.547872][ T653] ? __cfi__raw_spin_unlock_irqrestore (kernel/locking/spinlock.c:193)
> [ 292.549108][ T653] ? __cfi_rcu_torture_timer (kernel/rcu/rcutorture.c:2055) rcutorture
> [ 292.550341][ T653] ? __kthread_parkme (kernel/kthread.c:?)
> [ 292.551425][ T653] ? __kthread_parkme (include/linux/instrumented.h:? include/asm-generic/bitops/instrumented-non-atomic.h:141 kernel/kthread.c:280)
> [ 292.552489][ T653] kthread (kernel/kthread.c:390)
> [ 292.553504][ T653] ? __cfi_rcu_torture_reader (kernel/rcu/rcutorture.c:2076) rcutorture
> [ 292.554689][ T653] ? __cfi_kthread (kernel/kthread.c:341)
> [ 292.555749][ T653] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 292.556792][ T653] ? __cfi_kthread (kernel/kthread.c:341)
> [ 292.557852][ T653] ret_from_fork_asm (arch/x86/entry/entry_64.S:250)
> [  292.558920][  T653]  </TASK>
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240220/202402201506.b7e4b9b6-oliver.sang@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
