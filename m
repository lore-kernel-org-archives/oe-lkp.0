Content-Type: multipart/mixed; boundary="===============6604446445944472848=="
MIME-Version: 1.0
From: Lu, Aaron <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, memcontrol] 309fe96bfc: vm-scalability.throughput +23.0% improvement
Date: Tue, 29 May 2018 03:15:51 +0000
Message-ID: <dbd727326f53648ed114e03a85085b6b4655fda2.camel@intel.com>
In-Reply-To: <20180528120318.GB27180@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6604446445944472848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-05-28 at 14:03 +0200, Michal Hocko wrote:
> On Mon 28-05-18 19:40:19, kernel test robot wrote:
> > =

> > Greeting,
> > =

> > FYI, we noticed a +23.0% improvement of vm-scalability.throughput due t=
o commit:
> > =

> > =

> > commit: 309fe96bfc0ae387f53612927a8f0dc3eb056efd ("mm, memcontrol: impl=
ement memory.swap.events")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> This doesn't make any sense to me. The patch merely adds an accounting.
> It doesn't optimize anything. So I strongly suspect the result is just
> misleading or the test (environment) misconfigured. Not the first time
> I am seeing something like that I am afraid.
> =


Most likely the same situation as:
"
FYI, we noticed a -27.2% regression of will-it-scale.per_process_ops
due to commit:


commit: e27be240df53f1a20c659168e722b5d9f16cc7f4 ("mm: memcg: make sure
memory.events is uptodate when waking pollers")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
"

Where the performance change is due to layout change of
'struct mem_cgroup':
http://lkml.kernel.org/r/20180528085201.GA2918(a)intel.com
--===============6604446445944472848==--

