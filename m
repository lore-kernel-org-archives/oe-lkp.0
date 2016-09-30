Content-Type: multipart/mixed; boundary="===============7558511953175888868=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [staging] d4f56b47a8: divide error: 0000 [#1] PREEMPT SMP KASAN
Date: Fri, 30 Sep 2016 11:51:43 +0200
Message-ID: <20160930095143.GA30029@kroah.com>
In-Reply-To: <20160930061447.GA28248@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7558511953175888868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2016 at 02:14:47PM +0800, Ye Xiaolong wrote:
> On 09/30, Viresh Kumar wrote:
> >On Fri, Sep 30, 2016 at 7:29 AM, kernel test robot
> ><xiaolong.ye@intel.com> wrote:
> >>
> >>
> >> FYI, we noticed the following commit:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ma=
ster
> >> commit d4f56b47a8fac90b15adfae80a42a2735d6b3213 ("staging: greybus: Ad=
d drivers/staging/greybus to the build")
> >>
> >> in testcase: trinity
> >> with following parameters:
> >>
> >>         runtime: 300s
> >>
> >>
> >> Trinity is a linux system call fuzz tester.
> >>
> >>
> >> on test machine: qemu-system-x86_64 -enable-kvm -m 512M
> >>
> >> caused below changes:
> >>
> >>
> >> +------------------------------------------------+------------+-------=
-----+
> >> |                                                | 526dec0642 | d4f56b=
47a8 |
> >> +------------------------------------------------+------------+-------=
-----+
> >> | boot_successes                                 | 5          | 0     =
     |
> >> | boot_failures                                  | 8          | 12    =
     |
> >> | calltrace:SyS_open                             | 8          |       =
     |
> >> | invoked_oom-killer:gfp_mask=3D0x                 | 1          |     =
       |
> >> | Mem-Info                                       | 1          |       =
     |
> >> | IP-Config:Auto-configuration_of_network_failed | 2          |       =
     |
> >> | BUG:kernel_hang_in_test_stage                  | 6          |       =
     |
> >> | divide_error:#[##]PREEMPT_SMP_KASAN            | 0          | 12    =
     |
> >> | RIP:gb_timesync_init                           | 0          | 12    =
     |
> >> | calltrace:gb_init                              | 0          | 12    =
     |
> >> | Kernel_panic-not_syncing:Fatal_exception       | 0          | 12    =
     |
> >> +------------------------------------------------+------------+-------=
-----+
> >>
> >>
> >>
> >> [   16.795543] FPGA image file name: xlinx_fpga_firmware.bit
> >> [   16.796615] GPIO INIT FAIL!!
> >> [   16.799462] Unable to find a compatible ARMv7 timer
> >> [   16.799948] divide error: 0000 [#1] PREEMPT SMP KASAN
> >> [   16.800459] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc6-023=
64-gd4f56b4 #29
> >> [   16.801197] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS Debian-1.8.2-1 04/01/2014
> >> [   16.802055] task: ffff88001a124000 task.stack: ffff88001a140000
> >> [   16.802645] RIP: 0010:[<ffffffff82f67e97>]  [<ffffffff82f67e97>] gb=
_timesync_init+0x35/0x78
> >> [   16.803534] RSP: 0000:ffff88001a147e58  EFLAGS: 00010246
> >> [   16.804040] RAX: 00038d7ea4c68000 RBX: 0000000000000000 RCX: ffffff=
ff8114ea41
> >> [   16.804716] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88=
001a124c2c
> >> [   16.805393] RBP: ffff88001a147e60 R08: 0000000000000001 R09: 000000=
0000000000
> >> [   16.806066] R10: ffff88001a147d70 R11: ffffffff83cddb35 R12: ffffff=
ff82f67cc6
> >> [   16.806744] R13: 0000000000000000 R14: ffffffff82fbe8b0 R15: ffffff=
ff82fbe8f8
> >> [   16.807421] FS:  0000000000000000(0000) GS:ffff88001a400000(0000) k=
nlGS:0000000000000000
> >> [   16.808185] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> [   16.808728] CR2: 0000000000000000 CR3: 0000000002c0a000 CR4: 000000=
00000006b0
> >> [   16.809405] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000=
0000000000
> >> [   16.810078] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000=
0000000400
> >> [   16.810752] Stack:
> >> [   16.811058]  0000000000000000 ffff88001a147e78 ffffffff82f67d45 000=
00000ffffffff
> >> [   16.811819]  ffff88001a147ee8 ffffffff82efe339 ffffffff82b89800 000=
0000000000012
> >> [   16.812576]  ffff88001fa80fe5 0000000000000000 ffffffff82b0495f 000=
0000000000006
> >> [   16.813332] Call Trace:
> >> [   16.813577]  [<ffffffff82f67d45>] gb_init+0x7f/0xb3
> >> [   16.814045]  [<ffffffff82efe339>] do_one_initcall+0x9a/0x12c
> >> [   16.814588]  [<ffffffff82efe57b>] kernel_init_freeable+0x1b0/0x246
> >> [   16.815180]  [<ffffffff82404a51>] kernel_init+0xc/0x108
> >> [   16.815679]  [<ffffffff8240e40f>] ret_from_fork+0x1f/0x40
> >> [   16.816197]  [<ffffffff82404a45>] ? rest_init+0x13c/0x13c
> >> [   16.816724] Code: 85 c0 89 c3 74 12 48 c7 c7 64 ae b4 82 31 c0 e8 4=
0 b5 27 fe 89 d8 eb 53 e8 cb 55 23 ff 31 d2 89 c6 48 b8 00 80 c6 a4 7e 8d 0=
3 00 <48> f7 f6 31 d2 48 c7 c7 84 ae b4 82 48 89 35 de 65 64 01 48 89
> >> [   16.819509] RIP  [<ffffffff82f67e97>] gb_timesync_init+0x35/0x78
> >> [   16.820094]  RSP <ffff88001a147e58>
> >> [   16.820548] ---[ end trace c73ba0f929e81492 ]---
> >> [   16.821001] Kernel panic - not syncing: Fatal exception
> >
> >Can you please confirm if below patch fixes it for you ?
> >
> >https://marc.info/?l=3Dlinux-kernel&m=3D147490908100954
> =

> This error is gone with this fix.
> =

> Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>

Wonderful, thanks for letting us know.  It's been in linux-next since
Tuesday of this week.   Perhaps your testing could see if patches
further along in the specific branch you hit solve the problem you are
having before you need to report the issue?

thanks,

greg k-h

--===============7558511953175888868==--

