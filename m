Content-Type: multipart/mixed; boundary="===============7784504952362467734=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Thu, 07 Jan 2021 18:33:58 +0000
Message-ID: <20210107183358.GG3579531@ZenIV.linux.org.uk>
In-Reply-To: <CAHk-=wgQ5EEH3-GTK9KDB5mBmWjP25YHXC6_-V_KfWd0UTDTDQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7784504952362467734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 09:43:54AM -0800, Linus Torvalds wrote:

> Before, it would do the whole CLAC/STAC dance inside that loop for
> every entry (and with that commit d55564cfc22 it would be a function
> call, of course).
> =

> Can you verify that this fixes the regression (and in fact I'd expect
> it to improve that test-case)?

I'm not sure it's the best approach, TBH.  How about simply
        for (walk =3D head; walk; ufds +=3D walk->len, walk =3D walk->next)=
 {
		if (copy_to_user(ufds, walk->entries,
				 walk->len * sizeof(struct pollfd))
			goto out_fds;
        }
in there?  It's both simpler (obviously matches the copyin side) and
might very well be faster...
--===============7784504952362467734==--

