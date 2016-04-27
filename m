Content-Type: multipart/mixed; boundary="===============5806236972381278935=="
MIME-Version: 1.0
From: Kostya Serebryany <kcc@google.com>
To: lkp@lists.01.org
Subject: Re: Extending the 0-day system with syzkaller?
Date: Wed, 27 Apr 2016 11:03:42 -0700
Message-ID: <CAN=P9phf90a2qcsMaePY5-yr2QDED6qm4o_biLJy8s2JYCE9cQ@mail.gmail.com>
In-Reply-To: <606FA888-0FC1-44AA-A7DE-41F4D355D0E1@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5806236972381278935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ping...
(I know that the recent news at Intel might be quite distracting for some
you...)

On Fri, Apr 15, 2016 at 1:05 PM, Hart, Darren <darren.hart@intel.com> wro=
te:

> Hi Fengguang,
>
> I met with Kostya at Intel Tech Days and he had some compelling arguments
> for including some of these tests.
>
> Dave H: I took a quick look at Kasan, which appears to require an existing
> config option (CONFIG_KASAN) for dynamic memory access checking using
> shadow memory. Is this something you would like to see added to 0-day? Do
> we have anything today which provides comparable coverage?
>
> Combining Kasan and other existing kernel integrity checking, the
> syzkaller fuzz tester is showing promising results and the reports come in
> the form of kernel oops and similar things which we already check for in
> 0-day.
>
> For the others on Cc, do you have additional context for or against
> including syzkaller and kasan in 0day?
>
> Fengguang, what are your thoughts on including these in 0-day?
>
> Thanks,
>
> --
> Darren Hart
> Intel Open Source Technology Center
>
> On 4/12/16, 10:24 PM, "Kostya Serebryany" <kcc@google.com<mailto:
> kcc(a)google.com>> wrote:
>
> CC-ing more people after today's conversation at the Intel Tech Days.
>
> We'd like to add kasan and syzkaller [1,2,3,4] to the 0-day kbuild system.
> We believe this has a large potential to find old bugs and prevent
> regressions in the Kernel.
> How do we achieve this?
>
> Thanks,
>
> --kcc
>
> [1] https://github.com/google/syzkaller
> [2] https://github.com/google/syzkaller/wiki/Found-Bugs
> [3] https://lwn.net/Articles/677764/
> [4] https://www.kernel.org/doc/Documentation/kasan.txt
>
>
> On Tue, Dec 15, 2015 at 3:49 AM, David Drysdale <drysdale@google.com
> <mailto:drysdale@google.com>> wrote:
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
>

--===============5806236972381278935==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+UGluZy4uLsKgPGRpdj4oSSBrbm93IHRoYXQgdGhlIHJlY2VudCBuZXdz
IGF0IEludGVsIG1pZ2h0IGJlIHF1aXRlIGRpc3RyYWN0aW5nIGZvciBzb21lIHlvdS4uLik8L2Rp
dj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1
b3RlIj5PbiBGcmksIEFwciAxNSwgMjAxNiBhdCAxOjA1IFBNLCBIYXJ0LCBEYXJyZW4gPHNwYW4g
ZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86ZGFycmVuLmhhcnRAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+ZGFycmVuLmhhcnRAaW50ZWwuY29tPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxi
cj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhl
eDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5IaSBGZW5nZ3Vh
bmcsPGJyPgo8YnI+CkkgbWV0IHdpdGggS29zdHlhIGF0IEludGVsIFRlY2ggRGF5cyBhbmQgaGUg
aGFkIHNvbWUgY29tcGVsbGluZyBhcmd1bWVudHMgZm9yIGluY2x1ZGluZyBzb21lIG9mIHRoZXNl
IHRlc3RzLjxicj4KPGJyPgpEYXZlIEg6IEkgdG9vayBhIHF1aWNrIGxvb2sgYXQgS2FzYW4sIHdo
aWNoIGFwcGVhcnMgdG8gcmVxdWlyZSBhbiBleGlzdGluZyBjb25maWcgb3B0aW9uIChDT05GSUdf
S0FTQU4pIGZvciBkeW5hbWljIG1lbW9yeSBhY2Nlc3MgY2hlY2tpbmcgdXNpbmcgc2hhZG93IG1l
bW9yeS4gSXMgdGhpcyBzb21ldGhpbmcgeW91IHdvdWxkIGxpa2UgdG8gc2VlIGFkZGVkIHRvIDAt
ZGF5PyBEbyB3ZSBoYXZlIGFueXRoaW5nIHRvZGF5IHdoaWNoIHByb3ZpZGVzIGNvbXBhcmFibGUg
Y292ZXJhZ2U/PGJyPgo8YnI+CkNvbWJpbmluZyBLYXNhbiBhbmQgb3RoZXIgZXhpc3Rpbmcga2Vy
bmVsIGludGVncml0eSBjaGVja2luZywgdGhlIHN5emthbGxlciBmdXp6IHRlc3RlciBpcyBzaG93
aW5nIHByb21pc2luZyByZXN1bHRzIGFuZCB0aGUgcmVwb3J0cyBjb21lIGluIHRoZSBmb3JtIG9m
IGtlcm5lbCBvb3BzIGFuZCBzaW1pbGFyIHRoaW5ncyB3aGljaCB3ZSBhbHJlYWR5IGNoZWNrIGZv
ciBpbiAwLWRheS48YnI+Cjxicj4KRm9yIHRoZSBvdGhlcnMgb24gQ2MsIGRvIHlvdSBoYXZlIGFk
ZGl0aW9uYWwgY29udGV4dCBmb3Igb3IgYWdhaW5zdCBpbmNsdWRpbmcgc3l6a2FsbGVyIGFuZCBr
YXNhbiBpbiAwZGF5Pzxicj4KPGJyPgpGZW5nZ3VhbmcsIHdoYXQgYXJlIHlvdXIgdGhvdWdodHMg
b24gaW5jbHVkaW5nIHRoZXNlIGluIDAtZGF5Pzxicj4KPGJyPgpUaGFua3MsPGJyPgo8YnI+Ci0t
PGJyPgpEYXJyZW4gSGFydDxicj4KSW50ZWwgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXI8
YnI+CjxzcGFuIGNsYXNzPSJpbSBIT0VuWmIiPjxicj4KT24gNC8xMi8xNiwgMTA6MjQgUE0sICZx
dW90O0tvc3R5YSBTZXJlYnJ5YW55JnF1b3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86a2NjQGdvb2ds
ZS5jb20iPmtjY0Bnb29nbGUuY29tPC9hPiZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmtjY0Bn
b29nbGUuY29tIj5rY2NAZ29vZ2xlLmNvbTwvYT4mZ3Q7Jmd0OyB3cm90ZTo8YnI+Cjxicj4KQ0Mt
aW5nIG1vcmUgcGVvcGxlIGFmdGVyIHRvZGF5JiMzOTtzIGNvbnZlcnNhdGlvbiBhdCB0aGUgSW50
ZWwgVGVjaCBEYXlzLjxicj4KPGJyPgpXZSYjMzk7ZCBsaWtlIHRvIGFkZCBrYXNhbiBhbmQgc3l6
a2FsbGVyIFsxLDIsMyw0XSB0byB0aGUgMC1kYXkga2J1aWxkIHN5c3RlbS48YnI+CldlIGJlbGll
dmUgdGhpcyBoYXMgYSBsYXJnZSBwb3RlbnRpYWwgdG8gZmluZCBvbGQgYnVncyBhbmQgcHJldmVu
dCByZWdyZXNzaW9ucyBpbiB0aGUgS2VybmVsLjxicj4KSG93IGRvIHdlIGFjaGlldmUgdGhpcz88
YnI+Cjxicj4KVGhhbmtzLDxicj4KPGJyPgotLWtjYzxicj4KPGJyPgpbMV0gPGEgaHJlZj0iaHR0
cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvc3l6a2FsbGVyPC9hPjxicj4KWzJd
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvc3l6a2FsbGVyL3dpa2kvRm91bmQt
QnVncyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29t
L2dvb2dsZS9zeXprYWxsZXIvd2lraS9Gb3VuZC1CdWdzPC9hPjxicj4KWzNdIDxhIGhyZWY9Imh0
dHBzOi8vbHduLm5ldC9BcnRpY2xlcy82Nzc3NjQvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvNjc3NzY0LzwvYT48YnI+Cls0XSA8YSBo
cmVmPSJodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2thc2FuLnR4dCIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cua2VybmVsLm9yZy9k
b2MvRG9jdW1lbnRhdGlvbi9rYXNhbi50eHQ8L2E+PGJyPgo8YnI+Cjxicj4KPC9zcGFuPjxkaXYg
Y2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPk9uIFR1ZSwgRGVjIDE1LCAyMDE1IGF0IDM6
NDkgQU0sIERhdmlkIERyeXNkYWxlICZsdDs8YSBocmVmPSJtYWlsdG86ZHJ5c2RhbGVAZ29vZ2xl
LmNvbSI+ZHJ5c2RhbGVAZ29vZ2xlLmNvbTwvYT4mbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpk
cnlzZGFsZUBnb29nbGUuY29tIj5kcnlzZGFsZUBnb29nbGUuY29tPC9hPiZndDsmZ3Q7IHdyb3Rl
Ojxicj4KSGkgRmVuZ2d1YW5nIC8gTEtQLWZvbGssPGJyPgo8YnI+ClF1aWNrIHF1ZXN0aW9uIC0t
IGhvdyBlYXN5IGlzIGl0IHRvIGFkZCBleHRyYSBidWlsZHMvdGVzdHMvY2hlY2tzIHRvPGJyPgp5
b3VyIG1hcnZlbGxvdXMgMC1kYXkga2J1aWxkIHN5c3RlbT88YnI+Cjxicj4KVGhlIHJlYXNvbiBJ
IGFzayBpcyB0aGF0IEkmIzM5O3ZlIHJlY2VudGx5IGJlZW4gZXhwbG9yaW5nIHN5emthbGxlciBb
MV0sPGJyPgp3aGljaCBpcyBhIHN5c3RlbSBjYWxsIGZ1enplciB3cml0dGVuIGJ5IHNvbWUgb2Yg
bXkgY29sbGVhZ3VlcyBoZXJlIGF0PGJyPgpHb29nbGUgKGNjJiMzOTtlZCkuwqAgQWx0aG91Z2gg
aXQmIzM5O3MgZmFpcmx5IG5ldywgaXQgaGFzIHVuY292ZXJlZCBhIGJ1bmNoIG9mPGJyPgprZXJu
ZWwgYnVncyBhbHJlYWR5IFsyXSBzbyBJIHdvbmRlcmVkIGlmIGl0IG1pZ2h0IGJlIGEgZ29vZCBj
YW5kaWRhdGU8YnI+CmZvciBpbmNsdXNpb24gaW4gdGhlIDAtZGF5IGNoZWNrcyBhdCBzb21lIHBv
aW50Ljxicj4KPGJyPgooQXMgYW4gYXNpZGUsIEkmIzM5O20gaW4gdGhlIHByb2Nlc3Mgb2Ygd3Jp
dGluZyBhbiBhcnRpY2xlIGFib3V0IHN5emthbGxlcjxicj4KZm9yIExXTiwgd2hpY2ggbWlnaHQg
YWxzbyBleHBvc2UgaXQgdG8gbW9yZSBmb2xrLik8YnI+Cjxicj4KV2hhdCBkbyB5b3UgdGhpbms/
PGJyPgo8YnI+ClRoYW5rcyw8YnI+CkRhdmlkPGJyPgo8YnI+ClsxXSA8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vZ29vZ2xlL3N5emthbGxlciIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXI8L2E+PGJyPgpbMl0gPGEg
aHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIvd2lraS9Gb3VuZC1CdWdz
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vZ29v
Z2xlL3N5emthbGxlci93aWtpL0ZvdW5kLUJ1Z3M8L2E+PGJyPgo8YnI+CjwvZGl2PjwvZGl2Pjwv
YmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+Cg==

--===============5806236972381278935==--

