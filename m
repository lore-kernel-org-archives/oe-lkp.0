Content-Type: multipart/mixed; boundary="===============1108461188152580525=="
MIME-Version: 1.0
From: Nadav Amit <nadav.amit@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 7674270022: will-it-scale.per_process_ops -19.3% regression
Date: Tue, 08 Aug 2017 01:16:08 -0700
Message-ID: <CAKLkAJ48yH1hT2UQvxGf1i5Zuceasyu_4og3sqADuxOCD81c0Q@mail.gmail.com>
In-Reply-To: <20170808080821.GA31730@bbox>
List-Id: <oe-lkp.lists.linux.dev>

--===============1108461188152580525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Aug 8, 2017 01:08, "Minchan Kim" <minchan@kernel.org> wrote:

On Mon, Aug 07, 2017 at 10:51:00PM -0700, Nadav Amit wrote:
> Nadav Amit <nadav.amit@gmail.com> wrote:
>
> > Minchan Kim <minchan@kernel.org> wrote:
> >
> >> Hi,
> >>
> >> On Tue, Aug 08, 2017 at 09:19:23AM +0800, kernel test robot wrote:
> >>> Greeting,
> >>>
> >>> FYI, we noticed a -19.3% regression of will-it-scale.per_process_ops
due to commit:
> >>>
> >>>
> >>> commit: 76742700225cad9df49f05399381ac3f1ec3dc60 ("mm: fix
MADV_[FREE|DONTNEED] TLB flush miss problem")
> >>> url: https://github.com/0day-ci/linux/commits/Nadav-Amit/mm-
migrate-prevent-racy-access-to-tlb_flush_pending/20170802-205715
> >>>
> >>>
> >>> in testcase: will-it-scale
> >>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz
with 64G memory
> >>> with following parameters:
> >>>
> >>>   nr_task: 16
> >>>   mode: process
> >>>   test: brk1
> >>>   cpufreq_governor: performance
> >>>
> >>> test-description: Will It Scale takes a testcase and runs it from 1
through to n parallel copies to see if the testcase will scale. It builds
both a process and threads based test in order to see any differences
between the two.
> >>> test-url: https://github.com/antonblanchard/will-it-scale
> >>
> >> Thanks for the report.
> >> Could you explain what kinds of workload you are testing?
> >>
> >> Does it calls frequently madvise(MADV_DONTNEED) in parallel on multiple
> >> threads?
> >
> > According to the description it is "testcase:brk increase/decrease of
one
> > page=E2=80=9D. According to the mode it spawns multiple processes, not =
threads.
> >
> > Since a single page is unmapped each time, and the iTLB-loads increase
> > dramatically, I would suspect that for some reason a full TLB flush is
> > caused during do_munmap().
> >
> > If I find some free time, I=E2=80=99ll try to profile the workload - bu=
t feel
free
> > to beat me to it.
>
> The root-cause appears to be that tlb_finish_mmu() does not call
> dec_tlb_flush_pending() - as it should. Any chance you can take care of
it?

Oops, but with second looking, it seems it's not my fault. ;-)
https://marc.info/?l=3Dlinux-mm&m=3D150156699114088&w=3D2


Err... Sorry for that...

--===============1108461188152580525==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSIgZGlyPSJhdXRvIj48
YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIEF1ZyA4LCAyMDE3IDAxOjA4LCAmcXVvdDtN
aW5jaGFuIEtpbSZxdW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1pbmNoYW5Aa2VybmVsLm9yZyI+
bWluY2hhbkBrZXJuZWwub3JnPC9hPiZndDsgd3JvdGU6PGJyIHR5cGU9ImF0dHJpYnV0aW9uIj48
YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXIt
bGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGNsYXNzPSJlbGlkZWQt
dGV4dCI+T24gTW9uLCBBdWcgMDcsIDIwMTcgYXQgMTA6NTE6MDBQTSAtMDcwMCwgTmFkYXYgQW1p
dCB3cm90ZTo8YnI+CiZndDsgTmFkYXYgQW1pdCAmbHQ7PGEgaHJlZj0ibWFpbHRvOm5hZGF2LmFt
aXRAZ21haWwuY29tIj5uYWRhdi5hbWl0QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KJmd0
Ozxicj4KJmd0OyAmZ3Q7IE1pbmNoYW4gS2ltICZsdDs8YSBocmVmPSJtYWlsdG86bWluY2hhbkBr
ZXJuZWwub3JnIj5taW5jaGFuQGtlcm5lbC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+CiZndDsgJmd0
Ozxicj4KJmd0OyAmZ3Q7Jmd0OyBIaSw8YnI+CiZndDsgJmd0OyZndDs8YnI+CiZndDsgJmd0OyZn
dDsgT24gVHVlLCBBdWcgMDgsIDIwMTcgYXQgMDk6MTk6MjNBTSArMDgwMCwga2VybmVsIHRlc3Qg
cm9ib3Qgd3JvdGU6PGJyPgomZ3Q7ICZndDsmZ3Q7Jmd0OyBHcmVldGluZyw8YnI+CiZndDsgJmd0
OyZndDsmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7Jmd0OyBGWUksIHdlIG5vdGljZWQgYSAtMTkuMyUg
cmVncmVzc2lvbiBvZiB3aWxsLWl0LXNjYWxlLnBlcl9wcm9jZXNzX29wcyBkdWUgdG8gY29tbWl0
Ojxicj4KJmd0OyAmZ3Q7Jmd0OyZndDs8YnI+CiZndDsgJmd0OyZndDsmZ3Q7PGJyPgomZ3Q7ICZn
dDsmZ3Q7Jmd0OyBjb21taXQ6IDc2NzQyNzAwMjI1Y2FkOWRmNDlmMDUzOTkzODFhYzx3YnI+M2Yx
ZWMzZGM2MCAoJnF1b3Q7bW06IGZpeCBNQURWX1tGUkVFfERPTlRORUVEXSBUTEIgZmx1c2ggbWlz
cyBwcm9ibGVtJnF1b3Q7KTxicj4KJmd0OyAmZ3Q7Jmd0OyZndDsgdXJsOiA8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL05hZGF2LUFtaXQvbW0tbWlncmF0
ZS1wcmV2ZW50LXJhY3ktYWNjZXNzLXRvLXRsYl9mbHVzaF9wZW5kaW5nLzIwMTcwODAyLTIwNTcx
NSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tLzBk
YXktY2kvPHdicj5saW51eC9jb21taXRzL05hZGF2LUFtaXQvbW0tPHdicj5taWdyYXRlLXByZXZl
bnQtcmFjeS1hY2Nlc3MtPHdicj50by10bGJfZmx1c2hfcGVuZGluZy8yMDE3MDgwMi08d2JyPjIw
NTcxNTwvYT48YnI+CiZndDsgJmd0OyZndDsmZ3Q7PGJyPgomZ3Q7ICZndDsmZ3Q7Jmd0Ozxicj4K
Jmd0OyAmZ3Q7Jmd0OyZndDsgaW4gdGVzdGNhc2U6IHdpbGwtaXQtc2NhbGU8YnI+CiZndDsgJmd0
OyZndDsmZ3Q7IG9uIHRlc3QgbWFjaGluZTogODggdGhyZWFkcyBJbnRlbChSKSBYZW9uKFIpIENQ
VSBFNS0yNjk5IHY0IEAgMi4yMEdIeiB3aXRoIDY0RyBtZW1vcnk8YnI+CiZndDsgJmd0OyZndDsm
Z3Q7IHdpdGggZm9sbG93aW5nIHBhcmFtZXRlcnM6PGJyPgomZ3Q7ICZndDsmZ3Q7Jmd0Ozxicj4K
Jmd0OyAmZ3Q7Jmd0OyZndDvCoCDCoG5yX3Rhc2s6IDE2PGJyPgomZ3Q7ICZndDsmZ3Q7Jmd0O8Kg
IMKgbW9kZTogcHJvY2Vzczxicj4KJmd0OyAmZ3Q7Jmd0OyZndDvCoCDCoHRlc3Q6IGJyazE8YnI+
CiZndDsgJmd0OyZndDsmZ3Q7wqAgwqBjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZTxicj4K
Jmd0OyAmZ3Q7Jmd0OyZndDs8YnI+CiZndDsgJmd0OyZndDsmZ3Q7IHRlc3QtZGVzY3JpcHRpb246
IFdpbGwgSXQgU2NhbGUgdGFrZXMgYSB0ZXN0Y2FzZSBhbmQgcnVucyBpdCBmcm9tIDEgdGhyb3Vn
aCB0byBuIHBhcmFsbGVsIGNvcGllcyB0byBzZWUgaWYgdGhlIHRlc3RjYXNlIHdpbGwgc2NhbGUu
IEl0IGJ1aWxkcyBib3RoIGEgcHJvY2VzcyBhbmQgdGhyZWFkcyBiYXNlZCB0ZXN0IGluIG9yZGVy
IHRvIHNlZSBhbnkgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgdHdvLjxicj4KJmd0OyAmZ3Q7Jmd0
OyZndDsgdGVzdC11cmw6IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9hbnRvbmJsYW5jaGFy
ZC93aWxsLWl0LXNjYWxlIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczov
L2dpdGh1Yi5jb20vPHdicj5hbnRvbmJsYW5jaGFyZC93aWxsLWl0LXNjYWxlPC9hPjxicj4KJmd0
OyAmZ3Q7Jmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0OyBUaGFua3MgZm9yIHRoZSByZXBvcnQuPGJyPgom
Z3Q7ICZndDsmZ3Q7IENvdWxkIHlvdSBleHBsYWluIHdoYXQga2luZHMgb2Ygd29ya2xvYWQgeW91
IGFyZSB0ZXN0aW5nPzxicj4KJmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0OyAmZ3Q7Jmd0OyBEb2VzIGl0
IGNhbGxzIGZyZXF1ZW50bHkgbWFkdmlzZShNQURWX0RPTlRORUVEKSBpbiBwYXJhbGxlbCBvbiBt
dWx0aXBsZTxicj4KJmd0OyAmZ3Q7Jmd0OyB0aHJlYWRzPzxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7
ICZndDsgQWNjb3JkaW5nIHRvIHRoZSBkZXNjcmlwdGlvbiBpdCBpcyAmcXVvdDt0ZXN0Y2FzZTpi
cmsgaW5jcmVhc2UvZGVjcmVhc2Ugb2Ygb25lPGJyPgomZ3Q7ICZndDsgcGFnZeKAnS4gQWNjb3Jk
aW5nIHRvIHRoZSBtb2RlIGl0IHNwYXducyBtdWx0aXBsZSBwcm9jZXNzZXMsIG5vdCB0aHJlYWRz
Ljxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgU2luY2UgYSBzaW5nbGUgcGFnZSBpcyB1bm1h
cHBlZCBlYWNoIHRpbWUsIGFuZCB0aGUgaVRMQi1sb2FkcyBpbmNyZWFzZTxicj4KJmd0OyAmZ3Q7
IGRyYW1hdGljYWxseSwgSSB3b3VsZCBzdXNwZWN0IHRoYXQgZm9yIHNvbWUgcmVhc29uIGEgZnVs
bCBUTEIgZmx1c2ggaXM8YnI+CiZndDsgJmd0OyBjYXVzZWQgZHVyaW5nIGRvX211bm1hcCgpLjxi
cj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgSWYgSSBmaW5kIHNvbWUgZnJlZSB0aW1lLCBJ4oCZ
bGwgdHJ5IHRvIHByb2ZpbGUgdGhlIHdvcmtsb2FkIC0gYnV0IGZlZWwgZnJlZTxicj4KJmd0OyAm
Z3Q7IHRvIGJlYXQgbWUgdG8gaXQuPGJyPgomZ3Q7PGJyPgomZ3Q7IFRoZSByb290LWNhdXNlIGFw
cGVhcnMgdG8gYmUgdGhhdCB0bGJfZmluaXNoX21tdSgpIGRvZXMgbm90IGNhbGw8YnI+CiZndDsg
ZGVjX3RsYl9mbHVzaF9wZW5kaW5nKCkgLSBhcyBpdCBzaG91bGQuIEFueSBjaGFuY2UgeW91IGNh
biB0YWtlIGNhcmUgb2YgaXQ/PGJyPgo8YnI+CjwvZGl2Pk9vcHMsIGJ1dCB3aXRoIHNlY29uZCBs
b29raW5nLCBpdCBzZWVtcyBpdCYjMzk7cyBub3QgbXkgZmF1bHQuIDstKTxicj4KPGEgaHJlZj0i
aHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtbW0mYW1wO209MTUwMTU2Njk5MTE0MDg4JmFtcDt3
PTIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbWFyYy5pbmZvLz9s
PWxpbnV4LW1tJmFtcDs8d2JyPm09MTUwMTU2Njk5MTE0MDg4JmFtcDt3PTI8L2E+PC9ibG9ja3F1
b3RlPjwvZGl2PjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8i
PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpzYW5zLXNlcmlmIj5FcnIuLi4gU29ycnkgZm9yIHRo
YXQuLi48L3NwYW4+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIiBkaXI9ImF1dG8i
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxl
PSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxl
ZnQ6MWV4Ij48YnI+PC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============1108461188152580525==--

