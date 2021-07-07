Content-Type: multipart/mixed; boundary="===============0613059063307934766=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ide] b7fb14d3ac: EIP:ioread32_rep
Date: Wed, 07 Jul 2021 12:05:34 -0700
Message-ID: <CAHk-=wgEM5VcCEtOyCqLnWAXdAumqnAR077Nv5Q_eG+ZDd+owA@mail.gmail.com>
In-Reply-To: <20210707083528.GA353@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0613059063307934766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 7, 2021 at 1:35 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Actually, not it doesn't. Sorry.  So for a non-aligned large request
> this won't work.  So we'll need to actually loop here.
>
> This is probably better and fixes the issue as well (and ATAPI
> probably needs the same treatment):

Thanks, this looks sane and correct to me.

But please do add a comment (or perhaps even better - an actual check)
that the offset is at least 4-byte aligned. Because this splitting of
the buffer at page boundaries can only work if you still have at least
that 32-bit alignment.

At least that's the case for ata_sff_data_xfer32() (which was what
triggered that original oops). I did not really check the other
data_xfer functions, although I did look at a couple of them. At least
vlb32_data_xfer() has the exact same issue.

A couple of others would be ok with just 16-byte aligned splits. But I
*hope* nobody needs more than 32-bit alignment (and considering the
legacy status of this model, I'd be surprised if they need more, but
who knows..).

              Linus
--===============0613059063307934766==--

