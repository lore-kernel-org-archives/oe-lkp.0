Content-Type: multipart/mixed; boundary="===============0231920368062363032=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Fri, 23 Apr 2021 21:09:58 +0200
Message-ID: <87wnssvmux.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210422074126.GA85095@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0231920368062363032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22 2021 at 15:41, Feng Tang wrote:
> On Thu, Apr 22, 2021 at 02:58:27PM +0800, Xing Zhengjun wrote:
>> It happened during boot and before TSC calibration
>> (tsc_refine_calibration_work()), so on some machines "abs(cs_nsec - wd_n=
sec)
>> > WATCHDOG_THRESHOLD", WATCHDOG_THRESHOLD is set too small at that time.
>> After TSC calibrated, abs(cs_nsec - wd_nsec) should be very small,
>> WATCHDOG_THRESHOLD for here is ok. So I suggest increasing the
>> WATCHDOG_THRESHOLD before TSC calibration, for example, the clocks be sk=
ewed
>> by more than 1% to be marked unstable.
>
> As Zhengjun measuered, this is a Cascade Lake platform, and it has 2
> times calibration of tsc, the first one of early quick calibration gives
> 2100 MHz, while the later accurate calibration gives 2095 MHz, so there
> is about 2.5/1000 deviation for the first number, which just exceeds the
> 1/1000 threshold you set :)
>
> Following is the tsc freq info from kernel log
>
> [    0.000000] DMI: Intel Corporation S2600WFT/S2600WFT, BIOS SE5C620.86B=
.02.01.0008.031920191559 03/19/2019
> [    0.000000] tsc: Detected 2100.000 MHz processor
> ...
> [   13.859982] tsc: Refined TSC clocksource calibration: 2095.077 MHz

Right, that's because in 2021 we still use technology from the last
millenium to figure the correct TSC frequency out by doing a long time
measurement against some other timer where we assume to know the
frequeny it runs with.

Thanks,

        tglx
--===============0231920368062363032==--

