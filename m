Content-Type: multipart/mixed; boundary="===============0489212226746285922=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Mon, 03 Apr 2017 19:51:22 +0900
Message-ID: <20170403105122.GC17309@jagdpanzerIV.localdomain>
In-Reply-To: <87a881v52o.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0489212226746285922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (03/31/17 10:28), Eric W. Biederman wrote:
[..]
> > ... I'd also probably add pr_emerg() print-out to emergency_restart(),
> > the same way kernel_restart()/kernel_halt()/kernel_power_off() do.
> >
> > for those cases when emergency_restart() is called with printk in
> > kthreaded mode, not in emergency mode.
> =

> No. No. No.
> =

> emergency_restart should be the equivalent of a watchdog going off.
> AKA it is long past the point where you want to be coordinating
> with other parts of the kernel.  Rebooting is the priority.
> A print statement absolutely does not belong in emergency_restart.
> =

> The fact that nothing managed to get printed out without magic flushing
> code is highly disturbing.

Eric, have you checked what is usually going on right before the
emergency_restart() call?

a quick grep.

kernel/panic.c

	pr_emerg("Kernel panic - not syncing: %s\n", buf);
...
	console_flush_on_panic();
...
	emergency_restart();


kernel/debug/kdb/kdb_main.c

	kdb_printf("forcing reboot\n");
	kdb_reboot(0, NULL);
		emergency_restart();


kernel/debug/gdbstub.c

	gdb_cmd_reboot()
		printk(KERN_CRIT "Executing emergency reboot\n");
		machine_emergency_restart();


drivers/tty/sysrq.c

	__handle_sysrq()
		pr_info("SysRq : ");
		pr_cont("%s\n", op_p->action_msg);
		op_p->handler(key);
			sysrq_handle_reboot()
				emergency_restart()

and so on...


all those printk()-s, that are happening right before emergency_restart(),
in fact flush (!) all the pending logbuf messages to the serial console.
and seems it doesn't cause any troubles on you side. but having printk()
not one line _before_the emergency_restart(), but _in_ emergency_restart()
is all of a sudden very disturbing. how come?


> Looking from the outside this patchset appears to be broken by design.
> =

> If you don't want kernel functions suffering from the overhead of
> printing to a slow output device, don't do that then.

sorry, this is not productive. "don't use printk()" is not a solution.


> The point of printk is to give debugging output.  You have fundamentally
> incapacitated printk from serving it's primary purpose.

the point of the patch set is that printk has a fundamental issue -- it
can easily soft/hard lockup the system; it can stall RCU; it can cause
OOM; and so on and on and on.

	-ss

--===============0489212226746285922==--

