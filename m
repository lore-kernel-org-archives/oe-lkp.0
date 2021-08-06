Content-Type: multipart/mixed; boundary="===============4782718676892157089=="
MIME-Version: 1.0
From: Chao Gao <chao.gao@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Fri, 06 Aug 2021 10:10:00 +0800
Message-ID: <20210806020958.GA18104@gao-cwp>
In-Reply-To: <20210805153727.GG4397@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============4782718676892157089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 05, 2021 at 08:37:27AM -0700, Paul E. McKenney wrote:
>On Thu, Aug 05, 2021 at 01:39:40PM +0800, Chao Gao wrote:
>> [snip]
>> >> This patch works well; no false-positive (marking TSC unstable) in a
>> >> 10hr stress test.
>> >
>> >Very good, thank you!  May I add your Tested-by?
>> =

>> sure.
>> Tested-by: Chao Gao <chao.gao@intel.com>
>
>Very good, thank you!  I will apply this on the next rebase.
>
>> >I expect that I will need to modify the patch a bit more to check for
>> >a system where it is -never- able to get a good fine-grained read from
>> >the clock.
>> =

>> Agreed.
>> =

>> >And it might be that your test run ended up in that state.
>> =

>> Not that case judging from kernel logs. Coarse-grained check happened 64=
75
>> times in 43k seconds (by grep "coarse-grained skew check" in kernel logs=
).
>> So, still many checks were fine-grained.
>
>Whew!  ;-)
>
>So about once per 13 clocksource watchdog checks.
>
>To Andi's point, do you have enough information in your console log to
>work out the longest run of course-grained clocksource checks?

Yes. 5 consecutive course-grained clocksource checks. Note that
considering the reinitialization after course-grained check, in my
calculation, two course-grained checks are considered consecutive if
they happens in 1s(+/- 0.3s).

Thanks
Chao
--===============4782718676892157089==--

