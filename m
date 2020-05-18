Content-Type: multipart/mixed; boundary="===============1378372798136089270=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 2f08469563: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Mon, 18 May 2020 20:05:13 +0200
Message-ID: <20200518180513.GA114619@google.com>
In-Reply-To: <CAKwvOd=Gi2z_NjRfpTigCCcV5kUWU7Bm7h1eHLeQ6DZCmrsR8w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1378372798136089270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 18 May 2020, 'Nick Desaulniers' via kasan-dev wrote:

> On Mon, May 18, 2020 at 7:34 AM Marco Elver <elver@google.com> wrote:
> >
> > On Mon, 18 May 2020 at 14:44, Marco Elver <elver@google.com> wrote:
> > >
> > > [+Cc clang-built-linux FYI]
> > >
> > > On Mon, 18 May 2020 at 12:11, Marco Elver <elver@google.com> wrote:
> > > >
> > > > On Sun, 17 May 2020 at 05:47, Paul E. McKenney <paulmck@kernel.or=
g> wrote:
> > > > >
> > > > > On Sun, May 17, 2020 at 09:17:32AM +0800, kernel test robot wrote:
> > > > > > Greeting,
> > > > > >
> > > > > > FYI, we noticed the following commit (built with clang-11):
> > > > > >
> > > > > > commit: 2f08469563550d15cb08a60898d3549720600eee ("rcu: Mark rc=
u_state.ncpus to detect concurrent writes")
> > > > > > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.=
git dev.2020.05.14c
> > > > > >
> > > > > > in testcase: boot
> > > > > >
> > > > > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridg=
e -smp 2 -m 8G
> > > > > >
> > > > > > caused below changes (please refer to attached dmesg/kmsg for e=
ntire log/backtrace):
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > If you fix the issue, kindly add following tag
> > > > > > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > > > > >
> > > > > >
> > > > > > [    0.054943] BRK [0x05204000, 0x05204fff] PGTABLE
> > > > > > [    0.061181] BRK [0x05205000, 0x05205fff] PGTABLE
> > > > > > [    0.062403] BRK [0x05206000, 0x05206fff] PGTABLE
> > > > > > [    0.065200] RAMDISK: [mem 0x7a247000-0x7fffffff]
> > > > > > [    0.067344] ACPI: Early table checksum verification disabled
> > > > > > BUG: kernel reboot-without-warning in boot stage
> > > > >
> > > > > I am having some difficulty believing that this commit is at faul=
t given
> > > > > that the .config does not list CONFIG_KCSAN=3Dy, but CCing Marco =
Elver
> > > > > for his thoughts.  Especially given that I have never built with =
clang-11.
> > > > >
> > > > > But this does invoke ASSERT_EXCLUSIVE_WRITER() in early boot from
> > > > > rcu_init().  Might clang-11 have objections to early use of this =
macro?
> > > >
> > > > The macro is a noop without KCSAN. I think the bisection went wrong.
> > > >
> > > > I am able to reproduce a reboot-without-warning when building with
> > > > Clang 11 and the provided config. I did a bisect, starting with v5.6
> > > > (good), and found this:
> > > > - Since v5.6, first bad commit is
> > > > 20e2aa812620439d010a3f78ba4e05bc0b3e2861 (Merge tag
> > > > 'perf-urgent-2020-04-12' of
> > > > git://git.kernel.org/pub/scm/linux/kernel//git/tip/tip)
> > > > - The actual commit that introduced the problem is
> > > > 2b3b76b5ec67568da4bb475d3ce8a92ef494b5de (perf/x86/intel/uncore: Add
> > > > Ice Lake server uncore support) -- reverting it fixes the problem.
> >
> > Some more clues:
> >
> > 1. I should have noticed that this uses CONFIG_KASAN=3Dy.
> =

> Thanks for the report, testing, and bisection.  I don't see any
> smoking gun in the code.
> https://godbolt.org/z/qbK26r

My guess is data layout and maybe some interaction with KASAN. I also
played around with leaving icx_mmio_uncores empty, meaning none of the
data it refers to end up in the data section (presumably because
optimized out), which resulted in making the bug disappear as well.

> >
> > 2. Something about function icx_uncore_mmio_init(). Making it a noop
> > also makes the issue go away.
> >
> > 3. Leaving icx_uncore_mmio_init() a noop but removing the 'static'
> > from icx_mmio_uncores also presents the issue. So this seems to be
> > something about how/where icx_mmio_uncores is allocated.
> =

> Can you share the disassembly of icx_uncore_mmio_init() in the given
> configuration?

ffffffff8102c097 <icx_uncore_mmio_init>:
ffffffff8102c097:	e8 b4 52 bd 01       	callq  ffffffff82c01350 <__fentry__>
ffffffff8102c09c:	48 c7 c7 e0 55 c3 83 	mov    $0xffffffff83c355e0,%rdi
ffffffff8102c0a3:	e8 69 9a 3b 00       	callq  ffffffff813e5b11 <__asan_sto=
re8>
ffffffff8102c0a8:	48 c7 05 2d 95 c0 02 	movq   $0xffffffff83c388e0,0x2c0952=
d(%rip)        # ffffffff83c355e0 <uncore_mmio_uncores>
ffffffff8102c0af:	e0 88 c3 83 =

ffffffff8102c0b3:	c3                   	retq   =


The problem still happens if we add a __no_sanitize_address (or even
KASAN_SANITIZE :=3D n) here. I think this function is a red herring: you
can make this function be empty, but as long as icx_mmio_uncores and its
dependencies are added to the data section somewhere, does the bug
appear.

Thanks,
-- Marco
--===============1378372798136089270==--

