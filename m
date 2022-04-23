Content-Type: multipart/mixed; boundary="===============6473442690869604892=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fs/pipe] 5a519c8fe4: WARNING:at_mm/page_alloc.c:#__alloc_pages
Date: Sat, 23 Apr 2022 14:02:36 -0700
Message-ID: <CAHk-=wgBH+11vHDEKaPmDeVQ557mSruEXmEwBThACz3Xx-pvKA@mail.gmail.com>
In-Reply-To: <CANaxB-whArowHWaWsFMJf6B4idPabAmJNawzk9FdokNQ-1xrSA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6473442690869604892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 23, 2022 at 1:23 PM Andrei Vagin <avagin@gmail.com> wrote:
>
> vmsplice & splice  is the best. /proc/pid/mem is 30% slower.
> process_vm_readv is 20% slower.

Hmm.

I wonder how much low-hanging fruit there would be to optimize there.

Because process_vm_readv() in particular is pretty much _designed_ for
what you do, so it would be much nicer to basically work on that being
optimal, rather than doing vmsplice hackery.

(And yes, vmsplice is designed for efficient copies from the VM too,
of course, but that "limited to kernel pipe buffer" part is arguably
even more fundamental to it)

            Linus
--===============6473442690869604892==--

