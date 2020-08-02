Content-Type: multipart/mixed; boundary="===============8669130519367551737=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [serial] 679193b7ba: BUG:spinlock_bad_magic_on_CPU
Date: Sun, 02 Aug 2020 12:58:08 +0200
Message-ID: <20200802105808.GA164531@kroah.com>
In-Reply-To: <CAHp75Vcdwz2RynZ0KVCDMFyO_GPREgGdCNVNGqosjf6iV0_uog@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8669130519367551737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 02, 2020 at 01:50:29PM +0300, Andy Shevchenko wrote:
> On Sun, Aug 2, 2020 at 8:54 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 679193b7baf8d88e41cbeb397ca17f797654947d ("serial: 8250: Let se=
rial core initialise spin lock")
> > https://git.kernel.org/cgit/linux/kernel/git/gregkh/tty.git tty-next
> >
> >
> > in testcase: boot
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> > +-------------------------------+------------+------------+
> > |                               | f3af1b68fc | 679193b7ba |
> > +-------------------------------+------------+------------+
> > | boot_successes                | 4          | 0          |
> > | boot_failures                 | 0          | 4          |
> > | BUG:spinlock_bad_magic_on_CPU | 0          | 4          |
> > +-------------------------------+------------+------------+
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <lkp@intel.com>
> =

> Thanks for the report. I didn't see it on real hardware though. Maybe
> because of timing (race?) differences.
> =

> Greg, I think the best is to revert the change until I will have better o=
ne.

Can you send me a revert patch with the reported-by: set up?

thanks,

greg k-h
--===============8669130519367551737==--

