Content-Type: multipart/mixed; boundary="===============6446454042056825475=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0b0695f2b3: phoronix-test-suite.compress-gzip.0.seconds 19.8% regression
Date: Fri, 15 May 2020 09:43:39 +0800
Message-ID: <20200515014339.GA9854@xsang-OptiPlex-9020>
In-Reply-To: <CAKfTPtB3jQWd52FTyKNk5w8mmoDnu+jwYgkFBOiOKjb_BjxqTw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6446454042056825475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 07:09:35PM +0200, Vincent Guittot wrote:
> Hi Oliver,
> =

> On Thu, 14 May 2020 at 16:05, kernel test robot <oliver.sang@intel.com>=
 wrote:
> >
> > Hi Vincent Guittot,
> >
> > Below report FYI.
> > Last year, we actually reported an improvement "[sched/fair] 0b0695f2b3:
> > vm-scalability.median 3.1% improvement" on link [1].
> > but now we found the regression on pts.compress-gzip.
> > This seems align with what showed in "[v4,00/10] sched/fair: rework the=
 CFS
> > load balance" (link [2]), where showed the reworked load balance could =
have
> > both positive and negative effect for different test suites.
> =

> We have tried to run  all possible use cases but it's impossible to
> covers all so there were a possibility that one that is not covered,
> would regressed.
> =

> > And also from link [3], the patch set risks regressions.
> >
> > We also confirmed this regression on another platform
> > (Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz with 8G memory),
> > below is the data (lower is better).
> > v5.4    4.1
> > fcf0553db6f4c79387864f6e4ab4a891601f395e    4.01
> > 0b0695f2b34a4afa3f6e9aa1ff0e5336d8dad912    4.89
> > v5.5    5.18
> > v5.6    4.62
> > v5.7-rc2    4.53
> > v5.7-rc3    4.59
> >
> > It seems there are some recovery on latest kernels, but not fully back.
> > We were just wondering whether you could share some lights the further =
works
> > on the load balance after patch set [2] which could cause the performan=
ce
> > change?
> > And whether you have plan to refine the load balance algorithm further?
> =

> I'm going to have a look at your regression to understand what is
> going wrong and how it can be fixed

Thanks a lot!

> =

> Thanks
> Vincent
>=20
--===============6446454042056825475==--

