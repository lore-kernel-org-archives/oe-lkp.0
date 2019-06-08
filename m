Content-Type: multipart/mixed; boundary="===============4414573394607787171=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: inet: frags: Turn fqdir->dead into an int for old Alphas
Date: Sat, 08 Jun 2019 10:50:51 -0700
Message-ID: <CAHk-=wiRduKzoLpAwU7iFiOJ6DX7RE+PZ_wFi9Cvq=hDoaNsPA@mail.gmail.com>
In-Reply-To: <CAHk-=wj1G9nXMzAu=Ldbd4_bbzVtWgNORDKMD4bKTO6dRrMPmQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4414573394607787171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 8, 2019 at 10:42 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> There are no atomic rmw sequences that have reasonable performance for
> the bitfield updates themselves.

Note that this is purely about the writing side. Reads of bitfield
values can be (and generally _should_ be) atomic, and hopefully C11
means that you wouldn't see intermediate values.

But I'm not convinced about that either: one natural way to update a
bitfield is to first do the masking, and then do the insertion of new
bits, so a bitfield assignment very easily exposes non-real values to
a concurrent read on another CPU.

What I think C11 is supposed to protect is from compilers doing
horribly bad things, and accessing bitfields with bigger types than
the field itself, ie when you have

   struct {
       char c;
       int field1:5;
   };

then a write to "field1" had better not touch "char c" as part of the
rmw operation, because that would indeed introduce a data-race with a
completely independent field that might have completely independent
locking rules.

But

   struct {
        int c:8;
        int field1:5;
   };

would not sanely have the same guarantees, even if the layout in
memory might be identical. Once you have bitfields next to each other,
and use a base type that means they can be combined together, they
can't be sanely modified without locking.

(And I don't know if C11 took up the "base type of the bitfield"
thing. Maybe you still need to use the ":0" thing to force alignment,
and maybe the C standards people still haven't made the underlying
type be meaningful other than for sign handling).

            Linus

--===============4414573394607787171==--

