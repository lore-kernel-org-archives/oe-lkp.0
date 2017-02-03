Content-Type: multipart/mixed; boundary="===============8677039001569527555=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [PM / QOS] 3a8bc3c5ea: kernel_BUG_at_kernel/workqueue.c
Date: Fri, 03 Feb 2017 14:25:45 +0800
Message-ID: <20170203062545.GA3698@yexl-desktop>
In-Reply-To: <20170119043306.GF11478@vireshk-i7>
List-Id: <oe-lkp.lists.linux.dev>

--===============8677039001569527555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/19, Viresh Kumar wrote:
>On 17-01-17, 10:40, kernel test robot wrote:
>> =

>> FYI, we noticed the following commit:
>> =

>> commit: 3a8bc3c5ea623f1658dbe002b93976a4ff19a2f7 ("PM / QOS: Add 'perfor=
mance' request")
>> https://git.linaro.org/people/vireshk/linux opp/genpd-performance-state
>> =

>> in testcase: boot
>> =

>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -m 512M
>> =

>> caused below changes:
>> =

>> =

>> +---------------------------------------------------+------------+------=
------+
>> |                                                   | 6ece60ef12 | 3a8bc=
3c5ea |
>> +---------------------------------------------------+------------+------=
------+
>> | boot_successes                                    | 1          | 0    =
      |
>> | boot_failures                                     | 93         | 193  =
      |
>> | WARNING:at_lib/list_debug.c:#__list_add_valid     | 31         | 54   =
      |
>> | BUG:kernel_hang_in_test_stage                     | 90         | 121  =
      |
>> | WARNING:at_drivers/usb/core/urb.c:#usb_submit_urb | 1          | 1    =
      |
>> | general_protection_fault:#[##]SMP                 | 0          | 39   =
      |
>> | Kernel_panic-not_syncing:Fatal_exception          | 0          | 71   =
      |
>> | kernel_BUG_at_kernel/workqueue.c                  | 0          | 19   =
      |
>> | invalid_opcode:#[##]SMP                           | 0          | 30   =
      |
>> | WARNING:at_fs/kernfs/dir.c:#kernfs_get            | 0          | 1    =
      |
>> | BUG:unable_to_handle_kernel                       | 0          | 7    =
      |
>> | Oops                                              | 0          | 7    =
      |
>> | kernel_BUG_at_mm/slub.c                           | 0          | 11   =
      |
>> +---------------------------------------------------+------------+------=
------+
>> =

>> =

>> =

>> =

>> [   98.099740] evbug: Connected device: input3 (AT Translated Set 2 keyb=
oard at isa0060/serio0/input0)
>> [   98.228482] usb 1-1: new high-speed USB device number 2 using dummy_h=
cd
>> [   98.287950] ------------[ cut here ]------------
>> [   98.305941] kernel BUG at kernel/workqueue.c:3486!
>> [   98.328787] invalid opcode: 0000 [#1] SMP
>> [   98.345473] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc2-0005=
1-g3a8bc3c #1
>> [   98.376651] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.9.3-20161025_171302-gandalf 04/01/2014
>> [   98.413393] task: ffff88001f720000 task.stack: ffff88001f724000
>> [   98.434333] RIP: 0010:init_pwq+0xf/0xe3
>> [   98.450692] RSP: 0000:ffff88001f727d38 EFLAGS: 00010202
>> [   98.469653] RAX: ffffffff825e17c9 RBX: ffffffff825e17c9 RCX: 00000000=
00000441
>> [   98.492725] RDX: ffff88001f409000 RSI: ffff880019c9f800 RDI: ffffffff=
825e17c9
>> [   98.516020] RBP: ffff88001f727d58 R08: ffff88001f818180 R09: 00000000=
00000001
>> [   98.541143] R10: ffffffff825e17c9 R11: 0000000000000003 R12: ffff8800=
1f409000
>> [   98.564148] R13: ffff880019c9f800 R14: ffff880019c9f800 R15: 00000000=
00000001
>> [   98.587384] FS:  0000000000000000(0000) GS:ffff88001f800000(0000) knl=
GS:0000000000000000
>> [   98.619557] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   98.639715] CR2: 0000000000000000 CR3: 000000000280f000 CR4: 00000000=
000006f0
>> [   98.662730] Call Trace:
>> [   98.676173]  ? alloc_unbound_pwq+0xb0/0xe7
>> [   98.693023]  apply_wqattrs_prepare+0x167/0x305
>> [   98.710819]  apply_workqueue_attrs_locked+0xb9/0xd0
>
>Hi,
>
>Are you guys sure that this happens with my patch? I don't see how this can
>happen with it. I also looked at dmesg and nothing links this to my patch.

Hi,

Sorry for the late, 0day robot reported this out because it detected 71 tim=
es of
"Kernel panic - not syncing: Fatal exception" out of 193 times of test for =
this
commit, while its parent (6ece60ef12) didn't find these error messages. But=
 the
crash messages seems have nothing to do with your patch, it's likely a false
positive, Sorry for the noise.

Thanks,
Xiaolong

>
>-- =

>viresh

--===============8677039001569527555==--

