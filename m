Content-Type: multipart/mixed; boundary="===============0931717274025550094=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Tue, 08 Aug 2017 10:19:23 +0200
Message-ID: <20170808081923.holukum37phn3pe4@hirez.programming.kicks-ass.net>
In-Reply-To: <20170808023331.2lk4j3oook23prof@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0931717274025550094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Wu,

On Tue, Aug 08, 2017 at 10:33:31AM +0800, Fengguang Wu wrote:

> > So I'm not in fact able to reproduce.. there used to be an earlier
> > version of this patch that would fail to boot, but I'm thinking git-sha1
> > would not be the same.
> =

> I noticed it's gcc 4.8 and it's probably the culprit. To confirm that
> I tried gcc-6 and find no boot BUG there.

Oh curious, I'll see if I still got a gcc-4.8 around someplace.. It
would be bad if that miscompiled things somehow.

Thanks!

--===============0931717274025550094==--

