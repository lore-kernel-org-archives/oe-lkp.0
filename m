Content-Type: multipart/mixed; boundary="===============8544875973062970914=="
MIME-Version: 1.0
From: Kostya Serebryany <kcc@google.com>
To: lkp@lists.01.org
Subject: Re: Extending the 0-day system with syzkaller?
Date: Tue, 12 Apr 2016 22:24:00 -0700
Message-ID: <CAN=P9pj+AQL7ugZ4AcKtXw4bQZsiBUrVAVh0GLFS6Uw6vC=28g@mail.gmail.com>
In-Reply-To: <CAHse=S-4sRLKeURK-mr7s5NQ_g28iq8szVn2u82c3dFdB6Ho=g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8544875973062970914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC-ing more people after today's conversation at the Intel Tech Days.

We'd like to add kasan and syzkaller [1,2,3,4] to the 0-day kbuild system.
We believe this has a large potential to find old bugs and prevent
regressions in the Kernel.
How do we achieve this?

Thanks,

--kcc

[1] https://github.com/google/syzkaller
[2] https://github.com/google/syzkaller/wiki/Found-Bugs
[3] https://lwn.net/Articles/677764/
[4] https://www.kernel.org/doc/Documentation/kasan.txt


On Tue, Dec 15, 2015 at 3:49 AM, David Drysdale <drysdale@google.com> wro=
te:

> Hi Fengguang / LKP-folk,
>
> Quick question -- how easy is it to add extra builds/tests/checks to
> your marvellous 0-day kbuild system?
>
> The reason I ask is that I've recently been exploring syzkaller [1],
> which is a system call fuzzer written by some of my colleagues here at
> Google (cc'ed).  Although it's fairly new, it has uncovered a bunch of
> kernel bugs already [2] so I wondered if it might be a good candidate
> for inclusion in the 0-day checks at some point.
>
> (As an aside, I'm in the process of writing an article about syzkaller
> for LWN, which might also expose it to more folk.)
>
> What do you think?
>
> Thanks,
> David
>
> [1] https://github.com/google/syzkaller
> [2] https://github.com/google/syzkaller/wiki/Found-Bugs
>

--===============8544875973062970914==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+Q0MtaW5nIG1vcmUgcGVvcGxlIGFmdGVyIHRvZGF5JiMzOTtzIGNvbnZl
cnNhdGlvbiBhdCB0aGUgSW50ZWwgVGVjaCBEYXlzLsKgPGRpdj48YnI+PC9kaXY+PGRpdj5XZSYj
Mzk7ZCBsaWtlIHRvIGFkZCBrYXNhbiBhbmQgc3l6a2FsbGVyIFsxLDIsMyw0XSB0byB0aGXCoDxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij4wLWRheSBrYnVpbGQgc3lzdGVtLjwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij5XZSBiZWxpZXZlIHRoaXMg
aGFzIGEgbGFyZ2UgcG90ZW50aWFsIHRvIGZpbmQgb2xkIGJ1Z3PCoDwvc3Bhbj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjEyLjhweCI+YW5kIHByZXZlbnQgcmVncmVzc2lvbnPCoDwvc3Bhbj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+aW4gdGhlIEtlcm5lbC4gwqA8L3NwYW4+PC9kaXY+
PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+SG93IGRvIHdlIGFjaGlldmUgdGhp
cz/CoDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48YnI+
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPlRoYW5rcyzC
oDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48YnI+PC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPi0ta2NjwqA8L3Nw
YW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjhw
eCI+WzFdwqA8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxs
ZXIiIHJlbD0ibm9yZWZlcnJlciIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPmh0dHBzOi8vZ2l0
aHViLmNvbS9nb29nbGUvc3l6a2FsbGVyPC9hPjxiciBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPlsyXcKgPC9zcGFuPjxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9nb29nbGUvc3l6a2FsbGVyL3dpa2kvRm91bmQtQnVncyIgcmVsPSJub3Jl
ZmVycmVyIiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+aHR0cHM6Ly9naXRodWIuY29tL2dvb2ds
ZS9zeXprYWxsZXIvd2lraS9Gb3VuZC1CdWdzPC9hPjxicj48L2Rpdj48ZGl2PlszXcKgPGEgaHJl
Zj0iaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzY3Nzc2NC8iPmh0dHBzOi8vbHduLm5ldC9BcnRp
Y2xlcy82Nzc3NjQvPC9hPjwvZGl2PjxkaXY+WzRdIDxhIGhyZWY9Imh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL0RvY3VtZW50YXRpb24va2FzYW4udHh0Ij5odHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9Eb2N1bWVudGF0aW9uL2thc2FuLnR4dDwvYT48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24g
VHVlLCBEZWMgMTUsIDIwMTUgYXQgMzo0OSBBTSwgRGF2aWQgRHJ5c2RhbGUgPHNwYW4gZGlyPSJs
dHIiPiZsdDs8YSBocmVmPSJtYWlsdG86ZHJ5c2RhbGVAZ29vZ2xlLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmRyeXNkYWxlQGdvb2dsZS5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1
b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1s
ZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkhpIEZlbmdndWFuZyAvIExLUC1m
b2xrLDxicj4KPGJyPgpRdWljayBxdWVzdGlvbiAtLSBob3cgZWFzeSBpcyBpdCB0byBhZGQgZXh0
cmEgYnVpbGRzL3Rlc3RzL2NoZWNrcyB0bzxicj4KeW91ciBtYXJ2ZWxsb3VzIDAtZGF5IGtidWls
ZCBzeXN0ZW0/PGJyPgo8YnI+ClRoZSByZWFzb24gSSBhc2sgaXMgdGhhdCBJJiMzOTt2ZSByZWNl
bnRseSBiZWVuIGV4cGxvcmluZyBzeXprYWxsZXIgWzFdLDxicj4Kd2hpY2ggaXMgYSBzeXN0ZW0g
Y2FsbCBmdXp6ZXIgd3JpdHRlbiBieSBzb21lIG9mIG15IGNvbGxlYWd1ZXMgaGVyZSBhdDxicj4K
R29vZ2xlIChjYyYjMzk7ZWQpLsKgIEFsdGhvdWdoIGl0JiMzOTtzIGZhaXJseSBuZXcsIGl0IGhh
cyB1bmNvdmVyZWQgYSBidW5jaCBvZjxicj4Ka2VybmVsIGJ1Z3MgYWxyZWFkeSBbMl0gc28gSSB3
b25kZXJlZCBpZiBpdCBtaWdodCBiZSBhIGdvb2QgY2FuZGlkYXRlPGJyPgpmb3IgaW5jbHVzaW9u
IGluIHRoZSAwLWRheSBjaGVja3MgYXQgc29tZSBwb2ludC48YnI+Cjxicj4KKEFzIGFuIGFzaWRl
LCBJJiMzOTttIGluIHRoZSBwcm9jZXNzIG9mIHdyaXRpbmcgYW4gYXJ0aWNsZSBhYm91dCBzeXpr
YWxsZXI8YnI+CmZvciBMV04sIHdoaWNoIG1pZ2h0IGFsc28gZXhwb3NlIGl0IHRvIG1vcmUgZm9s
ay4pPGJyPgo8YnI+CldoYXQgZG8geW91IHRoaW5rPzxicj4KPGJyPgpUaGFua3MsPGJyPgpEYXZp
ZDxicj4KPGJyPgpbMV0gPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxs
ZXIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9n
b29nbGUvc3l6a2FsbGVyPC9hPjxicj4KWzJdIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9n
b29nbGUvc3l6a2FsbGVyL3dpa2kvRm91bmQtQnVncyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIvd2lraS9Gb3VuZC1C
dWdzPC9hPjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj48L2Rpdj4K

--===============8544875973062970914==--

