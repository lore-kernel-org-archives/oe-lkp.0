Content-Type: multipart/mixed; boundary="===============4650523371916855646=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 1/2 for-4.20] mm, thp: restore node-local hugepage allocations
Date: Wed, 05 Dec 2018 11:24:53 -0800
Message-ID: <alpine.DEB.2.21.1812051120550.240991@chino.kir.corp.google.com>
In-Reply-To: <20181205073434.GT1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4650523371916855646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Michal Hocko wrote:

> > > At minimum do not remove the cleanup part which consolidates the gfp
> > > hadnling to a single place. There is no real reason to have the
> > > __GFP_THISNODE ugliness outside of alloc_hugepage_direct_gfpmask.
> > > =

> > =

> > The __GFP_THISNODE usage is still confined to =

> > alloc_hugepage_direct_gfpmask() for the thp fault path, we no longer se=
t =

> > it in alloc_pages_vma() as done before the cleanup.
> =

> Why should be new_page any different?
> =


To match alloc_new_node_page() which does it correctly and does not change =

the behavior of mbind() that the cleanup did, which used =

alloc_hugepage_vma() to get the __GFP_THISNODE behavior.  If there is a =

reason mbind() is somehow different wrt allocating hugepages locally, I =

think that should be a separate patch, but the goal of this patch is to =

revert all the behavioral change that caused hugepages to be allocated =

remotely.

--===============4650523371916855646==--

