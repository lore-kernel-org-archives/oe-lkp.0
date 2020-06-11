Content-Type: multipart/mixed; boundary="===============7666527499930700343=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [smp] b2a02fc43a: suspend-stress.fail
Date: Thu, 11 Jun 2020 18:10:22 +0200
Message-ID: <20200611161022.GL2531@hirez.programming.kicks-ass.net>
In-Reply-To: <CADjb_WSLpKrkt-Oq_3krGBp8ZLjVZ4caUAd0d0s1_6s1tOHdHQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7666527499930700343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2020 at 04:24:53PM +0800, Chen Yu wrote:
> Hi Peter,
> On Wed, Jun 10, 2020 at 5:52 PM Peter Zijlstra <peterz@infradead.org> w=
rote:
> >
> > On Wed, Jun 10, 2020 at 04:35:02PM +0800, kernel test robot wrote:
> > > Greeting,
> > >
> > > FYI, we noticed the following commit (built with gcc-9):
> > >
> > > commit: b2a02fc43a1f40ef4eb2fb2b06357382608d4d84 ("smp: Optimize send=
_call_function_single_ipi()")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > >
> > > in testcase: suspend-stress
> > > with following parameters:
> > >
> > >       mode: freeze
> > >       iterations: 10
> > >
> > >
> > >
> > > on test machine: 2 threads Broxton with 4G memory
> > >
> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > >
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > >
> > >
> > > the result of this commit:
> > >
> > > test started
> >
> > No dmesg output? No splat?
> This issue was only found on one of the test machines from lkp team.
>  I've borrowed that machine and will try to narrow down and give feedback=
 later.

Thanks! One thing to maybe try is hotplug tests. Suspend does hotplugs,
and it might be easier to debug hotplug than it is to debug suspend.
--===============7666527499930700343==--

