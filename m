Content-Type: multipart/mixed; boundary="===============4447772468204003427=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 15:30:08 -0700
Message-ID: <CA+55aFxd-smj5PkN96byr1ZJZ2bgymTBpRYQXq5Ph=4EwRDGpQ@mail.gmail.com>
In-Reply-To: <20160811221634.GU2356@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4447772468204003427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 3:16 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Huh?  The very first thing it does is
>         char *kaddr =3D kmap_atomic(page), *p =3D kaddr + offset;
>
> If _that_ does not disable pagefaults, we are very deep in shit.

Right you are - it does, even with highmem disabled. Never mind, those
pagefault_disabled/enabled() calls are clearly bogus.

         Linus

--===============4447772468204003427==--

