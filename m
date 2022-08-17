Content-Type: multipart/mixed; boundary="===============0789524366200593925=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: [USB] 3a2b1036e8: WARNING:possible_recursive_locking_detected
Date: Wed, 17 Aug 2022 17:52:21 -0400
Message-ID: <Yv1jFcPocWBkgL4v@rowland.harvard.edu>
In-Reply-To: <113d66dd-b2b5-fa2e-fbd3-53c5a5666867@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0789524366200593925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 04:43:01PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 3a2b1036e8951328b7e59517408897c700a74871 ("USB: gadget: Fix use-a=
fter-free Read in usb_udc_uevent()")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git l=
inux-5.4.y

How did you come by that combination?  The "USB: gadget: Fix =

use-after-free Read in usb_udc_uevent()" patch is not supposed to be =

applied to the 5.4.y kernel series.  It is only supposed to be applied =

to kernels which have [a backported version of] commit fc274c1e9973 =

("USB: gadget: Add a new bus for gadgets").

It's not surprising that you found an issue, applying that patch to a =

kernel where it doesn't belong.

Alan Stern

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

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <yujie.liu@intel.com>
> =

> =

> [   11.163772][    T1] WARNING: possible recursive locking detected
> [   11.163947][    T1] 5.4.210-00049-g3a2b1036e895 #2 Not tainted
> [   11.163947][    T1] --------------------------------------------
> [   11.163947][    T1] swapper/1 is trying to acquire lock:
> [ 11.163947][ T1] c1d981d8 (udc_lock){+.+.}, at: usb_udc_uevent (core.c:?)
> [   11.163947][    T1]
> [   11.163947][    T1] but task is already holding lock:
> [ 11.163947][ T1] c1d981d8 (udc_lock){+.+.}, at: usb_add_gadget_udc_relea=
se (??:?)
> [   11.163947][    T1]
> [   11.163947][    T1] other info that might help us debug this:
> [   11.163947][    T1]  Possible unsafe locking scenario:
> [   11.163947][    T1]
> [   11.163947][    T1]        CPU0
> [   11.163947][    T1]        ----
> [   11.163947][    T1]   lock(udc_lock);
> [   11.163947][    T1]
> [   11.163947][    T1]  *** DEADLOCK ***
> [   11.163947][    T1]
> [   11.163947][    T1]  May be due to missing lock nesting notation
> [   11.163947][    T1]
> [   11.163947][    T1] 2 locks held by swapper/1:
> [ 11.163947][ T1] #0: ee5440d8 (&dev->mutex){....}, at: device_lock (pci-=
sysfs.c:?)
> [ 11.163947][ T1] #1: c1d981d8 (udc_lock){+.+.}, at: usb_add_gadget_udc_r=
elease (??:?)
> [   11.163947][    T1]
> [   11.163947][    T1] stack backtrace:
> [   11.163947][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.4.210-00=
049-g3a2b1036e895 #2
> [   11.163947][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [   11.163947][    T1] Call Trace:
> [ 11.163947][ T1] dump_stack (??:?)
> [ 11.163947][ T1] __lock_acquire (lockdep.c:?)
> [ 11.163947][ T1] lock_acquire (??:?)
> [ 11.163947][ T1] ? usb_udc_uevent (core.c:?)
> [ 11.163947][ T1] __mutex_lock (mutex.c:?)
> [ 11.163947][ T1] ? usb_udc_uevent (core.c:?)
> [ 11.163947][ T1] ? add_uevent_var (??:?)
> [ 11.163947][ T1] mutex_lock_nested (??:?)
> [ 11.163947][ T1] ? usb_udc_uevent (core.c:?)
> [ 11.163947][ T1] usb_udc_uevent (core.c:?)
> [ 11.163947][ T1] dev_uevent (core.c:?)
> [ 11.163947][ T1] ? device_get_devnode (core.c:?)
> [ 11.163947][ T1] kobject_uevent_env (??:?)
> [ 11.163947][ T1] kobject_uevent (??:?)
> [ 11.163947][ T1] device_add (??:?)
> [ 11.163947][ T1] usb_add_gadget_udc_release (??:?)
> [ 11.163947][ T1] usb_add_gadget_udc (??:?)
> [ 11.163947][ T1] dummy_udc_probe (dummy_hcd.c:?)
--===============0789524366200593925==--

