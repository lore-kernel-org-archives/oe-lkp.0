Content-Type: multipart/mixed; boundary="===============1085562963159162234=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Thu, 26 Oct 2017 23:12:09 +0200
Message-ID: <CA+55aFyEcOMb657vWSmrM13OxmHxC-XxeBmNis=DwVvpJUOogQ@mail.gmail.com>
In-Reply-To: <CAOJUGyfZxbhyMuh3zE77R3b30RF3Xi7jB4_mmSjhWtFQhVc5jQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1085562963159162234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2017 at 9:50 PM, Craig Bergstrom <craigb@google.com> wrot=
e:
> Reverting seems like the right approach at the moment.  My apologies
> for the breakage so late the in the cycle.
>
> Post-revert, there remains a bug here wherein you can make the system
> OOPS if you mmap memory above the 48 bit bus width.  Linus/Ingo, is
> there something in particular that you'd like to see before pulling in
> a check on the bus width (or some other fix)?

I think we might also look at just also handling the whole RSVD page
fault case more gracefully.

The fact that we consider it a page table corruption and react in a
fairly extreme manner to it sounds a bit excessive. Yes, that RSVD it
clearly happens if we have page table corruption, but if we can
trigger it other ways, we shouldn't necessarily just assume blindly
that it's due to some horrible corruption.

So perhaps instead of trying to limit the mmap, see this as a testing
opportunity for unusual fault handling, and not consider RSVD a
"corrupted page tables" issue, but just treat it as a normal page
fault (perhaps after validating that it's a /dev/mem mapping).

I'll need to go to bed now (in order to wake up again in a couple of
hours to go to the airport to get back home from the kernel summit),
but this doesn't sound fundamentally nasty. And handling it at fault
time avoids the whole worry about "what if we got the physical memory
size wrong for some CPU or virtualization environment" issue.

                Linus

--===============1085562963159162234==--

