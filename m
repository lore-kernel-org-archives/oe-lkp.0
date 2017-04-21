Content-Type: multipart/mixed; boundary="===============0200628079250495141=="
MIME-Version: 1.0
From: Eric Biggers <ebiggers3@gmail.com>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp-robot] [KEYS] bdf7c0f8bf: ltp.add_key02.fail
Date: Thu, 20 Apr 2017 21:43:04 -0700
Message-ID: <20170421044304.GB626@zzz>
In-Reply-To: <20170420125750.GD10246@rei.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============0200628079250495141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

On Thu, Apr 20, 2017 at 02:57:50PM +0200, Cyril Hrubis wrote:
> > =

> > In my opinion this is a valid behavior, and the test is just weird; it'=
s passing
> > in *both* an unaddressable payload and an invalid description, so it's =
not clear
> > which case it's meant to be testing.  (Generally, if a syscall will fai=
l for
> > more than one reason, it's not guaranteed which error code you'll get.)
> =

> That is quite common problem with LTP testcases. Do you care to send a
> patch or should I fix that?
> =


I'll plan to send a patch.  Also, it looks like the testing that LTP does of
add_key() is very sparse, so I'll try to extend it a bit.

> > In any case, once we have a fix merged, it would be nice for there to b=
e an ltp
> > test added for the "NULL payload with nonzero length" case with one of =
the key
> > types that crashed the kernel.
> =

> Here as well, feel free to send a patch or at least point us to a
> reproducer that could be turned into a testcase.
> =


I'll plan to send a patch for that as well.

Thanks,

Eric

--===============0200628079250495141==--

