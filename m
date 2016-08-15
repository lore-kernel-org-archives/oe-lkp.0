Content-Type: multipart/mixed; boundary="===============2595603975182189717=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 15:00:16 +1000
Message-ID: <20160815050016.GY19025@dastard>
In-Reply-To: <CA+55aFxbLsD_btd0qXpuxTqAB5OQF1O+v7-OMgj8ftBE4Qd7WA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2595603975182189717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 07:53:40PM -0700, Linus Torvalds wrote:
> On Sun, Aug 14, 2016 at 7:28 PM, Dave Chinner <david@fromorbit.com> wro=
te:
> >>
> >> Maybe your symbol table came from a old kernel, and functions moved
> >> around enough that the profile attributions ended up bogus.
> >
> > No, I don't think so. I don't install symbol tables on my test VMs,
> > I let /proc/kallsyms do that work for me. From an strace of 'perf
> > top -U -g":
> =

> Ok. But something is definitely wrong with your profile.
> =

> What does it say if you annotate that _raw_spin_unlock_irqrestore() funct=
ion?
....

raw_spin_unlock_irqrestore  /proc/kcore
       =C2=BF
       =C2=BF
       =C2=BF
       =C2=BF    Disassembly of section load0:
       =C2=BF
       =C2=BF    ffffffff81e628b0 <load0>:
       =C2=BF      nop
       =C2=BF      push   %rbp
       =C2=BF      mov    %rsp,%rbp
       =C2=BF      movb   $0x0,(%rdi)
       =C2=BF      nop
       =C2=BF      mov    %rsi,%rdi
       =C2=BF      push   %rdi
       =C2=BF      popfq
 99.35 =C2=BF      nop
       =C2=BF      decl   %gs:0x7e1a9bc7(%rip)
  0.65 =C2=BF    =C2=BF je     25
       =C2=BF      pop    %rbp
       =C2=BF    =C2=BF retq
       =C2=BF25:   callq  0xffffffff81002000
       =C2=BF      pop    %rbp
       =C2=BF    =C2=BF retq


> I guarantee you that no, it's not spending 41% of time in
> spin_unlock_irqrestore. That just isn't a valid profile. There's
> something seriously wrong somewhere.
> =

> The fact that you then get the same profile when you turn _off_
> CONFIG_DEBUG_SPINLOCK only proves there is something going on that is
> pure garbage.
> =

> I suspect that what you did was to edit the .config file, remove
> DEBUG_SPINLOCK, and then do "make oldconfig" again.

Yes.

> And it got turned on again,

No. I'm not that stupid - I checked:

$ grep SPINLOCK .config
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
CONFIG_QUEUED_SPINLOCKS=3Dy
CONFIG_PARAVIRT_SPINLOCKS=3Dy
# CONFIG_DEBUG_SPINLOCK is not set
$

> because you have one of the lock debugging
> options on that force spinlock debuggin on again:

>  - DEBUG_WW_MUTEX_SLOWPATH
>  - DEBUG_LOCK_ALLOC
>  - PROVE_LOCKING

None of which are set:

$ grep 'DEBUG\|PROVE' .config |grep -v '#'
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
CONFIG_DEBUG_RODATA=3Dy
CONFIG_SLUB_DEBUG=3Dy
CONFIG_HAVE_DMA_API_DEBUG=3Dy
CONFIG_X86_DEBUGCTLMSR=3Dy
CONFIG_PM_DEBUG=3Dy
CONFIG_PM_SLEEP_DEBUG=3Dy
CONFIG_DEBUG_DEVRES=3Dy
CONFIG_PNP_DEBUG_MESSAGES=3Dy
CONFIG_XFS_DEBUG=3Dy
CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
CONFIG_CIFS_DEBUG=3Dy
CONFIG_DEBUG_INFO=3Dy
CONFIG_DEBUG_FS=3Dy
CONFIG_DEBUG_KERNEL=3Dy
CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
CONFIG_DEBUG_STACK_USAGE=3Dy
CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
CONFIG_SCHED_DEBUG=3Dy
CONFIG_DEBUG_MUTEXES=3Dy
CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
CONFIG_DEBUG_BUGVERBOSE=3Dy
CONFIG_DEBUG_LIST=3Dy
CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
CONFIG_DEBUG_BOOT_PARAMS=3Dy
$

> [ Light goes on ]
> =

> Oh, no, I can see another possibility: you're not doing proper CPU
> profiles, you're doing some timer-irq profile, and the reason you get
> 41% on spin_unlock_irq_restore() is that that is where the interrupts
> are enabled again.
> =

> Timer-interrupt based profiles are not useful either.

I've just been using whatever perf defaults to. Defaults are
supposed to be useful - if they aren't then perf needs to be fixed.
perf top reports this by default:

Samples: 118K of event 'cpu-clock', Event count (approx.): 793748915
Overhead  Shared O  Symbol                                                 =
                                                                           =
                 =C2=BF
  34.48%  [kernel]  [k] _raw_spin_unlock_irqrestore                        =
                                                                           =
                 =C2=BF
   7.89%  [kernel]  [k] copy_user_generic_string                           =
                                                                           =
                 =C2=BF
   5.08%  [kernel]  [k] _raw_spin_unlock_irq

...

> Make sure you actually use "perf record -e cycles:pp" or something
> that uses PEBS to get real profiles using CPU performance counters.

WTF is PEBS? I'm not a CPU nerd, and I certainly don't expect to
have to learn all the intricacies of hardware performance counters
just to profile the kernel in a correct and sane manner. That's what
the *perf defaults* are supposed to do.


Anyway: `perf top -U -e cycles:pp`:

Samples: 301K of event 'cpu-clock:ppH', Event count (approx.): 69364814
Overhead  Shared O  Symbol                                                 =
                                                                           =
                 =C2=BF
  30.89%  [kernel]  [k] _raw_spin_unlock_irqrestore                        =
                                                                           =
                 =C2=BF
   7.04%  [kernel]  [k] _raw_spin_unlock_irq                               =
                                                                           =
                 =C2=BF
   4.08%  [kernel]  [k] copy_user_generic_string                           =
                                                                           =
                 =C2=BF
   2.44%  [kernel]  [k] get_page_from_freelist                             =
                                                                           =
                 =C2=BF
   1.81%  [kernel]  [k] _raw_spin_lock

No change.

$ sudo perf record -e cycles:pp -a --all-kernel -- xfs_io -f -c "pwrite 0 4=
7g" /mnt/scratch/fooey

# Samples: 2M of event 'cpu-clock:khppH'
# Event count (approx.): 588517250000
#
# Overhead  Command          Shared Object      Symbol                     =
               =

# ........  ...............  .................  ...........................=
...............
#
    83.09%  swapper          [kernel.kallsyms]  [k] native_safe_halt
     1.42%  xfs_io           [kernel.kallsyms]  [k] copy_user_generic_string
     1.26%  kswapd3          [kernel.kallsyms]  [k] _raw_spin_unlock_irqres=
tore
     1.24%  kswapd1          [kernel.kallsyms]  [k] _raw_spin_unlock_irqres=
tore
     1.09%  kswapd2          [kernel.kallsyms]  [k] _raw_spin_unlock_irqres=
tore
     0.98%  kswapd0          [kernel.kallsyms]  [k] _raw_spin_unlock_irqres=
tore
     0.80%  xfs_io           [kernel.kallsyms]  [k] _raw_spin_unlock_irqres=
tore
     0.77%  kworker/u34:2    [kernel.kallsyms]  [k] _raw_spin_unlock_irqres=
tore
     0.73%  xfs_io           [kernel.kallsyms]  [k] _raw_spin_unlock_irq
     0.51%  xfs_io           [kernel.kallsyms]  [k] get_page_from_freelist
     0.39%  xfs_io           [kernel.kallsyms]  [k] __block_commit_write.is=
ra.29
     0.16%  xfs_io           [kernel.kallsyms]  [k] _raw_spin_lock
     0.14%  xfs_io           [kernel.kallsyms]  [k] up_write
     0.14%  kworker/u34:2    [kernel.kallsyms]  [k] clear_page_dirty_for_io
     0.14%  kworker/u34:2    [kernel.kallsyms]  [k] xfs_do_writepage
....

It's exactly the same profile, just reported as a percentage of 16
CPUs rather than normalised to a single CPU.  From my ignorant
viewpoing, I'd say that's expected because perf is still using
"cpu-clock" event configuration.

The hardware event counters are undocumented in the perf man pages,
perf-list doesn't output a single "cpu" or "cycles" event counter,
or even what hardware event counters are available. Hence I've got
no idea if it's broken, why "cycles" (or "cpu-cycles") doesn't
apparently record "cycle" triggered events, or even what perf is
supposed to tell me is it's recording cycle triggered events.

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============2595603975182189717==--

