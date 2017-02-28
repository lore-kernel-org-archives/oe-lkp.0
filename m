Content-Type: multipart/mixed; boundary="===============0112220627324135686=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [WARNING: A/V UNSCANNABLE][Merge tag 'media/v4.11-1' of git] ff58d005cd: BUG: unable to handle kernel NULL pointer dereference at 0000039c
Date: Tue, 28 Feb 2017 08:25:50 +0100
Message-ID: <20170228072550.GA17204@gmail.com>
In-Reply-To: <CA+55aFxwtkOs95R-v7z8yjguvp91oDTxRKs-x3uN_=sM_33Gvg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0112220627324135686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> In other words: what will happen is that distros start getting bootup pro=
blem =

> reports six months or a year after we've done it, and *if* they figure ou=
t it's =

> the irq enabling, they'll disable it, because they have no way to solve i=
t =

> either.
> =

> And core developers will just maybe see the occasional "4.12 doesn't boot=
 for =

> me" reports, but by then developers will ahve moved on to 4.16 or somethi=
ng.

Yeah, you are right, there's over 2,100 request_irq() calls in the kernel a=
nd =

perhaps only 1% of them gets tested on real hardware by the time a change g=
ets =

upstream :-/

So in theory we could require all *new* drivers handle this properly, as ne=
w =

drivers tend to come through developers who can fix such bugs - which would=
 at =

least guarantee that with time the problem would obsolete itself.

But I cannot see an easy non-intrusive way to do that - we'd have to rename=
 all =

existing request_irq() calls:

 - We could rename request_irq() to request_irq_legacy() - which does not d=
o the =

   tests.

 - The 'new' request_irq() function would do the tests unconditionally.

... and that's just too much churn - unless you think it's worth it, or if =
anyone =

can think of a better method to phase in the new behavior without affecting=
 old =

users.

Another, less intrusive method would be to introduce a new request_irq_shar=
ed() =

API call, mark request_irq() obsolete (without putting warnings into the bu=
ild =

though), and put a check into checkpatch that warns about request_irq() use.

The flip side would be that:

 - request_irq() is such a nice and well-known name to waste

 - plus request_irq_shared() is a misnomer, as this has nothing to do with =
sharing =

   IRQs, it's about getting IRQs in unexpected moments.

I'd rather do the renaming that is easy to automate and the pain is one tim=
e only.

Or revert the retrigger change and muddle through, although as per Thomas's =

observations spurious interrupts are very common.

Thanks,

	Ingo

--===============0112220627324135686==--

