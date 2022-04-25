Content-Type: multipart/mixed; boundary="===============7014108457549770387=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [proc/sysctl] 1dd38979b2: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 25 Apr 2022 16:34:34 -0700
Message-ID: <20220425163434.5f8f47e8c301ea30c2f94a5a@linux-foundation.org>
In-Reply-To: <YmcqCVLv3HQ+Kxeq@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7014108457549770387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Apr 2022 16:08:57 -0700 Luis Chamberlain <mcgrof@kernel.org> w=
rote:

> On Mon, Apr 25, 2022 at 02:46:07PM -0700, Andrew Morton wrote:
> > On Mon, 25 Apr 2022 12:00:21 -0700 Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
> > =

> > > Andrew, can we drop this patch for now?
> > =

> > I've been sitting on (ie, forgotten about) this patch
> > (https://lore.kernel.org/all/20200709235115.56954-1-jpitti(a)cisco.com/=
T/#u)
> =

> Jesh, yeah I see.
> =

> > for two years.  Evidently waiting for you/Kees/Ingo to provide
> > guidance.  So sure, the need seems very unurgent so I can drop it.
> =

> Well Keew as OK with it, but I yeah I can't decipher the issue at this
> point in time.
> =

> > However I fail to see how that patch could have caused this crash.  I'm
> > suspecting a bisection error?
> > =

> > Maybe something is unwell in drivers/vdpa/vdpa_user/vduse_dev.c.
> =

> At a quick glance, yes it could very well by vduse_init() is messy and
> races somehow with init, but if a race does lurk here my instincts tell
> me this can't be the only place.
> =

> Not sure if leaving a patch in place more time to see how else things
> can explode is worth it.

Confused.  Are you thinking that the above-linked patch was somehow
involved in this crash?  If so, but how?  All it does it to permit
unprivileged reads to four ints via proc_dointvec_minmax()?

--===============7014108457549770387==--

