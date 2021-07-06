Content-Type: multipart/mixed; boundary="===============5814916561285462339=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ide] b7fb14d3ac: EIP:ioread32_rep
Date: Tue, 06 Jul 2021 12:08:42 -0700
Message-ID: <CAHk-=wgPyx7tHFNaO2N6bsaB_E6gL+t1uDAmrD91jJw+hiTvrQ@mail.gmail.com>
In-Reply-To: <20210706143647.GA28289@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5814916561285462339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 6, 2021 at 7:36 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Yeah, there's usually a huge offset into the page.  The otherwise
> similar ATAPI code actually has checks to chunk it up and not cross
> page boundaries, and copying that over fixes the problem.

Ok.

Your patch made me go "I think it should loop until it has transferred
the full 512 bytes", but maybe the caller loops properly?

Or should it just discard the end?

HOWEVER.

Even if the caller does loop/discard properly, your patch still worries me:

> +       /* don't cross page boundaries */
> +       count =3D min(count, (unsigned int)PAGE_SIZE - offset);

Is the offset guaranteed to be 4-byte aligned?

Because I'm looking at ata_sff_data_xfer32(), and I think it
fundamentally would fail the "retry after partial 4-byte transfer".

Let's imagine that "offset" is 511 bytes off the end of the page, and
so you'd first do a 511-byte transfer, and then a 1-byte transfer.

That's not how ata_sff_data_xfer32() works. It would actually first do
a 508-byte transfer (using that "rep insl" to do 4 bytes at a time),
and then it would do a 4-byte transfer into a temporary buffer, and
copy the first three bytes to fill out the 511 bytes in the first
page.

If you then loop back to do the last byte, it would do another 4-byte
transfer into a temporary buffer, and copy the remaining byte - ending
up with 512 bytes result as asked for.

Except they wouldn't be the *RIGHT* 512 bytes. It would have done 516
bytes worth of "inl", and from those 516 bytes it would have filled
the last 4 bytes with basically random garbage (ok, the first three
bytes would be ok, but the last byte would not be).

So I think that ap->ops->sff_data_xfer fundamentally cannot handle a
page crosser correctly - at least not if it's not 4-byte aligned.

How does IO to a non-sector-aligned buffer eevr happen? Because I
think that's broken, and your patch is only hiding further bugs.

                    Linus
--===============5814916561285462339==--

