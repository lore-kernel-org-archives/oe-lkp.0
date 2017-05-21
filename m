Content-Type: multipart/mixed; boundary="===============5134517354741459984=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [waitid()] 75f64d68f9: Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=
Date: Sun, 21 May 2017 22:14:43 +0100
Message-ID: <20170521211443.GA390@ZenIV.linux.org.uk>
In-Reply-To: <alpine.LFD.2.20.1705211233580.8607@i7.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============5134517354741459984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2017 at 12:35:28PM -0700, Linus Torvalds wrote:
> =

> =

> On Sun, 21 May 2017, Al Viro wrote:
> > =

> > fix unsafe_put_user()
> =

> So here's my proposed patch on top of yours to fix unsafe_get_user() with =

> "long long" arguments, and to clean up the extra-long line you did.
> =

> Comments?

>  #define unsafe_get_user(x, ptr, err_label)					\
>  do {										\
>  	int __gu_err;								\
> -	unsigned long __gu_val;							\
> +	__inttype(*(ptr)) __gu_val;						\

Umm...  get_user() for anything larger than long is simply not supported on
a lot of architectures[1].  Do we really want to do that for unsafe_get_use=
r()?

[1] at the moment, blackfin, m32r, m68k/mmu, microblaze, mn10300, nios2, sh.
arm allows it for get_user() (and rmk was really unhappy about doing so), b=
ut
not for __get_user().

--===============5134517354741459984==--

