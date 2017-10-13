Content-Type: multipart/mixed; boundary="===============3948192123323599601=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Fri, 13 Oct 2017 12:09:23 -0700
Message-ID: <CA+55aFyvK+proOBKfc41qSH8hoPU+mBiT0=hLhbt_ZQv4N82iA@mail.gmail.com>
In-Reply-To: <9a1c3232-86e3-7301-23f8-50116abf37d3@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3948192123323599601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2017 at 6:56 AM, Andrey Ryabinin
<aryabinin@virtuozzo.com> wrote:
>
> This could be fixed by s/vmovdqa/vmovdqu change like bellow, but maybe th=
e right fix
> would be to align the data properly?

I suspect anything that has the SHA extensions should also do
unaligned loads efficiently. The whole "aligned only" model is broken.
It's just doing two loads from the state pointer, there's likely no
point in trying to align it.

So your patch looks fine, but maybe somebody could add the required
alignment to the sha256 context allocation (which I don't know where
it is).

But yeah, that other SLOB panic looks unrelated to this.

                   Linus

--===============3948192123323599601==--

