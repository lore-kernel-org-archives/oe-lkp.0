Content-Type: multipart/mixed; boundary="===============0703417844092218220=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86,tsc] a4adad8d16: BUG:kernel_hang_in_boot_stage
Date: Tue, 02 May 2017 16:45:23 +0800
Message-ID: <20170502084523.GU31795@yexl-desktop>
In-Reply-To: <20170502082312.GB4626@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0703417844092218220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/02, Peter Zijlstra wrote:
>On Tue, May 02, 2017 at 02:38:54PM +0800, kernel test robot wrote:
>> =

>> FYI, we noticed the following commit:
>> =

>> commit: a4adad8d16a6d2d4208998db794b55ec6e63722f ("x86,tsc: Feed refined=
 TSC calibration into sched_clock")
>
>> [    2.020173] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
>> [    2.159072] random: fast init done
>> [    2.206708] tsc: Refined TSC clocksource calibration: 2925.999 MHz
>
>Crud, I was afraid of that but couldn't actually trigger that on any of
>my real hardware. I'll see if I can reproduce with qemu.

Feel free to try the `lkp qemu` tool, I can reproduce it stably with it.

Thanks,
Xiaolong

--===============0703417844092218220==--

