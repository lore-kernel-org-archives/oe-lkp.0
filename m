Content-Type: multipart/mixed; boundary="===============3605542574794005139=="
MIME-Version: 1.0
From: Craig Bergstrom <craigb@google.com>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Wed, 25 Oct 2017 16:02:09 -0600
Message-ID: <CAOJUGyfTM2J-P29yPhUx2A2SDjA0rv972SE0hmbMHonthMd_bQ@mail.gmail.com>
In-Reply-To: <c5082661-99a4-1b11-c8a1-8b31e9ab8d95@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3605542574794005139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the notification, my apologies for the breakage.  I'll take a
close look and see if I can figure out what went wrong.

Sander, any chance you can send /proc/iomem and the inputs to the mmap call
that fail on your affected system?


On Wed, Oct 25, 2017 at 2:50 PM, Boris Ostrovsky <boris.ostrovsky@oracle.=
com
> wrote:

> On 10/23/2017 10:44 PM, Fengguang Wu wrote:
> > Greetings,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> master
> >
> > commit ce56a86e2ade45d052b3228cdfebe913a1ae7381
> > Author:     Craig Bergstrom <craigb@google.com>
> > AuthorDate: Thu Oct 19 13:28:56 2017 -0600
> > Commit:     Ingo Molnar <mingo@kernel.org>
> > CommitDate: Fri Oct 20 09:48:00 2017 +0200
> >
> >      x86/mm: Limit mmap() of /dev/mem to valid physical addresses
>
> Also note
> https://lists.xenproject.org/archives/html/xen-devel/2017-10/msg02935.html
>
> -boris
>

--===============3605542574794005139==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIGZvciB0aGUgbm90aWZpY2F0aW9uLCBteSBhcG9sb2dpZXMg
Zm9yIHRoZSBicmVha2FnZS7CoCBJJiMzOTtsbCB0YWtlIGEgY2xvc2UgbG9vayBhbmQgc2VlIGlm
IEkgY2FuIGZpZ3VyZSBvdXQgd2hhdCB3ZW50IHdyb25nLjxkaXY+PGJyPjwvZGl2PjxkaXY+U2Fu
ZGVyLCBhbnkgY2hhbmNlIHlvdSBjYW4gc2VuZCAvcHJvYy9pb21lbSBhbmQgdGhlIGlucHV0cyB0
byB0aGUgbW1hcCBjYWxsIHRoYXQgZmFpbCBvbiB5b3VyIGFmZmVjdGVkIHN5c3RlbT88L2Rpdj48
ZGl2Pjxicj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj5PbiBXZWQsIE9jdCAyNSwgMjAxNyBhdCAyOjUwIFBNLCBCb3JpcyBP
c3Ryb3Zza3kgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20iIHRhcmdldD0iX2JsYW5rIj5ib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFk
ZGluZy1sZWZ0OjFleCI+PHNwYW4gY2xhc3M9IiI+T24gMTAvMjMvMjAxNyAxMDo0NCBQTSwgRmVu
Z2d1YW5nIFd1IHdyb3RlOjxicj4KJmd0OyBHcmVldGluZ3MsPGJyPgomZ3Q7PGJyPgomZ3Q7IDBk
YXkga2VybmVsIHRlc3Rpbmcgcm9ib3QgZ290IHRoZSBiZWxvdyBkbWVzZyBhbmQgdGhlIGZpcnN0
IGJhZCBjb21taXQgaXM8YnI+CiZndDs8YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi88
d2JyPnNjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzLzx3YnI+bGludXguZ2l0PC9hPiBtYXN0
ZXI8YnI+CiZndDs8YnI+CiZndDsgY29tbWl0IGNlNTZhODZlMmFkZTQ1ZDA1MmIzMjI4Y2RmZWJl
OTx3YnI+MTNhMWFlNzM4MTxicj4KJmd0OyBBdXRob3I6wqAgwqAgwqBDcmFpZyBCZXJnc3Ryb20g
Jmx0OzxhIGhyZWY9Im1haWx0bzpjcmFpZ2JAZ29vZ2xlLmNvbSI+Y3JhaWdiQGdvb2dsZS5jb208
L2E+Jmd0Ozxicj4KJmd0OyBBdXRob3JEYXRlOiBUaHUgT2N0IDE5IDEzOjI4OjU2IDIwMTcgLTA2
MDA8YnI+CiZndDsgQ29tbWl0OsKgIMKgIMKgSW5nbyBNb2xuYXIgJmx0OzxhIGhyZWY9Im1haWx0
bzptaW5nb0BrZXJuZWwub3JnIj5taW5nb0BrZXJuZWwub3JnPC9hPiZndDs8YnI+CiZndDsgQ29t
bWl0RGF0ZTogRnJpIE9jdCAyMCAwOTo0ODowMCAyMDE3ICswMjAwPGJyPgomZ3Q7PGJyPgomZ3Q7
wqAgwqAgwqAgeDg2L21tOiBMaW1pdCBtbWFwKCkgb2YgL2Rldi9tZW0gdG8gdmFsaWQgcGh5c2lj
YWwgYWRkcmVzc2VzPGJyPgo8YnI+Cjwvc3Bhbj5BbHNvIG5vdGU8YnI+CjxhIGhyZWY9Imh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMC9t
c2cwMjkzNS5odG1sIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnLzx3YnI+YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy08d2Jy
PjEwL21zZzAyOTM1Lmh0bWw8L2E+PGJyPgo8c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9udCBjb2xv
cj0iIzg4ODg4OCI+PGJyPgotYm9yaXM8YnI+CjwvZm9udD48L3NwYW4+PC9ibG9ja3F1b3RlPjwv
ZGl2Pjxicj48L2Rpdj4K

--===============3605542574794005139==--

