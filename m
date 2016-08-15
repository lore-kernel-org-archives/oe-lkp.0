Content-Type: multipart/mixed; boundary="===============8126520401622488979=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 22:12:20 -0700
Message-ID: <CA+55aFxp+rLehC8c157uRbH459wUC1rRPfCVgvmcq5BrG9gkyg@mail.gmail.com>
In-Reply-To: <CA+55aFy14nUnJQ_GdF=j8Fa9xiH70c6fY2G3q5HQ01+8z1z3qQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8126520401622488979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Aug 14, 2016 10:00 PM, "Dave Chinner" <david@fromorbit.com> wrote:
>
> > What does it say if you annotate that _raw_spin_unlock_irqrestore()
function?
> ....
>        =C2=BF
>        =C2=BF    Disassembly of section load0:
>        =C2=BF
>        =C2=BF    ffffffff81e628b0 <load0>:
>        =C2=BF      nop
>        =C2=BF      push   %rbp
>        =C2=BF      mov    %rsp,%rbp
>        =C2=BF      movb   $0x0,(%rdi)
>        =C2=BF      nop
>        =C2=BF      mov    %rsi,%rdi
>        =C2=BF      push   %rdi
>        =C2=BF      popfq
>  99.35 =C2=BF      nop

Yeah, that's a good disassembly of a non-debug spin unlock, and the symbols
are fine, but the profile is not valid. That's an interrupt point, right
after the popf that enables interiors again.

I don't know why 'perf' isn't working on your machine, but it clearly
isn't.

Has it ever worked on that machine? What cpu is it? Are you running in some
virtualized environment without performance counters, perhaps?

It's not actually the unlock that is expensive, and there is no contention
on the lock (if there had been, the numbers would have been entirely
different for the debug case, which makes locking an order of magnitude
more expensive). All the cost of everything that happened while interrupts
were disabled is just accounted to the instruction after they were enabled
again.

             Linus

--===============8126520401622488979==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHAgZGlyPSJsdHIiPjwvcD4KPHAgZGlyPSJsdHIiPk9uIEF1ZyAxNCwgMjAxNiAxMDowMCBQTSwg
JnF1b3Q7RGF2ZSBDaGlubmVyJnF1b3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2aWRAZnJvbW9y
Yml0LmNvbSI+ZGF2aWRAZnJvbW9yYml0LmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KJmd0Ozxicj4K
Jmd0OyAmZ3Q7IFdoYXQgZG9lcyBpdCBzYXkgaWYgeW91IGFubm90YXRlIHRoYXQgX3Jhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCkgZnVuY3Rpb24/PGJyPgomZ3Q7IC4uLi48YnI+CiZndDsgwqAg
wqAgwqAgwqDCvzxicj4KJmd0OyDCoCDCoCDCoCDCoMK/wqAgwqAgRGlzYXNzZW1ibHkgb2Ygc2Vj
dGlvbiBsb2FkMDo8YnI+CiZndDsgwqAgwqAgwqAgwqDCvzxicj4KJmd0OyDCoCDCoCDCoCDCoMK/
wqAgwqAgZmZmZmZmZmY4MWU2MjhiMCAmbHQ7bG9hZDAmZ3Q7Ojxicj4KJmd0OyDCoCDCoCDCoCDC
oMK/wqAgwqAgwqAgbm9wPGJyPgomZ3Q7IMKgIMKgIMKgIMKgwr/CoCDCoCDCoCBwdXNowqAgwqAl
cmJwPGJyPgomZ3Q7IMKgIMKgIMKgIMKgwr/CoCDCoCDCoCBtb3bCoCDCoCAlcnNwLCVyYnA8YnI+
CiZndDsgwqAgwqAgwqAgwqDCv8KgIMKgIMKgIG1vdmLCoCDCoCQweDAsKCVyZGkpPGJyPgomZ3Q7
IMKgIMKgIMKgIMKgwr/CoCDCoCDCoCBub3A8YnI+CiZndDsgwqAgwqAgwqAgwqDCv8KgIMKgIMKg
IG1vdsKgIMKgICVyc2ksJXJkaTxicj4KJmd0OyDCoCDCoCDCoCDCoMK/wqAgwqAgwqAgcHVzaMKg
IMKgJXJkaTxicj4KJmd0OyDCoCDCoCDCoCDCoMK/wqAgwqAgwqAgcG9wZnE8YnI+CiZndDsgwqA5
OS4zNSDCv8KgIMKgIMKgIG5vcDwvcD4KPHAgZGlyPSJsdHIiPlllYWgsIHRoYXQmIzM5O3MgYSBn
b29kIGRpc2Fzc2VtYmx5IG9mIGEgbm9uLWRlYnVnIHNwaW4gdW5sb2NrLCBhbmQgdGhlIHN5bWJv
bHMgYXJlIGZpbmUsIGJ1dCB0aGUgcHJvZmlsZSBpcyBub3QgdmFsaWQuIFRoYXQmIzM5O3MgYW4g
aW50ZXJydXB0IHBvaW50LCByaWdodCBhZnRlciB0aGUgcG9wZiB0aGF0IGVuYWJsZXMgaW50ZXJp
b3JzIGFnYWluLjwvcD4KPHAgZGlyPSJsdHIiPkkgZG9uJiMzOTt0IGtub3cgd2h5ICYjMzk7cGVy
ZiYjMzk7IGlzbiYjMzk7dCB3b3JraW5nIG9uIHlvdXIgbWFjaGluZSwgYnV0IGl0IGNsZWFybHkg
aXNuJiMzOTt0LiA8L3A+CjxwIGRpcj0ibHRyIj5IYXMgaXQgZXZlciB3b3JrZWQgb24gdGhhdCBt
YWNoaW5lPyBXaGF0IGNwdSBpcyBpdD8gQXJlIHlvdSBydW5uaW5nIGluIHNvbWUgdmlydHVhbGl6
ZWQgZW52aXJvbm1lbnQgd2l0aG91dCBwZXJmb3JtYW5jZSBjb3VudGVycywgcGVyaGFwcz88L3A+
CjxwIGRpcj0ibHRyIj5JdCYjMzk7cyBub3QgYWN0dWFsbHkgdGhlIHVubG9jayB0aGF0IGlzIGV4
cGVuc2l2ZSwgYW5kIHRoZXJlIGlzIG5vIGNvbnRlbnRpb24gb24gdGhlIGxvY2sgKGlmIHRoZXJl
IGhhZCBiZWVuLCB0aGUgbnVtYmVycyB3b3VsZCBoYXZlIGJlZW4gZW50aXJlbHkgZGlmZmVyZW50
IGZvciB0aGUgZGVidWcgY2FzZSwgd2hpY2ggbWFrZXMgbG9ja2luZyBhbiBvcmRlciBvZiBtYWdu
aXR1ZGUgbW9yZSBleHBlbnNpdmUpLiBBbGwgdGhlIGNvc3Qgb2YgZXZlcnl0aGluZyB0aGF0IGhh
cHBlbmVkIHdoaWxlIGludGVycnVwdHMgd2VyZSBkaXNhYmxlZCBpcyBqdXN0IGFjY291bnRlZCB0
byB0aGUgaW5zdHJ1Y3Rpb24gYWZ0ZXIgdGhleSB3ZXJlIGVuYWJsZWQgYWdhaW4uPC9wPgo8cCBk
aXI9Imx0ciI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExpbnVzPC9wPgo=

--===============8126520401622488979==--

