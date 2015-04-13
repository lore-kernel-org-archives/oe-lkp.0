Content-Type: multipart/mixed; boundary="===============4263374443640143045=="
MIME-Version: 1.0
From: Chris Metcalf <cmetcalf@ezchip.com>
To: lkp@lists.01.org
Subject: Re: [watchdog] fd036dc7957: WARNING: CPU: 0 PID: 1 at mm/memblock.c:1151 memblock_virt_alloc_internal+0x7e/0x142()
Date: Mon, 13 Apr 2015 11:46:57 -0400
Message-ID: <552BE4F1.5040503@ezchip.com>
In-Reply-To: <1428910375.6726.670.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4263374443640143045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/13/2015 03:32 AM, Huang Ying wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile.git mas=
ter
> commit fd036dc79578c6e9490af03eaf87c10e9d158c9c ("watchdog: add watchdog_=
exclude sysctl to assist nohz")

Thanks.  This patch is going to go via a different route eventually, and =

I've removed
it from the tile tree.  (The bug in question has also been fixed.)

>
>
> +----------------------------------------------------------+------------+=
------------+
> |                                                          | 371532c270 |=
 fd036dc795 |
> +----------------------------------------------------------+------------+=
------------+
> | boot_successes                                           | 10         |=
 0          |
> | early-boot-hang                                          | 1          |=
            |
> | boot_failures                                            | 0          |=
 10         |
> | WARNING:at_mm/memblock.c:#memblock_virt_alloc_internal() | 0          |=
 10         |
> | BUG:unable_to_handle_kernel                              | 0          |=
 10         |
> | Oops                                                     | 0          |=
 10         |
> | RIP:__bitmap_empty                                       | 0          |=
 10         |
> | Kernel_panic-not_syncing:Fatal_exception                 | 0          |=
 10         |
> | backtrace:alloc_bootmem_cpumask_var                      | 0          |=
 10         |
> | backtrace:lockup_detector_init                           | 0          |=
 10         |
> | backtrace:kernel_init_freeable                           | 0          |=
 10         |
> +----------------------------------------------------------+------------+=
------------+
>
>
> [    0.078023] Performance Events: Broken PMU hardware detected, using so=
ftware events only.
> [    0.080002] Failed to access perfctr msr (MSR c1 is 0)
> [    0.082279] ------------[ cut here ]------------
> [    0.083005] WARNING: CPU: 0 PID: 1 at mm/memblock.c:1151 memblock_virt=
_alloc_internal+0x7e/0x142()
> [    0.084002] Modules linked in:
> [    0.085003] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.0.0-rc6-wl-ath=
-05581-g50ad550 #1
> [    0.086002] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.087002]  ffffffff81c7870e ffff88013ab77d78 ffffffff81937e53 000000=
0000000cfe
> [    0.089002]  0000000000000000 ffff88013ab77db8 ffffffff8107281a ffff88=
013ab77e28
> [    0.091002]  0000000000000000 00000000ffffffff 0000000000000000 000000=
0000000400
> [    0.093002] Call Trace:
> [    0.094006]  [<ffffffff81937e53>] dump_stack+0x4c/0x65
> [    0.095005]  [<ffffffff8107281a>] warn_slowpath_common+0x8a/0xc0
> [    0.096003]  [<ffffffff8107290a>] warn_slowpath_null+0x1a/0x20
> [    0.097004]  [<ffffffff81fa28d8>] memblock_virt_alloc_internal+0x7e/0x=
142
> [    0.098004]  [<ffffffff81fa2b02>] memblock_virt_alloc_try_nid+0x5f/0x95
> [    0.099004]  [<ffffffff81fbb823>] alloc_bootmem_cpumask_var+0x1d/0x24
> [    0.100004]  [<ffffffff81f9a5c8>] lockup_detector_init+0x28/0x9a
> [    0.101005]  [<ffffffff81f740d1>] kernel_init_freeable+0x128/0x248
> [    0.102004]  [<ffffffff8192b2a0>] ? rest_init+0x90/0x90
> [    0.103003]  [<ffffffff8192b2ae>] kernel_init+0xe/0xf0
> [    0.104004]  [<ffffffff81940958>] ret_from_fork+0x58/0x90
> [    0.105003]  [<ffffffff8192b2a0>] ? rest_init+0x90/0x90
> [    0.106006] ---[ end trace 1bd7ba7378ad664f ]---
> [    0.107006] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
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
>

-- =

Chris Metcalf, EZChip Semiconductor
http://www.ezchip.com


--===============4263374443640143045==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9d2lu
ZG93cy0xMjUyIgogICAgICBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiPgogIDwvaGVhZD4KICA8
Ym9keSB0ZXh0PSIjMDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIE9uIDA0LzEzLzIwMTUg
MDM6MzIgQU0sIEh1YW5nIFlpbmcgd3JvdGU6PGJyPgogICAgPGJsb2NrcXVvdGUgY2l0ZT0ibWlk
OjE0Mjg5MTAzNzUuNjcyNi42NzAuY2FtZWxAaW50ZWwuY29tIgogICAgICB0eXBlPSJjaXRlIj4K
ICAgICAgPHByZSB3cmFwPSIiPkZZSSwgd2Ugbm90aWNlZCB0aGUgYmVsb3cgY2hhbmdlcyBvbgoK
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NtZXRjYWxmL2xp
bnV4LXRpbGUuZ2l0IG1hc3Rlcgpjb21taXQgZmQwMzZkYzc5NTc4YzZlOTQ5MGFmMDNlYWY4N2Mx
MGU5ZDE1OGM5YyAoIndhdGNoZG9nOiBhZGQgd2F0Y2hkb2dfZXhjbHVkZSBzeXNjdGwgdG8gYXNz
aXN0IG5vaHoiKTwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgVGhhbmtzLqAg
VGhpcyBwYXRjaCBpcyBnb2luZyB0byBnbyB2aWEgYSBkaWZmZXJlbnQgcm91dGUgZXZlbnR1YWxs
eSwKICAgIGFuZCBJJ3ZlIHJlbW92ZWQ8YnI+CiAgICBpdCBmcm9tIHRoZSB0aWxlIHRyZWUuoCAo
VGhlIGJ1ZyBpbiBxdWVzdGlvbiBoYXMgYWxzbyBiZWVuIGZpeGVkLik8YnI+CiAgICA8YnI+CiAg
ICA8YmxvY2txdW90ZSBjaXRlPSJtaWQ6MTQyODkxMDM3NS42NzI2LjY3MC5jYW1lbEBpbnRlbC5j
b20iCiAgICAgIHR5cGU9ImNpdGUiPgogICAgICA8cHJlIHdyYXA9IiI+CgoKKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLSsKfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDM3MTUzMmMyNzAgfCBmZDAzNmRjNzk1IHwKKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLSsKfCBib290X3N1Y2Nlc3NlcyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDEwICAgICAgICAgfCAwICAgICAgICAgIHwKfCBlYXJs
eS1ib290LWhhbmcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEg
ICAgICAgICAgfCAgICAgICAgICAgIHwKfCBib290X2ZhaWx1cmVzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDAgICAgICAgICAgfCAxMCAgICAgICAgIHwKfCBX
QVJOSU5HOmF0X21tL21lbWJsb2NrLmM6I21lbWJsb2NrX3ZpcnRfYWxsb2NfaW50ZXJuYWwoKSB8
IDAgICAgICAgICAgfCAxMCAgICAgICAgIHwKfCBCVUc6dW5hYmxlX3RvX2hhbmRsZV9rZXJuZWwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDAgICAgICAgICAgfCAxMCAgICAgICAgIHwK
fCBPb3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDAgICAgICAgICAgfCAxMCAgICAgICAgIHwKfCBSSVA6X19iaXRtYXBfZW1wdHkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDAgICAgICAgICAgfCAxMCAgICAgICAg
IHwKfCBLZXJuZWxfcGFuaWMtbm90X3N5bmNpbmc6RmF0YWxfZXhjZXB0aW9uICAgICAgICAgICAg
ICAgICB8IDAgICAgICAgICAgfCAxMCAgICAgICAgIHwKfCBiYWNrdHJhY2U6YWxsb2NfYm9vdG1l
bV9jcHVtYXNrX3ZhciAgICAgICAgICAgICAgICAgICAgICB8IDAgICAgICAgICAgfCAxMCAgICAg
ICAgIHwKfCBiYWNrdHJhY2U6bG9ja3VwX2RldGVjdG9yX2luaXQgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDAgICAgICAgICAgfCAxMCAgICAgICAgIHwKfCBiYWNrdHJhY2U6a2VybmVsX2lu
aXRfZnJlZWFibGUgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDAgICAgICAgICAgfCAxMCAg
ICAgICAgIHwKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKCgpbICAgIDAuMDc4MDIzXSBQ
ZXJmb3JtYW5jZSBFdmVudHM6IEJyb2tlbiBQTVUgaGFyZHdhcmUgZGV0ZWN0ZWQsIHVzaW5nIHNv
ZnR3YXJlIGV2ZW50cyBvbmx5LgpbICAgIDAuMDgwMDAyXSBGYWlsZWQgdG8gYWNjZXNzIHBlcmZj
dHIgbXNyIChNU1IgYzEgaXMgMCkKWyAgICAwLjA4MjI3OV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVy
ZSBdLS0tLS0tLS0tLS0tClsgICAgMC4wODMwMDVdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDEgYXQg
bW0vbWVtYmxvY2suYzoxMTUxIG1lbWJsb2NrX3ZpcnRfYWxsb2NfaW50ZXJuYWwrMHg3ZS8weDE0
MigpClsgICAgMC4wODQwMDJdIE1vZHVsZXMgbGlua2VkIGluOgpbICAgIDAuMDg1MDAzXSBDUFU6
IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA0LjAuMC1yYzYtd2wtYXRoLTA1
NTgxLWc1MGFkNTUwICMxClsgICAgMC4wODYwMDJdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRh
cmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIDEuNy41LTIwMTQwNTMxXzA4MzAzMC1n
YW5kYWxmIDA0LzAxLzIwMTQKWyAgICAwLjA4NzAwMl0gIGZmZmZmZmZmODFjNzg3MGUgZmZmZjg4
MDEzYWI3N2Q3OCBmZmZmZmZmZjgxOTM3ZTUzIDAwMDAwMDAwMDAwMDBjZmUKWyAgICAwLjA4OTAw
Ml0gIDAwMDAwMDAwMDAwMDAwMDAgZmZmZjg4MDEzYWI3N2RiOCBmZmZmZmZmZjgxMDcyODFhIGZm
ZmY4ODAxM2FiNzdlMjgKWyAgICAwLjA5MTAwMl0gIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDBm
ZmZmZmZmZiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDA0MDAKWyAgICAwLjA5MzAwMl0g
Q2FsbCBUcmFjZToKWyAgICAwLjA5NDAwNl0gIFsmbHQ7ZmZmZmZmZmY4MTkzN2U1MyZndDtdIGR1
bXBfc3RhY2srMHg0Yy8weDY1ClsgICAgMC4wOTUwMDVdICBbJmx0O2ZmZmZmZmZmODEwNzI4MWEm
Z3Q7XSB3YXJuX3Nsb3dwYXRoX2NvbW1vbisweDhhLzB4YzAKWyAgICAwLjA5NjAwM10gIFsmbHQ7
ZmZmZmZmZmY4MTA3MjkwYSZndDtdIHdhcm5fc2xvd3BhdGhfbnVsbCsweDFhLzB4MjAKWyAgICAw
LjA5NzAwNF0gIFsmbHQ7ZmZmZmZmZmY4MWZhMjhkOCZndDtdIG1lbWJsb2NrX3ZpcnRfYWxsb2Nf
aW50ZXJuYWwrMHg3ZS8weDE0MgpbICAgIDAuMDk4MDA0XSAgWyZsdDtmZmZmZmZmZjgxZmEyYjAy
Jmd0O10gbWVtYmxvY2tfdmlydF9hbGxvY190cnlfbmlkKzB4NWYvMHg5NQpbICAgIDAuMDk5MDA0
XSAgWyZsdDtmZmZmZmZmZjgxZmJiODIzJmd0O10gYWxsb2NfYm9vdG1lbV9jcHVtYXNrX3Zhcisw
eDFkLzB4MjQKWyAgICAwLjEwMDAwNF0gIFsmbHQ7ZmZmZmZmZmY4MWY5YTVjOCZndDtdIGxvY2t1
cF9kZXRlY3Rvcl9pbml0KzB4MjgvMHg5YQpbICAgIDAuMTAxMDA1XSAgWyZsdDtmZmZmZmZmZjgx
Zjc0MGQxJmd0O10ga2VybmVsX2luaXRfZnJlZWFibGUrMHgxMjgvMHgyNDgKWyAgICAwLjEwMjAw
NF0gIFsmbHQ7ZmZmZmZmZmY4MTkyYjJhMCZndDtdID8gcmVzdF9pbml0KzB4OTAvMHg5MApbICAg
IDAuMTAzMDAzXSAgWyZsdDtmZmZmZmZmZjgxOTJiMmFlJmd0O10ga2VybmVsX2luaXQrMHhlLzB4
ZjAKWyAgICAwLjEwNDAwNF0gIFsmbHQ7ZmZmZmZmZmY4MTk0MDk1OCZndDtdIHJldF9mcm9tX2Zv
cmsrMHg1OC8weDkwClsgICAgMC4xMDUwMDNdICBbJmx0O2ZmZmZmZmZmODE5MmIyYTAmZ3Q7XSA/
IHJlc3RfaW5pdCsweDkwLzB4OTAKWyAgICAwLjEwNjAwNl0gLS0tWyBlbmQgdHJhY2UgMWJkN2Jh
NzM3OGFkNjY0ZiBdLS0tClsgICAgMC4xMDcwMDZdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBrZXJu
ZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0ICAgICAgICAgICAobnVsbCkKCgoKVGhhbmtz
LApZaW5nIEh1YW5nCgo8L3ByZT4KICAgICAgPGJyPgogICAgICA8ZmllbGRzZXQgY2xhc3M9Im1p
bWVBdHRhY2htZW50SGVhZGVyIj48L2ZpZWxkc2V0PgogICAgICA8YnI+CiAgICAgIDxwcmUgd3Jh
cD0iIj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMS1Ag
bWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1h
aWx0bzpMS1BAbGludXguaW50ZWwuY29tIj5MS1BAbGludXguaW50ZWwuY29tPC9hPgoKPC9wcmU+
CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgICA8cHJlIGNsYXNzPSJtb3otc2lnbmF0dXJl
IiBjb2xzPSI3MiI+LS0gCkNocmlzIE1ldGNhbGYsIEVaQ2hpcCBTZW1pY29uZHVjdG9yCjxhIGNs
YXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHA6Ly93d3cuZXpjaGlwLmNvbSI+
aHR0cDovL3d3dy5lemNoaXAuY29tPC9hPjwvcHJlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============4263374443640143045==--

