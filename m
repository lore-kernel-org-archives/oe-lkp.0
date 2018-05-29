Content-Type: multipart/mixed; boundary="===============4791291638960136599=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, memcontrol] 309fe96bfc: vm-scalability.throughput +23.0% improvement
Date: Tue, 29 May 2018 09:58:00 +0200
Message-ID: <20180529075800.GL27180@dhcp22.suse.cz>
In-Reply-To: <dbd727326f53648ed114e03a85085b6b4655fda2.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4791291638960136599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 29-05-18 03:15:51, Lu, Aaron wrote:
> On Mon, 2018-05-28 at 14:03 +0200, Michal Hocko wrote:
> > On Mon 28-05-18 19:40:19, kernel test robot wrote:
> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a +23.0% improvement of vm-scalability.throughput due=
 to commit:
> > > =

> > > =

> > > commit: 309fe96bfc0ae387f53612927a8f0dc3eb056efd ("mm, memcontrol: im=
plement memory.swap.events")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > =

> > This doesn't make any sense to me. The patch merely adds an accounting.
> > It doesn't optimize anything. So I strongly suspect the result is just
> > misleading or the test (environment) misconfigured. Not the first time
> > I am seeing something like that I am afraid.
> > =

> =

> Most likely the same situation as:
> "
> FYI, we noticed a -27.2% regression of will-it-scale.per_process_ops
> due to commit:
> =

> =

> commit: e27be240df53f1a20c659168e722b5d9f16cc7f4 ("mm: memcg: make sure
> memory.events is uptodate when waking pollers")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> "
> =

> Where the performance change is due to layout change of
> 'struct mem_cgroup':
> http://lkml.kernel.org/r/20180528085201.GA2918(a)intel.com

I do not follow. How can _this_ patch lead to an improvement when it
actually _adds_ an accounting? The other report you are mentioning is a
_regression_ and I can imagine that the layout changes can lead to that
result.
-- =

Michal Hocko
SUSE Labs

--===============4791291638960136599==--

