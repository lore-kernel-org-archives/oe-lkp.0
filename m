Content-Type: multipart/mixed; boundary="===============8605413432919017671=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [clear_page] 0ad07c8104 BUG: unable to handle kernel NULL pointer dereference at 0000000000000040
Date: Sun, 19 Feb 2017 14:50:19 +0100
Message-ID: <20170219135019.tiaed3zl5t5vr45k@pd.tnic>
In-Reply-To: <20170219010651.nsxugr7j6exvh3wn@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8605413432919017671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2017 at 09:06:51AM +0800, Fengguang Wu wrote:
> Yes if we add it as a line below the branch URL, it could be a time saver.

Right.

> Since it's hard to teach ALL people about the rule, it'd be best if we
> can work w/o any rules -- unless you want to be accurate&helpful or to
> customize test behaviors.
> =

> Since we already tested the original patch/commit (hence the report),
> we should know where the fixup should be applied to. And it'd be
> reasonably easy to tell whether the fix is incremental or a
> replacement -- just try git-am onto the original commit first, if
> failed, continue to try the parent commit. For old bugs the fix could
> be against linus/master or linux-next/master, which could be tried too.

Makes sense.

> Yes, that'd be most convenient. In general the email interface could
> be something like this:
> =

>        # "key: value" fields; if you Re: to an earlier bug report, they c=
an be auto retrieved
>        compiler: gcc-6 # optional
>        base-commit: v4.10-rc8 # the robot knows kernel commits from hundr=
eds of public git trees
>        ---
>        the patch
>        ---
>        attach kconfig files

Yap, just stick those rules somewhere on a website.

Btw, this is not only useful for a follow-on, fix patch but also for
initial test request. For example, I want to backport patch to stable
and would like to run it on a bunch of kernels:

base-commit: v4.4-stable, v4.9-stable, ...

i.e., a list of trees to apply it to. I believe people might like this a
lot.

Or, for example, a patch touching a bunch of arches and author doesn't
necessarily have access to all those different toolchains. Shoot a mail
to the 0day bot:

base-commit: linus/master
arch: x86_64, powerpc, sparc, ...

Would be very useful too.

Anyway, just a couple of ideas.

What would also be cool if you guys had a 0day bot howto with all those
things we should pay attention to and we can go and look up.

Thanks!

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============8605413432919017671==--

