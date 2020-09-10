Content-Type: multipart/mixed; boundary="===============6439357551266603133=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [PATCH v2] syscall/ptrace08: Simplify the test.
Date: Thu, 10 Sep 2020 17:24:47 +0200
Message-ID: <20200910152447.GA10844@yuki.lan>
In-Reply-To: <5d127ee5-56d1-01c5-c364-dcb004204e9d@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6439357551266603133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> looks good and the test passes on older fixed kernels. Just one
> compatibility issue below.

I've fixed that and also the kernel version when the behavior had
changed and pushed, thanks for the review and testing.

...

> > +	if (TST_RET !=3D -1) {
> > +		tst_res(TFAIL, "ptrace() breakpoint with kernel addr succeeded");
> > +	} else {
> > +		if (TST_ERR =3D=3D EINVAL) {
> > +			tst_res(TPASS | TTERRNO,
> > +				"ptrace() breakpoint with kernel addr failed");
> > +		} else {
> > +			tst_res(TFAIL | TTERRNO,
> > +				"ptrace() breakpoint on kernel addr should return EINVAL, got");
> > +		}
> > +	}
> > +
> > +	unsigned long addr;
> =

> AFAICT, we're not compiling with --std=3Dc99 so older compilers may
> complain about the variable declaration here.

The default std for gcc has been at least gnu90 for ages, which includes
subset of c99 features as well including this one. So unless you
explicitly pass --std=3Dc90 or older it will work just fine.

I've moved the declaration to the top of the function nevertheless.

-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============6439357551266603133==--

