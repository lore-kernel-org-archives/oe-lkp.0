Content-Type: multipart/mixed; boundary="===============0279161194902047796=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [raid5] kernel BUG at drivers/md/raid5.c:4374!
Date: Thu, 17 Apr 2014 14:13:55 +1000
Message-ID: <20140417141355.355e2f3e@notabene.brown>
In-Reply-To: <20140417035958.GE8702@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0279161194902047796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Apr 2014 11:59:59 +0800 Fengguang Wu <fengguang.wu@intel.com>
wrote:

> Shaohua,
> =

> We noticed the below BUG on
> =

> commit e240c1839d11152b0355442f8ac6d2d2d921be36 ("raid5: get_active_strip=
e avoids device_lock")
> =

> test case: lkp-ws02/micro/dd-write/11HDD-RAID5-cfq-ext4-10dd

Thanks.  We know about this.  I really should push that patch out....
Sorry

NeilBrown



> =

> 27c0f68f0745218  e240c1839d11152b0355442f8  =

> ---------------  -------------------------  =

>          0           +Inf%          1 ~ 0%  TOTAL dmesg.kernel_BUG_at_dri=
vers/md/raid5.c
>          0           +Inf%          1 ~ 0%  TOTAL dmesg.invalid_opcode
>          0           +Inf%          1 ~ 0%  TOTAL dmesg.RIP:handle_active=
_stripes
>          0           +Inf%          1 ~ 0%  TOTAL dmesg.Kernel_panic-not_=
syncing:Fatal_exception
> =

> Legend:
> 	~XX%    - stddev percent
> 	[+-]XX% - change percent
> =

> [  264.260444] kernel BUG at drivers/md/raid5.c:4374!
> [  264.267590] invalid opcode: 0000 [#1] SMP
> [  264.272076] Modules linked in: btrfs microcode ipmi_si ipmi_msghandler=
 acpi_cpufreq processor
> [  264.281514] CPU: 0 PID: 4005 Comm: md0_raid5 Not tainted 3.15.0-rc1-00=
611-g2e76799 #1
> [  264.289823] Hardware name: Supermicro X8DTN/X8DTN, BIOS 4.6.3 01/06/20=
10
> [  264.296789] task: ffff8804151e41a0 ti: ffff88041672c000 task.ti: ffff8=
8041672c000
> [  264.304750] RIP: 0010:[<ffffffff81804ef1>]  [<ffffffff81804ef1>] handl=
e_active_stripes.isra.24+0x254/0x360
> [  264.314951] RSP: 0018:ffff88041672dd10  EFLAGS: 00010002
> [  264.320527] RAX: ffff88021dc46000 RBX: ffff880220a4e000 RCX: ffff88022=
0a4e080
> [  264.327926] RDX: 0000000000000001 RSI: ffff88021e0d7010 RDI: ffff88022=
0a4e000
> [  264.335325] RBP: ffff88041672dda8 R08: 0000000000000000 R09: 000000000=
0000000
> [  264.342724] R10: 0000000000000000 R11: 000000000000ef58 R12: 000000000=
0000000
> [  264.350131] R13: ffff880220a4e080 R14: 0000000000000000 R15: ffff88022=
0a4e268
> [  264.357530] FS:  0000000000000000(0000) GS:ffff880237c00000(0000) knlG=
S:0000000000000000
> [  264.366099] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [  264.372111] CR2: 0000000001e21d64 CR3: 000000000200f000 CR4: 000000000=
00007f0
> [  264.379509] Stack:
> [  264.381780]  ffff8804173d7de0 ffff880220a4e000 ffff88041672dd38 ffffff=
ffffffffd8
> [  264.389907]  ffffffff1e1bd000 ffff880220a4e090 ffffffff817fdba2 ffff88=
0220a4e000
> [  264.398043]  0000000000000021 ffff880220a4e268 0000000000000000 ffff88=
041672dd78
> [  264.406172] Call Trace:
> [  264.408893]  [<ffffffff817fdba2>] ? do_release_stripe+0xdf/0x158
> [  264.415168]  [<ffffffff817fdc30>] ? __release_stripe+0x15/0x17
> [  264.421266]  [<ffffffff818054f2>] raid5d+0x3e2/0x4f2
> [  264.426497]  [<ffffffff819bcacf>] ? schedule_timeout+0x2f/0x19f
> [  264.432681]  [<ffffffff81826151>] md_thread+0x123/0x139
> [  264.438171]  [<ffffffff811148b6>] ? __wake_up_sync+0x12/0x12
> [  264.444096]  [<ffffffff8182602e>] ? md_register_thread+0xd5/0xd5
> [  264.450368]  [<ffffffff810fa267>] kthread+0xdb/0xe3
> [  264.455511]  [<ffffffff810fa18c>] ? kthread_create_on_node+0x16f/0x16f
> [  264.462310]  [<ffffffff819c7d7c>] ret_from_fork+0x7c/0xb0
> [  264.467973]  [<ffffffff810fa18c>] ? kthread_create_on_node+0x16f/0x16f
> [  264.474764] Code: 60 00 00 00 00 48 8b 70 10 48 8b 48 18 48 8d 50 10 4=
8 89 4e 08 48 89 31 48 89 50 10 48 89 50 18 f0 ff 40 50 8b 50 50
> ff ca 74 02 <0f> 0b 4a 89 44 d5 98 49 ff c2 49 83 fa 08 0f 85 d7 fd ff ff=
 41
> [  264.498252] RIP  [<ffffffff81804ef1>] handle_active_stripes.isra.24+0x=
254/0x360
> [  264.506112]  RSP <ffff88041672dd10>
> [  264.509869] ---[ end trace 58f3875ff7b4e923 ]---
> =

> Thanks,
> Fengguang


--===============0279161194902047796==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIuMC4yMiAoR05V
L0xpbnV4KQoKaVFJVkF3VUJVMDlWQXpuc250MVdZb0c1QVFMVmR3LzlHMHVTWG1xY3Awa3pSWExY
bFdITklEZ0lMa3ZROTdLbwp3eU5abW1lcTJjc0J3UVlkWjFjUVJzTE5BK1RMd1ExaWV3LytlbG9x
OHBPR3JSVGN6UGpydDJSUGkyZk41Y05MCkprRVhjeVI3NjlKUlFvVVcxRjR5RzdIMXJ3M3BhYWdR
cElEQXdRa2JUK3UzbUV0QlNURXZqQnJNbHNUNDNpOHUKQzRNTXY2bHM2V1Jha1dzTlJMeW9CMlVN
LzdRa0Z1QnhHelp5anhIR0NaN1YxOVpRQ3Q5Q2RCbWlFRXpobFdoaQozcWMvRExKTHI0cERKK2J1
ZEtWakRmQlo1RHZSdk0xb2o1dnE1U1JVYlJtc2tiZ2x1NFpQV3VtK3QyVWZqenRZCmxLRmsycUtN
b3RrWnNvYnJpUWFNZ01IV1ljSmM1U1ZzMm43MkN2QWxINHl4ay8vSnpOVXJhZ3ZEWnB0VHFnYm4K
VjlDdEZITXhDcWtPaW14SEt1dmRjektlaGltekMrUHFmb1hDRXNvaUxvS1Vmb0wzckFjbW9jYmZu
dHhqTlFiNQo0VTFtM3RVc3BlT3kvM0xqOGxYSWd6bTh1L3BiNUc3byttU09oclloQkZRWXpIdDlv
d3hKcEI0czBOTzRnVE5FCk5LVHdaRjhrWXRCelRmVVhNdjJQdmdjbk9iME9sam9NMGJPQWpZcEpn
SFNYT1VZN1JrNGZvbS80QkVITUVsNFgKNW92K05nUGVCMENHc0JCaSsvVGVDazJFaFNtMjd4eW9T
SlJ3OG9oMXpNUXlGUmdCMjRCcVI0MHFKRlNCTzVZLwpVM0U3UW1Gb2ZTNWRuNHJITGhObFBaSWNs
ekt5encyMVZYd0hsWTRiR0xTUjNvVWRyaE1UMkhhOVRYN1hvK2JMCi9FcS94OVVUT0tNPQo9Vnl3
aAotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============0279161194902047796==--

