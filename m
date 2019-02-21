Content-Type: multipart/mixed; boundary="===============0862069097659385880=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [driver core] 570d020012: will-it-scale.per_thread_ops -12.2% regression
Date: Thu, 21 Feb 2019 13:46:54 +0800
Message-ID: <20190221054654.GC28147@shao2-debian>
In-Reply-To: <20190221034612.GA15147@richard>
List-Id: <oe-lkp.lists.linux.dev>

--===============0862069097659385880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2019 at 11:46:12AM +0800, Wei Yang wrote:
> On Thu, Feb 21, 2019 at 11:10:49AM +0800, kernel test robot wrote:
> >On Tue, Feb 19, 2019 at 01:19:04PM +0100, Greg Kroah-Hartman wrote:
> >> On Tue, Feb 19, 2019 at 08:59:45AM +0800, Wei Yang wrote:
> >> > On Mon, Feb 18, 2019 at 03:54:42PM +0800, kernel test robot wrote:
> >> > >Greeting,
> >> > >
> >> > >FYI, we noticed a -12.2% regression of will-it-scale.per_thread_ops=
 due to commit:
> >> > >
> >> > >
> >> > >commit: 570d0200123fb4f809aa2f6226e93a458d664d70 ("driver core: mov=
e device->knode_class to device_private")
> >> > >https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git ma=
ster
> >> > >
> >> > =

> >> > This is interesting.
> >> > =

> >> > I didn't expect the move of this field will impact the performance.
> >> > =

> >> > The reason is struct device is a hotter memory than device->device_p=
rivate?
> >> > =

> >> > >in testcase: will-it-scale
> >> > >on test machine: 288 threads Knights Mill with 80G memory
> >> > >with following parameters:
> >> > >
> >> > >	nr_task: 100%
> >> > >	mode: thread
> >> > >	test: unlink2
> >> > >	cpufreq_governor: performance
> >> > >
> >> > >test-description: Will It Scale takes a testcase and runs it from 1=
 through to n parallel copies to see if the testcase will scale. It builds =
both a process and threads based test in order to see any differences betwe=
en the two.
> >> > >test-url: https://github.com/antonblanchard/will-it-scale
> >> > >
> >> > >In addition to that, the commit also has significant impact on the =
following tests:
> >> > >
> >> > >+------------------+-----------------------------------------------=
----------------+
> >> > >| testcase: change | will-it-scale: will-it-scale.per_thread_ops -2=
9.9% regression |
> >> > >| test machine     | 288 threads Knights Mill with 80G memory      =
                |
> >> > >| test parameters  | cpufreq_governor=3Dperformance                =
                  |
> >> > >|                  | mode=3Dthread                                 =
                  |
> >> > >|                  | nr_task=3D100%                                =
                  |
> >> > >|                  | test=3Dsignal1                                =
                  |
> >> =

> >> Ok, I'm going to blame your testing system, or something here, and not
> >> the above patch.
> >> =

> >> All this test does is call raise(3).  That does not touch the driver
> >> core at all.
> >> =

> >> > >+------------------+-----------------------------------------------=
----------------+
> >> > >| testcase: change | will-it-scale: will-it-scale.per_thread_ops -1=
6.5% regression |
> >> > >| test machine     | 288 threads Knights Mill with 80G memory      =
                |
> >> > >| test parameters  | cpufreq_governor=3Dperformance                =
                  |
> >> > >|                  | mode=3Dthread                                 =
                  |
> >> > >|                  | nr_task=3D100%                                =
                  |
> >> > >|                  | test=3Dopen1                                  =
                  |
> >> > >+------------------+-----------------------------------------------=
----------------+
> >> =

> >> Same here, open1 just calls open/close a lot.  No driver core
> >> interaction at all there either.
> >> =

> >> So are you _sure_ this is the offending patch?
> >
> >Hi Greg,
> >
> >We did an experiment, recovered the layout of struct device. and we
> >found the regression is gone. I guess the regession is not from the
> >patch but related to the struct layout.
> >
> >
> >tests: 1
> >testcase/path_params/tbox_group/run: will-it-scale/performance-thread-10=
0%-unlink2/lkp-knm01
> >
> >570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

> >----------------  --------------------------  =

> >         %stddev      change         %stddev
> >             \          |                \  =

> >    237096              14%     270789        will-it-scale.workload
> >       823              14%        939        will-it-scale.per_thread_o=
ps
> >
> =

> Do you have the comparison between a36dc70b810afe9183de2ea18f and the one
> before 570d020012?

testcase/path_params/tbox_group/run: will-it-scale/performance-thread-100%-=
unlink2/lkp-knm01

4bd4e92cfe6d2af7 a36dc70b810afe9183de2ea18f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    937.00            +0.2%     939.33        will-it-scale.per_thread_ops
    269989            +0.3%     270789        will-it-scale.workload

> >
> >tests: 1
> >testcase/path_params/tbox_group/run: will-it-scale/performance-thread-10=
0%-signal1/lkp-knm01
> >
> >570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

> >----------------  --------------------------  =

> >         %stddev      change         %stddev
> >             \          |                \  =

> >     93.51 =C2=B1  3%        48%     138.53 =C2=B1  3%  will-it-scale.ti=
me.user_time
> >       186              40%        261        will-it-scale.per_thread_o=
ps
> >     53909              40%      75507        will-it-scale.workload
> >

testcase/path_params/tbox_group/run: will-it-scale/performance-thread-100%-=
signal1/lkp-knm01

4bd4e92cfe6d2af7 a36dc70b810afe9183de2ea18f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    266.00 =C2=B1  2%      -1.6%     261.67        will-it-scale.per_thread=
_ops
     76699 =C2=B1  2%      -1.6%      75507        will-it-scale.workload

> >
> >tests: 1
> >testcase/path_params/tbox_group/run: will-it-scale/performance-thread-10=
0%-open1/lkp-knm01
> >
> >570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

> >----------------  --------------------------  =

> >         %stddev      change         %stddev
> >             \          |                \  =

> >    447722              22%     546258 =C2=B1 10%  will-it-scale.time.in=
voluntary_context_switches
> >    226995              19%     269751        will-it-scale.workload
> >       787              19%        936        will-it-scale.per_thread_o=
ps
> >
> >

testcase/path_params/tbox_group/run: will-it-scale/performance-thread-100%-=
open1/lkp-knm01

4bd4e92cfe6d2af7 a36dc70b810afe9183de2ea18f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    944.60            -0.9%     936.00        will-it-scale.per_thread_ops
    272252            -0.9%     269751        will-it-scale.workload

Best Regards,
Rong Chen

--===============0862069097659385880==--

