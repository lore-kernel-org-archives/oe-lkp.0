Content-Type: multipart/mixed; boundary="===============9051724863993048089=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 1eb70f54c4: xfstests.xfs.348.fail
Date: Fri, 10 Jun 2022 13:38:07 +0800
Message-ID: <20220610053807.GA9136@xsang-OptiPlex-9020>
In-Reply-To: <20220602214436.GF1098723@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============9051724863993048089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, Jun 03, 2022 at 07:44:36AM +1000, Dave Chinner wrote:
> >     ...
> >     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/348.out /lkp/bench=
marks/xfstests/results//xfs/348.out.bad'  to see the entire diff)
> > xfs/349	[failed, exit status 1]- output mismatch (see /lkp/benchmarks/x=
fstests/results//xfs/349.out.bad)
> >     --- tests/xfs/349.out	2022-05-16 16:42:32.000000000 +0000
> >     +++ /lkp/benchmarks/xfstests/results//xfs/349.out.bad	2022-05-18 11=
:53:51.101272360 +0000
> >     @@ -1,3 +1,2 @@
> >      QA output created by 349
> >      Format and populate
> >     -Scrub
> >     ...
> >     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/349.out /lkp/bench=
marks/xfstests/results//xfs/349.out.bad'  to see the entire diff)
> =

> You are running a test in the "dangerous_fuzzers" group that isn't
> in the auto group. This is a test for developers to find error
> detection issues and, as such, failure is kinda expected. It is not
> regression test that can be used for pass/fail testing....

Thanks a lot for guidance! we will disable auto tests in "dangerous_fuzzers"
group.

> =

> Cheers,
> =

> Dave.
> -- =

> Dave Chinner
> david(a)fromorbit.com
--===============9051724863993048089==--

