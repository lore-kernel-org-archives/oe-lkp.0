Content-Type: multipart/mixed; boundary="===============1203217224349551896=="
MIME-Version: 1.0
From: Horiguchi, Naoya <Naoya.Horiguchi@necam.com>
To: lkp@lists.01.org
Subject: Re: [mempolicy] 5507231dd04: -18.2% vm-scalability.migrate_mbps
Date: Thu, 26 Jun 2014 07:59:41 -0500
Message-ID: <FC3CA273EA98D94B96901B237F5F506BB61DB1@irvmail101.necam.prv>
In-Reply-To: <a2aff3e6884b425481b1dd542effbb87@BPXC19GP.gisp.nec.co.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============1203217224349551896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Hi Naoya,                                                                =
                      =

>
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git am437x-starte=
rkit
> commit 5507231dd04d3d68796bafe83e6a20c985a0ef68 ("mempolicy: apply page t=
able walker on queue_pages_range()")

This patch is to be revised with one with less performance impact,
where I stop calling ->pte_entry() callback heavily.

Thanks,
Naoya Horiguchi

--===============1203217224349551896==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDMuMi8vRU4iPgo8SFRNTD4K
PEhFQUQ+CjxNRVRBIEhUVFAtRVFVSVY9IkNvbnRlbnQtVHlwZSIgQ09OVEVOVD0idGV4dC9odG1s
OyBjaGFyc2V0PWlzby0yMDIyLWpwIj4KPE1FVEEgTkFNRT0iR2VuZXJhdG9yIiBDT05URU5UPSJN
UyBFeGNoYW5nZSBTZXJ2ZXIgdmVyc2lvbiA2LjUuNzY1NC4xMiI+CjxUSVRMRT5SRTogW21lbXBv
bGljeV0gNTUwNzIzMWRkMDQ6IC0xOC4yJSB2bS1zY2FsYWJpbGl0eS5taWdyYXRlX21icHM8L1RJ
VExFPgo8L0hFQUQ+CjxCT0RZPgo8IS0tIENvbnZlcnRlZCBmcm9tIHRleHQvcGxhaW4gZm9ybWF0
IC0tPgoKPFA+PEZPTlQgU0laRT0yPiZndDsgSGkgTmFveWEsJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7PEJSPgomZ3Q7PEJSPgomZ3Q7IEZZSSwg
d2Ugbm90aWNlZCB0aGUgYmVsb3cgY2hhbmdlcyBvbjxCUj4KJmd0OzxCUj4KJmd0OyBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYmFsYmkvdXNiLmdpdCBhbTQz
N3gtc3RhcnRlcmtpdDxCUj4KJmd0OyBjb21taXQgNTUwNzIzMWRkMDRkM2Q2ODc5NmJhZmU4M2U2
YTIwYzk4NWEwZWY2OCAoJnF1b3Q7bWVtcG9saWN5OiBhcHBseSBwYWdlIHRhYmxlIHdhbGtlciBv
biBxdWV1ZV9wYWdlc19yYW5nZSgpJnF1b3Q7KTxCUj4KPEJSPgpUaGlzIHBhdGNoIGlzIHRvIGJl
IHJldmlzZWQgd2l0aCBvbmUgd2l0aCBsZXNzIHBlcmZvcm1hbmNlIGltcGFjdCw8QlI+CndoZXJl
IEkgc3RvcCBjYWxsaW5nIC0mZ3Q7cHRlX2VudHJ5KCkgY2FsbGJhY2sgaGVhdmlseS48QlI+CjxC
Uj4KVGhhbmtzLDxCUj4KTmFveWEgSG9yaWd1Y2hpPEJSPgo8L0ZPTlQ+CjwvUD4KCjwvQk9EWT4K
PC9IVE1MPg==
--===============1203217224349551896==--

