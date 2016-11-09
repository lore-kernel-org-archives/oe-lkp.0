Content-Type: multipart/mixed; boundary="===============2225482545390507697=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/copy_user] adb402cd14: will-it-scale.per_process_ops -12.7% regression
Date: Wed, 09 Nov 2016 13:42:14 +0100
Message-ID: <20161109124214.sjasqcurv6gi64ol@pd.tnic>
In-Reply-To: <20161107025038.GE21529@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2225482545390507697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 10:50:38AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -12.7% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit adb402cd1461eef6e1a21db4532a3b9e6a6be853 ("x86/copy_user: Unify th=
e code by removing the 64-bit asm _copy_*_user() variants")
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
> =

> in testcase: will-it-scale
> on test machine: 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz with 4G=
 memory
> with following parameters:
> =

> 	test: poll1
> 	cpufreq_governor: performance

...

> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
  ^^^^^^^^^^^^^^^^^^^^^^^^^

So Mel says that this might be the culprit for the observed
change in perf. Can you please rerun your test without that
CONFIG_DEBUG_ATOMIC_SLEEP thing?

Thanks.

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============2225482545390507697==--

