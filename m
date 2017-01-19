Content-Type: multipart/mixed; boundary="===============3512695516388399104=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] e5a305ac4a: WARNING:at_lib/list_debug.c:#__list_del_entry_valid
Date: Wed, 18 Jan 2017 16:49:53 -0800
Message-ID: <20170118164953.430a36a5643e2d05df7322b8@linux-foundation.org>
In-Reply-To: <20170119004025.GA20827@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3512695516388399104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Jan 2017 08:40:25 +0800 Ye Xiaolong <xiaolong.ye@intel.com> wr=
ote:

> On 01/18, Andrew Morton wrote:
> >On Wed, 18 Jan 2017 09:23:04 +0800 kernel test robot <xiaolong.ye@inte=
l.com> wrote:
> >
> >> =

> >> FYI, we noticed the following commit:
> >> =

> >> commit: e5a305ac4a5233e039586c97f4ea643a4c7dc484 ("Reimplement IDR and=
 IDA using the radix tree")
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ma=
ster
> >> =

> >> in testcase: trinity
> >> with following parameters:
> >> =

> >> 	runtime: 300s
> >> =

> >> test-description: Trinity is a linux system call fuzz tester.
> >> test-url: http://codemonkey.org.uk/projects/trinity/
> >> =

> >> =

> >> on test machine: qemu-system-i386 -enable-kvm -m 256M
> >> =

> >> ...
> >> =

> >> [    2.963488] input: AT Translated Set 2 keyboard as /devices/platfor=
m/i8042/serio0/input/input1
> >> [    2.964998] evbug: Connected device: input1 (AT Translated Set 2 ke=
yboard at isa0060/serio0/input0)
> >> [    2.966202] ------------[ cut here ]------------
> >> [    2.966844] WARNING: CPU: 0 PID: 14 at lib/list_debug.c:55 __list_d=
el_entry_valid+0x43/0xb0
> >> [    2.968198] list_del corruption. next->prev should be bc904168, but=
 was b215df80
> >> [    2.969171] CPU: 0 PID: 14 Comm: kworker/0:1 Not tainted 4.10.0-rc2=
-02114-ge5a305a #1
> >> [    2.970209] Workqueue: events_long serio_handle_event
> >> [    2.970893] Call Trace:
> >> [    2.971217]  dump_stack+0x16/0x19
> >> [    2.971677]  __warn+0xa5/0xc0
> >> [    2.972074]  warn_slowpath_fmt+0x28/0x30
> >
> >Thanks.
> >
> >That isn't a very good backtrace.  Is that really the entire output?
> =

> Hmm, it is a fragment of the entire backtrace, the whole output can be fo=
und in
> attached dmesg.xz, we'll try to paste the whole backtrace next time.

Ah, OK, thanks.  This:

[    2.966202] ------------[ cut here ]------------
[    2.966844] WARNING: CPU: 0 PID: 14 at lib/list_debug.c:55 __list_del_en=
try_valid+0x43/0xb0
[    2.968198] list_del corruption. next->prev should be bc904168, but was =
b215df80
[    2.969171] CPU: 0 PID: 14 Comm: kworker/0:1 Not tainted 4.10.0-rc2-0211=
4-ge5a305a #1
[    2.970209] Workqueue: events_long serio_handle_event
[    2.970893] Call Trace:
[    2.971217]  dump_stack+0x16/0x19
[    2.971677]  __warn+0xa5/0xc0
[    2.972074]  warn_slowpath_fmt+0x28/0x30
[    2.972587]  __list_del_entry_valid+0x43/0xb0
[    2.973186]  devices_kset_move_last+0x2d/0x80
[    2.973815]  ? driver_sysfs_add+0x5a/0x80
[    2.974341]  really_probe+0x127/0x230
[    2.974849]  __driver_attach+0x7f/0xa0
[    2.975345]  ? really_probe+0x230/0x230
[    2.975873]  bus_for_each_dev+0x4f/0x80
[    2.976375]  driver_attach+0x14/0x20
[    2.976868]  ? really_probe+0x230/0x230
[    2.977370]  serio_handle_event+0x1bb/0x230
[    2.977953]  ? process_one_work+0x105/0x3f0
[    2.978504]  process_one_work+0x153/0x3f0
[    2.979054]  ? process_one_work+0x105/0x3f0
[    2.979596]  worker_thread+0x39/0x460
[    2.980104]  ? _raw_spin_unlock_irqrestore+0x3d/0x50
[    2.980803]  kthread+0xd9/0x110
[    2.981211]  ? process_one_work+0x3f0/0x3f0
[    2.981782]  ? __kthread_create_on_node+0x190/0x190
[    2.982426]  ret_from_fork+0x19/0x30
[    2.982919] ---[ end trace 842edab4ceba3acb ]---



--===============3512695516388399104==--

