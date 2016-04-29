Content-Type: multipart/mixed; boundary="===============6094789373722407052=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Fri, 29 Apr 2016 20:54:13 +0800
Message-ID: <20160429125413.GA21824@aaronlu.sh.intel.com>
In-Reply-To: <20160429092936.GE21977@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6094789373722407052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2016 at 11:29:36AM +0200, Michal Hocko wrote:
> On Fri 29-04-16 16:59:37, Aaron Lu wrote:
> > On Thu, Apr 28, 2016 at 01:21:35PM +0200, Michal Hocko wrote:
> > > All of them are order-2 and this was a known problem for "mm, oom:
> > > rework oom detection" commit and later should make it much more
> > > resistant to failures for higher (!costly) orders. So I would definit=
ely
> > > encourage you to retest with the current _complete_ mmotm tree.
> > =

> > OK, will run the test on this branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-4.5
> > with head commit:
> > commit 81cc2e6f1e8bd81ebc7564a3cd3797844ee1712e
> > Author: Michal Hocko <mhocko@suse.com>
> > Date:   Thu Apr 28 12:03:24 2016 +0200
> > =

> >     drm/amdgpu: make amdgpu_mn_get wait for mmap_sem killable
> > =

> > Please let me know if this isn't right.
> =

> Yes that should contain all the oom related patches in the mmotm tree.

The test shows commit 81cc2e6f1e doesn't OOM anymore and its throughput =

is 43609, the same level compared to 43802, so everyting is fine :-)

--===============6094789373722407052==--

