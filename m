Content-Type: multipart/mixed; boundary="===============8796468914045256671=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86,tsc] a4adad8d16: BUG:kernel_hang_in_boot_stage
Date: Wed, 03 May 2017 09:00:40 +0800
Message-ID: <20170503010040.GW31795@yexl-desktop>
In-Reply-To: <20170502102234.dfsb5ieuymndsxbb@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8796468914045256671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/02, Peter Zijlstra wrote:
>On Tue, May 02, 2017 at 04:45:23PM +0800, Ye Xiaolong wrote:
>> On 05/02, Peter Zijlstra wrote:
>> >On Tue, May 02, 2017 at 02:38:54PM +0800, kernel test robot wrote:
>> >> =

>> >> FYI, we noticed the following commit:
>> >> =

>> >> commit: a4adad8d16a6d2d4208998db794b55ec6e63722f ("x86,tsc: Feed refi=
ned TSC calibration into sched_clock")
>> >
>> >> [    2.020173] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
>> >> [    2.159072] random: fast init done
>> >> [    2.206708] tsc: Refined TSC clocksource calibration: 2925.999 MHz
>> >
>> >Crud, I was afraid of that but couldn't actually trigger that on any of
>> >my real hardware. I'll see if I can reproduce with qemu.
>> =

>> Feel free to try the `lkp qemu` tool, I can reproduce it stably with it.
>
>That's not working....
>
>root(a)ivb-ep:/usr/local/src/lkp-tests# bin/lkp qemu -k /usr/src/linux-2.6=
/defconfig-build/arch/x86/boot/bzImage
>Usage: lkp qemu [-o RESULT_ROOT] [-p VDISK_PATH] [-s SSH_PORT] [-k bzImage=
] job.sh

Hmm, the `lkp qemu` tool needs job-script (attached in the original report)=
 as
its parameter, the usage is like:

bin/lkp qemu -k /usr/src/linux-2.6/defconfig-build/arch/x86/boot/bzImage jo=
b-script
>
>So now I have to go reverse engineer said tool to figure out what qemu
>parameters it wants to use... which is why I hate all tools.

`lkp qemu` tool would automatically figure out the exact qemu parameters as=
 0day
robot used from the job-script, we hope it would save some efforts. =


Thanks,
Xiaolong

>
>
>In any case, the trick seems to be to boot UP, something I had not done.
>I had in fact tried KVM with SMP setups.
>
>

--===============8796468914045256671==--

