Content-Type: multipart/mixed; boundary="===============2731575411905171125=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/1] slob: Only use list functions when safe to do so
Date: Tue, 02 Apr 2019 12:12:39 -0700
Message-ID: <20190402121239.76d64e3c262dcb24ebcee058@linux-foundation.org>
In-Reply-To: <20190402190538.GA5084@eros.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============2731575411905171125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Apr 2019 06:05:38 +1100 "Tobin C. Harding" <me@tobin.cc> wrote:

> > It's regrettable that this fixes
> > slob-respect-list_head-abstraction-layer.patch but doesn't apply to
> > that patch - slob-use-slab_list-instead-of-lru.patch gets in the way. =

> > So we end up with a patch series which introduces a bug and later
> > fixes it.
> =

> Yes I thought that also.  Do you rebase the mm tree?  Did you apply this
> right after slob-use-slab_list-instead-of-lru or to the current tip?

After slob-use-slab_list-instead-of-lru.patch

>  If
> it is applied to the tip does this effect the ability to later bisect in
> between these two commits (if the need arises for some unrelated reason)?

There is a bisection hole but it is short and the bug is hardish to
hit.

> > I guess we can live with that but if the need comes to respin this
> > series, please do simply fix
> > slob-respect-list_head-abstraction-layer.patch so we get a clean
> > series.
> =

> If its not too much work for you to apply the new series I'll do another
> version just to get this right.

I guess that would be best, thanks.

--===============2731575411905171125==--

