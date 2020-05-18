Content-Type: multipart/mixed; boundary="===============5607907374277193109=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 2f08469563: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Mon, 18 May 2020 12:11:06 +0200
Message-ID: <CANpmjNNj37=mgrZpzX7joAwnYk-GsuiE8oOm13r48FYAK0gSQw@mail.gmail.com>
In-Reply-To: <20200517034739.GO2869@paulmck-ThinkPad-P72>
List-Id: <oe-lkp.lists.linux.dev>

--===============5607907374277193109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 17 May 2020 at 05:47, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sun, May 17, 2020 at 09:17:32AM +0800, kernel test robot wrote:
> > Greeting,
> >
> > FYI, we noticed the following commit (built with clang-11):
> >
> > commit: 2f08469563550d15cb08a60898d3549720600eee ("rcu: Mark rcu_state.=
ncpus to detect concurrent writes")
> > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git dev.=
2020.05.14c
> >
> > in testcase: boot
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 8G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> >
> >
> > [    0.054943] BRK [0x05204000, 0x05204fff] PGTABLE
> > [    0.061181] BRK [0x05205000, 0x05205fff] PGTABLE
> > [    0.062403] BRK [0x05206000, 0x05206fff] PGTABLE
> > [    0.065200] RAMDISK: [mem 0x7a247000-0x7fffffff]
> > [    0.067344] ACPI: Early table checksum verification disabled
> > BUG: kernel reboot-without-warning in boot stage
>
> I am having some difficulty believing that this commit is at fault given
> that the .config does not list CONFIG_KCSAN=3Dy, but CCing Marco Elver
> for his thoughts.  Especially given that I have never built with clang-11.
>
> But this does invoke ASSERT_EXCLUSIVE_WRITER() in early boot from
> rcu_init().  Might clang-11 have objections to early use of this macro?

The macro is a noop without KCSAN. I think the bisection went wrong.

I am able to reproduce a reboot-without-warning when building with
Clang 11 and the provided config. I did a bisect, starting with v5.6
(good), and found this:
- Since v5.6, first bad commit is
20e2aa812620439d010a3f78ba4e05bc0b3e2861 (Merge tag
'perf-urgent-2020-04-12' of
git://git.kernel.org/pub/scm/linux/kernel//git/tip/tip)
- The actual commit that introduced the problem is
2b3b76b5ec67568da4bb475d3ce8a92ef494b5de (perf/x86/intel/uncore: Add
Ice Lake server uncore support) -- reverting it fixes the problem.

Thanks,
-- Marco
--===============5607907374277193109==--

