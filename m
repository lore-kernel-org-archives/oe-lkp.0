Content-Type: multipart/mixed; boundary="===============9014441748571328254=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Fwd: Re: [mm] 10befea91b: hackbench.throughput -62.4% regression
Date: Fri, 05 Feb 2021 10:08:30 +0800
Message-ID: <2b08b551-6eb5-395d-5c69-5f61d145eb0c@linux.intel.com>
In-Reply-To: <20210205010457.GB2053809@carbon.dhcp.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9014441748571328254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

    From 286e04b8ed7a0427 to 3de7d4f25a7438f09fef4e71ef1 there are two =

regressions for process mode :
1) 286e04b8ed7a0427 to 10befea91b61c4e2c2d1df06a2e  (-62.4% regression)
2) 10befea91b61c4e2c2d1df06a2e to d3921cb8be29ce5668c64e23ffd (-22.3% =

regression)

For regression 1), 0-day has reported it. For regression 2), Do we =

report any regression? Thanks.


-------- Forwarded Message --------
Subject: Re: [LKP] Re: [mm] 10befea91b: hackbench.throughput -62.4% =

regression
Date: Thu, 4 Feb 2021 17:04:57 -0800
From: Roman Gushchin <guro@fb.com>
To: Xing Zhengjun <zhengjun.xing@linux.intel.com>
CC: Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton =

<akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Shakeel =

Butt <shakeelb@google.com>, Christoph Lameter <cl@linux.com>, Michal =

Hocko <mhocko@kernel.org>, Tejun Heo <tj@kernel.org>, Linus Torvalds =

<torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, =

lkp(a)lists.01.org, lkp(a)intel.com

On Thu, Feb 04, 2021 at 01:19:47PM +0800, Xing Zhengjun wrote:
> =

> =

> On 2/3/2021 10:49 AM, Roman Gushchin wrote:
> > On Tue, Feb 02, 2021 at 04:18:27PM +0800, Xing, Zhengjun wrote:
> > > On 1/14/2021 11:18 AM, Roman Gushchin wrote:
> > > > On Thu, Jan 14, 2021 at 10:51:51AM +0800, kernel test robot wrote:
> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed a -62.4% regression of hackbench.throughput due t=
o commit:
> > > > Hi!
> > > > =

> > > > Commit "mm: memcg/slab: optimize objcg stock draining" (currently o=
nly in the mm tree,
> > > > so no stable hash) should improve the hackbench regression.
> > > The commit has been merged into Linux mainline :
> > >  =C2=A03de7d4f25a7438f09fef4e71ef111f1805cd8e7c ("mm: memcg/slab: opt=
imize objcg
> > > stock draining")
> > > I test the regression still existed.
> > Hm, so in your setup it's about the same with and without this commit?
> > =

> > It's strange because I've received a letter stating a 45.2% improvement=
 recently:
> > https://lkml.org/lkml/2021/1/27/83
> =

> They are different test cases, 45.2% improvement test case run in "thread=
" mode, -62.4% regression test case run in "process" mode.

Thank you for the clarification!

> From 286e04b8ed7a0427 to 3de7d4f25a7438f09fef4e71ef1 there are two regres=
sions for process mode :
> 1) 286e04b8ed7a0427 to 10befea91b61c4e2c2d1df06a2e  (-62.4% regression)
> 2) 10befea91b61c4e2c2d1df06a2e to d3921cb8be29ce5668c64e23ffd (-22.3% reg=
ression)
> =

> 3de7d4f25a7438f09fef4e71ef111f1805cd8e7c only fix the regression 2) , so =
the value of "hackbench.throughput" for 3de7d4f25a7438f09fef4e71ef1(71824) =
and 10befea91b61c4e2c2d1df06a2e (72220) is very closed.

Ok, it seems that 1) is caused by switching to per-object =

accounting/stats of slab memory.
I don't now anything about 2). There are 38326 commits in between. Do =

you know which commits
are causing it?
I believe that 3de7d4f25a74 partially fixes regression 1).

I'll take a look what we can do here.

Some regression could be unavoidable: we're doing more precise =

accounting, but it requires
more work. As a compensation we're getting major benefits like saving =

over 40% of
the slab memory and having less fragmentation.

But hopefully we can make it smaller.

Thanks!
--===============9014441748571328254==--

