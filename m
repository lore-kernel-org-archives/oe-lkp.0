Content-Type: multipart/mixed; boundary="===============3382835712700745313=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mac80211] c752cac9db: hwsim.ap_vlan_iface_cleanup_multibss_per_sta_vif.fail
Date: Thu, 07 Mar 2019 16:21:25 +0800
Message-ID: <20190307082125.GR25100@shao2-debian>
In-Reply-To: <20190307075916.GQ25100@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3382835712700745313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 03:59:16PM +0800, kernel test robot wrote:
> On Thu, Mar 07, 2019 at 07:49:11AM +0000, Tony Chuang wrote:
> > =

> > =

> > > -----Original Message-----
> > > From: kernel test robot [mailto:rong.a.chen(a)intel.com]
> > > Sent: Thursday, March 07, 2019 3:05 PM
> > > To: Tony Chuang
> > > Cc: Johannes Berg; Larry Finger; LKML; Linus Torvalds; lkp(a)01.org
> > > Subject: [LKP] [mac80211] c752cac9db:
> > > hwsim.ap_vlan_iface_cleanup_multibss_per_sta_vif.fail
> > > =

> > > FYI, we noticed the following commit (built with gcc-8):
> > > =

> > > commit: c752cac9db1b0c469db7ba9d17af4ba708984db5 ("mac80211: fix
> > > GFP_KERNEL under tasklet context")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > > in testcase: hwsim
> > > with following parameters:
> > > =

> > > 	group: hwsim-02
> > > =

> > > =

> > > =

> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2
> > > -m 4G
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire
> > > log/backtrace):
> > > =

> > =

> > <...>
> > =

> > > =

> > > 2019-03-06 14:51:15 	./run-tests.py ap_vlan_iface_cleanup_multibss
> > > DEV: wlan0: 02:00:00:00:00:00
> > > DEV: wlan1: 02:00:00:00:01:00
> > > DEV: wlan2: 02:00:00:00:02:00
> > > APDEV: wlan3
> > > APDEV: wlan4
> > > START ap_vlan_iface_cleanup_multibss 1/1
> > > Test: AP VLAN operation in multi-BSS multi-VLAN case
> > > RTNETLINK answers: File exists
> > > Starting AP wlan4
> > > Starting interface wlan3
> > > Connect STA wlan0 to AP
> > > Connect STA wlan1 to AP
> > > wlan0 -> VLAN 2
> > > test wlan1 =3D=3D VLAN 1
> > > wlan1 -> VLAN 2
> > > test wlan0 =3D=3D VLAN 2
> > > PASS ap_vlan_iface_cleanup_multibss 3.037115 2019-03-06 14:51:19.3625=
36
> > > passed all 1 test case(s)
> > > 2019-03-06 14:51:19 	./run-tests.py
> > > ap_vlan_iface_cleanup_multibss_per_sta_vif
> > > DEV: wlan0: 02:00:00:00:00:00
> > > DEV: wlan1: 02:00:00:00:01:00
> > > DEV: wlan2: 02:00:00:00:02:00
> > > APDEV: wlan3
> > > APDEV: wlan4
> > > START ap_vlan_iface_cleanup_multibss_per_sta_vif 1/1
> > > Test: AP VLAN operation in multi-BSS multi-VLAN case with per-sta-vif=
 set
> > > Starting AP wlan4
> > > Starting interface wlan3
> > > Connect STA wlan0 to AP
> > > Connect STA wlan1 to AP
> > > dev1->dev2 unicast data delivery failed
> > > Traceback (most recent call last):
> > >   File "./run-tests.py", line 466, in main
> > >     t(dev, apdev)
> > >   File "/lkp/benchmarks/hwsim/tests/hwsim/test_ap_vlan.py", line 505,=
 in
> > > test_ap_vlan_iface_cleanup_multibss_per_sta_vif
> > >     'multi-bss-iface-per_sta_vif.conf')
> > >   File "/lkp/benchmarks/hwsim/tests/hwsim/test_ap_vlan.py", line 413,=
 in
> > > ap_vlan_iface_cleanup_multibss
> > >     hwsim_utils.test_connectivity_iface(dev[1], hapd1, "brvlan1")
> > >   File "/lkp/benchmarks/hwsim/tests/hwsim/hwsim_utils.py", line 176, =
in
> > > test_connectivity_iface
> > >     max_tries=3Dmax_tries, timeout=3Dtimeout)
> > >   File "/lkp/benchmarks/hwsim/tests/hwsim/hwsim_utils.py", line 169, =
in
> > > test_connectivity
> > >     raise Exception(last_err)
> > > Exception: dev1->dev2 unicast data delivery failed
> > > FAIL ap_vlan_iface_cleanup_multibss_per_sta_vif 6.917146 2019-03-06
> > > 14:51:26.784664
> > > passed 0 test case(s)
> > > skipped 0 test case(s)
> > > failed tests: ap_vlan_iface_cleanup_multibss_per_sta_vif
> > =

> > <...>
> > =

> > > =

> > > =

> > > To reproduce:
> > > =

> > >         # build kernel
> > > 	cd linux
> > > 	cp config-4.19.0-12453-gc752cac .config
> > > 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 olddefconfig
> > > 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 prepare
> > > 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 modules_prepare
> > > 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 SHELL=3D/bin/bash
> > > 	make HOSTCC=3Dgcc-8 CC=3Dgcc-8 ARCH=3Dx86_64 bzImage
> > > =

> > > =

> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         bin/lkp qemu -k <bzImage> job-script # job-script is attached=
 in this
> > > email
> > > =

> > > =

> > > =

> > > Thanks,
> > > Rong Chen
> > =

> > =

> > It looks really strange that this patch failed the test.
> > And I checked the dmesg, the log shows me that
> > =

> > PASS ap_vlan_iface_cleanup_multibss_per_sta_vif
> > =

> > At line 24000.
> =

> Hi,
> =

> This doesn't happen every time. Here is a bad result:
> =

> 2019-03-06 14:51:19     ./run-tests.py ap_vlan_iface_cleanup_multibss_per=
_sta_vif =

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
>   File "/lkp/benchmarks/hwsim/tests/hwsim/test_ap_vlan.py", line 505, in =
test_ap_vlan_iface_cleanup_multibss_per_sta_vif
>     'multi-bss-iface-per_sta_vif.conf')
>   File "/lkp/benchmarks/hwsim/tests/hwsim/test_ap_vlan.py", line 413, in =
ap_vlan_iface_cleanup_multibss
>     hwsim_utils.test_connectivity_iface(dev[1], hapd1, "brvlan1")
>   File "/lkp/benchmarks/hwsim/tests/hwsim/hwsim_utils.py", line 176, in t=
est_connectivity_iface
>     max_tries=3Dmax_tries, timeout=3Dtimeout)
>   File "/lkp/benchmarks/hwsim/tests/hwsim/hwsim_utils.py", line 169, in t=
est_connectivity
>     raise Exception(last_err)
> Exception: dev1->dev2 unicast data delivery failed
> FAIL ap_vlan_iface_cleanup_multibss_per_sta_vif 6.917146 2019-03-06 14:51=
:26.784664
> passed 0 test case(s)
> skipped 0 test case(s)
> failed tests: ap_vlan_iface_cleanup_multibss_per_sta_vif
> =


Sorry, ap_vlan_iface_cleanup_multibss_per_sta_vif.fail is this one, but hws=
im.ap_wpa2_eap_aka_sql fails too.
the kernel of parent commit can't run successfully, I'm not 100% sure the f=
ailure was caused by this commit.

81c5dce2cd0bb0ec c752cac9db1b0c469db7ba9d17a
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :90          14%          13:91    hwsim.ap_vlan_iface_cleanup_m=
ultibss_per_sta_vif.fail
           :90           9%           8:91    stderr.Failed_to_connect_to_h=
ostapd-wpa_ctrl_open:No_such_file_or_directory
         90:90        -100%            :91    dmesg.BUG:sleeping_function_c=
alled_from_invalid_context_at_mm/slab.h
           :90           6%           5:91    dmesg.RIP:__ieee80211_beacon_=
get[mac80211]
           :90           1%           1:91    dmesg.RIP:console_unlock
           :90           6%           5:91    dmesg.WARNING:at_net/mac80211=
/tx.c:#__ieee80211_beacon_get/0x
         90:90         -94%           5:91    dmesg.boot_failures
      21732:90      -24148%            :91    dmesg.timestamp:BUG:sleeping_=
function_called_from_invalid_context_at_mm/slab.h
           :90       14125%       12712:91    dmesg.timestamp:RIP:__ieee802=
11_beacon_get[mac80211]
           :90        3137%        2822:91    dmesg.timestamp:RIP:console_u=
nlock
           :90       14125%       12712:91    dmesg.timestamp:WARNING:at_ne=
t/mac80211/tx.c:#__ieee80211_beacon_get/0x
      22439:90       70264%       85676:91    dmesg.timestamp:last

Best Regards,
Rong Chen

--===============3382835712700745313==--

