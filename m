Content-Type: multipart/mixed; boundary="===============5203741485921539728=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/entry/64/compat] 8bb2610bc4: kernel_selftests.x86.test_syscall_vdso_32.fail
Date: Wed, 04 Jul 2018 11:30:38 -0700
Message-ID: <E0E9D986-A638-4863-B49A-33B5B0B77352@amacapital.net>
In-Reply-To: <CA+55aFwSD8T1dusD_Q14MhAxQcYG===ZTdS+CXuT-odj88xWkA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5203741485921539728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Jul 4, 2018, at 9:23 AM, Linus Torvalds <torvalds@linux-foundation.o=
rg> wrote:
> =

>> On Tue, Jul 3, 2018 at 11:58 PM kernel test robot <xiaolong.ye@intel.c=
om> wrote:
>> =

>> FYI, we noticed the following commit (built with gcc-7):
>> =

>> commit: 8bb2610bc4967f19672444a7b0407367f1540028 ("x86/entry/64/compat: =
Preserve r8-r11 in int $0x80")
>> [...]
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
> =

> So that commit is expected to fix things, but it also *enabled* the
> selftests to warn about the change.
> =

> Did you run the new selftest on an old kernel?
> =

> It looks that way, because you talk about running the selftests for
> commit 8bb2610bc496 (which is 4.17-rc2+), but the dmesg you include is
> some ancient version"
> =

>    Linux version 4.12.0-10998-g6974f0c
> =

> Hmm. Some of those self-tests are very much expected to break on old kern=
els.
> =

>           =


Nah, it=E2=80=99s a legit error.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/a=
rch/x86/entry?id=3D22cd978e598618e82c3c3348d2069184f6884182

I blame git apply for being a bit overzealous.

--===============5203741485921539728==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxicj48ZGl2Pjxi
cj5PbiBKdWwgNCwgMjAxOCwgYXQgOToyMyBBTSwgTGludXMgVG9ydmFsZHMgJmx0OzxhIGhyZWY9
Im1haWx0bzp0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZyI+dG9ydmFsZHNAbGludXgtZm91
bmRhdGlvbi5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+PGJyPjwvZGl2PjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiPjxkaXY+PHNwYW4+T24gVHVlLCBKdWwgMywgMjAxOCBhdCAxMTo1OCBQTSBrZXJuZWwg
dGVzdCByb2JvdCAmbHQ7PGEgaHJlZj0ibWFpbHRvOnhpYW9sb25nLnllQGludGVsLmNvbSI+eGlh
b2xvbmcueWVAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PC9zcGFuPjxicj48YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj48c3Bhbj48L3NwYW4+PGJyPjwvYmxvY2txdW90ZT48YmxvY2txdW90ZSB0eXBl
PSJjaXRlIj48c3Bhbj5GWUksIHdlIG5vdGljZWQgdGhlIGZvbGxvd2luZyBjb21taXQgKGJ1aWx0
IHdpdGggZ2NjLTcpOjwvc3Bhbj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiPjxzcGFuPjwvc3Bhbj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUi
PjxzcGFuPmNvbW1pdDogOGJiMjYxMGJjNDk2N2YxOTY3MjQ0NGE3YjA0MDczNjdmMTU0MDAyOCAo
Ing4Ni9lbnRyeS82NC9jb21wYXQ6IFByZXNlcnZlIHI4LXIxMSBpbiBpbnQgJDB4ODAiKTwvc3Bh
bj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPlsuLi5dPC9z
cGFuPjxicj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+Y2F1c2Vk
IGJlbG93IGNoYW5nZXMgKHBsZWFzZSByZWZlciB0byBhdHRhY2hlZCBkbWVzZy9rbXNnIGZvciBl
bnRpcmUgbG9nL2JhY2t0cmFjZSk6PC9zcGFuPjxicj48L2Jsb2NrcXVvdGU+PHNwYW4+PC9zcGFu
Pjxicj48c3Bhbj5TbyB0aGF0IGNvbW1pdCBpcyBleHBlY3RlZCB0byBmaXggdGhpbmdzLCBidXQg
aXQgYWxzbyAqZW5hYmxlZCogdGhlPC9zcGFuPjxicj48c3Bhbj5zZWxmdGVzdHMgdG8gd2FybiBh
Ym91dCB0aGUgY2hhbmdlLjwvc3Bhbj48YnI+PHNwYW4+PC9zcGFuPjxicj48c3Bhbj5EaWQgeW91
IHJ1biB0aGUgbmV3IHNlbGZ0ZXN0IG9uIGFuIG9sZCBrZXJuZWw/PC9zcGFuPjxicj48c3Bhbj48
L3NwYW4+PGJyPjxzcGFuPkl0IGxvb2tzIHRoYXQgd2F5LCBiZWNhdXNlIHlvdSB0YWxrIGFib3V0
IHJ1bm5pbmcgdGhlIHNlbGZ0ZXN0cyBmb3I8L3NwYW4+PGJyPjxzcGFuPmNvbW1pdCA4YmIyNjEw
YmM0OTYgKHdoaWNoIGlzIDQuMTctcmMyKyksIGJ1dCB0aGUgZG1lc2cgeW91IGluY2x1ZGUgaXM8
L3NwYW4+PGJyPjxzcGFuPnNvbWUgYW5jaWVudCB2ZXJzaW9uIjwvc3Bhbj48YnI+PHNwYW4+PC9z
cGFuPjxicj48c3Bhbj4gJm5ic3A7Jm5ic3A7Jm5ic3A7TGludXggdmVyc2lvbiA0LjEyLjAtMTA5
OTgtZzY5NzRmMGM8L3NwYW4+PGJyPjxzcGFuPjwvc3Bhbj48YnI+PHNwYW4+SG1tLiBTb21lIG9m
IHRob3NlIHNlbGYtdGVzdHMgYXJlIHZlcnkgbXVjaCBleHBlY3RlZCB0byBicmVhayBvbiBvbGQg
a2VybmVscy48L3NwYW4+PGJyPjxzcGFuPjwvc3Bhbj48YnI+PHNwYW4+Jm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyZuYnNwOzwvc3Bhbj48YnI+PC9kaXY+PC9ibG9ja3F1b3RlPjxi
cj48ZGl2Pk5haCwgaXTigJlzIGEgbGVnaXQgZXJyb3IuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj48YSBocmVmPSJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2FyY2gveDg2L2VudHJ5P2lkPTIyY2Q5NzhlNTk4
NjE4ZTgyYzNjMzM0OGQyMDY5MTg0ZjY4ODQxODIiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvYXJjaC94ODYv
ZW50cnk/aWQ9MjJjZDk3OGU1OTg2MThlODJjM2MzMzQ4ZDIwNjkxODRmNjg4NDE4MjwvYT48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgYmxhbWUgZ2l0IGFwcGx5IGZvciBiZWluZyBhIGJpdCBv
dmVyemVhbG91cy48L2Rpdj48L2JvZHk+PC9odG1sPg==
--===============5203741485921539728==--

