Content-Type: multipart/mixed; boundary="===============4892195348057452587=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: lkp@lists.01.org
Subject: Re: [serial] 679193b7ba: BUG:spinlock_bad_magic_on_CPU
Date: Sun, 02 Aug 2020 13:50:29 +0300
Message-ID: <CAHp75Vcdwz2RynZ0KVCDMFyO_GPREgGdCNVNGqosjf6iV0_uog@mail.gmail.com>
In-Reply-To: <20200802054852.GR23458@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4892195348057452587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2020 at 8:54 AM kernel test robot <lkp@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 679193b7baf8d88e41cbeb397ca17f797654947d ("serial: 8250: Let seri=
al core initialise spin lock")
> https://git.kernel.org/cgit/linux/kernel/git/gregkh/tty.git tty-next
>
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +-------------------------------+------------+------------+
> |                               | f3af1b68fc | 679193b7ba |
> +-------------------------------+------------+------------+
> | boot_successes                | 4          | 0          |
> | boot_failures                 | 0          | 4          |
> | BUG:spinlock_bad_magic_on_CPU | 0          | 4          |
> +-------------------------------+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>

Thanks for the report. I didn't see it on real hardware though. Maybe
because of timing (race?) differences.

Greg, I think the best is to revert the change until I will have better one.

-- =

With Best Regards,
Andy Shevchenko
--===============4892195348057452587==--

