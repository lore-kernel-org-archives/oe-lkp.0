Content-Type: multipart/mixed; boundary="===============2793190053774817076=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [patch 1/2 for-4.20] mm, thp: restore node-local hugepage allocations
Date: Wed, 05 Dec 2018 21:15:28 +0100
Message-ID: <20181205201528.GW1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812051120550.240991@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2793190053774817076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 05-12-18 11:24:53, David Rientjes wrote:
> On Wed, 5 Dec 2018, Michal Hocko wrote:
> =

> > > > At minimum do not remove the cleanup part which consolidates the gfp
> > > > hadnling to a single place. There is no real reason to have the
> > > > __GFP_THISNODE ugliness outside of alloc_hugepage_direct_gfpmask.
> > > > =

> > > =

> > > The __GFP_THISNODE usage is still confined to =

> > > alloc_hugepage_direct_gfpmask() for the thp fault path, we no longer =
set =

> > > it in alloc_pages_vma() as done before the cleanup.
> > =

> > Why should be new_page any different?
> > =

> =

> To match alloc_new_node_page() which does it correctly and does not chang=
e =

> the behavior of mbind() that the cleanup did, which used =

> alloc_hugepage_vma() to get the __GFP_THISNODE behavior.  If there is a =

> reason mbind() is somehow different wrt allocating hugepages locally, I =

> think that should be a separate patch, but the goal of this patch is to =

> revert all the behavioral change that caused hugepages to be allocated =

> remotely.

If the __GFP_THISNODE should be really used then it should be applied to
all other types of pages. Not only THP. And as such done in a separate
patch. Not a part of the revert. The cleanup was meant to unify THP
allocations and that is why I object to reverting it as a part of this
work.

-- =

Michal Hocko
SUSE Labs

--===============2793190053774817076==--

