Content-Type: multipart/mixed; boundary="===============8161235044194884149=="
MIME-Version: 1.0
From: Tony Chuang <yhchuang@realtek.com>
To: lkp@lists.01.org
Subject: Re: [mac80211] c752cac9db: hwsim.ap_vlan_iface_cleanup_multibss_per_sta_vif.fail
Date: Thu, 07 Mar 2019 07:49:11 +0000
Message-ID: <F7CD281DE3E379468C6D07993EA72F84D17B4425@RTITMBSVM04.realtek.com.tw>
In-Reply-To: <20190307070450.GO25100@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8161235044194884149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: kernel test robot [mailto:rong.a.chen(a)intel.com]
> Sent: Thursday, March 07, 2019 3:05 PM
> To: Tony Chuang
> Cc: Johannes Berg; Larry Finger; LKML; Linus Torvalds; lkp(a)01.org
> Subject: [LKP] [mac80211] c752cac9db:
> hwsim.ap_vlan_iface_cleanup_multibss_per_sta_vif.fail
> =

> FYI, we noticed the following commit (built with gcc-8):
> =

> commit: c752cac9db1b0c469db7ba9d17af4ba708984db5 ("mac80211: fix
> GFP_KERNEL under tasklet context")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: hwsim
> with following parameters:
> =

> 	group: hwsim-02
> =

> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2
> -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =


<...>

> =

> 2019-03-06 14:51:15 	./run-tests.py ap_vlan_iface_cleanup_multibss
> DEV: wlan0: 02:00:00:00:00:00
> DEV: wlan1: 02:00:00:00:01:00
> DEV: wlan2: 02:00:00:00:02:00
> APDEV: wlan3
> APDEV: wlan4
> START ap_vlan_iface_cleanup_multibss 1/1
> Test: AP VLAN operation in multi-BSS multi-VLAN case
> RTNETLINK answers: File exists
> Starting AP wlan4
> Starting interface wlan3
> Connect STA wlan0 to AP
> Connect STA wlan1 to AP
> wlan0 -> VLAN 2
> test wlan1 =3D=3D VLAN 1
> wlan1 -> VLAN 2
> test wlan0 =3D=3D VLAN 2
> PASS ap_vlan_iface_cleanup_multibss 3.037115 2019-03-06 14:51:19.362536
> passed all 1 test case(s)
> 2019-03-06 14:51:19 	./run-tests.py
> ap_vlan_iface_cleanup_multibss_per_sta_vif
> DEV: wlan0: 02:00:00:00:00:00
> DEV: wlan1: 02:00:00:00:01:00
> DEV: wlan2: 02:00:00:00:02:00
> APDEV: wlan3
> APDEV: wlan4
> START ap_vlan_iface_cleanup_multibss_per_sta_vif 1/1
> Test: AP VLAN operation in multi-BSS multi-VLAN case with per-sta-vif set
> Starting AP wlan4
> Starting interface wlan3
> Connect STA wlan0 to AP
> Connect STA wlan1 to AP
> dev1->dev2 unicast data delivery failed
> Traceback (most recent call last):
>   File "./run-tests.py", line 466, in main
>     t(dev, apdev)
>   File "/lkp/benchmarks/hwsim/tests/hwsim/test_ap_vlan.py", line 505, in
> test_ap_vlan_iface_cleanup_multibss_per_sta_vif
>     'multi-bss-iface-per_sta_vif.conf')
>   File "/lkp/benchmarks/hwsim/tests/hwsim/test_ap_vlan.py", line 413, in
> ap_vlan_iface_cleanup_multibss
>     hwsim_utils.test_connectivity_iface(dev[1], hapd1, "brvlan1")
>   File "/lkp/benchmarks/hwsim/tests/hwsim/hwsim_utils.py", line 176, in
> test_connectivity_iface
>     max_tries=3Dmax_tries, timeout=3Dtimeout)
>   File "/lkp/benchmarks/hwsim/tests/hwsim/hwsim_utils.py", line 169, in
> test_connectivity
>     raise Exception(last_err)
> Exception: dev1->dev2 unicast data delivery failed
> FAIL ap_vlan_iface_cleanup_multibss_per_sta_vif 6.917146 2019-03-06
> 14:51:26.784664
> passed 0 test case(s)
> skipped 0 test case(s)
> failed tests: ap_vlan_iface_cleanup_multibss_per_sta_vif

<...>

> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-4.19.0-12453-gc752cac .config
> 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 olddefconfig
> 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 prepare
> 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 modules_prepare
> 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 SHELL=3D/bin/bash
> 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 bzImage
> =

> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this
> email
> =

> =

> =

> Thanks,
> Rong Chen


It looks really strange that this patch failed the test.
And I checked the dmesg, the log shows me that

PASS ap_vlan_iface_cleanup_multibss_per_sta_vif

At line 24000.

So I think I need to reproduce this to confirm it.
Or anyone has any idea please let me know.
Thanks

Yan-Hsuan

--===============8161235044194884149==--

