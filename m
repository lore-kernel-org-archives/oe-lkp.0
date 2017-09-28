Content-Type: multipart/mixed; boundary="===============3131357111999782368=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] f5caf621ee: PANIC:double_fault
Date: Thu, 28 Sep 2017 10:49:41 +0200
Message-ID: <20170928084941.ygmvb6qfn3otfvac@gmail.com>
In-Reply-To: <20170928081850.ep3nqulhxeakwmzs@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3131357111999782368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Sep 28, 2017 at 09:59:07AM +0200, Ingo Molnar wrote:
> > =

> > * kernel test robot <xiaolong.ye@intel.com> wrote:
> > =

> > > =

> > > FYI, we noticed the following commit:
> > > =

> > > commit: f5caf621ee357279e759c0911daf6d55c7d36f03 ("x86/asm: Fix inlin=
e asm call constraints for Clang")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > > in testcase: trinity
> > > with following parameters:
> > > =

> > > 	runtime: 300s
> > > =

> > > test-description: Trinity is a linux system call fuzz tester.
> > > test-url: http://codemonkey.org.uk/projects/trinity/
> > > =

> > > =

> > > on test machine: qemu-system-x86_64 -enable-kvm -m 420M
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > +-----------------------------------------+------------+------------+
> > > |                                         | 0d0970eef3 | f5caf621ee |
> > > +-----------------------------------------+------------+------------+
> > > | boot_successes                          | 9          | 4          |
> > > | boot_failures                           | 0          | 4          |
> > > | PANIC:double_fault                      | 0          | 4          |
> > > | Kernel_panic-not_syncing:Machine_halted | 0          | 4          |
> > > +-----------------------------------------+------------+------------+
> > =

> > I think a key piece of information is that the test is using GCC 4.4:
> > =

> >         export compiler=3D'gcc-4.4'
> > =

> > ... which is pretty old compared to what gets tested typically.
> > =

> > GCC 4.4 was released in 2009 (!), the last minor update of 4.4.7 was 5 =
years ago.
> =

> Sure, but its still an officially supported GCC version. So either it
> must be made to work, or we must update the minimal GCC version
> requirements for the kernel.

Of course! I just mean I'd not be surprised if this was a GCC bug/quirk
with legacy GCC versions that probably won't be fixed.

Thanks,

	Ingo

--===============3131357111999782368==--

