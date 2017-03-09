Content-Type: multipart/mixed; boundary="===============5750423174063840148=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] ed3ce2a917: BUG:unable_to_handle_kernel
Date: Thu, 09 Mar 2017 10:30:52 +0800
Message-ID: <20170309023052.grzkmd2m6cttnesv@wfg-t540p.sh.intel.com>
In-Reply-To: <20170309021310.GB11500@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5750423174063840148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 10:13:10AM +0800, Ye Xiaolong wrote:
>On 03/02, Borislav Petkov wrote:
>>Hi,
>>
>>On Thu, Mar 02, 2017 at 09:09:34AM +0800, kernel test robot wrote:
>>>
>>> FYI, we noticed the following commit:
>>>
>>> commit: ed3ce2a9172457ef7dbaa9f964e63dfde2bdcb5f ("x86: Optimize clear_=
page()")
>>> url: https://github.com/0day-ci/linux/commits/Borislav-Petkov/x86-Optim=
ize-clear_page/20170215-193441
>>>
>>>
>>> in testcase: will-it-scale
>>> with following parameters:
>>>
>>> 	test: poll2
>>> 	cpufreq_governor: performance
>>>
>>> test-description: Will It Scale takes a testcase and runs it from 1 thr=
ough to n parallel copies to see if the testcase will scale. It builds both=
 a process and threads based test in order to see any differences between t=
he two.
>>> test-url: https://github.com/antonblanchard/will-it-scale
>>
>>thanks for the report, I was able to reproduce.
>>
>>BUT(!) this report is misleading because it talks about will-it-scale
>>but your splat happens when you kexec the kernel:
>>
>>  [  336.340747] LKP: kexec loading...
>>  [  336.340852]
>>  [  336.343323] kexec --noefi -l /tmp/cache/pkg/linux/x86_64-rhel-7.2/gc=
c-6/ed3ce2a9172457ef7dbaa9f964e63dfde2bdcb5f/vmlinuz-4.9.0-rc6-00134-ged3ce=
2a --initrd=3D/tmp/cache/initrd-concatenated
>>  [  336.343758]
>>  [  337.893471] --append=3Dip=3D::::lkp-ivb-d01::dhcp root=3D/dev/ram0 u=
ser=3Dlkp job=3D/lkp/scheduled/lkp-ivb-d01/will-it-scale-poll2-performance-=
debian-x86_64-2016-08-31.cgz-ed3ce2a9172457ef7dbaa9f964e63dfde2bdcb5f-20170=
301-28072-1dqjyhl-11.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-7.2 branch=3D=
linux-devel/devel-hourly-2017022612 commit=3Ded3ce2a9172457ef7dbaa9f964e63d=
fde2bdcb5f BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-7.2/gcc-6/ed3ce2a9172457ef7d=
baa9f964e63dfde2bdcb5f/vmlinuz-4.9.0-rc6-00134-ged3ce2a max_uptime=3D1500 R=
ESULT_ROOT=3D/result/will-it-scale/poll2-performance/lkp-ivb-d01/debian-x86=
_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/ed3ce2a9172457ef7dbaa9f964e63dfde2=
bdcb5f/11 LKP_SERVER=3Dinn debug apic=3Ddebug sysrq_always_enabled rcupdate=
.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1=
 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 pr=
ompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_
>>  [  337.895521]
>>  [  339.467661] BUG: unable to handle kernel paging request at ffff8803c=
f2e2008
>>  [  339.468000] IP: [<ffffffff81061e71>] native_set_pmd+0x1/0x10
>>  ...
>>
>>
>>Maybe Fengguang has an idea what to do here, maybe something like add
>>markers to the log to denote where the test environment is prepared and
>>when the actual test starts. Then grep for those and generate the report
>>based on that...
>
>Thanks for the suggestions, we'll keep improving the reports to avoid conf=
usion
>or misleading.

One possible improvement is to provide "lkp qemu" reproduce steps for
kernel oops -- it would be way more convenient and safe to follow than
"lkp run", since the later risks hang the physical machine.

As for the test description, the dmesg carries markers for the user
space test start/stop points, so the robot can easily tell whether the
oops happen during the test or before/after the test -- the latter may
well (but not always) indicate the oops is not relevant to the testcase,
but to the regular kernel boot/reboot/kexec process.

Thanks,
Fengguang

--===============5750423174063840148==--

