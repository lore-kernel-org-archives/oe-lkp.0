Content-Type: multipart/mixed; boundary="===============2556136328467960791=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Fri, 01 Aug 2014 16:14:23 +0800
Message-ID: <20140801081423.GA21249@localhost>
In-Reply-To: <20140801072911.GE19379@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2556136328467960791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 09:29:11AM +0200, Peter Zijlstra wrote:
> On Fri, Aug 01, 2014 at 10:03:30AM +0800, Aaron Lu wrote:
> > > > > ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

> > > > > ---------------  -------------------------  =

> > > > >      94500 ~ 3%    +115.6%     203711 ~ 6%  ivb42/hackbench/50%-t=
hreads-pipe
> > > > >      67745 ~ 4%     +64.1%     111174 ~ 5%  lkp-snb01/hackbench/5=
0%-threads-socket
> > > > >     162245 ~ 3%     +94.1%     314885 ~ 6%  TOTAL proc-vmstat.num=
a_hint_faults_local
> =

> > It means, for commit ebe06187bf2aec1, the number for
> > num_hint_local_faults is 94500 for ivb42 machine and 67745 for lkp-snb01
> > machine. The 3%, 4% following that number means the deviation of the
> > different runs to their average(we usually run it multiple times to
> > phase out possible sharp values). We should probably remove that
> > percentage, as they cause confusion if no detailed explanation and may
> > not mean much to the commit author and others(if the deviation is big
> > enough, we should simply drop that result).
> =

> Nah, variance is good, but the typical symbol would be +- or the fancy
> =C2=B1.
> =

> ~ when used as a unary op means 'approx' or 'about' or 'same order'
> ~ when used as a binary op means equivalence, a weaker equal, often in
> the vein of the unary op meaning.
> =

> Also see: http://en.wikipedia.org/wiki/Tilde#Mathematics
> =

> So while I think having a measure of variance is good, I think you
> picked entirely the wrong symbol.

Good point! We'll first try =C2=B1 for the stddev percent and fall back to
+- if it turn out to not work well in some cases.

Thanks,
Fengguang

--===============2556136328467960791==--

