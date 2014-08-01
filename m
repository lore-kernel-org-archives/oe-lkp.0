Content-Type: multipart/mixed; boundary="===============8535921227435604459=="
MIME-Version: 1.0
From: Davidlohr Bueso <davidlohr@hp.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 21:03:22 -0700
Message-ID: <1406865802.4243.3.camel@buesod1.americas.hpqcorp.net>
In-Reply-To: <20140801020330.GA30211@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8535921227435604459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-08-01 at 10:03 +0800, Aaron Lu wrote:
> On Thu, Jul 31, 2014 at 12:42:41PM +0200, Peter Zijlstra wrote:
> > On Tue, Jul 29, 2014 at 02:39:40AM -0400, Rik van Riel wrote:
> > > On Tue, 29 Jul 2014 13:24:05 +0800
> > > Aaron Lu <aaron.lu@intel.com> wrote:
> > > =

> > > > FYI, we noticed the below changes on
> > > > =

> > > > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git m=
aster
> > > > commit a43455a1d572daf7b730fe12eb747d1e17411365 ("sched/numa: Ensur=
e task_numa_migrate() checks the preferred node")
> > > > =

> > > > ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

> > > > ---------------  -------------------------  =

> > > >      94500 ~ 3%    +115.6%     203711 ~ 6%  ivb42/hackbench/50%-thr=
eads-pipe
> > > >      67745 ~ 4%     +64.1%     111174 ~ 5%  lkp-snb01/hackbench/50%=
-threads-socket
> > > >     162245 ~ 3%     +94.1%     314885 ~ 6%  TOTAL proc-vmstat.numa_=
hint_faults_local
> > > =

> > > Hi Aaron,
> > > =

> > > Jirka Hladky has reported a regression with that changeset as
> > > well, and I have already spent some time debugging the issue.
> > =

> > So assuming those numbers above are the difference in
> =

> Yes, they are.
> =

> It means, for commit ebe06187bf2aec1, the number for
> num_hint_local_faults is 94500 for ivb42 machine and 67745 for lkp-snb01
> machine. The 3%, 4% following that number means the deviation of the
> different runs to their average(we usually run it multiple times to
> phase out possible sharp values). We should probably remove that
> percentage, as they cause confusion if no detailed explanation and may
> not mean much to the commit author and others(if the deviation is big
> enough, we should simply drop that result).
> =

> The percentage in the middle is the change between the two commits.
> =

> Another thing is the meaning of the numbers, it doesn't seem that
> evident they are for proc-vmstat.numa_hint_faults_local. Maybe something
> like this is better?

Instead of removing info, why not document what each piece of data
represents. Or add headers to the table. etc.

Thanks,
Davidlohr


--===============8535921227435604459==--

