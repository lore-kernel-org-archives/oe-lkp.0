Content-Type: multipart/mixed; boundary="===============2653291459907073007=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] 096aa33863a: -21.4% hackbench.throughput, -20.2% netperf.Throughput_Mbps
Date: Fri, 08 Aug 2014 10:38:53 +0200
Message-ID: <20140808083853.GA8919@gmail.com>
In-Reply-To: <53E3C270.1010302@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2653291459907073007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Rik van Riel <riel@redhat.com> wrote:

> On 08/07/2014 06:53 AM, Fengguang Wu wrote:
> > Hi Rik,
> > =

> > We noticed the below performance regression in commit
> > 096aa33863a5e48de52d2ff30e0801b7487944f4 ("sched/numa: Decay
> > ->wakee_flips instead of zeroing")
> > =

> > b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
> > ---------------  -------------------------  ---------------------------
> >     122361 =C2=B1 0%     -21.4%      96140 =C2=B1 0%  lkp-snb01/hackben=
ch/50%-process-pipe
> >     122361 =C2=B1 0%     -21.4%      96140 =C2=B1 0%  TOTAL hackbench.t=
hroughput
> =

> I guess the performance of that benchmark depends on it
> "slipping under the wire" after each time the kernel
> zeroes out ->wakee_flips.
> =

> Depending on repeatedly pulling the wakee back to the same
> node as the waker suggests something else in the kernel may
> be pulling the wakee to another place in the system repeatedly,
> as well, just at a lower frequency (load balancer?).
> =

> I have also noticed that select_idle_sibling often fails to
> find an idle sibling within the LLC domain, even when it
> exists. Fixing that bug sometimes results in lower performance.
> =

> It appears that some of the performance results of the scheduler
> appear on the code acting in an opposite way to its documented
> intention.
> =

> It may be best to revert 096aa33863a for now...

Mind sending a revert patch, with an explanation, a Reported-by, etc?

Thanks,

	Ingo

--===============2653291459907073007==--

