Content-Type: multipart/mixed; boundary="===============4151573161348379816=="
MIME-Version: 1.0
From: Felipe Balbi <balbi@ti.com>
To: lkp@lists.01.org
Subject: Re: [usb] 56aa45adcc5: Fixed: WARNING: at kernel/mutex.c:199 mutex_lock_nested+0x121/0x349()
Date: Fri, 26 Jun 2015 11:01:01 -0500
Message-ID: <20150626160101.GA10056@saruman.tx.rr.com>
In-Reply-To: <1435285950.24116.14.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4151573161348379816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 26, 2015 at 10:32:30AM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 56aa45adcc5b793369e535a4b7177f1c7314b577 ("usb: gadget: make usb f=
unctions to load before gadget driver")
> =

> This commit fixed an warning as below:
> =

> [    8.571726] ------------[ cut here ]------------
> [    8.572786] WARNING: at kernel/mutex.c:199 mutex_lock_nested+0x121/0x3=
49()
> [    8.572786] Hardware name: Standard PC (i440FX + PIIX, 1996)
> [    8.572786] Pid: 1, comm: swapper/0 Not tainted 3.9.0-rc1-00006-gfe2a4=
29 #884
> [    8.572786] Call Trace:
> [    8.572786]  [<ffffffff81064ed2>] warn_slowpath_common+0x77/0x91
> [    8.572786]  [<ffffffff81064fb3>] warn_slowpath_null+0x15/0x17
> [    8.572786]  [<ffffffff81b8cbc3>] mutex_lock_nested+0x121/0x349
> [    8.572786]  [<ffffffff810106f8>] ? sched_clock+0x9/0xd
> [    8.572786]  [<ffffffff8108b161>] ? sched_clock_local+0x11/0x78
> [    8.572786]  [<ffffffff81810ffb>] ? gserial_alloc_line+0x2a/0x1c0
> [    8.572786]  [<ffffffff81810ffb>] gserial_alloc_line+0x2a/0x1c0
> [    8.572786]  [<ffffffff81810ffb>] ? gserial_alloc_line+0x2a/0x1c0
> [    8.572786]  [<ffffffff825867f7>] acm_ms_bind+0x2d/0x7ab
> [    8.572786]  [<ffffffff81b8da18>] ? mutex_unlock+0x9/0xb
> [    8.572786]  [<ffffffff81164e29>] ? sysfs_addrm_finish+0x16/0x52
> [    8.572786]  [<ffffffff81163e5d>] ? sysfs_add_file_mode+0xa8/0xdc
> [    8.572786]  [<ffffffff81163e9e>] ? sysfs_add_file+0xd/0xf
> [    8.572786]  [<ffffffff81163ec3>] ? sysfs_create_file+0x23/0x25
> [    8.572786]  [<ffffffff814a9079>] ? device_create_file+0x14/0x16
> [    8.572786]  [<ffffffff81806c6e>] ? composite_dev_prepare+0xb0/0xe9
> [    8.572786]  [<ffffffff81806e73>] composite_bind+0x9c/0x166
> [    8.572786]  [<ffffffff825867b8>] ? m66592_probe+0x418/0x418
> [    8.572786]  [<ffffffff8180476f>] udc_bind_to_driver+0x25/0xa6
> [    8.572786]  [<ffffffff825867b8>] ? m66592_probe+0x418/0x418
> [    8.572786]  [<ffffffff81804dd1>] usb_gadget_probe_driver+0x75/0x88
> [    8.572786]  [<ffffffff81806fca>] usb_composite_probe+0x8d/0x8f
> [    8.572786]  [<ffffffff825867c8>] init+0x10/0x12
> [    8.572786]  [<ffffffff8254ae3e>] do_one_initcall+0x7a/0x13d
> [    8.572786]  [<ffffffff8254b079>] kernel_init_freeable+0x178/0x1fb
> [    8.572786]  [<ffffffff81b6c473>] ? rest_init+0xb7/0xb7
> [    8.572786]  [<ffffffff81b6c47c>] kernel_init+0x9/0xd1
> [    8.572786]  [<ffffffff81b910bc>] ret_from_fork+0x7c/0xb0
> [    8.572786]  [<ffffffff81b6c473>] ? rest_init+0xb7/0xb7
> [    8.572786] ---[ end trace 220a440ac161c663 ]---

This warning is not available on your dmesg.xz

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 3.9.0-rc1 Kernel Configuration

3.9 ??

-- =

balbi

--===============4151573161348379816==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSlZqWGM5QUFvSkVJYU9zdUExeXFSRVlGNFFBSW8zSzllYjZmblhaN25iSXJDZVVvSU4K
ZlM5aDRUamw1VENYQ3FyT0d3ZDdIWkV3eXgrd3Y4TEZ6bTVBK0FyTEJSQ0hkRytBdmlpMXZtMEdE
ZUlWdGVPUgpRRVhHNWoySlFHSjdFUUxPTHFPeEpWZ2JVUnlILzFwSHFaajhJZ0xWdFl3UklZS25h
Z282RXkvYXhPTHQxZkdOCmxoN05LTFdUZVIyb2M5Q3dTdnZmeUMrL3pGNGxiVXdRVngxK0NMZEgv
amowRzcweW1jeXVwcGdTOU9VMkJCMFEKWGdNb2JSamcySHh2TXRwdFFJY01MekgrVllGeHNIVGgv
L0tOU29NbTNSRjBRSE5CQ1lyWGtpRC95K2VVRUlDegpqa0NvV1hjUXVhdzJQa1dXMUpFamRVUy94
OGc4VzYvUUU2Z25JT093TjBwa254cU1wdThoMmJ4eDhzMy95dEpQCm41WGVMZWU3OEMzbnh1UEdD
dCtHb0RINHhJUCtvMmhmMkwvUW5sMk9hd0hYclQvQ1FLNm5aLzd5bjhwK1QxQnUKWU5JazRrY0ti
UlZGVy9lcWdmUlNyM0ExbUczS2xERTI1OURHYmZtRFdUNlErbkFBeEY4eHRraHFCZGRwSFo3TApx
YVJ0UHQ0bm15NEJ3RnJHYTJKbkxkM0RPek1qc1BUTk1rMGtnbUVPUExCWHNZVHNRcXZZQldlcGha
cExVWTdzClVHSmUvT0ZoQkhDcWxOV0hxY1lzZVZpd09zQzQzQ3UrWEx5amlWMWdMd0c3aW1HTkxk
bUNhUVJoaS90Skw1a0wKVHEzb0Z1c0ZacXYxa3hxbkRRamVPd21LV1FZUm1JSGFGSFhoMmpGVnZt
cEUvSVJzVFRCM0xJM3BVZ1plVldKZgptLzVQd1BhWGVEUk5qdk1haUErbQo9dkZEbQotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4151573161348379816==--

