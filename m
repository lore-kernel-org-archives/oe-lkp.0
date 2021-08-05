Content-Type: multipart/mixed; boundary="===============5428410862331913478=="
MIME-Version: 1.0
From: Chao Gao <chao.gao@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 05 Aug 2021 13:39:40 +0800
Message-ID: <20210805053938.GA12593@gao-cwp>
In-Reply-To: <20210805040349.GD4397@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============5428410862331913478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[snip]
>> This patch works well; no false-positive (marking TSC unstable) in a
>> 10hr stress test.
>
>Very good, thank you!  May I add your Tested-by?

sure.
Tested-by: Chao Gao <chao.gao@intel.com>

>
>I expect that I will need to modify the patch a bit more to check for
>a system where it is -never- able to get a good fine-grained read from
>the clock.

Agreed.

>And it might be that your test run ended up in that state.

Not that case judging from kernel logs. Coarse-grained check happened 6475
times in 43k seconds (by grep "coarse-grained skew check" in kernel logs).
So, still many checks were fine-grained.

>
>My current thought is that if more than (say) 100 consecutive attempts
>to read the clocksource get hit with excessive delays, it is time to at
>least do a WARN_ON(), and maybe also time to disable the clocksource
>due to skew.  The reason is that if reading the clocksource -always-
>sees excessive delays, perhaps the clock driver or hardware is to blame.
>
>Thoughts?

It makes sense to me.

Thanks
Chao
--===============5428410862331913478==--

