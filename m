Content-Type: multipart/mixed; boundary="===============1505082657485990235=="
MIME-Version: 1.0
From: Anvin, H Peter <h.peter.anvin@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Tue, 15 May 2018 21:25:53 +0000
Message-ID: <C40DC70F50313144AB3AF8625D4F407F90689B42@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <20180515210757.GA12225@avx2>
List-Id: <oe-lkp.lists.linux.dev>

--===============1505082657485990235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Why is that a problem?



Sent from my Samsung Galaxy smartphone.


-------- Original message --------
From: Alexey Dobriyan <adobriyan@gmail.com>
Date: 5/15/18 14:08 (GMT-08:00)
To: "Ye, Xiaolong" <xiaolong.ye@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, "Anvin, H Peter" <h.peter.anvin@int=
el.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@ke=
rnel.org>, Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.c=
om>, Denys Vlasenko <dvlasenk@redhat.com>, Josh Poimboeuf <jpoimboe@red=
hat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra =
<peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, "H. Peter =
Anvin" <hpa@zytor.com>, tipbuild(a)zytor.com, lkp(a)01.org
Subject: Re: [lkp-robot] [x86/asm]  51bad67ffb: int3:#[##]

On Tue, May 15, 2018 at 04:00:33PM +0800, kernel test robot wrote:

> [   11.182501] Code: 00 00 00 eb e6 cc cc cc cc cc cc cc cc cc cc cc cc c=
c fa 8d b6 00 00 00 00 e8 5d e8 8f ff 8b 44 24 34 83 e0 03 83 f8 03 72 28 c=
c <cc> cc cc cc cc cc cc fa 8d b6 00 00 00 00 e8 3d e8 8f ff 89 e0
> [   11.184326] EIP: ret_from_intr+0xd/0x14 SS:ESP: 0068:8603bfb4

INT3 slipped through M586 =3D> X86_ALIGNMENT_16 :-\

--===============1505082657485990235==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+CjwhLS0gY29udmVydGVkIGZyb20gdGV4dCAt
LT48c3R5bGU+PCEtLSAuRW1haWxRdW90ZSB7IG1hcmdpbi1sZWZ0OiAxcHQ7IHBhZGRpbmctbGVm
dDogNHB0OyBib3JkZXItbGVmdDogIzgwMDAwMCAycHggc29saWQ7IH0gLS0+PC9zdHlsZT4KPC9o
ZWFkPgo8Ym9keT4KPGRpdj4KPGRpdj5XaHkgaXMgdGhhdCBhIHByb2JsZW0/PC9kaXY+CjxkaXY+
PGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXYgaWQ9Inhf
Y29tcG9zZXJfc2lnbmF0dXJlIj4KPGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJmb250LXNpemU6ODUl
OyBjb2xvcjojNTc1NzU3Ij5TZW50IGZyb20gbXkgU2Ftc3VuZyBHYWxheHkgc21hcnRwaG9uZS48
L2Rpdj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pi0tLS0t
LS0tIE9yaWdpbmFsIG1lc3NhZ2UgLS0tLS0tLS08L2Rpdj4KPGRpdj5Gcm9tOiBBbGV4ZXkgRG9i
cml5YW4gJmx0O2Fkb2JyaXlhbkBnbWFpbC5jb20mZ3Q7IDwvZGl2Pgo8ZGl2PkRhdGU6IDUvMTUv
MTggMTQ6MDggKEdNVC0wODowMCkgPC9kaXY+CjxkaXY+VG86ICZxdW90O1llLCBYaWFvbG9uZyZx
dW90OyAmbHQ7eGlhb2xvbmcueWVAaW50ZWwuY29tJmd0OyA8L2Rpdj4KPGRpdj5DYzogSW5nbyBN
b2xuYXIgJmx0O21pbmdvQGtlcm5lbC5vcmcmZ3Q7LCAmcXVvdDtBbnZpbiwgSCBQZXRlciZxdW90
OyAmbHQ7aC5wZXRlci5hbnZpbkBpbnRlbC5jb20mZ3Q7LCBUaG9tYXMgR2xlaXhuZXIgJmx0O3Rn
bHhAbGludXRyb25peC5kZSZndDssIEFuZHkgTHV0b21pcnNraSAmbHQ7bHV0b0BrZXJuZWwub3Jn
Jmd0OywgQm9yaXNsYXYgUGV0a292ICZsdDticEBhbGllbjguZGUmZ3Q7LCBCcmlhbiBHZXJzdCAm
bHQ7YnJnZXJzdEBnbWFpbC5jb20mZ3Q7LCBEZW55cyBWbGFzZW5rbyAmbHQ7ZHZsYXNlbmtAcmVk
aGF0LmNvbSZndDssCiBKb3NoIFBvaW1ib2V1ZiAmbHQ7anBvaW1ib2VAcmVkaGF0LmNvbSZndDss
IExpbnVzIFRvcnZhbGRzICZsdDt0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZyZndDssIFBl
dGVyIFppamxzdHJhICZsdDtwZXRlcnpAaW5mcmFkZWFkLm9yZyZndDssIExLTUwgJmx0O2xpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcmZ3Q7LCAmcXVvdDtILiBQZXRlciBBbnZpbiZxdW90OyAm
bHQ7aHBhQHp5dG9yLmNvbSZndDssIHRpcGJ1aWxkQHp5dG9yLmNvbSwgbGtwQDAxLm9yZwo8L2Rp
dj4KPGRpdj5TdWJqZWN0OiBSZTogW2xrcC1yb2JvdF0gW3g4Ni9hc21dJm5ic3A7IDUxYmFkNjdm
ZmI6IGludDM6I1sjI10gPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPC9kaXY+Cjxmb250IHNpemU9
IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTBwdDsiPgo8ZGl2IGNsYXNzPSJQbGFpblRleHQi
Pk9uIFR1ZSwgTWF5IDE1LCAyMDE4IGF0IDA0OjAwOjMzUE0gJiM0MzswODAwLCBrZXJuZWwgdGVz
dCByb2JvdCB3cm90ZTo8YnI+Cjxicj4KJmd0OyBbJm5ic3A7Jm5ic3A7IDExLjE4MjUwMV0gQ29k
ZTogMDAgMDAgMDAgZWIgZTYgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2Mg
ZmEgOGQgYjYgMDAgMDAgMDAgMDAgZTggNWQgZTggOGYgZmYgOGIgNDQgMjQgMzQgODMgZTAgMDMg
ODMgZjggMDMgNzIgMjggY2MgJmx0O2NjJmd0OyBjYyBjYyBjYyBjYyBjYyBjYyBmYSA4ZCBiNiAw
MCAwMCAwMCAwMCBlOCAzZCBlOCA4ZiBmZiA4OSBlMAo8YnI+CiZndDsgWyZuYnNwOyZuYnNwOyAx
MS4xODQzMjZdIEVJUDogcmV0X2Zyb21faW50ciYjNDM7MHhkLzB4MTQgU1M6RVNQOiAwMDY4Ojg2
MDNiZmI0PGJyPgo8YnI+CklOVDMgc2xpcHBlZCB0aHJvdWdoIE01ODYgPSZndDsgWDg2X0FMSUdO
TUVOVF8xNiA6LVw8YnI+CjwvZGl2Pgo8L3NwYW4+PC9mb250Pgo8L2JvZHk+CjwvaHRtbD4K

--===============1505082657485990235==--

