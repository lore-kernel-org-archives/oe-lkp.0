Content-Type: multipart/mixed; boundary="===============6750053063556174908=="
MIME-Version: 1.0
From: Nicolas Boichat <drinkcat@chromium.org>
To: lkp@lists.01.org
Subject: Re: [kmemleak] b751c52bb5: BUG:kernel_hang_in_boot_stage
Date: Wed, 10 Jun 2020 17:31:21 +0800
Message-ID: <CANMq1KCf3Q2DDBMJkCM=PB8AHOPKJOhKA+C8TqY5v7AsAfD63A@mail.gmail.com>
In-Reply-To: <20200610075156.GE12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6750053063556174908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 3:52 PM kernel test robot <rong.a.chen@intel.com>=
 wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: b751c52bb587ae66f773b15204ef7a147467f4c7 ("kmemleak: increase DEB=
UG_KMEMLEAK_EARLY_LOG_SIZE default to 16K")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Huh, It's not impossible there is an underlying issue, but I really
don't see how that change could cause any of the issues below...


> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +-------------------------------------------------+------------+---------=
---+
> |                                                 | 9d5f0be0f7 | b751c52b=
b5 |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 0          | 0       =
   |
> | boot_failures                                   | 3          | 4       =
   |
> | WARNING:at_kernel/locking/mutex.c:#__mutex_lock | 3          |         =
   |
> | EIP:__mutex_lock                                | 3          |         =
   |
> | BUG:kernel_hang_in_boot_stage                   | 0          | 4       =
   |
> +-------------------------------------------------+------------+---------=
---+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
>
> [    0.247058] ------------------------
> [    0.247878] | Locking API testsuite:
> [    0.248695] ----------------------------------------------------------=
------------------
> [    0.250509]                                  | spin |wlock |rlock |mut=
ex | wsem | rsem |
> [    0.252429]   --------------------------------------------------------=
------------------
> [    0.254369]                      A-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.263731]                  A-B-B-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.273828]              A-B-B-C-C-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.284876]              A-B-C-A-B-C deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.296642]          A-B-B-C-C-D-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.308919]          A-B-C-D-B-D-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.320993]          A-B-C-D-B-C-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.333668]                     double unlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.343237]                   initialize held:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |
> [    0.352761]   --------------------------------------------------------=
------------------
> [    0.354703]               recursive read-lock:             |  ok  |   =
          |  ok  |
> [    0.358943]            recursive read-lock #2:             |  ok  |   =
          |  ok  |
> [    0.363056]             mixed read-write-lock:             |  ok  |   =
          |  ok  |
> [    0.367191]             mixed write-read-lock:             |  ok  |   =
          |  ok  |
> [    0.371251]   mixed read-lock/lock-write ABBA:             |FAILED|   =
          |  ok  |
> [    0.373667]    mixed read-lock/lock-read ABBA:             |  ok  |   =
          |  ok  |
> [    0.377895]  mixed write-lock/lock-write ABBA:             |  ok  |   =
          |  ok  |
> [    0.381888]   --------------------------------------------------------=
------------------
> [    0.385416]      hard-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
> [    0.389990]      soft-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
> [    0.395489]      hard-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
> [    0.400157]      soft-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
> [    0.408936]        sirq-safe-A =3D> hirqs-on/12:  ok  |  ok  |  ok  |
> [    0.413666]        sirq-safe-A =3D> hirqs-on/21:  ok  |  ok  |  ok  |
> [    0.418073]          hard-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
> [    0.422942]          soft-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
> [    0.427616]          hard-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
> [    0.433873]          soft-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
> [    0.442630]     hard-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
> [    0.447955]     soft-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
> [    0.453324]     hard-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
> [    0.458298]     soft-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
> [    0.463422]     hard-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
> [    0.468262]     soft-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
> [    0.473090]     hard-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
> [    0.478066]     soft-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
> [    0.482982]     hard-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
> [    0.490885]     soft-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
> [    0.496095]     hard-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
> [    0.501193]     soft-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
> [    0.506457]     hard-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
> [    0.516060]     soft-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
> [    0.521157]     hard-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
> [    0.530477]     soft-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
> [    0.535387]     hard-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
> [    0.540393]     soft-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
> [    0.552196]     hard-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
> [    0.557088]     soft-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
> [    0.562135]     hard-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
> [    0.567072]     soft-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
> [    0.572107]     hard-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
> [    0.577276]     soft-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
> [    0.582592]       hard-irq lock-inversion/123:  ok  |  ok  |  ok  |
> [    0.587839]       soft-irq lock-inversion/123:  ok  |  ok  |  ok  |
> [    0.593347]       hard-irq lock-inversion/132:  ok  |  ok  |  ok  |
> [    0.598574]       soft-irq lock-inversion/132:  ok  |  ok  |  ok  |
> [    0.603629]       hard-irq lock-inversion/213:  ok  |  ok  |  ok  |
> [    0.608515]       soft-irq lock-inversion/213:  ok  |  ok  |  ok  |
> [    0.613650]       hard-irq lock-inversion/231:  ok  |  ok  |  ok  |
> [    0.620111]       soft-irq lock-inversion/231:  ok  |  ok  |  ok  |
> [    0.625090]       hard-irq lock-inversion/312:  ok  |  ok  |  ok  |
> [    0.630141]       soft-irq lock-inversion/312:  ok  |  ok  |  ok  |
> [    0.634948]       hard-irq lock-inversion/321:  ok  |  ok  |  ok  |
> [    0.639932]       soft-irq lock-inversion/321:  ok  |  ok  |  ok  |
> [    0.645786]       hard-irq read-recursion/123:  ok  |
> [    0.648025]       soft-irq read-recursion/123:  ok  |
> [    0.650400]       hard-irq read-recursion/132:  ok  |
> [    0.652820]       soft-irq read-recursion/132:  ok  |
> [    0.655214]       hard-irq read-recursion/213:  ok  |
> [    0.657531]       soft-irq read-recursion/213:  ok  |
> [    0.659993]       hard-irq read-recursion/231:  ok  |
> [    0.662498]       soft-irq read-recursion/231:  ok  |
> [    0.664895]       hard-irq read-recursion/312:  ok  |
> [    0.667422]       soft-irq read-recursion/312:  ok  |
> [    0.669851]       hard-irq read-recursion/321:  ok  |
> [    0.672222]       soft-irq read-recursion/321:  ok  |
> [    0.674713]   --------------------------------------------------------=
------------------
> [    0.676711]   | Wound/wait tests |
> [    0.677592]   ---------------------
> [    0.678496]                   ww api failures:  ok  |  ok  |  ok  |
> [    0.684457]                ww contexts mixing:  ok  |  ok  |
> [    0.688135]              finishing ww context:  ok  |  ok  |  ok  |  o=
k  |
> [    0.694329]                locking mismatches:  ok  |  ok  |  ok  |
> [    0.699328]                  EDEADLK handling:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> [    0.714881]            spinlock nest unlocked:  ok  |
> [    0.717152]   -----------------------------------------------------
> [    0.718723]                                  |block | try  |context|
> [    0.720196]   -----------------------------------------------------
> [    0.721677]                           context:  ok  |  ok  |  ok  |
> [    0.727929]                               try:  ok  |  ok  |  ok  |
> [    0.732790]                             block:  ok  |  ok  |  ok  |
> [    0.737894]                          spinlock:  ok  |  ok  |  ok  |
> [    0.743082] -------------------------------------------------------
> [    0.744547] Good, all 261 testcases passed! |
> [    0.745547] ---------------------------------
> BUG: kernel hang in boot stage
>
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.3.0-11789-gb751c52bb587a .config
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 olddefconfig prepare m=
odules_prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>
>
> Thanks,
> Rong Chen
>
--===============6750053063556174908==--

