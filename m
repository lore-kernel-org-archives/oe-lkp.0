Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0BEDF6C
	for <oe-lkp@lists.linux.dev>; Sat, 24 Feb 2024 02:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708743341; cv=none; b=B5fRA1qlZuGyJU9jHAoS+rCoGC4l7VvKTAg1tItZ5z8SMTmRbIEnDem8nvWf9180tde0OC7HMBOZV38+tLJXt6HI3iXW8zUyEqS1vhh/5BFbELos+CKB11+g3I45ssYj0QrrqMggq5ET0OICXGoc8ilIgKsTTSuqORoMhmgWP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708743341; c=relaxed/simple;
	bh=s0+7DUkxC9v95WTMsMb6JK4YaSoyruhPTd6puPiPmmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTJ1iGi9hjZYN815SY4baXBDEakiWJK1a5rYc1DaK0nq+VfMhFSPzycJ3Skc8AxOHzqT9SUMlSf+9sX9vw46sExvWlgq94MdMKsTrxr1iXbk8VHG3y16o40mXT6DNeP8yHYKDGed+Lju3siGHAFCXptuTVLH34+0+MkRSJ2qmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESOlaq+9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESOlaq+9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so2048076a12.1
        for <oe-lkp@lists.linux.dev>; Fri, 23 Feb 2024 18:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708743338; x=1709348138; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKSTnM2v+jmLIpYPi1kbD+Pb1Qc9BSBN4XGZJPjFFPc=;
        b=ESOlaq+9co4EC45gKnCXoSQnZzMzq3k2Tcjkv/fqIyttqZg81b4Y6Q0/sPIJ4o4A2g
         hBV9oPFJBUKkrxrsOyHmaKgjZ/p7y6ySyqj7H854/CzgTJVQBIushK5vhCZ2HsCbRXgl
         /Xj6P8WegmpfhyHHDYuxUit33TYR4SajJIsYbTqy07b2GXkVY1y/4eEsasri5iXDPi1R
         em6Iq3n1XcgBkn+qN50DcDL/sejc1WSO22LQtu79ENJT0ik0ALfPOmbZsS2T31VNJjm/
         jubvcQmrRILKjIdI9h4HhekDAIsEl1YCfUWMyjy8xszrixW+oV0WgwD0JEh8szWDnRf3
         Ubdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708743338; x=1709348138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKSTnM2v+jmLIpYPi1kbD+Pb1Qc9BSBN4XGZJPjFFPc=;
        b=ddgugqMgIkOk7fCjZx31VcN36vIY+sVxsFApaiP5qymDMF5S3fOSWQop5Qz/iXmeZR
         1v320oFbQWMGhkgVawRQNAyGnHzhW64FPYYswgVy1NBNq66SuNBgrRNGy0YBFMHIBpcq
         2y+yld3VdOnEA3Nm18hGKi9TbyjngFRufnJ/eBWpSJuG+r4K9MC6Py7QOjljVmo6hoi1
         2bTXAkkoM76R60faqczX45G2bFT4lp0afmfLfFQka+a9tIKa4PTbhdVwmf3nYcdDISpE
         0LG+Hh5mma5OR6+KvESRutagJffIeT8xFFfjhtphVvywbSlLGsxx5MAEdOYUrpcoCZ/i
         4eWg==
X-Forwarded-Encrypted: i=1; AJvYcCUMlIwhj/s+elmjCWfGqyuvpjoC0BBegeJCyYjnw38o2/8zygE+yypmulYVK6ZGKKOrXMaJ21UyR16OjmA8rYJ77eJe6pf5
X-Gm-Message-State: AOJu0YyXSGyLUcifg6RRZ5N/e2mePMWqHMuPdiiTzD6gpIo/52gRAlD5
	zHAFYRkoSWUy00JiPLz84SYhEbfBkXucU0ZIrrjyihV2cJNWPDuuFiv/kWqqlEytdBUfitDifXx
	INyHSHTIgO982XW4AAj7sjpayGTQ=
X-Google-Smtp-Source: AGHT+IHqimg10K1/L+NRQXdNA2GGrmNDOmgRLEkO8bWLdybN2k28avxqLXsoB1b3MUY5xGyvrKtcfZlp0iCGclsq5VA=
X-Received: by 2002:a05:6402:5201:b0:565:a5e1:3a10 with SMTP id
 s1-20020a056402520100b00565a5e13a10mr183414edd.36.1708743337653; Fri, 23 Feb
 2024 18:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402201506.b7e4b9b6-oliver.sang@intel.com> <CANpmjNNGCkfFBNiSsc+DOm1EDzXZoNLQy_jnEZjt9WuxP5aayw@mail.gmail.com>
In-Reply-To: <CANpmjNNGCkfFBNiSsc+DOm1EDzXZoNLQy_jnEZjt9WuxP5aayw@mail.gmail.com>
From: Neeraj upadhyay <neeraj.iitr10@gmail.com>
Date: Sat, 24 Feb 2024 08:25:24 +0530
Message-ID: <CAFwiDX-tVTsNcbrzd63oCCat5DqzhouA_HQv4sd4xS=c-C01yQ@mail.gmail.com>
Subject: Re: [linux-next:master] [kasan] 187292be96: WARNING:suspicious_RCU_usage
To: Marco Elver <elver@google.com>
Cc: kernel test robot <oliver.sang@intel.com>, "Paul E. McKenney" <paulmck@kernel.org>, RCU <rcu@vger.kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Vlastimil Babka <vbabka@suse.cz>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 20, 2024 at 1:33=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> On Tue, 20 Feb 2024 at 08:35, kernel test robot <oliver.sang@intel.com> w=
rote:
> >
> >
> >
> > Hello,
> >
> > we noticed this is a revert commit, below report is for an issue we obs=
erved
> > on this commit but not on its parent. just FYI.
> >
> > 113edefd366346b3 187292be96ae2be247807fac1c3
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :6          100%           6:6     dmesg.WARNING:suspicious_=
RCU_usage
> >
> >
> > kernel test robot noticed "WARNING:suspicious_RCU_usage" on:
> >
> > commit: 187292be96ae2be247807fac1c3a6d89a7cc2a84 ("kasan: revert evicti=
on of stack traces in generic mode")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> This commit didn't touch rcutorture or the rcu subsystem in any way,
> so I currently don't understand how rcutorture would be affected.
> While stackdepot has started to use RCU, this already happened in a
> previous commit, and this particular commit actually reduced RCU usage
> (no more evictions and re-allocations of stacktraces).
>
> The only explanation I have is that it improved performance of a
> KASAN-enabled kernel (which the config here has enabled) so much that
> previously undiscovered issues have now become much more likely to
> occur.
>
> [+Cc rcu folks]
>
> > in testcase: rcutorture

The rcutorture test type executed here is busted_srcud (torture_type:
busted_srcud). The busted_srcud torture test creates bad reader critical
section usages - in this case the rcu reader lock acquired was not
srcu lock, which subsequently resulted in rcu_dereference_check() to
cause a splat due to srcu read lock not being held.

 So, this is expected behavior, and not a problem in either KASAN or RCU.



Thanks
Neeraj

> > version:
> > with following parameters:
> >
> >         runtime: 300s
> >         test: cpuhotplug
> >         torture_type: busted_srcud
> >
> >
> >
> > compiler: clang-17
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m=
 16G
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202402201506.b7e4b9b6-oliver.s=
ang@intel.com
> >
> >
> > [  292.513535][  T653] WARNING: suspicious RCU usage
> > [  292.514923][  T653] 6.8.0-rc4-00126-g187292be96ae #1 Not tainted
> > [  292.516369][  T653] -----------------------------
> > [  292.517743][  T653] kernel/rcu/rcutorture.c:1983 suspicious rcu_dere=
ference_check() usage!
> > [  292.519310][  T653]
> > [  292.519310][  T653] other info that might help us debug this:
> > [  292.519310][  T653]
> > [  292.523130][  T653]
> > [  292.523130][  T653] rcu_scheduler_active =3D 2, debug_locks =3D 1
> > [  292.525644][  T653] no locks held by rcu_torture_rea/653.
> > [  292.526974][  T653]
> > [  292.526974][  T653] stack backtrace:
> > [  292.529271][  T653] CPU: 0 PID: 653 Comm: rcu_torture_rea Not tainte=
d 6.8.0-rc4-00126-g187292be96ae #1
> > [  292.530780][  T653] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [  292.532329][  T653] Call Trace:
> > [  292.533524][  T653]  <TASK>
> > [ 292.534696][ T653] dump_stack_lvl (lib/dump_stack.c:?)
> > [ 292.535941][ T653] ? __cfi_dump_stack_lvl (lib/dump_stack.c:98)
> > [ 292.537221][ T653] ? lockdep_rcu_suspicious (kernel/locking/lockdep.c=
:6712)
> > [ 292.538523][ T653] rcu_torture_one_read (kernel/rcu/rcutorture.c:?) r=
cutorture
> > [ 292.539887][ T653] ? __cfi_lockdep_hardirqs_on_prepare (kernel/lockin=
g/lockdep.c:4312)
> > [ 292.541226][ T653] ? rcu_torture_timer (kernel/rcu/rcutorture.c:1955)=
 rcutorture
> > [ 292.542621][ T653] ? __cfi_rcu_torture_timer (kernel/rcu/rcutorture.c=
:2055) rcutorture
> > [ 292.544012][ T653] ? init_timer_key (include/linux/lockdep.h:135 incl=
ude/linux/lockdep.h:142 include/linux/lockdep.h:148 kernel/time/timer.c:847=
 kernel/time/timer.c:867)
> > [ 292.545262][ T653] rcu_torture_reader (kernel/rcu/rcutorture.c:2093) =
rcutorture
> > [ 292.546579][ T653] ? __cfi_rcu_torture_reader (kernel/rcu/rcutorture.=
c:2076) rcutorture
> > [ 292.547872][ T653] ? __cfi__raw_spin_unlock_irqrestore (kernel/lockin=
g/spinlock.c:193)
> > [ 292.549108][ T653] ? __cfi_rcu_torture_timer (kernel/rcu/rcutorture.c=
:2055) rcutorture
> > [ 292.550341][ T653] ? __kthread_parkme (kernel/kthread.c:?)
> > [ 292.551425][ T653] ? __kthread_parkme (include/linux/instrumented.h:?=
 include/asm-generic/bitops/instrumented-non-atomic.h:141 kernel/kthread.c:=
280)
> > [ 292.552489][ T653] kthread (kernel/kthread.c:390)
> > [ 292.553504][ T653] ? __cfi_rcu_torture_reader (kernel/rcu/rcutorture.=
c:2076) rcutorture
> > [ 292.554689][ T653] ? __cfi_kthread (kernel/kthread.c:341)
> > [ 292.555749][ T653] ret_from_fork (arch/x86/kernel/process.c:153)
> > [ 292.556792][ T653] ? __cfi_kthread (kernel/kthread.c:341)
> > [ 292.557852][ T653] ret_from_fork_asm (arch/x86/entry/entry_64.S:250)
> > [  292.558920][  T653]  </TASK>
> >
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20240220/202402201506.b7e4b9b6-=
oliver.sang@intel.com
> >
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
>
