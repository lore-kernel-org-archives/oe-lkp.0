Content-Type: multipart/mixed; boundary="===============3128627459500496555=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: ffbe758dbb [ 0.052456] Kernel panic - not syncing: Can't create rootfs
Date: Thu, 09 Aug 2018 17:22:32 +0800
Message-ID: <4f0d8de2-ed42-2ab7-9c24-afc24d778e5b@intel.com>
In-Reply-To: <8959.1533798245@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3128627459500496555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 08/09/2018 03:04 PM, David Howells wrote:
> Rong Chen <rong.a.chen@intel.com> wrote:
>
>> Attached please find the log.
> Hmmm...  There's not enough there to go on - just that it hangs.  Can you
> trigger a thread dump?
I noticed that kernel_hang_in_boot_stag first appeared in ee410f15b, and =

it has been reverted.
so I guess the fix is good, and ffbe758dbb is a victim.

+-------------------------------+------------+------------+------------+---=
------------+
|                               | 608dbdfb1f | ee410f15b1 | 883c9ab9eb | ne=
xt-20180629 |
+-------------------------------+------------+------------+------------+---=
------------+
| boot_successes                | 35         | 0          | 19         | 13=
            |
| boot_failures                 | 0          | 15         |            |   =
            |
| BUG:kernel_hang_in_boot_stage | 0          | 15         |            |   =
            |
+-------------------------------+------------+------------+------------+---=
------------+

+----------------------------------------------+------------+------------+-=
-----------+
|                                              | ca93a22ee4 | ffbe758dbb | =
f51a8fa449 |
+----------------------------------------------+------------+------------+-=
-----------+
| boot_successes                               | 0          | 0          | =
0          |
| boot_failures                                | 48         | 15         | =
7          |
| BUG:kernel_hang_in_boot_stage                | 48         |            | =
           |
| Kernel_panic-not_syncing:Can't_create_rootfs | 0          | 15         | =
7          |
+----------------------------------------------+------------+------------+-=
-----------+

>
>> BUG: kernel hang in boot stage
> Does that actually come from the kernel?
no, it's from 0-day.

Best Regards,
Rong, Chen

>
> David


--===============3128627459500496555==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJyPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAwOC8wOS8yMDE4IDAzOjA0IFBNLCBE
YXZpZCBIb3dlbGxzCiAgICAgIHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOjg5NTkuMTUzMzc5ODI0NUB3YXJ0aG9nLnByb2N5
b24ub3JnLnVrIj4KICAgICAgPHByZSB3cmFwPSIiPlJvbmcgQ2hlbiA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cm9uZy5hLmNoZW5AaW50ZWwuY29tIj4mbHQ7
cm9uZy5hLmNoZW5AaW50ZWwuY29tJmd0OzwvYT4gd3JvdGU6Cgo8L3ByZT4KICAgICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPkF0dGFjaGVkIHBsZWFzZSBm
aW5kIHRoZSBsb2cuCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgd3JhcD0i
Ij4KSG1tbS4uLiAgVGhlcmUncyBub3QgZW5vdWdoIHRoZXJlIHRvIGdvIG9uIC0ganVzdCB0aGF0
IGl0IGhhbmdzLiAgQ2FuIHlvdQp0cmlnZ2VyIGEgdGhyZWFkIGR1bXA/PC9wcmU+CiAgICA8L2Js
b2NrcXVvdGU+CiAgICA8c3BhbiBpZD0id18yOTYiIGNsYXNzPSIiPgogICAgPC9zcGFuPkkgbm90
aWNlZCB0aGF0IGtlcm5lbF9oYW5nX2luX2Jvb3Rfc3RhZyA8c3BhbiBpZD0id18xNDAiCiAgICAg
IGNsYXNzPSIiPmZpcnN0IDwvc3Bhbj48c3BhbiBpZD0id18xNDEiIGNsYXNzPSIiPmFwcGVhcmVk
IDwvc3Bhbj48c3BhbgogICAgICBpZD0id18xNDIiIGNsYXNzPSIiPmluIDwvc3Bhbj5lZTQxMGYx
NWIsIGFuZCBpdCBoYXMgYmVlbgogICAgcmV2ZXJ0ZWQuIDxicj4KICAgIHNvIEkgZ3Vlc3MgdGhl
IGZpeCBpcyBnb29kLCBhbmQgZmZiZTc1OGRiYiBpcyBhIDxzcGFuIGlkPSJ3XzI5NiIKICAgICAg
Y2xhc3M9IiI+dmljdGltLiA8L3NwYW4+PHNwYW4gaWQ9IndfMjk2IiBjbGFzcz0iIj48L3NwYW4+
CiAgICA8cHJlIHdyYXA9IiI+Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tKwp8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgNjA4ZGJkZmIxZiB8IGVlNDEwZjE1YjEgfCA4ODNj
OWFiOWViIHwgbmV4dC0yMDE4MDYyOSB8CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLSsK
fCBib290X3N1Y2Nlc3NlcyAgICAgICAgICAgICAgICB8IDM1ICAgICAgICAgfCAwICAgICAgICAg
IHwgMTkgICAgICAgICB8IDEzICAgICAgICAgICAgfAp8IGJvb3RfZmFpbHVyZXMgICAgICAgICAg
ICAgICAgIHwgMCAgICAgICAgICB8IDE1ICAgICAgICAgfCAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICB8CnwgQlVHOmtlcm5lbF9oYW5nX2luX2Jvb3Rfc3RhZ2UgfCAwICAgICAgICAgIHwgMTUg
ICAgICAgICB8ICAgICAgICAgICAgfCAgICAgICAgICAgICAgIHwKKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0t
LS0tLS0tLS0tLS0tKzwvcHJlPgogICAgPHByZSB3cmFwPSIiPistLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0t
LS0tLS0tLS0tKwp8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgY2E5M2EyMmVlNCB8IGZmYmU3NThkYmIgfCBmNTFhOGZhNDQ5IHwKKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0rCnwgYm9vdF9zdWNjZXNzZXMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAwICAgICAgICAgIHwgMCAgICAgICAgICB8IDAgICAgICAgICAgfAp8IGJvb3RfZmFp
bHVyZXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDggICAgICAgICB8IDE1ICAg
ICAgICAgfCA3ICAgICAgICAgIHwKfCBCVUc6a2VybmVsX2hhbmdfaW5fYm9vdF9zdGFnZSAgICAg
ICAgICAgICAgICB8IDQ4ICAgICAgICAgfCAgICAgICAgICAgIHwgICAgICAgICAgICB8CnwgS2Vy
bmVsX3BhbmljLW5vdF9zeW5jaW5nOkNhbid0X2NyZWF0ZV9yb290ZnMgfCAwICAgICAgICAgIHwg
MTUgICAgICAgICB8IDcgICAgICAgICAgfAorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsK
CjwvcHJlPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOjg5NTku
MTUzMzc5ODI0NUB3YXJ0aG9nLnByb2N5b24ub3JnLnVrIj4KICAgICAgPHByZSB3cmFwPSIiPgoK
PC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgd3JhcD0i
Ij5CVUc6IGtlcm5lbCBoYW5nIGluIGJvb3Qgc3RhZ2UKPC9wcmU+CiAgICAgIDwvYmxvY2txdW90
ZT4KICAgICAgPHByZSB3cmFwPSIiPgpEb2VzIHRoYXQgYWN0dWFsbHkgY29tZSBmcm9tIHRoZSBr
ZXJuZWw/PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICBubywgaXQncyBmcm9tIDAtZGF5Ljxi
cj4KICAgIDxicj4KICAgIEJlc3QgUmVnYXJkcyw8YnI+CiAgICBSb25nLCBDaGVuPGJyPgogICAg
PGJyPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOjg5NTkuMTUz
Mzc5ODI0NUB3YXJ0aG9nLnByb2N5b24ub3JnLnVrIj4KICAgICAgPHByZSB3cmFwPSIiPgoKRGF2
aWQKPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============3128627459500496555==--

