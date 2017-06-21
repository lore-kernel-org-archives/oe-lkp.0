Content-Type: multipart/mixed; boundary="===============8863450745138173005=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 12:39:52 -0700
Message-ID: <alpine.LSU.2.11.1706211238180.17033@eggly.anvils>
In-Reply-To: <CA+55aFxzdtZ787snPhLhU8+2xUHKd74Som82yRCiFSQVXCNFhA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8863450745138173005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jun 2017, Linus Torvalds wrote:
> On Tue, Jun 20, 2017 at 7:41 PM, Hugh Dickins <hughd@google.com> wrote:
> > On Wed, 21 Jun 2017, kernel test robot wrote:
> >
> > Thanks for the report: yes, this is the same one as Dave Jones
> > found yesterday, which is fixed by this patch posted last night:
> =

> .. and that patch is in current -git now, so hopefully we're all good.
> =

> Hugh, Michal - I also merged Helge's drop-up cleanup, is there
> anything I've missed? I think Oleg had something, but I can't recall
> right now, and I might just have missed it.

No, the tree looks good now, thanks.  You're right that Oleg raised a
concern about how mmap(MAP_GROWSDOWN) behaves, and is wondering about
how to make it more sensible: but that's neither a vulnerability nor
a regression - he agreed minor, to think about another time.  He's
also been fielding a concern from the CRIU people, we're hoping that's
just something they need to fix at their end - ah, no, I see Oleg has
just replied ahead of me, not digested yet, I'll look into that later...

Hugh

--===============8863450745138173005==--

