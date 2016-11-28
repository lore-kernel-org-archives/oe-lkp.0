Content-Type: multipart/mixed; boundary="===============4907432385971572529=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: f8bfff5e6d: WARNING: CPU: 0 PID: 1 at drivers/base/power/common.c:150 dev_pm_domain_set
Date: Mon, 28 Nov 2016 14:04:08 +0530
Message-ID: <20161128083408.GB9104@vireshk-i7>
In-Reply-To: <20161128083231.jrsude3vibwugbg6@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4907432385971572529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 28-11-16, 16:32, Fengguang Wu wrote:
> Hi Viresh,
> =

> On Mon, Nov 28, 2016 at 10:00:17AM +0530, Viresh Kumar wrote:
> >On 26-11-16, 01:56, kernel test robot wrote:
> >>Greetings,
> >>
> >>0day kernel testing robot got the below dmesg and the first bad commit =
is
> >>
> >>https://git.linaro.org/people/vireshk/linux opp/genpd-performance-state
> >>
> >>commit f8bfff5e6d937251e39602cfd7fb5cd3478934b1
> >>Author:     Viresh Kumar <viresh.kumar@linaro.org>
> >>AuthorDate: Wed Nov 23 11:01:35 2016 +0530
> >>Commit:     Viresh Kumar <viresh.kumar@linaro.org>
> >>CommitDate: Fri Nov 25 15:09:07 2016 +0530
> >
> >Hi Fengguang,
> >
> >Thanks for your report. Actually the top two patches on this branch are =
just for
> >testing and can cause such reports. I wanted the tests to cover only upt=
o the
> >following commit:
> >
> >780b13eb758d
> >
> >I had to keep the test patches on the top of the branch, so that others =
can see
> >how I am testing it out.
> =

> Got it. Sorry for the noise!

Don't be sorry, you guys are helping out lots of people with your good work=
 :)

> Shall we simply ignore this report?

Yes.

> Since it looks not a typical requirement to avoid testing 2 top
> patches, so I see no need to improve the robot for this case.

I agree. Thanks.

-- =

viresh

--===============4907432385971572529==--

