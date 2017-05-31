Content-Type: multipart/mixed; boundary="===============1723886715483527737=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [btrfs] beeeccca9b: WARNING:at_mm/util.c:#kvmalloc_node
Date: Wed, 31 May 2017 11:19:05 +0200
Message-ID: <20170531091904.GD27783@dhcp22.suse.cz>
In-Reply-To: <20170531091202.GA769@vader>
List-Id: <oe-lkp.lists.linux.dev>

--===============1723886715483527737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 31-05-17 02:12:02, Omar Sandoval wrote:
> On Wed, May 31, 2017 at 08:51:28AM +0200, Michal Hocko wrote:
> > On Wed 31-05-17 14:30:33, kernel test robot wrote:
> > > =

> > > FYI, we noticed the following commit:
> > > =

> > > commit: beeeccca9bebcec386cc31c250cff8a06cf27034 ("btrfs: Use kvzallo=
c instead of kzalloc/vmalloc in alloc_bitmap")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > =

> > I have intentionally skipped alloc_bitmap because it relies on GFP_NOFS.
> > This doesn't work properly when falling back to vmalloc and that is what
> > the warning reported here says. I believe the right approach is to check
> > whether the GFP_NOFS is _really_ needed and document why if yes.
> > Otherwise drop the NOFS part in one patch with the explanation and
> > convert it to kvmalloc in a separate patch.
> =

> Unfortunately we really do need GFP_NOFS here, the free space tree is
> modified while we are committing a fs transaction, sometimes in the
> critical section when we block new operations from joining the
> transaction.

OK, please document this.

> Looking at the comment in kvmalloc_node():
> =

> 	/*
> 	 * vmalloc uses GFP_KERNEL for some internal allocations (e.g page table=
s)
> 	 * so the given set of flags has to be compatible.
> 	 */
> 	WARN_ON_ONCE((flags & GFP_KERNEL) !=3D GFP_KERNEL);
> =

> has alloc_bitmap() always been broken by virtue of calling vmalloc()
> with GFP_NOFS?

yes. vmalloc is simply not GFP_NOFS safe as it performs GFP_KERNEL
hardcoded allocations. The way out of this is to use
memalloc_nofs_{save,restore} around kvmalloc call.

-- =

Michal Hocko
SUSE Labs

--===============1723886715483527737==--

