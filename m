Content-Type: multipart/mixed; boundary="===============6381259564489142781=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [ 53.230885] RIP: 0010:[<ffffffff811b3557>] [<ffffffff811b3557>] qlink_free
Date: Mon, 01 Aug 2016 22:16:04 +0800
Message-ID: <20160801141604.GA30677@wfg-t540p.sh.intel.com>
In-Reply-To: <20160801135947.GA24942@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6381259564489142781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2016 at 09:59:47PM +0800, Fengguang Wu wrote:
>Hi Alexander,
>
>>When I build the kernel with your config and run the script, QEMU
>>bails out with an error message:
>>  qemu: linux kernel too old to load a ram disk
>>Any idea how to work around that?
>
>Yes this config may not include necessary parts. I cannot enter initrd
>this way:
>
>[    3.079656] Failed to execute /init (error -8)
>[    3.082079] Starting init: /sbin/init exists but couldn't execute it (e=
rror -8)
>[    3.084836] Starting init: /etc/init exists but couldn't execute it (er=
ror -13)
>[    3.088568] Starting init: /bin/sh exists but couldn't execute it (erro=
r -8)
>[    3.090560] Kernel panic - not syncing: No working init found.  Try pas=
sing init=3D option to kernel. See Linux Documentation/init.txt for guidanc=
e.

Sorry I fed it with an i386 initrd.. Now I can reach this point.

However no luck to reproduce the qlink_free() bug in the newer machine.

[   14.454154] Freeing unused kernel memory: 1140K (ffff8800018e3000 - ffff=
880001a00000)
[   14.458196] Freeing unused kernel memory: 364K (ffff880001da5000 - ffff8=
80001e00000)
[   17.368599] init[1] vsyscall attempted with vsyscall=3Dnone ip:fffffffff=
f600400 cs:33 sp:7ffd3e371148 ax:ffffffffff600400 si:7ffd3e371090 di:7ffd3e=
371280
[   17.372230] init[1]: segfault at ffffffffff600400 ip ffffffffff600400 sp=
 00007ffd3e371148 error 15
[   17.375448] init[1] vsyscall attempted with vsyscall=3Dnone ip:fffffffff=
f600400 cs:33 sp:7ffd3e370778 ax:ffffffffff600400 si:7f683dc55a4c di:7ffd3e=
370838
[   17.386163] init[1]: segfault at ffffffffff600400 ip ffffffffff600400 sp=
 00007ffd3e370778 error 15
[   17.389439] Kernel panic - not syncing: Attempted to kill init! exitcode=
=3D0x0000000b
[   17.389439]
[   17.392589] CPU: 0 PID: 1 Comm: init Not tainted 4.7.0-rc7-00002-g85d9ad=
b #1
[   17.394448] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[   17.397634]  ffffffff81e4c300 ffff8800361ef9a8 ffffffff814710db ffff8800=
361efa28
[   17.400247]  ffffffff8115bdf6 ffffffff00000010 ffff8800361efa38 ffff8800=
361ef9d8
[   17.402842]  ffff8800361e0040 ffff8800361ef9f8 000000000000000b ffff8800=
361e0040
[   17.405416] Call Trace:
[   17.406260]  [<ffffffff814710db>] dump_stack+0x19/0x1e
[   17.407582]  [<ffffffff8115bdf6>] panic+0xd8/0x243
[   17.408868]  [<ffffffff8107caf7>] forget_original_parent+0xe7/0x3f0
[   17.410314]  [<ffffffff8107e3b0>] ? exit_notify+0x30/0x1d0
[   17.411716]  [<ffffffff810bb92e>] ? do_raw_write_lock+0xe/0x80
[   17.413082]  [<ffffffff8107e3bb>] exit_notify+0x3b/0x1d0
[   17.414351]  [<ffffffff810f751c>] ? cgroup_exit+0xdc/0x140
[   17.415618]  [<ffffffff818d6059>] ? _cond_resched+0x9/0x30
[   17.416922]  [<ffffffff8115b309>] ? unregister_hw_breakpoint+0x9/0x20
[   17.418442]  [<ffffffff8107e8f9>] do_exit+0x3a9/0x480
[   17.419765]  [<ffffffff8108cac4>] ? get_signal+0x4f4/0x520
[   17.421101]  [<ffffffff8107ea65>] do_group_exit+0x95/0xd0
[   17.422446]  [<ffffffff8108ca82>] get_signal+0x4b2/0x520
[   17.423749]  [<ffffffff8115bfa6>] ? printk+0x45/0x47
[   17.424986]  [<ffffffff8103c154>] ? __bad_area_nosemaphore+0x1a4/0x1e0
[   17.426404]  [<ffffffff81013bba>] do_signal+0x2a/0xd0
[   17.427650]  [<ffffffff810c13af>] ? vprintk_default+0x1f/0x30
[   17.428815]  [<ffffffff81001707>] ? exit_to_usermode_loop+0x47/0xd0
[   17.430042]  [<ffffffff810b6873>] ? trace_hardirqs_on_caller+0x193/0x1f0
[   17.431341]  [<ffffffff81001735>] exit_to_usermode_loop+0x75/0xd0
[   17.432568]  [<ffffffff81001d5d>] prepare_exit_to_usermode+0x7d/0x90
[   17.433805]  [<ffffffff818dc771>] retint_user+0x8/0x20
[   17.434952] Kernel Offset: disabled

Thanks,
Fengguang

--===============6381259564489142781==--

