Content-Type: multipart/mixed; boundary="===============8008328990760682042=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 11:29:34 -0700
Message-ID: <CA+55aFxzdtZ787snPhLhU8+2xUHKd74Som82yRCiFSQVXCNFhA@mail.gmail.com>
In-Reply-To: <alpine.LSU.2.11.1706201937340.14450@eggly.anvils>
List-Id: <oe-lkp.lists.linux.dev>

--===============8008328990760682042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2017 at 7:41 PM, Hugh Dickins <hughd@google.com> wrote:
> On Wed, 21 Jun 2017, kernel test robot wrote:
>
> Thanks for the report: yes, this is the same one as Dave Jones
> found yesterday, which is fixed by this patch posted last night:

.. and that patch is in current -git now, so hopefully we're all good.

Hugh, Michal - I also merged Helge's drop-up cleanup, is there
anything I've missed? I think Oleg had something, but I can't recall
right now, and I might just have missed it.

               Linus

--===============8008328990760682042==--

