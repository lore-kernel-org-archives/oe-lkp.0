Content-Type: multipart/mixed; boundary="===============2062315641625939837=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Tue, 21 Mar 2017 14:11:25 -0700
Message-ID: <CA+55aFzS=X5J9QXbF_oXdO3KTrGjzA6BpGfdLo8BiuuU81cOPw@mail.gmail.com>
In-Reply-To: <CAJcbSZFuJiJE0=rS-ZGPLCMUgaz+dPzHUm-iMa=J1E4H0qAHFg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2062315641625939837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 1:25 PM, Thomas Garnier <thgarnie@google.com> wro=
te:
> The issue seems to be related to exceptions happening in close pages
> to the fixmap GDT remapping.
>
> The original page fault happen in do_test_wp_bit which set a fixmap
> entry to test WP flag. If I grow the number of processors supported
> increasing the distance between the remapped GDT page and the WP test
> page, the error does not reproduce.
>
> I am still looking at the exact distance between repro and no-repro as
> well as the exact root cause.

Hmm. Have we set the GDT limit incorrectly, somehow? The GDT *can*
cover 8k entries, which at 8 bytes each would be 64kB.

So somebody trying to load an invalid segment (say, 0xffff) might end
up causing an access to the GDT base + 64k - 8.

It is also possible that the CPU might do a page table writability
check *before* it does the limit check. That would sound odd, though.
Might be a CPU errata.

              Linus

--===============2062315641625939837==--

