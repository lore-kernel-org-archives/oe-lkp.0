Content-Type: multipart/mixed; boundary="===============4329622042902151095=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: f8bfff5e6d: WARNING: CPU: 0 PID: 1 at drivers/base/power/common.c:150 dev_pm_domain_set
Date: Mon, 28 Nov 2016 16:32:31 +0800
Message-ID: <20161128083231.jrsude3vibwugbg6@wfg-t540p.sh.intel.com>
In-Reply-To: <20161128043017.GC14931@vireshk-i7>
List-Id: <oe-lkp.lists.linux.dev>

--===============4329622042902151095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

On Mon, Nov 28, 2016 at 10:00:17AM +0530, Viresh Kumar wrote:
>On 26-11-16, 01:56, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.linaro.org/people/vireshk/linux opp/genpd-performance-state
>>
>> commit f8bfff5e6d937251e39602cfd7fb5cd3478934b1
>> Author:     Viresh Kumar <viresh.kumar@linaro.org>
>> AuthorDate: Wed Nov 23 11:01:35 2016 +0530
>> Commit:     Viresh Kumar <viresh.kumar@linaro.org>
>> CommitDate: Fri Nov 25 15:09:07 2016 +0530
>
>Hi Fengguang,
>
>Thanks for your report. Actually the top two patches on this branch are ju=
st for
>testing and can cause such reports. I wanted the tests to cover only upto =
the
>following commit:
>
>780b13eb758d
>
>I had to keep the test patches on the top of the branch, so that others ca=
n see
>how I am testing it out.

Got it. Sorry for the noise! Shall we simply ignore this report?
Since it looks not a typical requirement to avoid testing 2 top
patches, so I see no need to improve the robot for this case. =


Regards,
Fengguang

--===============4329622042902151095==--

