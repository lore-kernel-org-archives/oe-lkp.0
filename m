Content-Type: multipart/mixed; boundary="===============8272160997820145737=="
MIME-Version: 1.0
From: Chris Metcalf <cmetcalf@ezchip.com>
To: lkp@lists.01.org
Subject: Re: [watchdog] 8fcf2cc768a: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Wed, 06 May 2015 11:15:21 -0400
Message-ID: <554A3009.8060005@ezchip.com>
In-Reply-To: <1430882046.5148.2.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8272160997820145737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you.  Andrew has a fix that he will pick up for his tree.

On 5/5/2015 11:14 PM, Huang Ying wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 8fcf2cc768acd845c1fed837bf9cfe2d7106336d ("watchdog: add watchdog_=
cpumask sysctl to assist nohz")
>
>
> +------------------------------------------+------------+------------+
> |                                          | ac2a46075f | 8fcf2cc768 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 32         | 0          |
> | early-boot-hang                          | 1          |            |
> | boot_failures                            | 0          | 30         |
> | BUG:unable_to_handle_kernel              | 0          | 30         |
> | Oops                                     | 0          | 30         |
> | RIP:find_first_bit                       | 0          | 30         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 30         |
> | backtrace:lockup_detector_init           | 0          | 30         |
> | backtrace:kernel_init_freeable           | 0          | 30         |
> +------------------------------------------+------------+------------+
>
>
> [    0.066023] TSC deadline timer enabled
> [    0.066995] smpboot: CPU0: Intel Core Processor (Haswell) (fam: 06, mo=
del: 3c, stepping: 01)
> [    0.068023] Performance Events: unsupported p6 CPU model 60 no PMU dri=
ver, software events only.
> [    0.069756] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [    0.070000] IP: [<ffffffff81431e39>] find_first_bit+0x9/0x60
> [    0.070000] PGD 0
> [    0.070000] Oops: 0000 [#1] SMP
> [    0.070000] Modules linked in:
> [    0.070000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1.0-rc1-next-2=
0150501-01653-gf4f4e07 #7
> [    0.070000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.070000] task: ffff880036f08000 ti: ffff880036f04000 task.ti: ffff8=
80036f04000
> [    0.070000] RIP: 0010:[<ffffffff81431e39>]  [<ffffffff81431e39>] find_=
first_bit+0x9/0x60
> [    0.070000] RSP: 0000:ffff880036f07e68  EFLAGS: 00010202
> [    0.070000] RAX: 00000000ee6b2800 RBX: 0000000000000002 RCX: 000000000=
000001b
> [    0.070000] RDX: ffffffff82200280 RSI: 0000000000000002 RDI: 000000000=
0000000
> [    0.070000] RBP: ffff880036f07e68 R08: 0000000000000010 R09: 000000000=
000001f
> [    0.070000] R10: 00000000a13c5bac R11: 000000000000001a R12: 000000000=
0000000
> [    0.070000] R13: 0000000000002780 R14: 0000000000000000 R15: 000000000=
0000000
> [    0.070000] FS:  0000000000000000(0000) GS:ffff880037200000(0000) knlG=
S:0000000000000000
> [    0.070000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.070000] CR2: 0000000000000000 CR3: 0000000001cb7000 CR4: 000000000=
00406f0
> [    0.070000] Stack:
> [    0.070000]  ffff880036f07e88 ffffffff81eb8e33 ffffffff82200280 ffffff=
ff820214f8
> [    0.070000]  ffff880036f07f38 ffffffff81e920b8 0000000000000001 000000=
0000000000
> [    0.070000]  0000000000000000 0000000000000000 0000000000000000 000000=
0000000000
> [    0.070000] Call Trace:
> [    0.070000]  [<ffffffff81eb8e33>] lockup_detector_init+0x33/0x79
> [    0.070000]  [<ffffffff81e920b8>] kernel_init_freeable+0x128/0x248
> [    0.070000]  [<ffffffff818bb990>] ? rest_init+0x90/0x90
> [    0.070000]  [<ffffffff818bb99e>] kernel_init+0xe/0xf0
> [    0.070000]  [<ffffffff818d0fa2>] ret_from_fork+0x42/0x70
> [    0.070000]  [<ffffffff818bb990>] ? rest_init+0x90/0x90
> [    0.070000] Code: 66 90 48 83 c4 28 48 89 d8 5b 41 5c 41 5d 41 5e 41 5=
f 5d c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 55 48 85 f6 48 89 e5 74 4=
b <48> 8b 0f 48 83 c7 08 ba 40 00 00 00 48 85 c9 74 19 eb 21 0f 1f
> [    0.070000] RIP  [<ffffffff81431e39>] find_first_bit+0x9/0x60
> [    0.070000]  RSP <ffff880036f07e68>
> [    0.070000] CR2: 0000000000000000
> [    0.070000] ---[ end trace 94e3b40ec52f43d8 ]---
> [    0.070000] Kernel panic - not syncing: Fatal exception
>
>
>
> Thanks,
> Ying Huang
>
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com

-- =

Chris Metcalf, EZChip Semiconductor
http://www.ezchip.com


--===============8272160997820145737==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9d2lu
ZG93cy0xMjUyIgogICAgICBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiPgogIDwvaGVhZD4KICA8
Ym9keSBiZ2NvbG9yPSIjRkZGRkZGIiB0ZXh0PSIjMDAwMDAwIj4KICAgIFRoYW5rIHlvdS6gIEFu
ZHJldyBoYXMgYSBmaXggdGhhdCBoZSB3aWxsIHBpY2sgdXAgZm9yIGhpcyB0cmVlLjxicj4KICAg
IDxicj4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+T24gNS81LzIwMTUgMTE6MTQg
UE0sIEh1YW5nIFlpbmcgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSBjaXRl
PSJtaWQ6MTQzMDg4MjA0Ni41MTQ4LjIuY2FtZWxAaW50ZWwuY29tIiB0eXBlPSJjaXRlIj4KICAg
ICAgPHByZSB3cmFwPSIiPkZZSSwgd2Ugbm90aWNlZCB0aGUgYmVsb3cgY2hhbmdlcyBvbgoKZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4
dC5naXQgbWFzdGVyCmNvbW1pdCA4ZmNmMmNjNzY4YWNkODQ1YzFmZWQ4MzdiZjljZmUyZDcxMDYz
MzZkICgid2F0Y2hkb2c6IGFkZCB3YXRjaGRvZ19jcHVtYXNrIHN5c2N0bCB0byBhc3Npc3Qgbm9o
eiIpCgoKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tKwp8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCBhYzJhNDYwNzVmIHwgOGZjZjJjYzc2OCB8CistLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKfCBib290X3N1
Y2Nlc3NlcyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzIgICAgICAgICB8IDAgICAgICAg
ICAgfAp8IGVhcmx5LWJvb3QtaGFuZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICAgICAg
ICAgIHwgICAgICAgICAgICB8CnwgYm9vdF9mYWlsdXJlcyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDAgICAgICAgICAgfCAzMCAgICAgICAgIHwKfCBCVUc6dW5hYmxlX3RvX2hhbmRsZV9r
ZXJuZWwgICAgICAgICAgICAgIHwgMCAgICAgICAgICB8IDMwICAgICAgICAgfAp8IE9vcHMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMzAgICAgICAg
ICB8CnwgUklQOmZpbmRfZmlyc3RfYml0ICAgICAgICAgICAgICAgICAgICAgICB8IDAgICAgICAg
ICAgfCAzMCAgICAgICAgIHwKfCBLZXJuZWxfcGFuaWMtbm90X3N5bmNpbmc6RmF0YWxfZXhjZXB0
aW9uIHwgMCAgICAgICAgICB8IDMwICAgICAgICAgfAp8IGJhY2t0cmFjZTpsb2NrdXBfZGV0ZWN0
b3JfaW5pdCAgICAgICAgICAgfCAwICAgICAgICAgIHwgMzAgICAgICAgICB8CnwgYmFja3RyYWNl
Omtlcm5lbF9pbml0X2ZyZWVhYmxlICAgICAgICAgICB8IDAgICAgICAgICAgfCAzMCAgICAgICAg
IHwKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tKwoKClsgICAgMC4wNjYwMjNdIFRTQyBkZWFkbGluZSB0aW1lciBlbmFi
bGVkClsgICAgMC4wNjY5OTVdIHNtcGJvb3Q6IENQVTA6IEludGVsIENvcmUgUHJvY2Vzc29yIChI
YXN3ZWxsKSAoZmFtOiAwNiwgbW9kZWw6IDNjLCBzdGVwcGluZzogMDEpClsgICAgMC4wNjgwMjNd
IFBlcmZvcm1hbmNlIEV2ZW50czogdW5zdXBwb3J0ZWQgcDYgQ1BVIG1vZGVsIDYwIG5vIFBNVSBk
cml2ZXIsIHNvZnR3YXJlIGV2ZW50cyBvbmx5LgpbICAgIDAuMDY5NzU2XSBCVUc6IHVuYWJsZSB0
byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCAgICAgICAgICAgKG51
bGwpClsgICAgMC4wNzAwMDBdIElQOiBbJmx0O2ZmZmZmZmZmODE0MzFlMzkmZ3Q7XSBmaW5kX2Zp
cnN0X2JpdCsweDkvMHg2MApbICAgIDAuMDcwMDAwXSBQR0QgMCAKWyAgICAwLjA3MDAwMF0gT29w
czogMDAwMCBbIzFdIFNNUCAKWyAgICAwLjA3MDAwMF0gTW9kdWxlcyBsaW5rZWQgaW46ClsgICAg
MC4wNzAwMDBdIENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDQuMS4w
LXJjMS1uZXh0LTIwMTUwNTAxLTAxNjUzLWdmNGY0ZTA3ICM3ClsgICAgMC4wNzAwMDBdIEhhcmR3
YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIDEu
Ny41LTIwMTQwNTMxXzA4MzAzMC1nYW5kYWxmIDA0LzAxLzIwMTQKWyAgICAwLjA3MDAwMF0gdGFz
azogZmZmZjg4MDAzNmYwODAwMCB0aTogZmZmZjg4MDAzNmYwNDAwMCB0YXNrLnRpOiBmZmZmODgw
MDM2ZjA0MDAwClsgICAgMC4wNzAwMDBdIFJJUDogMDAxMDpbJmx0O2ZmZmZmZmZmODE0MzFlMzkm
Z3Q7XSAgWyZsdDtmZmZmZmZmZjgxNDMxZTM5Jmd0O10gZmluZF9maXJzdF9iaXQrMHg5LzB4NjAK
WyAgICAwLjA3MDAwMF0gUlNQOiAwMDAwOmZmZmY4ODAwMzZmMDdlNjggIEVGTEFHUzogMDAwMTAy
MDIKWyAgICAwLjA3MDAwMF0gUkFYOiAwMDAwMDAwMGVlNmIyODAwIFJCWDogMDAwMDAwMDAwMDAw
MDAwMiBSQ1g6IDAwMDAwMDAwMDAwMDAwMWIKWyAgICAwLjA3MDAwMF0gUkRYOiBmZmZmZmZmZjgy
MjAwMjgwIFJTSTogMDAwMDAwMDAwMDAwMDAwMiBSREk6IDAwMDAwMDAwMDAwMDAwMDAKWyAgICAw
LjA3MDAwMF0gUkJQOiBmZmZmODgwMDM2ZjA3ZTY4IFIwODogMDAwMDAwMDAwMDAwMDAxMCBSMDk6
IDAwMDAwMDAwMDAwMDAwMWYKWyAgICAwLjA3MDAwMF0gUjEwOiAwMDAwMDAwMGExM2M1YmFjIFIx
MTogMDAwMDAwMDAwMDAwMDAxYSBSMTI6IDAwMDAwMDAwMDAwMDAwMDAKWyAgICAwLjA3MDAwMF0g
UjEzOiAwMDAwMDAwMDAwMDAyNzgwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6IDAwMDAwMDAw
MDAwMDAwMDAKWyAgICAwLjA3MDAwMF0gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZm
ZmY4ODAwMzcyMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApbICAgIDAuMDcwMDAw
XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzClsgICAg
MC4wNzAwMDBdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDAwMDFjYjcwMDAgQ1I0
OiAwMDAwMDAwMDAwMDQwNmYwClsgICAgMC4wNzAwMDBdIFN0YWNrOgpbICAgIDAuMDcwMDAwXSAg
ZmZmZjg4MDAzNmYwN2U4OCBmZmZmZmZmZjgxZWI4ZTMzIGZmZmZmZmZmODIyMDAyODAgZmZmZmZm
ZmY4MjAyMTRmOApbICAgIDAuMDcwMDAwXSAgZmZmZjg4MDAzNmYwN2YzOCBmZmZmZmZmZjgxZTky
MGI4IDAwMDAwMDAwMDAwMDAwMDEgMDAwMDAwMDAwMDAwMDAwMApbICAgIDAuMDcwMDAwXSAgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAw
MDAwMDAwMApbICAgIDAuMDcwMDAwXSBDYWxsIFRyYWNlOgpbICAgIDAuMDcwMDAwXSAgWyZsdDtm
ZmZmZmZmZjgxZWI4ZTMzJmd0O10gbG9ja3VwX2RldGVjdG9yX2luaXQrMHgzMy8weDc5ClsgICAg
MC4wNzAwMDBdICBbJmx0O2ZmZmZmZmZmODFlOTIwYjgmZ3Q7XSBrZXJuZWxfaW5pdF9mcmVlYWJs
ZSsweDEyOC8weDI0OApbICAgIDAuMDcwMDAwXSAgWyZsdDtmZmZmZmZmZjgxOGJiOTkwJmd0O10g
PyByZXN0X2luaXQrMHg5MC8weDkwClsgICAgMC4wNzAwMDBdICBbJmx0O2ZmZmZmZmZmODE4YmI5
OWUmZ3Q7XSBrZXJuZWxfaW5pdCsweGUvMHhmMApbICAgIDAuMDcwMDAwXSAgWyZsdDtmZmZmZmZm
ZjgxOGQwZmEyJmd0O10gcmV0X2Zyb21fZm9yaysweDQyLzB4NzAKWyAgICAwLjA3MDAwMF0gIFsm
bHQ7ZmZmZmZmZmY4MThiYjk5MCZndDtdID8gcmVzdF9pbml0KzB4OTAvMHg5MApbICAgIDAuMDcw
MDAwXSBDb2RlOiA2NiA5MCA0OCA4MyBjNCAyOCA0OCA4OSBkOCA1YiA0MSA1YyA0MSA1ZCA0MSA1
ZSA0MSA1ZiA1ZCBjMyA2NiAyZSAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCAwZiAxZiA0MCAwMCA1
NSA0OCA4NSBmNiA0OCA4OSBlNSA3NCA0YiAmbHQ7NDgmZ3Q7IDhiIDBmIDQ4IDgzIGM3IDA4IGJh
IDQwIDAwIDAwIDAwIDQ4IDg1IGM5IDc0IDE5IGViIDIxIDBmIDFmIApbICAgIDAuMDcwMDAwXSBS
SVAgIFsmbHQ7ZmZmZmZmZmY4MTQzMWUzOSZndDtdIGZpbmRfZmlyc3RfYml0KzB4OS8weDYwClsg
ICAgMC4wNzAwMDBdICBSU1AgJmx0O2ZmZmY4ODAwMzZmMDdlNjgmZ3Q7ClsgICAgMC4wNzAwMDBd
IENSMjogMDAwMDAwMDAwMDAwMDAwMApbICAgIDAuMDcwMDAwXSAtLS1bIGVuZCB0cmFjZSA5NGUz
YjQwZWM1MmY0M2Q4IF0tLS0KWyAgICAwLjA3MDAwMF0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNp
bmc6IEZhdGFsIGV4Y2VwdGlvbgoKCgpUaGFua3MsCllpbmcgSHVhbmcKCjwvcHJlPgogICAgICA8
YnI+CiAgICAgIDxmaWVsZHNldCBjbGFzcz0ibWltZUF0dGFjaG1lbnRIZWFkZXIiPjwvZmllbGRz
ZXQ+CiAgICAgIDxicj4KICAgICAgPHByZSB3cmFwPSIiPl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxLUCBtYWlsaW5nIGxpc3QKPGEgY2xhc3M9Im1vei10
eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOkxLUEBsaW51eC5pbnRlbC5jb20iPkxL
UEBsaW51eC5pbnRlbC5jb208L2E+CjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgog
ICAgPHByZSBjbGFzcz0ibW96LXNpZ25hdHVyZSIgY29scz0iMTAwMDAwMCI+LS0gCkNocmlzIE1l
dGNhbGYsIEVaQ2hpcCBTZW1pY29uZHVjdG9yCjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRl
eHQiIGhyZWY9Imh0dHA6Ly93d3cuZXpjaGlwLmNvbSI+aHR0cDovL3d3dy5lemNoaXAuY29tPC9h
PjwvcHJlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============8272160997820145737==--

