Content-Type: multipart/mixed; boundary="===============5277524283805968700=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: f8bfff5e6d: WARNING: CPU: 0 PID: 1 at drivers/base/power/common.c:150 dev_pm_domain_set
Date: Mon, 28 Nov 2016 10:00:17 +0530
Message-ID: <20161128043017.GC14931@vireshk-i7>
In-Reply-To: <58387b39.67FfGFeAWh/FIiem%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5277524283805968700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 26-11-16, 01:56, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.linaro.org/people/vireshk/linux opp/genpd-performance-state
> =

> commit f8bfff5e6d937251e39602cfd7fb5cd3478934b1
> Author:     Viresh Kumar <viresh.kumar@linaro.org>
> AuthorDate: Wed Nov 23 11:01:35 2016 +0530
> Commit:     Viresh Kumar <viresh.kumar@linaro.org>
> CommitDate: Fri Nov 25 15:09:07 2016 +0530

Hi Fengguang,

Thanks for your report. Actually the top two patches on this branch are jus=
t for
testing and can cause such reports. I wanted the tests to cover only upto t=
he
following commit:

780b13eb758d

I had to keep the test patches on the top of the branch, so that others can=
 see
how I am testing it out.


-- =

viresh

--===============5277524283805968700==--

