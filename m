Content-Type: multipart/mixed; boundary="===============8542538882182080325=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Fri, 17 Mar 2017 12:36:22 -0700
Message-ID: <CA+55aFxrbQpisKU1ZuymdpYgSdxSUZ98k-fXjHZy9G9DwCXtgA@mail.gmail.com>
In-Reply-To: <CALCETrUtqOmFjj6ie8vaCuM6SX91BNotA-gwf90bUY9hj_qD1g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8542538882182080325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 11:20 AM, Andy Lutomirski <luto@kernel.org> wrote:
>
> I can easily imagine that breaking WINE or DOSEMU because it'll affect
> the LDT, too.

Can they even *read* the LDT contents, though? The whole accessed bit
doesn't show up in 'struct user_desc', so you can neither set it nor
read it.

> How about this:

I don't think that's _wrong_, but..

I'd really rather just do it in fill_ldt() itself, unless you can
explain how it would be visible to anybody..

               Linus

--===============8542538882182080325==--

