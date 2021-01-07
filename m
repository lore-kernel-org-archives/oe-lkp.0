Content-Type: multipart/mixed; boundary="===============7511704217346106735=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Thu, 07 Jan 2021 18:55:59 +0000
Message-ID: <20210107185559.GI3579531@ZenIV.linux.org.uk>
In-Reply-To: <20210107184058.GH3579531@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7511704217346106735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 06:40:58PM +0000, Al Viro wrote:
> do_sys_poll(): do the wholesale copyout
> =

> Don't bother with patching up just one field - 16 bits out of each 64.
> The amount of memory traffic is not going to be greater (might be
> smaller, actually) and the loop in copy_to_user() is optimized for
> bulk copy.

	BTW, considering the access pattern, I would expect it to be
considerably cheaper in a lot of cases; basically, we have a copy
of userland array of 64bit values, then we do a non-trivial amount
of work and modify 16 bits out of each 64.  Then we want that
propagated back to the original array.  I suspect that copying just
those 16bit fields out is going to cost more that a bulk copy of
the entire thing, and not just on s390 and similar oddball cases.

	Comments?
--===============7511704217346106735==--

