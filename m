Content-Type: multipart/mixed; boundary="===============1144330503381097580=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: 1808d65b55 ("asm-generic/tlb: Remove arch_tlb*_mmu()"): BUG: KASAN: stack-out-of-bounds in __change_page_attr_set_clr
Date: Fri, 12 Apr 2019 17:50:30 +0100
Message-ID: <5890.1555087830@warthog.procyon.org.uk>
In-Reply-To: <CAHk-=wieBr3G=_ZGoCndi8XnuG1wtkedaGqkWB+=AVq65=_8sQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1144330503381097580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> We should never have stack alignment bigger than 16 bytes.  And
> preferably not even that.

At least one arch I know of (FRV) had instructions that could atomically
load/store register pairs or register quads, but they had to be pair- or
quad-aligned (ie. 8- or 16-byte), which made for more efficient code if you
could use them.

I don't know whether any arch we currently support has features like this (I
know some have multi-reg load/stores, but they seem to require only
word-alignment).

David

--===============1144330503381097580==--

