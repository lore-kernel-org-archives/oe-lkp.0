Content-Type: multipart/mixed; boundary="===============8963014425625212570=="
MIME-Version: 1.0
From: Alexander Duyck <alexander.duyck@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ipv4/FIB] BUG: unable to handle kernel NULL pointer dereference at 0000000000000030
Date: Sat, 21 Mar 2015 15:06:01 -0700
Message-ID: <550DEB49.4050805@gmail.com>
In-Reply-To: <20150321111248.GB24707@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8963014425625212570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/21/2015 04:12 AM, Fengguang Wu wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master
>
> commit 0ddcf43d5d4a03ded1ee3f6b3b72a0cbed4e90b1
> Author:     Alexander Duyck <alexander.h.duyck@redhat.com>
> AuthorDate: Fri Mar 6 13:47:00 2015 -0800
> Commit:     David S. Miller <davem@davemloft.net>
> CommitDate: Wed Mar 11 16:22:14 2015 -0400
>
>     ipv4: FIB Local/MAIN table collapse
>     =

>     This patch is meant to collapse local and main into one by converting
>     tb_data from an array to a pointer.  Doing this allows us to point the
>     local table into the main while maintaining the same variables in the
>     table.
>     =

>     As such the tb_data was converted from an array to a pointer, and a n=
ew
>     array called data is added in order to still provide an object for tb=
_data
>     to point to.
>     =

>     In order to track the origin of the fib aliases a tb_id value was add=
ed in
>     a hole that existed on 64b systems.  Using this we can also reverse t=
he
>     merge in the event that custom FIB rules are enabled.
>     =

>     With this patch I am seeing an improvement of 20ns to 30ns for routing
>     lookups as long as custom rules are not enabled, with custom rules en=
abled
>     we fall back to split tables and the original behavior.
>     =

>     Signed-off-by: Alexander Duyck <alexander.h.duyck@redhat.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
>
>
> testbox/testcase/testparams: vm-vp-quantal-x86_64/boot/1
>
> 169bf9121b19dd60  0ddcf43d5d4a03ded1ee3f6b3b
> ----------------  --------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           0:80          12%          10:80    dmesg.BUG:unable_to_handle_=
kernel
>           0:80          12%          10:80    dmesg.Kernel_panic-not_sync=
ing:Fatal_exception
>           0:80          12%          10:80    dmesg.Oops
>           0:80          12%          10:80    dmesg.RIP:fib_trie_unmerge
>
> [   14.975179] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000030
> [   14.976015] IP: [<ffffffff817f77bd>] fib_trie_unmerge+0x1d/0x2f0
> [   14.976015] PGD 0 =

> [   14.976015] Oops: 0000 [#1] SMP =

> [   14.976015] Modules linked in:
> [   14.976015] CPU: 1 PID: 52 Comm: kworker/u4:1 Not tainted 4.0.0-rc3-00=
503-g0ddcf43 #1
> [   14.976015] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [   14.976015] Workqueue: netns cleanup_net
> [   14.976015] task: ffff88001605d880 ti: ffff880016064000 task.ti: ffff8=
80016064000
> [   14.976015] RIP: 0010:[<ffffffff817f77bd>]  [<ffffffff817f77bd>] fib_t=
rie_unmerge+0x1d/0x2f0
> [   14.976015] RSP: 0018:ffff880016067c38  EFLAGS: 00010292
> [   14.976015] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0000038
> [   14.976015] RDX: ffff880012200808 RSI: 00000000000000ff RDI: 000000000=
0000000
> [   14.976015] RBP: ffff880016067c88 R08: ffff880012200600 R09: 000000018=
00c0003
> [   14.976015] R10: ffff88001371a080 R11: ffff880014bfaa00 R12: ffff88001=
5ac8000
> [   14.976015] R13: ffff880012200780 R14: ffff880012200808 R15: ffff88001=
5ac8008
> [   14.976015] FS:  0000000000000000(0000) GS:ffff880013700000(0000) knlG=
S:0000000000000000
> [   14.976015] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [   14.976015] CR2: 0000000000000030 CR3: 0000000001cb3000 CR4: 000000000=
00007e0
> [   14.976015] Stack:
> [   14.976015]  ffff880016067c68 ffffffff811c724e ffff880014bfa838 ffff88=
0014bfa7b0
> [   14.976015]  ffff880014bfa838 0000000000000000 ffff880015ac8000 ffff88=
0012200780
> [   14.976015]  ffff880012200808 ffff880015ac8008 ffff880016067ca8 ffffff=
ff817f11a4
> [   14.976015] Call Trace:
> [   14.976015]  [<ffffffff811c724e>] ? kmem_cache_free+0x1de/0x200
> [   14.976015]  [<ffffffff817f11a4>] fib_unmerge+0x24/0xc0
> [   14.976015]  [<ffffffff817fcb0f>] fib4_rule_delete+0x1f/0x60
> [   14.976015]  [<ffffffff8178ea14>] fib_rules_unregister+0x84/0xe0
> [   14.976015]  [<ffffffff817fcf45>] fib4_rules_exit+0x15/0x20
> [   14.976015]  [<ffffffff817f05ab>] ip_fib_net_exit+0x1b/0x120
> [   14.976015]  [<ffffffff817f06e5>] fib_net_exit+0x35/0x40
> [   14.976015]  [<ffffffff81766759>] ops_exit_list+0x39/0x60
> [   14.976015]  [<ffffffff81767538>] cleanup_net+0x158/0x260
> [   14.976015]  [<ffffffff8108ba28>] process_one_work+0x158/0x490
> [   14.976015]  [<ffffffff8108c673>] worker_thread+0x73/0x570
> [   14.976015]  [<ffffffff8108c600>] ? rescuer_thread+0x400/0x400
> [   14.976015]  [<ffffffff810919df>] kthread+0xef/0x110
> [   14.976015]  [<ffffffff810918f0>] ? kthread_create_on_node+0x180/0x180
> [   14.976015]  [<ffffffff818b4198>] ret_from_fork+0x58/0x90
> [   14.976015]  [<ffffffff810918f0>] ? kthread_create_on_node+0x180/0x180
> [   14.976015] Code: 9c ff 31 c0 eb 88 0f 1f 84 00 00 00 00 00 0f 1f 44 0=
0 00 55 48 8d 4f 38 48 89 f8 48 89 e5 41 57 41 56 41 55 41 54 53 48 83 ec 2=
8 <48> 8b 57 30 48 39 ca 48 89 55 c8 0f 84 12 01 00 00 31 f6 bf ff =

> [   14.976015] RIP  [<ffffffff817f77bd>] fib_trie_unmerge+0x1d/0x2f0
> [   14.976015]  RSP <ffff880016067c38>
> [   14.976015] CR2: 0000000000000030
> [   14.976015] ---[ end trace ada4f02c5ab95ed8 ]---
> [   14.976015] Kernel panic - not syncing: Fatal exception
>

The fix for this should already be in under commit
3c9e9f7320f0138497ef7879c0903246746e0ed3 ("fib_trie: Avoid NULL pointer
if local table is not allocated") in Dave's net-next tree.

- Alex

--===============8963014425625212570==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9d2lu
ZG93cy0xMjUyIgogICAgICBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiPgogIDwvaGVhZD4KICA8
Ym9keSBiZ2NvbG9yPSIjRkZGRkZGIiB0ZXh0PSIjMDAwMDAwIj4KICAgIDxkaXYgY2xhc3M9Im1v
ei1jaXRlLXByZWZpeCI+T24gMDMvMjEvMjAxNSAwNDoxMiBBTSwgRmVuZ2d1YW5nIFd1CiAgICAg
IHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUgY2l0ZT0ibWlkOjIwMTUwMzIx
MTExMjQ4LkdCMjQ3MDdAd2ZnLXQ1NDBwLnNoLmludGVsLmNvbSIKICAgICAgdHlwZT0iY2l0ZSI+
CiAgICAgIDxwcmUgd3JhcD0iIj5HcmVldGluZ3MsCgowZGF5IGtlcm5lbCB0ZXN0aW5nIHJvYm90
IGdvdCB0aGUgYmVsb3cgZG1lc2cgYW5kIHRoZSBmaXJzdCBiYWQgY29tbWl0IGlzCgpnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZGF2ZW0vbmV0LW5leHQuZ2l0
IG1hc3RlcgoKY29tbWl0IDBkZGNmNDNkNWQ0YTAzZGVkMWVlM2Y2YjNiNzJhMGNiZWQ0ZTkwYjEK
QXV0aG9yOiAgICAgQWxleGFuZGVyIER1eWNrIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzphbGV4YW5kZXIuaC5kdXlja0ByZWRoYXQuY29tIj4mbHQ7YWxleGFu
ZGVyLmguZHV5Y2tAcmVkaGF0LmNvbSZndDs8L2E+CkF1dGhvckRhdGU6IEZyaSBNYXIgNiAxMzo0
NzowMCAyMDE1IC0wODAwCkNvbW1pdDogICAgIERhdmlkIFMuIE1pbGxlciA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCI+Jmx0
O2RhdmVtQGRhdmVtbG9mdC5uZXQmZ3Q7PC9hPgpDb21taXREYXRlOiBXZWQgTWFyIDExIDE2OjIy
OjE0IDIwMTUgLTA0MDAKCiAgICBpcHY0OiBGSUIgTG9jYWwvTUFJTiB0YWJsZSBjb2xsYXBzZQog
ICAgCiAgICBUaGlzIHBhdGNoIGlzIG1lYW50IHRvIGNvbGxhcHNlIGxvY2FsIGFuZCBtYWluIGlu
dG8gb25lIGJ5IGNvbnZlcnRpbmcKICAgIHRiX2RhdGEgZnJvbSBhbiBhcnJheSB0byBhIHBvaW50
ZXIuICBEb2luZyB0aGlzIGFsbG93cyB1cyB0byBwb2ludCB0aGUKICAgIGxvY2FsIHRhYmxlIGlu
dG8gdGhlIG1haW4gd2hpbGUgbWFpbnRhaW5pbmcgdGhlIHNhbWUgdmFyaWFibGVzIGluIHRoZQog
ICAgdGFibGUuCiAgICAKICAgIEFzIHN1Y2ggdGhlIHRiX2RhdGEgd2FzIGNvbnZlcnRlZCBmcm9t
IGFuIGFycmF5IHRvIGEgcG9pbnRlciwgYW5kIGEgbmV3CiAgICBhcnJheSBjYWxsZWQgZGF0YSBp
cyBhZGRlZCBpbiBvcmRlciB0byBzdGlsbCBwcm92aWRlIGFuIG9iamVjdCBmb3IgdGJfZGF0YQog
ICAgdG8gcG9pbnQgdG8uCiAgICAKICAgIEluIG9yZGVyIHRvIHRyYWNrIHRoZSBvcmlnaW4gb2Yg
dGhlIGZpYiBhbGlhc2VzIGEgdGJfaWQgdmFsdWUgd2FzIGFkZGVkIGluCiAgICBhIGhvbGUgdGhh
dCBleGlzdGVkIG9uIDY0YiBzeXN0ZW1zLiAgVXNpbmcgdGhpcyB3ZSBjYW4gYWxzbyByZXZlcnNl
IHRoZQogICAgbWVyZ2UgaW4gdGhlIGV2ZW50IHRoYXQgY3VzdG9tIEZJQiBydWxlcyBhcmUgZW5h
YmxlZC4KICAgIAogICAgV2l0aCB0aGlzIHBhdGNoIEkgYW0gc2VlaW5nIGFuIGltcHJvdmVtZW50
IG9mIDIwbnMgdG8gMzBucyBmb3Igcm91dGluZwogICAgbG9va3VwcyBhcyBsb25nIGFzIGN1c3Rv
bSBydWxlcyBhcmUgbm90IGVuYWJsZWQsIHdpdGggY3VzdG9tIHJ1bGVzIGVuYWJsZWQKICAgIHdl
IGZhbGwgYmFjayB0byBzcGxpdCB0YWJsZXMgYW5kIHRoZSBvcmlnaW5hbCBiZWhhdmlvci4KICAg
IAogICAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIER1eWNrIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzphbGV4YW5kZXIuaC5kdXlja0ByZWRoYXQuY29tIj4m
bHQ7YWxleGFuZGVyLmguZHV5Y2tAcmVkaGF0LmNvbSZndDs8L2E+CiAgICBTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBTLiBNaWxsZXIgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOmRhdmVtQGRhdmVtbG9mdC5uZXQiPiZsdDtkYXZlbUBkYXZlbWxvZnQubmV0Jmd0Ozwv
YT4KCgp0ZXN0Ym94L3Rlc3RjYXNlL3Rlc3RwYXJhbXM6IHZtLXZwLXF1YW50YWwteDg2XzY0L2Jv
b3QvMQoKMTY5YmY5MTIxYjE5ZGQ2MCAgMGRkY2Y0M2Q1ZDRhMDNkZWQxZWUzZjZiM2IKLS0tLS0t
LS0tLS0tLS0tLSAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgIGZhaWw6cnVucyAg
JXJlcHJvZHVjdGlvbiAgICBmYWlsOnJ1bnMKICAgICAgICAgICB8ICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgfAogICAgICAgICAgMDo4MCAgICAgICAgICAxMiUgICAgICAgICAgMTA6ODAgICAg
ZG1lc2cuQlVHOnVuYWJsZV90b19oYW5kbGVfa2VybmVsCiAgICAgICAgICAwOjgwICAgICAgICAg
IDEyJSAgICAgICAgICAxMDo4MCAgICBkbWVzZy5LZXJuZWxfcGFuaWMtbm90X3N5bmNpbmc6RmF0
YWxfZXhjZXB0aW9uCiAgICAgICAgICAwOjgwICAgICAgICAgIDEyJSAgICAgICAgICAxMDo4MCAg
ICBkbWVzZy5Pb3BzCiAgICAgICAgICAwOjgwICAgICAgICAgIDEyJSAgICAgICAgICAxMDo4MCAg
ICBkbWVzZy5SSVA6ZmliX3RyaWVfdW5tZXJnZQoKWyAgIDE0Ljk3NTE3OV0gQlVHOiB1bmFibGUg
dG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgMDAwMDAwMDAwMDAw
MDAzMApbICAgMTQuOTc2MDE1XSBJUDogWyZsdDtmZmZmZmZmZjgxN2Y3N2JkJmd0O10gZmliX3Ry
aWVfdW5tZXJnZSsweDFkLzB4MmYwClsgICAxNC45NzYwMTVdIFBHRCAwIApbICAgMTQuOTc2MDE1
XSBPb3BzOiAwMDAwIFsjMV0gU01QIApbICAgMTQuOTc2MDE1XSBNb2R1bGVzIGxpbmtlZCBpbjoK
WyAgIDE0Ljk3NjAxNV0gQ1BVOiAxIFBJRDogNTIgQ29tbToga3dvcmtlci91NDoxIE5vdCB0YWlu
dGVkIDQuMC4wLXJjMy0wMDUwMy1nMGRkY2Y0MyAjMQpbICAgMTQuOTc2MDE1XSBIYXJkd2FyZSBu
YW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAxLjcuNS0y
MDE0MDUzMV8wODMwMzAtZ2FuZGFsZiAwNC8wMS8yMDE0ClsgICAxNC45NzYwMTVdIFdvcmtxdWV1
ZTogbmV0bnMgY2xlYW51cF9uZXQKWyAgIDE0Ljk3NjAxNV0gdGFzazogZmZmZjg4MDAxNjA1ZDg4
MCB0aTogZmZmZjg4MDAxNjA2NDAwMCB0YXNrLnRpOiBmZmZmODgwMDE2MDY0MDAwClsgICAxNC45
NzYwMTVdIFJJUDogMDAxMDpbJmx0O2ZmZmZmZmZmODE3Zjc3YmQmZ3Q7XSAgWyZsdDtmZmZmZmZm
ZjgxN2Y3N2JkJmd0O10gZmliX3RyaWVfdW5tZXJnZSsweDFkLzB4MmYwClsgICAxNC45NzYwMTVd
IFJTUDogMDAxODpmZmZmODgwMDE2MDY3YzM4ICBFRkxBR1M6IDAwMDEwMjkyClsgICAxNC45NzYw
MTVdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiAwMDAw
MDAwMDAwMDAwMDM4ClsgICAxNC45NzYwMTVdIFJEWDogZmZmZjg4MDAxMjIwMDgwOCBSU0k6IDAw
MDAwMDAwMDAwMDAwZmYgUkRJOiAwMDAwMDAwMDAwMDAwMDAwClsgICAxNC45NzYwMTVdIFJCUDog
ZmZmZjg4MDAxNjA2N2M4OCBSMDg6IGZmZmY4ODAwMTIyMDA2MDAgUjA5OiAwMDAwMDAwMTgwMGMw
MDAzClsgICAxNC45NzYwMTVdIFIxMDogZmZmZjg4MDAxMzcxYTA4MCBSMTE6IGZmZmY4ODAwMTRi
ZmFhMDAgUjEyOiBmZmZmODgwMDE1YWM4MDAwClsgICAxNC45NzYwMTVdIFIxMzogZmZmZjg4MDAx
MjIwMDc4MCBSMTQ6IGZmZmY4ODAwMTIyMDA4MDggUjE1OiBmZmZmODgwMDE1YWM4MDA4ClsgICAx
NC45NzYwMTVdIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmODgwMDEzNzAwMDAw
KDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKWyAgIDE0Ljk3NjAxNV0gQ1M6ICAwMDEwIERT
OiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzYgpbICAgMTQuOTc2MDE1XSBDUjI6
IDAwMDAwMDAwMDAwMDAwMzAgQ1IzOiAwMDAwMDAwMDAxY2IzMDAwIENSNDogMDAwMDAwMDAwMDAw
MDdlMApbICAgMTQuOTc2MDE1XSBTdGFjazoKWyAgIDE0Ljk3NjAxNV0gIGZmZmY4ODAwMTYwNjdj
NjggZmZmZmZmZmY4MTFjNzI0ZSBmZmZmODgwMDE0YmZhODM4IGZmZmY4ODAwMTRiZmE3YjAKWyAg
IDE0Ljk3NjAxNV0gIGZmZmY4ODAwMTRiZmE4MzggMDAwMDAwMDAwMDAwMDAwMCBmZmZmODgwMDE1
YWM4MDAwIGZmZmY4ODAwMTIyMDA3ODAKWyAgIDE0Ljk3NjAxNV0gIGZmZmY4ODAwMTIyMDA4MDgg
ZmZmZjg4MDAxNWFjODAwOCBmZmZmODgwMDE2MDY3Y2E4IGZmZmZmZmZmODE3ZjExYTQKWyAgIDE0
Ljk3NjAxNV0gQ2FsbCBUcmFjZToKWyAgIDE0Ljk3NjAxNV0gIFsmbHQ7ZmZmZmZmZmY4MTFjNzI0
ZSZndDtdID8ga21lbV9jYWNoZV9mcmVlKzB4MWRlLzB4MjAwClsgICAxNC45NzYwMTVdICBbJmx0
O2ZmZmZmZmZmODE3ZjExYTQmZ3Q7XSBmaWJfdW5tZXJnZSsweDI0LzB4YzAKWyAgIDE0Ljk3NjAx
NV0gIFsmbHQ7ZmZmZmZmZmY4MTdmY2IwZiZndDtdIGZpYjRfcnVsZV9kZWxldGUrMHgxZi8weDYw
ClsgICAxNC45NzYwMTVdICBbJmx0O2ZmZmZmZmZmODE3OGVhMTQmZ3Q7XSBmaWJfcnVsZXNfdW5y
ZWdpc3RlcisweDg0LzB4ZTAKWyAgIDE0Ljk3NjAxNV0gIFsmbHQ7ZmZmZmZmZmY4MTdmY2Y0NSZn
dDtdIGZpYjRfcnVsZXNfZXhpdCsweDE1LzB4MjAKWyAgIDE0Ljk3NjAxNV0gIFsmbHQ7ZmZmZmZm
ZmY4MTdmMDVhYiZndDtdIGlwX2ZpYl9uZXRfZXhpdCsweDFiLzB4MTIwClsgICAxNC45NzYwMTVd
ICBbJmx0O2ZmZmZmZmZmODE3ZjA2ZTUmZ3Q7XSBmaWJfbmV0X2V4aXQrMHgzNS8weDQwClsgICAx
NC45NzYwMTVdICBbJmx0O2ZmZmZmZmZmODE3NjY3NTkmZ3Q7XSBvcHNfZXhpdF9saXN0KzB4Mzkv
MHg2MApbICAgMTQuOTc2MDE1XSAgWyZsdDtmZmZmZmZmZjgxNzY3NTM4Jmd0O10gY2xlYW51cF9u
ZXQrMHgxNTgvMHgyNjAKWyAgIDE0Ljk3NjAxNV0gIFsmbHQ7ZmZmZmZmZmY4MTA4YmEyOCZndDtd
IHByb2Nlc3Nfb25lX3dvcmsrMHgxNTgvMHg0OTAKWyAgIDE0Ljk3NjAxNV0gIFsmbHQ7ZmZmZmZm
ZmY4MTA4YzY3MyZndDtdIHdvcmtlcl90aHJlYWQrMHg3My8weDU3MApbICAgMTQuOTc2MDE1XSAg
WyZsdDtmZmZmZmZmZjgxMDhjNjAwJmd0O10gPyByZXNjdWVyX3RocmVhZCsweDQwMC8weDQwMApb
ICAgMTQuOTc2MDE1XSAgWyZsdDtmZmZmZmZmZjgxMDkxOWRmJmd0O10ga3RocmVhZCsweGVmLzB4
MTEwClsgICAxNC45NzYwMTVdICBbJmx0O2ZmZmZmZmZmODEwOTE4ZjAmZ3Q7XSA/IGt0aHJlYWRf
Y3JlYXRlX29uX25vZGUrMHgxODAvMHgxODAKWyAgIDE0Ljk3NjAxNV0gIFsmbHQ7ZmZmZmZmZmY4
MThiNDE5OCZndDtdIHJldF9mcm9tX2ZvcmsrMHg1OC8weDkwClsgICAxNC45NzYwMTVdICBbJmx0
O2ZmZmZmZmZmODEwOTE4ZjAmZ3Q7XSA/IGt0aHJlYWRfY3JlYXRlX29uX25vZGUrMHgxODAvMHgx
ODAKWyAgIDE0Ljk3NjAxNV0gQ29kZTogOWMgZmYgMzEgYzAgZWIgODggMGYgMWYgODQgMDAgMDAg
MDAgMDAgMDAgMGYgMWYgNDQgMDAgMDAgNTUgNDggOGQgNGYgMzggNDggODkgZjggNDggODkgZTUg
NDEgNTcgNDEgNTYgNDEgNTUgNDEgNTQgNTMgNDggODMgZWMgMjggJmx0OzQ4Jmd0OyA4YiA1NyAz
MCA0OCAzOSBjYSA0OCA4OSA1NSBjOCAwZiA4NCAxMiAwMSAwMCAwMCAzMSBmNiBiZiBmZiAKWyAg
IDE0Ljk3NjAxNV0gUklQICBbJmx0O2ZmZmZmZmZmODE3Zjc3YmQmZ3Q7XSBmaWJfdHJpZV91bm1l
cmdlKzB4MWQvMHgyZjAKWyAgIDE0Ljk3NjAxNV0gIFJTUCAmbHQ7ZmZmZjg4MDAxNjA2N2MzOCZn
dDsKWyAgIDE0Ljk3NjAxNV0gQ1IyOiAwMDAwMDAwMDAwMDAwMDMwClsgICAxNC45NzYwMTVdIC0t
LVsgZW5kIHRyYWNlIGFkYTRmMDJjNWFiOTVlZDggXS0tLQpbICAgMTQuOTc2MDE1XSBLZXJuZWwg
cGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uCgo8L3ByZT4KICAgIDwvYmxvY2tx
dW90ZT4KICAgIDxicj4KICAgIFRoZSBmaXggZm9yIHRoaXMgc2hvdWxkIGFscmVhZHkgYmUgaW4g
dW5kZXIgY29tbWl0CiAgICAzYzllOWY3MzIwZjAxMzg0OTdlZjc4NzljMDkwMzI0Njc0NmUwZWQz
ICgiZmliX3RyaWU6IEF2b2lkIE5VTEwKICAgIHBvaW50ZXIgaWYgbG9jYWwgdGFibGUgaXMgbm90
IGFsbG9jYXRlZCIpCiAgICA8bWV0YSBodHRwLWVxdWl2PSJjb250ZW50LXR5cGUiIGNvbnRlbnQ9
InRleHQvaHRtbDsKICAgICAgY2hhcnNldD13aW5kb3dzLTEyNTIiPgogICAgaW4gRGF2ZSdzIG5l
dC1uZXh0IHRyZWUuPGJyPgogICAgPGJyPgogICAgLSBBbGV4PGJyPgogIDwvYm9keT4KPC9odG1s
Pgo=

--===============8963014425625212570==--

