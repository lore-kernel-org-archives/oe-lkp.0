Content-Type: multipart/mixed; boundary="===============5137414756179937569=="
MIME-Version: 1.0
From: Paul Lemmermann <thepaulodoom@thepaulodoom.com>
To: lkp@lists.01.org
Subject: Re: [crypto] 8505b026c9: hwsim.fils_sk_hlp_oom.fail
Date: Tue, 12 Apr 2022 15:36:47 -0500
Message-ID: <YlXi3wmj30rM258J@hp-amd-paul>
In-Reply-To: <20220411103421.GC21954@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5137414756179937569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 06:34:21PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 8505b026c91a3e6d6c562a1fe46c2b8c20835de8 ("[PATCH] crypto: aes_ge=
neric: fixed styling warnings")

According to the following emails, it was agreed to drop this patch:
https://lore.kernel.org/linux-crypto/CAMj1kXHCR1nD24WDnYpD4Nu23x9+hw+=3D7EX=
Opq7y7m9LDk2J0w(a)mail.gmail.com/
https://lore.kernel.org/linux-crypto/20220328125137.bsbvroyxcjw6rl5m(a)hp-a=
md-paul/

Regards,
Paul

> url: https://github.com/intel-lab-lkp/linux/commits/Paul-Lemmermann/crypt=
o-aes_generic-fixed-styling-warnings/20220327-014837
> base: https://git.kernel.org/cgit/linux/kernel/git/herbert/cryptodev-2.6.=
git master
> patch link: https://lore.kernel.org/linux-crypto/20220326172051.14722-1-t=
hepaulodoom(a)thepaulodoom.com
> =

> in testcase: hwsim
> version: hwsim-x86_64-717e5d7-1_20220325
> with following parameters:
> =

> 	test: group-36
> 	ucode: 0x21
> =

> =

> =

> on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30=
GHz with 8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> =

> 2022-04-07 14:59:07 ./run-tests.py fils_sk_hlp_oom
> DEV: wlan0: 02:00:00:00:00:00
> DEV: wlan1: 02:00:00:00:01:00
> DEV: wlan2: 02:00:00:00:02:00
> APDEV: wlan3
> APDEV: wlan4
> START fils_sk_hlp_oom 1/1
> Test: FILS SK HLP and hostapd OOM
> Starting AP as-erp
> Starting AP wlan3 (old add_ap argument type)
> Connect STA wlan0 to AP
> Connection timed out
> Traceback (most recent call last):
>   File "./run-tests.py", line 531, in main
>     t(dev, apdev, params)
>   File "/lkp/benchmarks/hwsim/tests/hwsim/test_fils.py", line 919, in tes=
t_fils_sk_hlp_oom
>     dev[0].wait_connected()
>   File "/lkp/benchmarks/hwsim/tests/hwsim/wpasupplicant.py", line 1411, i=
n wait_connected
>     raise Exception(error)
> Exception: Connection timed out
> FAIL fils_sk_hlp_oom 10.282646 2022-04-07 14:59:18.241254
> passed 0 test case(s)
> skipped 0 test case(s)
> failed tests: fils_sk_hlp_oom
> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> -- =

> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>=20
--===============5137414756179937569==--

