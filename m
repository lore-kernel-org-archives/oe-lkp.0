Content-Type: multipart/mixed; boundary="===============5407279089336448739=="
MIME-Version: 1.0
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: lkp@lists.01.org
Subject: Re: [printk] e695fbe780: BUG:scheduling_while_atomic
Date: Fri, 23 Sep 2022 21:12:06 +0700
Message-ID: <a0634cfa-c44b-e9b4-401f-753071f0d963@gnuweeb.org>
In-Reply-To: <202209231537.b9d509b-oliver.sang@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5407279089336448739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/23/22 3:02 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: e695fbe780f429298dca1fd826601968b5d00200 ("printk: Prepare for SC=
RU console list protection")
> https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/printk.2022.=
09.11a
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-----------------------------+------------+------------+
> |                             | c522626383 | e695fbe780 |
> +-----------------------------+------------+------------+
> | boot_successes              | 12         | 0          |
> | boot_failures               | 0          | 16         |
> | BUG:scheduling_while_atomic | 0          | 16         |
> +-----------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/r/202209231537.b9d509b-oliver.sang(a)inte=
l.com
> =

> =

> [    0.326642][    T0] printk: console [tty0] enabled
> [    0.327777][    T0] printk: console [ttyS0] enabled
> [    0.329795][    T0] printk: bootconsole [earlyser0] disabled
> [    0.332327][    T0] BUG: scheduling while atomic: swapper/0/0x00000002
> [    0.333877][    T0] Modules linked in:
> [    0.335157][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc1-=
00138-ge695fbe780f4 #1
> [    0.337196][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [    0.343745][    T0] Call Trace:
> [    0.344608][    T0]  ? show_stack+0x33/0x39
> [    0.345628][    T0]  dump_stack_lvl+0x20/0x2a
> [    0.346859][    T0]  dump_stack+0xd/0x10
> [    0.347869][    T0]  __schedule_bug.cold+0x56/0x66
> [    0.349104][    T0]  __schedule+0x3df/0x4d0
> [    0.350260][    T0]  ? prb_read+0x78/0x1c0
> [    0.351334][    T0]  schedule+0x52/0xd0
> [    0.352362][    T0]  schedule_timeout+0x8d/0xd0
> [    0.353504][    T0]  ? __might_sleep+0x2f/0x90
> [    0.354723][    T0]  __wait_for_common+0x8b/0x190
> [    0.355826][    T0]  ? usleep_range_state+0xc0/0xc0
> [    0.357005][    T0]  wait_for_completion+0x1c/0x20
> [    0.358239][    T0]  synchronize_srcu+0x5e/0x80
> [    0.359453][    T0]  ? get_completed_synchronize_rcu+0x10/0x10
> [    0.360879][    T0]  console_unregister_locked+0x8b/0xa5
> [    0.362247][    T0]  register_console.cold+0x5f/0x6c
> [    0.363569][    T0]  univ8250_console_init+0x1b/0x25
> [    0.364813][    T0]  console_init+0x1f/0x24
> [    0.365865][    T0]  start_kernel+0x2b9/0x3bb
> [    0.367072][    T0]  i386_start_kernel+0x42/0x44
> [    0.385824][    T0]  startup_32_smp+0x161/0x164

Thanks for reporting, I will forward this to Paul.

-- =

Ammar Faizi
--===============5407279089336448739==--

