Content-Type: multipart/mixed; boundary="===============0546366452422485498=="
MIME-Version: 1.0
From: Frank Schäfer <fschaefer.oss@googlemail.com>
To: lkp@lists.01.org
Subject: Re: [media/em28xx] BUG: unable to handle kernel
Date: Fri, 19 Sep 2014 20:57:26 +0200
Message-ID: <541C7C96.2050306@googlemail.com>
In-Reply-To: <20140919014124.GA8326@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0546366452422485498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

thank you for reporting this issue.

Am 19.09.2014 um 03:41 schrieb Fengguang Wu:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit a5c075cfd2386a4f3ab4f8ed2830ebee557d4b3f
> Author:     Frank Schaefer <fschaefer.oss@googlemail.com>
> AuthorDate: Mon Mar 24 16:33:25 2014 -0300
> Commit:     Mauro Carvalho Chehab <m.chehab@samsung.com>
> CommitDate: Fri May 23 13:44:42 2014 -0300
>
>     [media] em28xx: move fields wq_trigger and streaming_started from str=
uct em28xx to struct em28xx_audio
>     =

>     Both wq_trigger and stream_started are used only to control the em28xx
>     alsa streaming. They don't belong to em28xx common struct.
>     =

>     Signed-off-by: Frank Sch=C3=A4fer <fschaefer.oss@googlemail.com>
>     Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>     Signed-off-by: Mauro Carvalho Chehab <m.chehab@samsung.com>

This patch affects the em28xx-alsa module (em28xx-audio.c) only.

Now take a look at your kernel config:

...
#
# Webcam, TV (analog/digital) USB devices
#
CONFIG_VIDEO_EM28XX=3Dy
CONFIG_VIDEO_EM28XX_V4L2=3Dy
# CONFIG_VIDEO_EM28XX_ALSA is not set
CONFIG_VIDEO_EM28XX_DVB=3Dy
CONFIG_VIDEO_EM28XX_RC=3Dy
...

The em28xx-alsa module is disabled.


>
> Attached dmesg for the parent commit, too. It looks like the parent is
> actually clean, just that the rcu-tortuture tests take too long time.
>
> +------------------------------------------+------------+------------+---=
------------+
> |                                          | 3319e6f839 | a5c075cfd2 | ne=
xt-20140917 |
> +------------------------------------------+------------+------------+---=
------------+
> | boot_successes                           | 0          | 0          | 0 =
            |
> | boot_failures                            | 80         | 20         | 11=
            |
> | BUG:kernel_boot_hang                     | 80         | 1          | 1 =
            |
> | BUG:unable_to_handle_kernel              | 0          | 19         | 10=
            |
> | Oops                                     | 0          | 19         | 10=
            |
> | EIP_is_at_af9005_usb_module_init         | 0          | 19         | 10=
            |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 19         | 10=
            |
> | backtrace:af9005_usb_module_init         | 0          | 19         | 10=
            |
> | backtrace:kernel_init_freeable           | 0          | 19         | 10=
            |
> | backtrace:_usb_module_init               | 0          | 19         | 10=
            |
> +------------------------------------------+------------+------------+---=
------------+
>
> [    8.528015] usbcore: registered new interface driver dvb_usb_ttusb2
> [    8.529751] usbcore: registered new interface driver dvb_usb_af9005
> [    8.529751] usbcore: registered new interface driver dvb_usb_af9005
> [    8.531584] BUG: unable to handle kernel =

> [    8.531584] BUG: unable to handle kernel paging requestpaging request =
at 02e00000
>  at 02e00000
> [    8.533385] IP:
> [    8.533385] IP: [<7d9d67c6>] af9005_usb_module_init+0x6b/0x9d
>  [<7d9d67c6>] af9005_usb_module_init+0x6b/0x9d
And this tells us what is going wrong:

(gdb) list *(af9005_usb_module_init+0x83)
0x2d11 is in af9005_usb_module_init
(drivers/media/usb/dvb-usb/af9005.c:1092).
1087            if (rc_decode =3D=3D NULL || rc_keys =3D=3D NULL || rc_keys=
_size
=3D=3D NULL) {
1088                    err("af9005_rc_decode function not found,
disabling remote");
1089                    af9005_properties.rc.legacy.rc_query =3D NULL;
1090            } else {
1091                    af9005_properties.rc.legacy.rc_map_table =3D rc_key=
s;
1092                    af9005_properties.rc.legacy.rc_map_size =3D
*rc_keys_size;
1093            }
1094
1095            return 0;
1096    }

So it happens in line 1092 when rc_keys_size is accessed.

According to your kernel config you have

CONFIG_MODULES disabled
CONFIG_DVB_USB_AF9005 enabled
CONFIG_DVB_USB_AF9005_REMOTE  disabled

So af9005 is compiled in without remote control support.
Thus we should have hit the "if"-path, which also prints a message about
the missing remote control support.

Instead, we have hit the "else" path, which means that rc_decode,
rc_keys and rc_keys_size are all !=3D NULL, although they should be NULL.

You can verify this by enabling CONFIG_DVB_USB_AF9005_REMOTE.
That makes the issue disappear.

Now let's go a few lines up to see where these pointers come from:

1084           rc_decode =3D symbol_request(af9005_rc_decode);
1085           rc_keys =3D symbol_request(rc_map_af9005_table);
1086           rc_keys_size =3D symbol_request(rc_map_af9005_table_size);

So symbol_request() returns pointers.!=3D NULL

A closer look at the definition of symbol_request() shows, that it does
nothing if CONFIG_MODULES is disabled (it just returns its argument).


One possibility to fix this bug would be to embrace these three lines with

#ifdef CONFIG_DVB_USB_AF9005_REMOTE
...
#endif


> [    8.535613] *pde =3D 00000000 =

> [    8.535613] *pde =3D 00000000 =

>
> [    8.536416] Oops: 0000 [#1] =

> [    8.536416] Oops: 0000 [#1] PREEMPT PREEMPT DEBUG_PAGEALLOCDEBUG_PAGEA=
LLOC
>
> [    8.537863] CPU: 0 PID: 1 Comm: swapper Not tainted 3.15.0-rc6-00151-g=
a5c075c #1
> [    8.537863] CPU: 0 PID: 1 Comm: swapper Not tainted 3.15.0-rc6-00151-g=
a5c075c #1
> [    8.539827] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    8.539827] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    8.541519] task: 89c9a670 ti: 89c9c000 task.ti: 89c9c000
> [    8.541519] task: 89c9a670 ti: 89c9c000 task.ti: 89c9c000
> [    8.541519] EIP: 0060:[<7d9d67c6>] EFLAGS: 00010206 CPU: 0
> [    8.541519] EIP: 0060:[<7d9d67c6>] EFLAGS: 00010206 CPU: 0
> [    8.541519] EIP is at af9005_usb_module_init+0x6b/0x9d
> [    8.541519] EIP is at af9005_usb_module_init+0x6b/0x9d
> [    8.541519] EAX: 02e00000 EBX: 00000000 ECX: 00000006 EDX: 00000000
> [    8.541519] EAX: 02e00000 EBX: 00000000 ECX: 00000006 EDX: 00000000
> [    8.541519] ESI: 00000000 EDI: 7da33ec8 EBP: 89c9df30 ESP: 89c9df2c
> [    8.541519] ESI: 00000000 EDI: 7da33ec8 EBP: 89c9df30 ESP: 89c9df2c
> [    8.541519]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    8.541519]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    8.541519] CR0: 8005003b CR2: 02e00000 CR3: 05a54000 CR4: 00000690
> [    8.541519] CR0: 8005003b CR2: 02e00000 CR3: 05a54000 CR4: 00000690
> [    8.541519] Stack:
> [    8.541519] Stack:
> [    8.541519]  7d9d675b
> [    8.541519]  7d9d675b 89c9df90 89c9df90 7d992a49 7d992a49 7d7d5914 7d7=
d5914 89c9df4c 89c9df4c 7be3a800 7be3a800 7d08c58c 7d08c58c 8a4c3968 8a4c39=
68
>
> [    8.541519]  89c9df80
> [    8.541519]  89c9df80 7be3a966 7be3a966 00000192 00000192 00000006 000=
00006 00000006 00000006 7d7d3ff4 7d7d3ff4 8a4c397a 8a4c397a 00000200 000002=
00
>
> [    8.541519]  7d6b1280
> [    8.541519]  7d6b1280 8a4c3979 8a4c3979 00000006 00000006 000009a6 000=
009a6 7da32db8 7da32db8 b13eec81 b13eec81 00000006 00000006 000009a6 000009=
a6
>
> [    8.541519] Call Trace:
> [    8.541519] Call Trace:
> [    8.541519]  [<7d9d675b>] ? ttusb2_driver_init+0x16/0x16
> [    8.541519]  [<7d9d675b>] ? ttusb2_driver_init+0x16/0x16
> [    8.541519]  [<7d992a49>] do_one_initcall+0x77/0x106
> [    8.541519]  [<7d992a49>] do_one_initcall+0x77/0x106
> [    8.541519]  [<7be3a800>] ? parameqn+0x2/0x35
> [    8.541519]  [<7be3a800>] ? parameqn+0x2/0x35
> [    8.541519]  [<7be3a966>] ? parse_args+0x113/0x25c
> [    8.541519]  [<7be3a966>] ? parse_args+0x113/0x25c
> [    8.541519]  [<7d992bc2>] kernel_init_freeable+0xea/0x167
> [    8.541519]  [<7d992bc2>] kernel_init_freeable+0xea/0x167
> [    8.541519]  [<7cf01070>] kernel_init+0x8/0xb8
> [    8.541519]  [<7cf01070>] kernel_init+0x8/0xb8
> [    8.541519]  [<7cf27ec0>] ret_from_kernel_thread+0x20/0x30
> [    8.541519]  [<7cf27ec0>] ret_from_kernel_thread+0x20/0x30
> [    8.541519]  [<7cf01068>] ? rest_init+0x10c/0x10c
> [    8.541519]  [<7cf01068>] ? rest_init+0x10c/0x10c
> [    8.541519] Code:
> [    8.541519] Code: 08 08 c2 c2 c7 c7 05 05 44 44 ed ed f9 f9 7d 7d 00 0=
0 00 00 e0 e0 02 02 c7 c7 05 05 40 40 ed ed f9 f9 7d 7d 00 00 00 00 e0 e0 0=
2 02 c7 c7 05 05 3c 3c ed ed f9 f9 7d 7d 00 00 00 00 e0 e0 02 02 75 75 1f 1=
f b8 b8 00 00 00 00 e0 e0 02 02 85 85 c0 c0 74 74 16 16 <a1> <a1> 00 00 00 =
00 e0 e0 02 02 c7 c7 05 05 54 54 84 84 8e 8e 7d 7d 00 00 00 00 e0 e0 02 02 =
a3 a3 58 58 84 84 8e 8e 7d 7d eb eb
>
> [    8.541519] EIP: [<7d9d67c6>] =

> [    8.541519] EIP: [<7d9d67c6>] af9005_usb_module_init+0x6b/0x9daf9005_u=
sb_module_init+0x6b/0x9d SS:ESP 0068:89c9df2c
>  SS:ESP 0068:89c9df2c
> [    8.541519] CR2: 0000000002e00000
> [    8.541519] CR2: 0000000002e00000
> [    8.541519] ---[ end trace 768b6faf51370fc7 ]---
> [    8.541519] ---[ end trace 768b6faf51370fc7 ]---
>
> git bisect start v3.16 v3.15 --
> git bisect  bad 5170a3b24a9141e2349a3420448743b7c68f2223  # 22:58      0-=
      1  Merge branch 'akpm' (patches from Andrew Morton)
> git bisect  bad 1ad96bb0a20fa26b952b2250e89d14b6397bf618  # 23:04      0-=
      1  Merge tag 'gpio-v3.16-2' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/linusw/linux-gpio
> git bisect  bad 412dd3a6daf0cadce1b2d6a34fa3713f40255579  # 23:16      0-=
      1  Merge tag 'xfs-for-linus-3.16-rc1' of git://oss.sgi.com/xfs/xfs
> git bisect  bad b1cce8032f6abe900b078d24f3c3938726528f97  # 23:23      0-=
      2  Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6
> git bisect  bad da85d191f58a44e149a7c07dbae78b3042909798  # 23:29      0-=
     19  Merge branch 'for-3.16' of git://git.kernel.org/pub/scm/linux/kern=
el/git/tj/wq
> git bisect  bad f8409abdc592e13cefbe4e4a24a84b3d5741e85f  # 23:38      0-=
      6  Merge tag 'ext4_for_linus' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/tytso/ext4
> git bisect  bad ed81e780a7dd5698a986f246fad6a1d8d0b6f9ce  # 23:44      0-=
     20  Merge branch 'x86-vdso-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect  bad 3f17ea6dea8ba5668873afa54628a91aaa3fb1c0  # 23:55      1-=
     19  Merge branch 'next' (accumulated 3.16 merge window patches) into m=
aster
> git bisect good 49eb7b0750d9483c74e9c14ae6ea1e9d62481c3c  # 00:38     20+=
     20  Merge tag 'tty-3.16-rc1' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/gregkh/tty into next
> git bisect  bad 535ec214e23adaf72c775938e9e9c6c1cf6fc5b9  # 07:40      0-=
      2  [media] mt9p031: Fix BLC configuration restore when disabling test=
 pattern
> git bisect good 2c52a2fce0f00479548a076d900d1a2ddd001c27  # 21:01     20+=
     20  [media] em28xx: move struct v4l2_clk *clk from struct em28xx to st=
ruct v4l2
> git bisect  bad a5c075cfd2386a4f3ab4f8ed2830ebee557d4b3f  # 22:07      0-=
      9  [media] em28xx: move fields wq_trigger and streaming_started from =
struct em28xx to struct em28xx_audio
> git bisect good 58159171c7f201e5d6ea2666c7b3857e782a2861  # 22:52     20+=
     20  [media] em28xx: move progressive/interlaced fields from struct em2=
8xx to struct v4l2
> git bisect good 3854b0d847d558bdc820b93ae8a93c0923d0211d  # 23:31     20+=
     20  [media] em28xx: move tuner frequency field from struct em28xx to s=
truct v4l2
> git bisect good 3319e6f839cf94e33fbad27a21fc4c64f6cec74f  # 00:14     20+=
     20  [media] em28xx: remove field tuner_addr from struct em28xx
> # first bad commit: [a5c075cfd2386a4f3ab4f8ed2830ebee557d4b3f] [media] em=
28xx: move fields wq_trigger and streaming_started from struct em28xx to st=
ruct em28xx_audio
> git bisect good 3319e6f839cf94e33fbad27a21fc4c64f6cec74f  # 00:55     60+=
     80  [media] em28xx: remove field tuner_addr from struct em28xx
> git bisect  bad 76c2c6dc46fbb5bdd73571ebd0897696c5ab4d73  # 00:58      0-=
     11  Add linux-next specific files for 20140917
> git bisect  bad 4d046e96046faac456f4f5c94c152c52a9c51a3a  # 01:09      2-=
     57  Add linux-next specific files for 20140918

Something went wrong during your bisection.
I can reproduce this issue with kernel v3.15, too, which doesn't have
the above commit yet.

Regards,
Frank Sch=C3=A4fer

>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dquantal-core-i386.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
> 	qemu-system-x86_64
> 	-cpu kvm64
> 	-enable-kvm
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 320
> 	-smp 2
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null =

> )
>
> append=3D(
> 	hung_task_panic=3D1
> 	earlyprintk=3DttyS0,115200
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> 	drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> Thanks,
> Fengguang
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com


--===============0546366452422485498==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9d2lu
ZG93cy0xMjUyIgogICAgICBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiPgogIDwvaGVhZD4KICA8
Ym9keSB0ZXh0PSIjMDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIEhpIEZlbmdndWFuZyw8
YnI+CiAgICA8YnI+CiAgICB0aGFuayB5b3UgZm9yIHJlcG9ydGluZyB0aGlzIGlzc3VlLjxicj4K
ICAgIDxicj4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+QW0gMTkuMDkuMjAxNCB1
bSAwMzo0MSBzY2hyaWViCiAgICAgIEZlbmdndWFuZyBXdTo8YnI+CiAgICA8L2Rpdj4KICAgIDxi
bG9ja3F1b3RlIGNpdGU9Im1pZDoyMDE0MDkxOTAxNDEyNC5HQTgzMjZAbG9jYWxob3N0IiB0eXBl
PSJjaXRlIj4KICAgICAgPHByZSB3cmFwPSIiPkdyZWV0aW5ncywKCjBkYXkga2VybmVsIHRlc3Rp
bmcgcm9ib3QgZ290IHRoZSBiZWxvdyBkbWVzZyBhbmQgdGhlIGZpcnN0IGJhZCBjb21taXQgaXMK
CmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQgbWFzdGVyCgpjb21taXQgYTVjMDc1Y2ZkMjM4NmE0ZjNhYjRmOGVkMjgzMGViZWU1
NTdkNGIzZgpBdXRob3I6ICAgICBGcmFuayBTY2hhZWZlciA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86ZnNjaGFlZmVyLm9zc0Bnb29nbGVtYWlsLmNvbSI+Jmx0
O2ZzY2hhZWZlci5vc3NAZ29vZ2xlbWFpbC5jb20mZ3Q7PC9hPgpBdXRob3JEYXRlOiBNb24gTWFy
IDI0IDE2OjMzOjI1IDIwMTQgLTAzMDAKQ29tbWl0OiAgICAgTWF1cm8gQ2FydmFsaG8gQ2hlaGFi
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzptLmNoZWhhYkBz
YW1zdW5nLmNvbSI+Jmx0O20uY2hlaGFiQHNhbXN1bmcuY29tJmd0OzwvYT4KQ29tbWl0RGF0ZTog
RnJpIE1heSAyMyAxMzo0NDo0MiAyMDE0IC0wMzAwCgogICAgW21lZGlhXSBlbTI4eHg6IG1vdmUg
ZmllbGRzIHdxX3RyaWdnZXIgYW5kIHN0cmVhbWluZ19zdGFydGVkIGZyb20gc3RydWN0IGVtMjh4
eCB0byBzdHJ1Y3QgZW0yOHh4X2F1ZGlvCiAgICAKICAgIEJvdGggd3FfdHJpZ2dlciBhbmQgc3Ry
ZWFtX3N0YXJ0ZWQgYXJlIHVzZWQgb25seSB0byBjb250cm9sIHRoZSBlbTI4eHgKICAgIGFsc2Eg
c3RyZWFtaW5nLiBUaGV5IGRvbid0IGJlbG9uZyB0byBlbTI4eHggY29tbW9uIHN0cnVjdC4KICAg
IAogICAgU2lnbmVkLW9mZi1ieTogRnJhbmsgU2No5GZlciA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86ZnNjaGFlZmVyLm9zc0Bnb29nbGVtYWlsLmNvbSI+Jmx0
O2ZzY2hhZWZlci5vc3NAZ29vZ2xlbWFpbC5jb20mZ3Q7PC9hPgogICAgU2lnbmVkLW9mZi1ieTog
SGFucyBWZXJrdWlsIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzpoYW5zLnZlcmt1aWxAY2lzY28uY29tIj4mbHQ7aGFucy52ZXJrdWlsQGNpc2NvLmNvbSZndDs8
L2E+CiAgICBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPGEgY2xhc3M9Im1v
ei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOm0uY2hlaGFiQHNhbXN1bmcuY29tIj4m
bHQ7bS5jaGVoYWJAc2Ftc3VuZy5jb20mZ3Q7PC9hPjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgog
ICAgPGJyPgogICAgVGhpcyBwYXRjaCBhZmZlY3RzIHRoZSBlbTI4eHgtYWxzYSBtb2R1bGUgKGVt
Mjh4eC1hdWRpby5jKSBvbmx5Ljxicj4KICAgIDxicj4KICAgIE5vdyB0YWtlIGEgbG9vayBhdCB5
b3VyIGtlcm5lbCBjb25maWc6PGJyPgogICAgPGJyPgogICAgLi4uPGJyPgogICAgIwogICAgPGJy
PgogICAgIyBXZWJjYW0sIFRWIChhbmFsb2cvZGlnaXRhbCkgVVNCIGRldmljZXMKICAgIDxicj4K
ICAgICM8YnI+CiAgICBDT05GSUdfVklERU9fRU0yOFhYPXkKICAgIDxicj4KICAgIENPTkZJR19W
SURFT19FTTI4WFhfVjRMMj15PGJyPgogICAgIyBDT05GSUdfVklERU9fRU0yOFhYX0FMU0EgaXMg
bm90IHNldAogICAgPGJyPgogICAgQ09ORklHX1ZJREVPX0VNMjhYWF9EVkI9eQogICAgPGJyPgog
ICAgQ09ORklHX1ZJREVPX0VNMjhYWF9SQz15PGJyPgogICAgLi4uPGJyPgogICAgPGJyPgogICAg
VGhlIGVtMjh4eC1hbHNhIG1vZHVsZSBpcyBkaXNhYmxlZC48YnI+CiAgICA8YnI+CiAgICA8YnI+
CiAgICA8YmxvY2txdW90ZSBjaXRlPSJtaWQ6MjAxNDA5MTkwMTQxMjQuR0E4MzI2QGxvY2FsaG9z
dCIgdHlwZT0iY2l0ZSI+CiAgICAgIDxwcmUgd3JhcD0iIj4KCkF0dGFjaGVkIGRtZXNnIGZvciB0
aGUgcGFyZW50IGNvbW1pdCwgdG9vLiBJdCBsb29rcyBsaWtlIHRoZSBwYXJlbnQgaXMKYWN0dWFs
bHkgY2xlYW4sIGp1c3QgdGhhdCB0aGUgcmN1LXRvcnR1dHVyZSB0ZXN0cyB0YWtlIHRvbyBsb25n
IHRpbWUuCgorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tKwp8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAzMzE5ZTZmODM5IHwgYTVjMDc1Y2ZkMiB8IG5leHQt
MjAxNDA5MTcgfAorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tKwp8IGJvb3Rfc3VjY2Vzc2Vz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMCAgICAgICAgICB8IDAg
ICAgICAgICAgICAgfAp8IGJvb3RfZmFpbHVyZXMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA4MCAgICAgICAgIHwgMjAgICAgICAgICB8IDExICAgICAgICAgICAgfAp8IEJVRzprZXJuZWxf
Ym9vdF9oYW5nICAgICAgICAgICAgICAgICAgICAgfCA4MCAgICAgICAgIHwgMSAgICAgICAgICB8
IDEgICAgICAgICAgICAgfAp8IEJVRzp1bmFibGVfdG9faGFuZGxlX2tlcm5lbCAgICAgICAgICAg
ICAgfCAwICAgICAgICAgIHwgMTkgICAgICAgICB8IDEwICAgICAgICAgICAgfAp8IE9vcHMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTkgICAgICAg
ICB8IDEwICAgICAgICAgICAgfAp8IEVJUF9pc19hdF9hZjkwMDVfdXNiX21vZHVsZV9pbml0ICAg
ICAgICAgfCAwICAgICAgICAgIHwgMTkgICAgICAgICB8IDEwICAgICAgICAgICAgfAp8IEtlcm5l
bF9wYW5pYy1ub3Rfc3luY2luZzpGYXRhbF9leGNlcHRpb24gfCAwICAgICAgICAgIHwgMTkgICAg
ICAgICB8IDEwICAgICAgICAgICAgfAp8IGJhY2t0cmFjZTphZjkwMDVfdXNiX21vZHVsZV9pbml0
ICAgICAgICAgfCAwICAgICAgICAgIHwgMTkgICAgICAgICB8IDEwICAgICAgICAgICAgfAp8IGJh
Y2t0cmFjZTprZXJuZWxfaW5pdF9mcmVlYWJsZSAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTkg
ICAgICAgICB8IDEwICAgICAgICAgICAgfAp8IGJhY2t0cmFjZTpfdXNiX21vZHVsZV9pbml0ICAg
ICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTkgICAgICAgICB8IDEwICAgICAgICAgICAgfAor
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tKwoKWyAgICA4LjUyODAxNV0gdXNiY29yZTogcmVn
aXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBkdmJfdXNiX3R0dXNiMgpbICAgIDguNTI5NzUx
XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGR2Yl91c2JfYWY5MDA1
ClsgICAgOC41Mjk3NTFdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIg
ZHZiX3VzYl9hZjkwMDUKWyAgICA4LjUzMTU4NF0gQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtlcm5l
bCAKWyAgICA4LjUzMTU4NF0gQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVx
dWVzdHBhZ2luZyByZXF1ZXN0IGF0IDAyZTAwMDAwCiBhdCAwMmUwMDAwMApbICAgIDguNTMzMzg1
XSBJUDoKWyAgICA4LjUzMzM4NV0gSVA6IFsmbHQ7N2Q5ZDY3YzYmZ3Q7XSBhZjkwMDVfdXNiX21v
ZHVsZV9pbml0KzB4NmIvMHg5ZAogWyZsdDs3ZDlkNjdjNiZndDtdIGFmOTAwNV91c2JfbW9kdWxl
X2luaXQrMHg2Yi8weDlkPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICBBbmQgdGhpcyB0ZWxs
cyB1cyB3aGF0IGlzIGdvaW5nIHdyb25nOjxicj4KICAgIDxicj4KICAgIChnZGIpIGxpc3QgKihh
ZjkwMDVfdXNiX21vZHVsZV9pbml0KzB4ODMpPGJyPgogICAgMHgyZDExIGlzIGluIGFmOTAwNV91
c2JfbW9kdWxlX2luaXQKICAgIChkcml2ZXJzL21lZGlhL3VzYi9kdmItdXNiL2FmOTAwNS5jOjEw
OTIpLjxicj4KICAgIDEwODegoKCgoKCgoKCgoCBpZiAocmNfZGVjb2RlID09IE5VTEwgfHwgcmNf
a2V5cyA9PSBOVUxMIHx8CiAgICByY19rZXlzX3NpemUgPT0gTlVMTCkgezxicj4KICAgIDEwODig
oKCgoKCgoKCgoKCgoKCgoKCgIGVycigiYWY5MDA1X3JjX2RlY29kZSBmdW5jdGlvbiBub3QgZm91
bmQsCiAgICBkaXNhYmxpbmcgcmVtb3RlIik7PGJyPgogICAgMTA4OaCgoKCgoKCgoKCgoKCgoKCg
oKAgYWY5MDA1X3Byb3BlcnRpZXMucmMubGVnYWN5LnJjX3F1ZXJ5ID0gTlVMTDs8YnI+CiAgICAx
MDkwoKCgoKCgoKCgoKAgfSBlbHNlIHs8YnI+CiAgICAxMDkxoKCgoKCgoKCgoKCgoKCgoKCgoCBh
ZjkwMDVfcHJvcGVydGllcy5yYy5sZWdhY3kucmNfbWFwX3RhYmxlID0KICAgIHJjX2tleXM7PGJy
PgogICAgMTA5MqCgoKCgoKCgoKCgoKCgoKCgoKAgYWY5MDA1X3Byb3BlcnRpZXMucmMubGVnYWN5
LnJjX21hcF9zaXplID0KICAgICpyY19rZXlzX3NpemU7PGJyPgogICAgMTA5M6CgoKCgoKCgoKCg
IH08YnI+CiAgICAxMDk0PGJyPgogICAgMTA5NaCgoKCgoKCgoKCgIHJldHVybiAwOzxicj4KICAg
IDEwOTagoKAgfTxicj4KICAgIDxicj4KICAgIFNvIGl0IGhhcHBlbnMgaW4gbGluZSAxMDkyIHdo
ZW4gcmNfa2V5c19zaXplIGlzIGFjY2Vzc2VkLjxicj4KICAgIDxicj4KICAgIEFjY29yZGluZyB0
byB5b3VyIGtlcm5lbCBjb25maWcgeW91IGhhdmU8YnI+CiAgICA8YnI+CiAgICBDT05GSUdfTU9E
VUxFUyBkaXNhYmxlZDxicj4KICAgIENPTkZJR19EVkJfVVNCX0FGOTAwNSBlbmFibGVkPGJyPgog
ICAgQ09ORklHX0RWQl9VU0JfQUY5MDA1X1JFTU9URaAgZGlzYWJsZWQ8YnI+CiAgICA8YnI+CiAg
ICBTbyBhZjkwMDUgaXMgY29tcGlsZWQgaW4gd2l0aG91dCByZW1vdGUgY29udHJvbCBzdXBwb3J0
Ljxicj4KICAgIFRodXMgd2Ugc2hvdWxkIGhhdmUgaGl0IHRoZSAiaWYiLXBhdGgsIHdoaWNoIGFs
c28gcHJpbnRzIGEgbWVzc2FnZQogICAgYWJvdXQgdGhlIG1pc3NpbmcgcmVtb3RlIGNvbnRyb2wg
c3VwcG9ydC48YnI+CiAgICA8YnI+CiAgICBJbnN0ZWFkLCB3ZSBoYXZlIGhpdCB0aGUgImVsc2Ui
IHBhdGgsIHdoaWNoIG1lYW5zIHRoYXQgcmNfZGVjb2RlLAogICAgcmNfa2V5cyBhbmQgcmNfa2V5
c19zaXplIGFyZSBhbGwgIT0gTlVMTCwgYWx0aG91Z2ggdGhleSBzaG91bGQgYmUKICAgIE5VTEwu
PGJyPgogICAgPGJyPgogICAgWW91IGNhbiB2ZXJpZnkgdGhpcyBieSBlbmFibGluZyBDT05GSUdf
RFZCX1VTQl9BRjkwMDVfUkVNT1RFLjxicj4KICAgIFRoYXQgbWFrZXMgdGhlIGlzc3VlIGRpc2Fw
cGVhci48YnI+CiAgICA8YnI+CiAgICBOb3cgbGV0J3MgZ28gYSBmZXcgbGluZXMgdXAgdG8gc2Vl
IHdoZXJlIHRoZXNlIHBvaW50ZXJzIGNvbWUgZnJvbTo8YnI+CiAgICA8YnI+CiAgICAxMDg0IKAg
oCCgIKAgoCByY19kZWNvZGUgPSBzeW1ib2xfcmVxdWVzdChhZjkwMDVfcmNfZGVjb2RlKTs8YnI+
CiAgICAxMDg1IKCgoKCgoKCgoCByY19rZXlzID0gc3ltYm9sX3JlcXVlc3QocmNfbWFwX2FmOTAw
NV90YWJsZSk7PGJyPgogICAgMTA4NiCgoKCgoKCgoKAgcmNfa2V5c19zaXplID0KICAgIHN5bWJv
bF9yZXF1ZXN0KHJjX21hcF9hZjkwMDVfdGFibGVfc2l6ZSk7PGJyPgogICAgPGJyPgogICAgU28g
c3ltYm9sX3JlcXVlc3QoKSByZXR1cm5zIHBvaW50ZXJzLiE9IE5VTEw8YnI+CiAgICA8YnI+CiAg
ICBBIGNsb3NlciBsb29rIGF0IHRoZSBkZWZpbml0aW9uIG9mIHN5bWJvbF9yZXF1ZXN0KCkgc2hv
d3MsIHRoYXQgaXQKICAgIGRvZXMgbm90aGluZyBpZiBDT05GSUdfTU9EVUxFUyBpcyBkaXNhYmxl
ZCAoaXQganVzdCByZXR1cm5zIGl0cwogICAgYXJndW1lbnQpLjxicj4KICAgIDxicj4KICAgIDxi
cj4KICAgIE9uZSBwb3NzaWJpbGl0eSB0byBmaXggdGhpcyBidWcgd291bGQgYmUgdG8gZW1icmFj
ZSB0aGVzZSB0aHJlZQogICAgbGluZXMgd2l0aDxicj4KICAgIDxicj4KICAgICNpZmRlZiBDT05G
SUdfRFZCX1VTQl9BRjkwMDVfUkVNT1RFPGJyPgogICAgLi4uPGJyPgogICAgI2VuZGlmPGJyPgog
ICAgPGJyPgogICAgPGJyPgogICAgPGJsb2NrcXVvdGUgY2l0ZT0ibWlkOjIwMTQwOTE5MDE0MTI0
LkdBODMyNkBsb2NhbGhvc3QiIHR5cGU9ImNpdGUiPgogICAgICA8cHJlIHdyYXA9IiI+ClsgICAg
OC41MzU2MTNdICpwZGUgPSAwMDAwMDAwMCAKWyAgICA4LjUzNTYxM10gKnBkZSA9IDAwMDAwMDAw
IAoKWyAgICA4LjUzNjQxNl0gT29wczogMDAwMCBbIzFdIApbICAgIDguNTM2NDE2XSBPb3BzOiAw
MDAwIFsjMV0gUFJFRU1QVCBQUkVFTVBUIERFQlVHX1BBR0VBTExPQ0RFQlVHX1BBR0VBTExPQwoK
WyAgICA4LjUzNzg2M10gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyIE5vdCB0YWludGVkIDMu
MTUuMC1yYzYtMDAxNTEtZ2E1YzA3NWMgIzEKWyAgICA4LjUzNzg2M10gQ1BVOiAwIFBJRDogMSBD
b21tOiBzd2FwcGVyIE5vdCB0YWludGVkIDMuMTUuMC1yYzYtMDAxNTEtZ2E1YzA3NWMgIzEKWyAg
ICA4LjUzOTgyN10gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJ
WCwgMTk5NiksIEJJT1MgMS43LjUtMjAxNDA1MzFfMDgzMDMwLWdhbmRhbGYgMDQvMDEvMjAxNApb
ICAgIDguNTM5ODI3XSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQ
SUlYLCAxOTk2KSwgQklPUyAxLjcuNS0yMDE0MDUzMV8wODMwMzAtZ2FuZGFsZiAwNC8wMS8yMDE0
ClsgICAgOC41NDE1MTldIHRhc2s6IDg5YzlhNjcwIHRpOiA4OWM5YzAwMCB0YXNrLnRpOiA4OWM5
YzAwMApbICAgIDguNTQxNTE5XSB0YXNrOiA4OWM5YTY3MCB0aTogODljOWMwMDAgdGFzay50aTog
ODljOWMwMDAKWyAgICA4LjU0MTUxOV0gRUlQOiAwMDYwOlsmbHQ7N2Q5ZDY3YzYmZ3Q7XSBFRkxB
R1M6IDAwMDEwMjA2IENQVTogMApbICAgIDguNTQxNTE5XSBFSVA6IDAwNjA6WyZsdDs3ZDlkNjdj
NiZndDtdIEVGTEFHUzogMDAwMTAyMDYgQ1BVOiAwClsgICAgOC41NDE1MTldIEVJUCBpcyBhdCBh
ZjkwMDVfdXNiX21vZHVsZV9pbml0KzB4NmIvMHg5ZApbICAgIDguNTQxNTE5XSBFSVAgaXMgYXQg
YWY5MDA1X3VzYl9tb2R1bGVfaW5pdCsweDZiLzB4OWQKWyAgICA4LjU0MTUxOV0gRUFYOiAwMmUw
MDAwMCBFQlg6IDAwMDAwMDAwIEVDWDogMDAwMDAwMDYgRURYOiAwMDAwMDAwMApbICAgIDguNTQx
NTE5XSBFQVg6IDAyZTAwMDAwIEVCWDogMDAwMDAwMDAgRUNYOiAwMDAwMDAwNiBFRFg6IDAwMDAw
MDAwClsgICAgOC41NDE1MTldIEVTSTogMDAwMDAwMDAgRURJOiA3ZGEzM2VjOCBFQlA6IDg5Yzlk
ZjMwIEVTUDogODljOWRmMmMKWyAgICA4LjU0MTUxOV0gRVNJOiAwMDAwMDAwMCBFREk6IDdkYTMz
ZWM4IEVCUDogODljOWRmMzAgRVNQOiA4OWM5ZGYyYwpbICAgIDguNTQxNTE5XSAgRFM6IDAwN2Ig
RVM6IDAwN2IgRlM6IDAwMDAgR1M6IDAwZTAgU1M6IDAwNjgKWyAgICA4LjU0MTUxOV0gIERTOiAw
MDdiIEVTOiAwMDdiIEZTOiAwMDAwIEdTOiAwMGUwIFNTOiAwMDY4ClsgICAgOC41NDE1MTldIENS
MDogODAwNTAwM2IgQ1IyOiAwMmUwMDAwMCBDUjM6IDA1YTU0MDAwIENSNDogMDAwMDA2OTAKWyAg
ICA4LjU0MTUxOV0gQ1IwOiA4MDA1MDAzYiBDUjI6IDAyZTAwMDAwIENSMzogMDVhNTQwMDAgQ1I0
OiAwMDAwMDY5MApbICAgIDguNTQxNTE5XSBTdGFjazoKWyAgICA4LjU0MTUxOV0gU3RhY2s6Clsg
ICAgOC41NDE1MTldICA3ZDlkNjc1YgpbICAgIDguNTQxNTE5XSAgN2Q5ZDY3NWIgODljOWRmOTAg
ODljOWRmOTAgN2Q5OTJhNDkgN2Q5OTJhNDkgN2Q3ZDU5MTQgN2Q3ZDU5MTQgODljOWRmNGMgODlj
OWRmNGMgN2JlM2E4MDAgN2JlM2E4MDAgN2QwOGM1OGMgN2QwOGM1OGMgOGE0YzM5NjggOGE0YzM5
NjgKClsgICAgOC41NDE1MTldICA4OWM5ZGY4MApbICAgIDguNTQxNTE5XSAgODljOWRmODAgN2Jl
M2E5NjYgN2JlM2E5NjYgMDAwMDAxOTIgMDAwMDAxOTIgMDAwMDAwMDYgMDAwMDAwMDYgMDAwMDAw
MDYgMDAwMDAwMDYgN2Q3ZDNmZjQgN2Q3ZDNmZjQgOGE0YzM5N2EgOGE0YzM5N2EgMDAwMDAyMDAg
MDAwMDAyMDAKClsgICAgOC41NDE1MTldICA3ZDZiMTI4MApbICAgIDguNTQxNTE5XSAgN2Q2YjEy
ODAgOGE0YzM5NzkgOGE0YzM5NzkgMDAwMDAwMDYgMDAwMDAwMDYgMDAwMDA5YTYgMDAwMDA5YTYg
N2RhMzJkYjggN2RhMzJkYjggYjEzZWVjODEgYjEzZWVjODEgMDAwMDAwMDYgMDAwMDAwMDYgMDAw
MDA5YTYgMDAwMDA5YTYKClsgICAgOC41NDE1MTldIENhbGwgVHJhY2U6ClsgICAgOC41NDE1MTld
IENhbGwgVHJhY2U6ClsgICAgOC41NDE1MTldICBbJmx0OzdkOWQ2NzViJmd0O10gPyB0dHVzYjJf
ZHJpdmVyX2luaXQrMHgxNi8weDE2ClsgICAgOC41NDE1MTldICBbJmx0OzdkOWQ2NzViJmd0O10g
PyB0dHVzYjJfZHJpdmVyX2luaXQrMHgxNi8weDE2ClsgICAgOC41NDE1MTldICBbJmx0OzdkOTky
YTQ5Jmd0O10gZG9fb25lX2luaXRjYWxsKzB4NzcvMHgxMDYKWyAgICA4LjU0MTUxOV0gIFsmbHQ7
N2Q5OTJhNDkmZ3Q7XSBkb19vbmVfaW5pdGNhbGwrMHg3Ny8weDEwNgpbICAgIDguNTQxNTE5XSAg
WyZsdDs3YmUzYTgwMCZndDtdID8gcGFyYW1lcW4rMHgyLzB4MzUKWyAgICA4LjU0MTUxOV0gIFsm
bHQ7N2JlM2E4MDAmZ3Q7XSA/IHBhcmFtZXFuKzB4Mi8weDM1ClsgICAgOC41NDE1MTldICBbJmx0
OzdiZTNhOTY2Jmd0O10gPyBwYXJzZV9hcmdzKzB4MTEzLzB4MjVjClsgICAgOC41NDE1MTldICBb
Jmx0OzdiZTNhOTY2Jmd0O10gPyBwYXJzZV9hcmdzKzB4MTEzLzB4MjVjClsgICAgOC41NDE1MTld
ICBbJmx0OzdkOTkyYmMyJmd0O10ga2VybmVsX2luaXRfZnJlZWFibGUrMHhlYS8weDE2NwpbICAg
IDguNTQxNTE5XSAgWyZsdDs3ZDk5MmJjMiZndDtdIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4ZWEv
MHgxNjcKWyAgICA4LjU0MTUxOV0gIFsmbHQ7N2NmMDEwNzAmZ3Q7XSBrZXJuZWxfaW5pdCsweDgv
MHhiOApbICAgIDguNTQxNTE5XSAgWyZsdDs3Y2YwMTA3MCZndDtdIGtlcm5lbF9pbml0KzB4OC8w
eGI4ClsgICAgOC41NDE1MTldICBbJmx0OzdjZjI3ZWMwJmd0O10gcmV0X2Zyb21fa2VybmVsX3Ro
cmVhZCsweDIwLzB4MzAKWyAgICA4LjU0MTUxOV0gIFsmbHQ7N2NmMjdlYzAmZ3Q7XSByZXRfZnJv
bV9rZXJuZWxfdGhyZWFkKzB4MjAvMHgzMApbICAgIDguNTQxNTE5XSAgWyZsdDs3Y2YwMTA2OCZn
dDtdID8gcmVzdF9pbml0KzB4MTBjLzB4MTBjClsgICAgOC41NDE1MTldICBbJmx0OzdjZjAxMDY4
Jmd0O10gPyByZXN0X2luaXQrMHgxMGMvMHgxMGMKWyAgICA4LjU0MTUxOV0gQ29kZToKWyAgICA4
LjU0MTUxOV0gQ29kZTogMDggMDggYzIgYzIgYzcgYzcgMDUgMDUgNDQgNDQgZWQgZWQgZjkgZjkg
N2QgN2QgMDAgMDAgMDAgMDAgZTAgZTAgMDIgMDIgYzcgYzcgMDUgMDUgNDAgNDAgZWQgZWQgZjkg
ZjkgN2QgN2QgMDAgMDAgMDAgMDAgZTAgZTAgMDIgMDIgYzcgYzcgMDUgMDUgM2MgM2MgZWQgZWQg
ZjkgZjkgN2QgN2QgMDAgMDAgMDAgMDAgZTAgZTAgMDIgMDIgNzUgNzUgMWYgMWYgYjggYjggMDAg
MDAgMDAgMDAgZTAgZTAgMDIgMDIgODUgODUgYzAgYzAgNzQgNzQgMTYgMTYgJmx0O2ExJmd0OyAm
bHQ7YTEmZ3Q7IDAwIDAwIDAwIDAwIGUwIGUwIDAyIDAyIGM3IGM3IDA1IDA1IDU0IDU0IDg0IDg0
IDhlIDhlIDdkIDdkIDAwIDAwIDAwIDAwIGUwIGUwIDAyIDAyIGEzIGEzIDU4IDU4IDg0IDg0IDhl
IDhlIDdkIDdkIGViIGViCgpbICAgIDguNTQxNTE5XSBFSVA6IFsmbHQ7N2Q5ZDY3YzYmZ3Q7XSAK
WyAgICA4LjU0MTUxOV0gRUlQOiBbJmx0OzdkOWQ2N2M2Jmd0O10gYWY5MDA1X3VzYl9tb2R1bGVf
aW5pdCsweDZiLzB4OWRhZjkwMDVfdXNiX21vZHVsZV9pbml0KzB4NmIvMHg5ZCBTUzpFU1AgMDA2
ODo4OWM5ZGYyYwogU1M6RVNQIDAwNjg6ODljOWRmMmMKWyAgICA4LjU0MTUxOV0gQ1IyOiAwMDAw
MDAwMDAyZTAwMDAwClsgICAgOC41NDE1MTldIENSMjogMDAwMDAwMDAwMmUwMDAwMApbICAgIDgu
NTQxNTE5XSAtLS1bIGVuZCB0cmFjZSA3NjhiNmZhZjUxMzcwZmM3IF0tLS0KWyAgICA4LjU0MTUx
OV0gLS0tWyBlbmQgdHJhY2UgNzY4YjZmYWY1MTM3MGZjNyBdLS0tCgpnaXQgYmlzZWN0IHN0YXJ0
IHYzLjE2IHYzLjE1IC0tCmdpdCBiaXNlY3QgIGJhZCA1MTcwYTNiMjRhOTE0MWUyMzQ5YTM0MjA0
NDg3NDNiN2M2OGYyMjIzICAjIDIyOjU4ICAgICAgMC0gICAgICAxICBNZXJnZSBicmFuY2ggJ2Fr
cG0nIChwYXRjaGVzIGZyb20gQW5kcmV3IE1vcnRvbikKZ2l0IGJpc2VjdCAgYmFkIDFhZDk2YmIw
YTIwZmEyNmI5NTJiMjI1MGU4OWQxNGI2Mzk3YmY2MTggICMgMjM6MDQgICAgICAwLSAgICAgIDEg
IE1lcmdlIHRhZyAnZ3Bpby12My4xNi0yJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4LWdwaW8KZ2l0IGJpc2VjdCAgYmFkIDQxMmRk
M2E2ZGFmMGNhZGNlMWIyZDZhMzRmYTM3MTNmNDAyNTU1NzkgICMgMjM6MTYgICAgICAwLSAgICAg
IDEgIE1lcmdlIHRhZyAneGZzLWZvci1saW51cy0zLjE2LXJjMScgb2YgZ2l0Oi8vb3NzLnNnaS5j
b20veGZzL3hmcwpnaXQgYmlzZWN0ICBiYWQgYjFjY2U4MDMyZjZhYmU5MDBiMDc4ZDI0ZjNjMzkz
ODcyNjUyOGY5NyAgIyAyMzoyMyAgICAgIDAtICAgICAgMiAgTWVyZ2UgYnJhbmNoICdmb3ItbmV4
dCcgb2YgZ2l0Oi8vZ2l0LnNhbWJhLm9yZy9zZnJlbmNoL2NpZnMtMi42CmdpdCBiaXNlY3QgIGJh
ZCBkYTg1ZDE5MWY1OGE0NGUxNDlhN2MwN2RiYWU3OGIzMDQyOTA5Nzk4ICAjIDIzOjI5ICAgICAg
MC0gICAgIDE5ICBNZXJnZSBicmFuY2ggJ2Zvci0zLjE2JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGovd3EKZ2l0IGJpc2VjdCAgYmFkIGY4NDA5YWJk
YzU5MmUxM2NlZmJlNGU0YTI0YTg0YjNkNTc0MWU4NWYgICMgMjM6MzggICAgICAwLSAgICAgIDYg
IE1lcmdlIHRhZyAnZXh0NF9mb3JfbGludXMnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90eXRzby9leHQ0CmdpdCBiaXNlY3QgIGJhZCBlZDgxZTc4MGE3
ZGQ1Njk4YTk4NmYyNDZmYWQ2YTFkOGQwYjZmOWNlICAjIDIzOjQ0ICAgICAgMC0gICAgIDIwICBN
ZXJnZSBicmFuY2ggJ3g4Ni12ZHNvLWZvci1saW51cycgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAKZ2l0IGJpc2VjdCAgYmFkIDNmMTdlYTZk
ZWE4YmE1NjY4ODczYWZhNTQ2MjhhOTFhYWEzZmIxYzAgICMgMjM6NTUgICAgICAxLSAgICAgMTkg
IE1lcmdlIGJyYW5jaCAnbmV4dCcgKGFjY3VtdWxhdGVkIDMuMTYgbWVyZ2Ugd2luZG93IHBhdGNo
ZXMpIGludG8gbWFzdGVyCmdpdCBiaXNlY3QgZ29vZCA0OWViN2IwNzUwZDk0ODNjNzRlOWMxNGFl
NmVhMWU5ZDYyNDgxYzNjICAjIDAwOjM4ICAgICAyMCsgICAgIDIwICBNZXJnZSB0YWcgJ3R0eS0z
LjE2LXJjMScgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2dyZWdraC90dHkgaW50byBuZXh0CmdpdCBiaXNlY3QgIGJhZCA1MzVlYzIxNGUyM2FkYWY3MmM3
NzU5MzhlOWU5YzZjMWNmNmZjNWI5ICAjIDA3OjQwICAgICAgMC0gICAgICAyICBbbWVkaWFdIG10
OXAwMzE6IEZpeCBCTEMgY29uZmlndXJhdGlvbiByZXN0b3JlIHdoZW4gZGlzYWJsaW5nIHRlc3Qg
cGF0dGVybgpnaXQgYmlzZWN0IGdvb2QgMmM1MmEyZmNlMGYwMDQ3OTU0OGEwNzZkOTAwZDFhMmRk
ZDAwMWMyNyAgIyAyMTowMSAgICAgMjArICAgICAyMCAgW21lZGlhXSBlbTI4eHg6IG1vdmUgc3Ry
dWN0IHY0bDJfY2xrICpjbGsgZnJvbSBzdHJ1Y3QgZW0yOHh4IHRvIHN0cnVjdCB2NGwyCmdpdCBi
aXNlY3QgIGJhZCBhNWMwNzVjZmQyMzg2YTRmM2FiNGY4ZWQyODMwZWJlZTU1N2Q0YjNmICAjIDIy
OjA3ICAgICAgMC0gICAgICA5ICBbbWVkaWFdIGVtMjh4eDogbW92ZSBmaWVsZHMgd3FfdHJpZ2dl
ciBhbmQgc3RyZWFtaW5nX3N0YXJ0ZWQgZnJvbSBzdHJ1Y3QgZW0yOHh4IHRvIHN0cnVjdCBlbTI4
eHhfYXVkaW8KZ2l0IGJpc2VjdCBnb29kIDU4MTU5MTcxYzdmMjAxZTVkNmVhMjY2NmM3YjM4NTdl
NzgyYTI4NjEgICMgMjI6NTIgICAgIDIwKyAgICAgMjAgIFttZWRpYV0gZW0yOHh4OiBtb3ZlIHBy
b2dyZXNzaXZlL2ludGVybGFjZWQgZmllbGRzIGZyb20gc3RydWN0IGVtMjh4eCB0byBzdHJ1Y3Qg
djRsMgpnaXQgYmlzZWN0IGdvb2QgMzg1NGIwZDg0N2Q1NThiZGM4MjBiOTNhZThhOTNjMDkyM2Qw
MjExZCAgIyAyMzozMSAgICAgMjArICAgICAyMCAgW21lZGlhXSBlbTI4eHg6IG1vdmUgdHVuZXIg
ZnJlcXVlbmN5IGZpZWxkIGZyb20gc3RydWN0IGVtMjh4eCB0byBzdHJ1Y3QgdjRsMgpnaXQgYmlz
ZWN0IGdvb2QgMzMxOWU2ZjgzOWNmOTRlMzNmYmFkMjdhMjFmYzRjNjRmNmNlYzc0ZiAgIyAwMDox
NCAgICAgMjArICAgICAyMCAgW21lZGlhXSBlbTI4eHg6IHJlbW92ZSBmaWVsZCB0dW5lcl9hZGRy
IGZyb20gc3RydWN0IGVtMjh4eAojIGZpcnN0IGJhZCBjb21taXQ6IFthNWMwNzVjZmQyMzg2YTRm
M2FiNGY4ZWQyODMwZWJlZTU1N2Q0YjNmXSBbbWVkaWFdIGVtMjh4eDogbW92ZSBmaWVsZHMgd3Ff
dHJpZ2dlciBhbmQgc3RyZWFtaW5nX3N0YXJ0ZWQgZnJvbSBzdHJ1Y3QgZW0yOHh4IHRvIHN0cnVj
dCBlbTI4eHhfYXVkaW8KZ2l0IGJpc2VjdCBnb29kIDMzMTllNmY4MzljZjk0ZTMzZmJhZDI3YTIx
ZmM0YzY0ZjZjZWM3NGYgICMgMDA6NTUgICAgIDYwKyAgICAgODAgIFttZWRpYV0gZW0yOHh4OiBy
ZW1vdmUgZmllbGQgdHVuZXJfYWRkciBmcm9tIHN0cnVjdCBlbTI4eHgKZ2l0IGJpc2VjdCAgYmFk
IDc2YzJjNmRjNDZmYmI1YmRkNzM1NzFlYmQwODk3Njk2YzVhYjRkNzMgICMgMDA6NTggICAgICAw
LSAgICAgMTEgIEFkZCBsaW51eC1uZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDE0MDkxNwpnaXQg
YmlzZWN0ICBiYWQgNGQwNDZlOTYwNDZmYWFjNDU2ZjRmNWM5NGMxNTJjNTJhOWM1MWEzYSAgIyAw
MTowOSAgICAgIDItICAgICA1NyAgQWRkIGxpbnV4LW5leHQgc3BlY2lmaWMgZmlsZXMgZm9yIDIw
MTQwOTE4CjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgU29tZXRoaW5nIHdl
bnQgd3JvbmcgZHVyaW5nIHlvdXIgYmlzZWN0aW9uLjxicj4KICAgIEkgY2FuIHJlcHJvZHVjZSB0
aGlzIGlzc3VlIHdpdGgga2VybmVsIHYzLjE1LCB0b28sIHdoaWNoIGRvZXNuJ3QKICAgIGhhdmUg
dGhlIGFib3ZlIGNvbW1pdCB5ZXQuPGJyPgogICAgPGJyPgogICAgUmVnYXJkcyw8YnI+CiAgICBG
cmFuayBTY2jkZmVyPGJyPgogICAgPGJyPgogICAgPGJsb2NrcXVvdGUgY2l0ZT0ibWlkOjIwMTQw
OTE5MDE0MTI0LkdBODMyNkBsb2NhbGhvc3QiIHR5cGU9ImNpdGUiPgogICAgICA8cHJlIHdyYXA9
IiI+CgpUaGlzIHNjcmlwdCBtYXkgcmVwcm9kdWNlIHRoZSBlcnJvci4KCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIyEvYmluL2Jhc2gKCmtlcm5lbD0kMQppbml0cmQ9cXVhbnRhbC1jb3JlLWkzODYuY2d6
Cgp3Z2V0IC0tbm8tY2xvYmJlciA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vZmVuZ2d1YW5nL3JlcHJvZHVjZS1rZXJuZWwtYnVnL3Jhdy9t
YXN0ZXIvaW5pdHJkLyRpbml0cmQiPmh0dHBzOi8vZ2l0aHViLmNvbS9mZW5nZ3VhbmcvcmVwcm9k
dWNlLWtlcm5lbC1idWcvcmF3L21hc3Rlci9pbml0cmQvJGluaXRyZDwvYT4KCmt2bT0oCglxZW11
LXN5c3RlbS14ODZfNjQKCS1jcHUga3ZtNjQKCS1lbmFibGUta3ZtCgkta2VybmVsICRrZXJuZWwK
CS1pbml0cmQgJGluaXRyZAoJLW0gMzIwCgktc21wIDIKCS1uZXQgbmljLHZsYW49MSxtb2RlbD1l
MTAwMAoJLW5ldCB1c2VyLHZsYW49MQoJLWJvb3Qgb3JkZXI9bmMKCS1uby1yZWJvb3QKCS13YXRj
aGRvZyBpNjMwMGVzYgoJLXJ0YyBiYXNlPWxvY2FsdGltZQoJLXNlcmlhbCBzdGRpbwoJLWRpc3Bs
YXkgbm9uZQoJLW1vbml0b3IgbnVsbCAKKQoKYXBwZW5kPSgKCWh1bmdfdGFza19wYW5pYz0xCgll
YXJseXByaW50az10dHlTMCwxMTUyMDAKCWRlYnVnCglhcGljPWRlYnVnCglzeXNycV9hbHdheXNf
ZW5hYmxlZAoJcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAoJcGFuaWM9LTEKCXNv
ZnRsb2NrdXBfcGFuaWM9MQoJbm1pX3dhdGNoZG9nPXBhbmljCglvb3BzPXBhbmljCglsb2FkX3Jh
bWRpc2s9MgoJcHJvbXB0X3JhbWRpc2s9MAoJY29uc29sZT10dHlTMCwxMTUyMDAKCWNvbnNvbGU9
dHR5MAoJdmdhPW5vcm1hbAoJcm9vdD0vZGV2L3JhbTAKCXJ3CglkcmJkLm1pbm9yX2NvdW50PTgK
KQoKIiR7a3ZtW0BdfSIgLS1hcHBlbmQgIiR7YXBwZW5kWypdfSIKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQoKVGhhbmtzLApGZW5nZ3VhbmcKPC9wcmU+CiAgICAgIDxicj4KICAgICAgPGZpZWxkc2V0IGNs
YXNzPSJtaW1lQXR0YWNobWVudEhlYWRlciI+PC9maWVsZHNldD4KICAgICAgPGJyPgogICAgICA8
cHJlIHdyYXA9IiI+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTEtQIG1haWxpbmcgbGlzdAo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBo
cmVmPSJtYWlsdG86TEtQQGxpbnV4LmludGVsLmNvbSI+TEtQQGxpbnV4LmludGVsLmNvbTwvYT4K
PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============0546366452422485498==--

