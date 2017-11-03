Content-Type: multipart/mixed; boundary="===============3443676930035883203=="
MIME-Version: 1.0
From: Craig Bergstrom <craigb@google.com>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Fri, 03 Nov 2017 13:53:19 -0600
Message-ID: <CAOJUGye62r=YXNnM=ufu4+A+1AVk7=VHWfiZqeeP8nebsNX2Pw@mail.gmail.com>
In-Reply-To: <CAOJUGydTX7A=1-ZnODDJ+qAMbvFeb1TabLRKKx9BaLmDUOSj6Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3443676930035883203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Just a follow up, since I said I would come back around this week.

I've come up with a couple patchsets that I'm going to attempt to test
internally before I sent out more widely.  I'm thinking it's appropriate to
mail out two changes:

 (1) Reject attempts to map physical memory addresses outside the valid
physical memory bus width of the system.  This should reject mappings that
will obviously break the page fault handler without affecting any memory
mapped devices.

 (2) Make a page fault handler that's called with a reserved bit set kill
the process instead of reboot the whole kernel. This is based on Linus'
comment "I think we might also look at just also handling the whole RSVD
page fault case more gracefully".

Standby while I test these changes.

Cheers,
Craig


On Fri, Oct 27, 2017 at 1:28 PM, Craig Bergstrom <craigb@google.com> wrot=
e:

> Sounds good.  Thanks for the context.
>
> I'll keep this on my plate and I'll turn something around once I've
> had a chance to test a bit, probably next week.
>
> On Fri, Oct 27, 2017 at 1:24 PM, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > * Craig Bergstrom <craigb@google.com> wrote:
> >
> >> Reverting seems like the right approach at the moment.  My apologies
> >> for the breakage so late the in the cycle.
> >
> > Note that there's no need for you to apologize and you carry exactly
> zero amount
> > of blame for the late-cycle breakage: it was my decision to send it to
> Linus so
> > quickly, you never asked for it to be sent upstream on such a short
> notice.
> >
> > ( Classic "patch makes sense, looks good, other arches ar doing this
> too, and I
> >   tested it myself too on multiple systems, so it must be obviously fine
> for
> >   everyone" moment. )
> >
> > Your change still makes sense from a robustness POV, so please send it
> again with
> > the suggested fixes - and I'll be more careful with the upstream merge
> this time.
> >
> > Thanks,
> >
> >         Ingo
>

--===============3443676930035883203==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SnVzdCBhIGZvbGxvdyB1cCwgc2luY2UgSSBzYWlkIEkgd291bGQgY29t
ZSBiYWNrIGFyb3VuZCB0aGlzIHdlZWsuPGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTt2ZSBjb21l
IHVwIHdpdGggYSBjb3VwbGUgcGF0Y2hzZXRzIHRoYXQgSSYjMzk7bSBnb2luZyB0byBhdHRlbXB0
IHRvIHRlc3QgaW50ZXJuYWxseSBiZWZvcmUgSSBzZW50IG91dCBtb3JlIHdpZGVseS7CoCBJJiMz
OTttIHRoaW5raW5nIGl0JiMzOTtzIGFwcHJvcHJpYXRlIHRvIG1haWwgb3V0IHR3byBjaGFuZ2Vz
OjwvZGl2PjxkaXY+PGJyPsKgKDEpIFJlamVjdCBhdHRlbXB0cyB0byBtYXAgcGh5c2ljYWwgbWVt
b3J5IGFkZHJlc3NlcyBvdXRzaWRlIHRoZSB2YWxpZCBwaHlzaWNhbCBtZW1vcnkgYnVzIHdpZHRo
IG9mIHRoZSBzeXN0ZW0uwqAgVGhpcyBzaG91bGQgcmVqZWN0IG1hcHBpbmdzIHRoYXQgd2lsbCBv
YnZpb3VzbHkgYnJlYWsgdGhlIHBhZ2UgZmF1bHQgaGFuZGxlciB3aXRob3V0IGFmZmVjdGluZyBh
bnkgbWVtb3J5IG1hcHBlZCBkZXZpY2VzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+wqAoMikg
TWFrZSBhIHBhZ2UgZmF1bHQgaGFuZGxlciB0aGF0JiMzOTtzIGNhbGxlZCB3aXRoIGEgcmVzZXJ2
ZWQgYml0IHNldCBraWxsIHRoZSBwcm9jZXNzIGluc3RlYWQgb2YgcmVib290IHRoZSB3aG9sZSBr
ZXJuZWwuIFRoaXMgaXMgYmFzZWQgb24gTGludXMmIzM5OyBjb21tZW50ICZxdW90OzxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTIuOHB4Ij5JIHRoaW5rIHdlIG1pZ2h0IGFsc28gbG9vayBhdCBqdXN0
IGFsc28gaGFuZGxpbmcgdGhlIHdob2xlIFJTVkQgcGFnZcKgPC9zcGFuPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTIuOHB4Ij5mYXVsdCBjYXNlIG1vcmUgZ3JhY2VmdWxseSZxdW90Oy48L3NwYW4+
PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+PGJyPjwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij5TdGFuZGJ5IHdoaWxlIEkgdGVz
dCB0aGVzZSBjaGFuZ2VzLjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTIuOHB4Ij48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44
cHgiPkNoZWVycyw8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjhw
eCI+Q3JhaWc8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+
PGJyPjwvc3Bhbj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBGcmksIE9jdCAyNywgMjAxNyBhdCAxOjI4IFBNLCBDcmFp
ZyBCZXJnc3Ryb20gPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86Y3JhaWdiQGdv
b2dsZS5jb20iIHRhcmdldD0iX2JsYW5rIj5jcmFpZ2JAZ29vZ2xlLmNvbTwvYT4mZ3Q7PC9zcGFu
PiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+
U291bmRzIGdvb2QuwqAgVGhhbmtzIGZvciB0aGUgY29udGV4dC48YnI+Cjxicj4KSSYjMzk7bGwg
a2VlcCB0aGlzIG9uIG15IHBsYXRlIGFuZCBJJiMzOTtsbCB0dXJuIHNvbWV0aGluZyBhcm91bmQg
b25jZSBJJiMzOTt2ZTxicj4KaGFkIGEgY2hhbmNlIHRvIHRlc3QgYSBiaXQsIHByb2JhYmx5IG5l
eHQgd2Vlay48YnI+CjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxicj4KT24g
RnJpLCBPY3QgMjcsIDIwMTcgYXQgMToyNCBQTSwgSW5nbyBNb2xuYXIgJmx0OzxhIGhyZWY9Im1h
aWx0bzptaW5nb0BrZXJuZWwub3JnIj5taW5nb0BrZXJuZWwub3JnPC9hPiZndDsgd3JvdGU6PGJy
PgomZ3Q7PGJyPgomZ3Q7ICogQ3JhaWcgQmVyZ3N0cm9tICZsdDs8YSBocmVmPSJtYWlsdG86Y3Jh
aWdiQGdvb2dsZS5jb20iPmNyYWlnYkBnb29nbGUuY29tPC9hPiZndDsgd3JvdGU6PGJyPgomZ3Q7
PGJyPgomZ3Q7Jmd0OyBSZXZlcnRpbmcgc2VlbXMgbGlrZSB0aGUgcmlnaHQgYXBwcm9hY2ggYXQg
dGhlIG1vbWVudC7CoCBNeSBhcG9sb2dpZXM8YnI+CiZndDsmZ3Q7IGZvciB0aGUgYnJlYWthZ2Ug
c28gbGF0ZSB0aGUgaW4gdGhlIGN5Y2xlLjxicj4KJmd0Ozxicj4KJmd0OyBOb3RlIHRoYXQgdGhl
cmUmIzM5O3Mgbm8gbmVlZCBmb3IgeW91IHRvIGFwb2xvZ2l6ZSBhbmQgeW91IGNhcnJ5IGV4YWN0
bHkgemVybyBhbW91bnQ8YnI+CiZndDsgb2YgYmxhbWUgZm9yIHRoZSBsYXRlLWN5Y2xlIGJyZWFr
YWdlOiBpdCB3YXMgbXkgZGVjaXNpb24gdG8gc2VuZCBpdCB0byBMaW51cyBzbzxicj4KJmd0OyBx
dWlja2x5LCB5b3UgbmV2ZXIgYXNrZWQgZm9yIGl0IHRvIGJlIHNlbnQgdXBzdHJlYW0gb24gc3Vj
aCBhIHNob3J0IG5vdGljZS48YnI+CiZndDs8YnI+CiZndDsgKCBDbGFzc2ljICZxdW90O3BhdGNo
IG1ha2VzIHNlbnNlLCBsb29rcyBnb29kLCBvdGhlciBhcmNoZXMgYXIgZG9pbmcgdGhpcyB0b28s
IGFuZCBJPGJyPgomZ3Q7wqAgwqB0ZXN0ZWQgaXQgbXlzZWxmIHRvbyBvbiBtdWx0aXBsZSBzeXN0
ZW1zLCBzbyBpdCBtdXN0IGJlIG9idmlvdXNseSBmaW5lIGZvcjxicj4KJmd0O8KgIMKgZXZlcnlv
bmUmcXVvdDsgbW9tZW50LiApPGJyPgomZ3Q7PGJyPgomZ3Q7IFlvdXIgY2hhbmdlIHN0aWxsIG1h
a2VzIHNlbnNlIGZyb20gYSByb2J1c3RuZXNzIFBPViwgc28gcGxlYXNlIHNlbmQgaXQgYWdhaW4g
d2l0aDxicj4KJmd0OyB0aGUgc3VnZ2VzdGVkIGZpeGVzIC0gYW5kIEkmIzM5O2xsIGJlIG1vcmUg
Y2FyZWZ1bCB3aXRoIHRoZSB1cHN0cmVhbSBtZXJnZSB0aGlzIHRpbWUuPGJyPgomZ3Q7PGJyPgom
Z3Q7IFRoYW5rcyw8YnI+CiZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoEluZ288YnI+CjwvZGl2
PjwvZGl2PjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+Cg==

--===============3443676930035883203==--

