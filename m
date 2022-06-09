Content-Type: multipart/mixed; boundary="===============6479493372440873528=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk@linaro.org>
To: lkp@lists.01.org
Subject: Re: [cgroup] 3c87862ca1: WARNING:at_kernel/softirq.c:#__local_bh_enable_ip
Date: Thu, 09 Jun 2022 07:30:41 -0700
Message-ID: <b39cdb9c-aa2a-0f49-318b-8632b2989433@linaro.org>
In-Reply-To: <20220609085641.GB17678@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6479493372440873528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/9/22 01:56, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 3c87862ca13147416d900cf82ca56bb2f23910bf ("[PATCH v2] cgroup: ser=
ialize css kill and release paths")
> url:https://github.com/intel-lab-lkp/linux/commits/Tadeusz-Struk/cgroup-s=
erialize-css-kill-and-release-paths/20220606-014132
> base:https://git.kernel.org/cgit/linux/kernel/git/tj/cgroup.git  for-next
> patch link:https://lore.kernel.org/netdev/20220603181321.443716-1-tadeusz=
.struk(a)linaro.org
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot<oliver.sang@intel.com>
> =

> =

> [ 55.821003][ C1] WARNING: CPU: 1 PID: 1 at kernel/softirq.c:363 __local_=
bh_enable_ip (kernel/softirq.c:363)

Looks like that will need to be spin_lock_irq(&css->lock) instead of spin_l=
ock_bh(&css->lock)
I can respin the patch, but I would like to request some feedback on it fir=
st.

Tejun, Michal
Are you interested in fixing this at syzbot issue all? Do you have any more=
 feedback on this?

-- =

Thanks,
Tadeusz
--===============6479493372440873528==--

