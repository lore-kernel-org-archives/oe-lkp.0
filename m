Content-Type: multipart/mixed; boundary="===============5949402422574820641=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 42a3003535: will-it-scale.per_process_ops -25.9% regression
Date: Tue, 21 May 2019 11:13:55 -0400
Message-ID: <20190521151355.GA2870@cmpxchg.org>
In-Reply-To: <20190521134646.GE19312@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5949402422574820641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 09:46:46PM +0800, kernel test robot wrote:
> On Mon, May 20, 2019 at 05:53:28PM -0400, Johannes Weiner wrote:
> > Hello,
> > =

> > On Mon, May 20, 2019 at 02:35:34PM +0800, kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed a -25.9% regression of will-it-scale.per_process_ops =
due to commit:
> > > =

> > > =

> > > commit: 42a300353577ccc17ecc627b8570a89fa1678bec ("mm: memcontrol: fi=
x recursive statistics correctness & scalabilty")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > > in testcase: will-it-scale
> > > on test machine: 192 threads Skylake-SP with 256G memory
> > > with following parameters:
> > =

> > Ouch. That has to be the additional cache footprint of the split
> > local/recursive stat counters, rather than the extra instructions.
> > =

> > Could you please try re-running the test on that host with the below
> > patch applied?
> =

> Hi,
> =

> The patch can fix the regression.
> =

> tests: 1
> testcase/path_params/tbox_group/run: will-it-scale/performance-process-10=
0%-page_fault3/lkp-skl-4sp1
> =

> db9adbcbe7 ("mm: memcontrol: move stat/event counting functions out-of-li=
ne")
> 8d8245997d ("mm: memcontrol: don't batch updates of local VM stats and ev=
ents")
> =

> db9adbcbe740e098  8d8245997dbd17c5056094f15c  =

> ----------------  --------------------------  =

>          %stddev      change         %stddev
>              \          |                \  =

>   87819982                    85307742        will-it-scale.workload
>     457395                      444310        will-it-scale.per_process_o=
ps

Fantastic, thank you for verifying! I'm going to take that as a
Tested-by.

--===============5949402422574820641==--

