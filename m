Content-Type: multipart/mixed; boundary="===============1104612816776906901=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [futex] 8019ad13ef: will-it-scale.per_process_ops -97.8% regression
Date: Sun, 08 Mar 2020 08:22:25 -0600
Message-ID: <CAHk-=wgJV7xrxsTkOG203huPShzZBEC6N_BG0KGwHBmEq4yqWg@mail.gmail.com>
In-Reply-To: <20200308140200.GO5972@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1104612816776906901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2020, 08:02 kernel test robot <rong.a.chen@intel.com> wrot=
e:

>
> FYI, we noticed a -97.8% regression of will-it-scale.per_process_ops due
> to commit:
>
> commit: 8019ad13ef7f64be44d4f892af9c840179009254 ("futex: Fix inode
> life-time issue")


Well, that's not optimal.

Peter, any ideas? One of the things that worried me about changing to an
u64 was what I think it causes extra padding, I think. And maybe that
messes with the comparison and hashing of the futexes?

--===============1104612816776906901==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFN1biwgTWFyIDgsIDIwMjAsIDA4OjAy
IGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWlsdG86cm9uZy5hLmNoZW5AaW50ZWwu
Y29tIj5yb25nLmEuY2hlbkBpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8L2Rpdj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVm
dDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KPGJyPgpGWUksIHdlIG5vdGljZWQg
YSAtOTcuOCUgcmVncmVzc2lvbiBvZiB3aWxsLWl0LXNjYWxlLnBlcl9wcm9jZXNzX29wcyBkdWUg
dG8gY29tbWl0Ojxicj4KPGJyPgpjb21taXQ6IDgwMTlhZDEzZWY3ZjY0YmU0NGQ0Zjg5MmFmOWM4
NDAxNzkwMDkyNTQgKCZxdW90O2Z1dGV4OiBGaXggaW5vZGUgbGlmZS10aW1lIGlzc3VlJnF1b3Q7
KTwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYg
ZGlyPSJhdXRvIj5XZWxsLCB0aGF0JiMzOTtzIG5vdCBvcHRpbWFsLjwvZGl2PjxkaXYgZGlyPSJh
dXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlBldGVyLCBhbnkgaWRlYXM/IE9uZSBvZiB0
aGUgdGhpbmdzIHRoYXQgd29ycmllZCBtZSBhYm91dCBjaGFuZ2luZyB0byBhbiB1NjQgd2FzIHdo
YXQgSSB0aGluayBpdCBjYXVzZXMgZXh0cmEgcGFkZGluZywgSSB0aGluay4gQW5kIG1heWJlIHRo
YXQgbWVzc2VzIHdpdGggdGhlIGNvbXBhcmlzb24gYW5kIGhhc2hpbmcgb2YgdGhlIGZ1dGV4ZXM/
PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PC9kaXY+PGRp
diBkaXI9ImF1dG8iPjwvZGl2PjwvZGl2Pgo=

--===============1104612816776906901==--

