Content-Type: multipart/mixed; boundary="===============0904666297938496616=="
MIME-Version: 1.0
From: Brown, Len <len.brown@intel.com>
To: lkp@lists.01.org
Subject: Re: x86 idle: pigz.throughput regression
Date: Tue, 14 Jan 2014 10:06:15 +0000
Message-ID: <1A7043D5F58CCB44A599DFD55ED4C948452C18D0@FMSMSX106.amr.corp.intel.com>
In-Reply-To: <20140110092127.GA1925@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0904666297938496616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Is this on a NHM-EX or WSM-EX machine?
> =

> The regressed test case is lkp-nex04/micro/pigz/100%, where lkp-nex04 is
> a NHM-EX machine.
> =

>       v3.13-rc4  40e2d7f9b5dae048789c64672
> ---------------  -------------------------
>        414 ~ 0%      -6.1%        389 ~ 0%  pigz.throughput

What do these numbers mean?

What is the typical variance in this test when
run multiple times?

> > How much idle time/idle transitions are there in this workload?
> =

> CPU idle time is 12%. What do you mean by idle transitions and how to
> measure it?

Transitions to idle are counted in
/sys/devices/system/cpu/cpu*/cpuidle/*/usage

so you can snapshot those counts,
run the workload, snapshot again,
and the difference is the number of transitions
by each processor to each state during the test.

Also interesting would be the output on this machine of

dmesg | grep idle

grep . /sys/devices/system/cpu/cpu*/cpuidle/*/*

and the output from =


# turbostat -v {pigz invocation here} > pigz.out 2>&1

Can you tell me exactly how to run this test
so that I can reproduce on my WSM-EX?

thanks,
-Len


> =

> Detailed numbers in
> /lkp/result/lkp-nex04/micro/pigz/100%/x86_64-
> lkp/40e2d7f9b5dae048789c64672bf3027fbb663ffa/matrix.json:
> =

>   "vmstat.cpu.us": [
>     86,
>     87,
>     86,
>     86,
>     86
>   ],
>   "vmstat.cpu.sy": [
>     1,
>     1,
>     1,
>     1,
>     1
>   ],
>   "vmstat.cpu.id": [
>     12,
>     11,
>     12,
>     12,
>     12
>   ],
> =

> Thanks,
> Fengguang


--===============0904666297938496616==--

