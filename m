Content-Type: multipart/mixed; boundary="===============5522355669826919148=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] e44e907dd8: phoronix-test-suite.glmark2.800x600.score -64.9% regression
Date: Tue, 16 Jun 2020 11:29:30 +0800
Message-ID: <cc7068ef-7fc3-93c5-c7da-e114542d650d@intel.com>
In-Reply-To: <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5522355669826919148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/16/20 11:10 AM, Rong Chen wrote:
>
>
> On 6/16/20 4:58 AM, Emil Velikov wrote:
>> Hi all,
>>
>> On Thu, 4 Jun 2020 at 08:11, kernel test robot =

>> <rong.a.chen@intel.com> wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -64.9% regression of =

>>> phoronix-test-suite.glmark2.800x600.score due to commit:
>>>
>> On one hand, I'm really happy to see performance testing happening
>> although this report is missing various crucial pieces of information.
>>
>>> commit: e44e907dd8f937313d35615d799d54162c56d173 ("[PATCH v3 05/15] =

>>> drm/mgag200: Split MISC register update into PLL selection, SYNC and =

>>> I/O")
>>> url: =

>>> https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-mgag200-=
Convert-to-atomic-modesetting/20200515-163744
>>> base: git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>>
>>> in testcase: phoronix-test-suite
>>> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz =

>>> with 48G memory
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 need_x: true
>> Replace "need_x" with the Xorg version as seen in `Xorg -version'.
>
> # Xorg -version
> /bin/sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
>
> X.Org X Server 1.20.4
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 4.9.0-8-amd64 x86_64 Debian
> Current Operating System: Linux lkp-nhm-2ep1 =

> 5.7.0-rc5-01428-ge44e907dd8f937 #1 SMP Tue Jun 2 19:51:38 CST 2020 x86_64
> Kernel command line:=C2=A0 ip=3D::::lkp-nhm-2ep1::dhcp =

> root=3D/dev/disk/by-id/wwn-0x55cd2e4123123127-part2 =

> rootflags=3Dsubvol=3Ddebian-x86_64-phoronix =

> remote_rootfs=3Dinternal-lkp-server:/osimage/debian/debian-x86_64-phoroni=
x =

> user=3Dlkp =

> job=3D/lkp/jobs/scheduled/lkp-nhm-2ep1/phoronix-test-suite-performance-tr=
ue-glmark2-1.1.0-ucode=3D0x1d-debian-x86_64-phoronix-e44e907dd8f937313d3561=
5d799d54162c56d173-20200616-56456-1kgmjzm-0.yaml =

> ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-7.6 =

> branch=3Dlinux-devel/devel-hourly-2020051600 =

> commit=3De44e907dd8f937313d35615d799d54162c56d173 =

> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-7.6/gcc-7/e44e907dd8f937313d35615d799=
d54162c56d173/vmlinuz-5.7.0-rc5-01428-ge44e907dd8f937 =

> console=3DttyS1,115200 console=3Dtty0 max_uptime=3D3600 =

> RESULT_ROOT=3D/result/phoronix-test-suite/performance-true-glmark2-1.1.0-=
ucode=3D0x1d/lkp-nhm-2ep1/debian-x86_64-phoronix/x86_64-rhel-7.6/gcc-7/e44e=
907dd8f937313d35615d799d54162c56d173/4 =

> LKP_SERVER=3Dinn nokaslr selinux=3D0 debug apic=3Ddebug sysrq_always_enab=
led =

> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don =

> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic =

> load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 =

> systemd.log_level=3Derr ignore_loglevel console=3Dtty0 =

> earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw
> Build Date: 05 March 2019=C2=A0 08:11:12PM
> xorg-server 2:1.20.4-1 (https://www.debian.org/support)
> Current version of pixman: 0.36.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Before reporting problems, che=
ck http://wiki.x.org
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to make sure that you have the=
 latest version.
>
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test: glmark2-1.1.0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpufreq_governor: perf=
ormance
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ucode: 0x1d
>>>
>>> test-description: The Phoronix Test Suite is the most comprehensive =

>>> testing and benchmarking platform available that provides an =

>>> extensible framework for which new tests can be easily added.
>>> test-url: http://www.phoronix-test-suite.com/
>>>
>> Please remove the test description and url. They don't add any value.
>>
>> Mention which Mesa version is used as well as on what GPU. The output
>> of lspci and glxinfo will help here.
>
> Attached please find the outputs of lspci and glxinfo

Sorry, the previous lspci is not correct, please find it in this attachment.

Best Regards,
Rong Chen

>
>>
>> For this particular test - there is no Mesa/upstream driver for this
>> GPU, so I imagine one of the swrast drivers was used. Which one -
>> swrast (classic, softpipe, llvmpipe, swr) or kms_swrast.
>> The output of `LD_DEBUG=3Dlibs glxinfo=C2=A0 |& grep _dri.so` will help =
here.
>
> # LD_DEBUG=3Dlibs glxinfo=C2=A0 |& grep _dri.so
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2132:=C2=A0=C2=A0=C2=A0=C2=A0 calling init=
: /usr/lib/i386-linux-gnu/dri/swrast_dri.so
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2132:=C2=A0=C2=A0=C2=A0=C2=A0 calling fini=
: =

> /usr/lib/i386-linux-gnu/dri/swrast_dri.so [0]
>
> Best Regards,
> Rong Chen
>
>>
>>> commit:
>>> =C2=A0=C2=A0 bef2303526 ("drm/mgag200: Move mode-setting code into sepa=
rate =

>>> helper function")
>>> =C2=A0=C2=A0 e44e907dd8 ("drm/mgag200: Split MISC register update into =
PLL =

>>> selection, SYNC and I/O")
>>>
>> Actually the offending commit has a subtle change of behaviour - it
>> adds an extra MGAREG_MISC_RAMMAPEN.
>> That is not documented and I've failed to spot it during review.
>>
>> Thomas - shall we revert that line in itself or at least add an inline
>> comment why it is needed?
>>
>>> =C2=A0=C2=A0 100 =

>>> +---------------------------------------------------------------------+
>>> =C2=A0=C2=A0=C2=A0 90 |-+=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +=C2=A0=C2=A0 +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 =
+=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 + =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 80 |-:=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 =
:=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 70 |-::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=
=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=
=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :: =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
 : :=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0 : =
:=C2=A0=C2=A0=C2=A0 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 60 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=
=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
=C2=A0 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 50 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=
=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
=C2=A0 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 40 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0 :=C2=
=A0 : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |:=C2=A0 : : :=C2=A0=C2=A0 :=C2=A0=
 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : =
:=C2=A0=C2=A0 :=C2=A0 : :O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

>>> O O O=C2=A0 O |
>>> =C2=A0=C2=A0=C2=A0 30 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0 :=C2=
=A0 : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 20 |-+ ::=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0 : :=C2=A0=C2=A0 ::=
=C2=A0=C2=A0 :=C2=A0 : O =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 =
: :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 :=C2=
=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 10 |-+=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 0 =

>>> +---------------------------------------------------------------------+
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phoronix-test-suite.glmark2.1=
024x768.score
>>>
>>> =C2=A0=C2=A0 70 =

>>> +----------------------------------------------------------------------=
+ =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 +..+=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=
=C2=A0 + =

>>> +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
>>> =C2=A0=C2=A0 60 |-:=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=
=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=
=C2=A0=C2=A0 : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 50 |-::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=
=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=A0=C2=A0 :: =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0 =
: :=C2=A0=C2=A0 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 40 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0 =
: :=C2=A0=C2=A0 : : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

>>> O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 30 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=
=A0 : :O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

>>> O=C2=A0=C2=A0 O=C2=A0 O |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |:=C2=A0 : : :=C2=A0=C2=A0 :=C2=A0 : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=
=A0 :=C2=A0=C2=A0 :=C2=A0 : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 20 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=
=A0 : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 ::=C2=A0=C2=A0=
 :=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0 : : O =

>>> ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 10 |-+=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 :=C2=
=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=
=A0 O :=C2=A0=C2=A0=C2=A0 O : : O=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : O :=C2=A0=
=C2=A0=C2=A0 : : =

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 0 =

>>> +----------------------------------------------------------------------=
+ =

>>>
>>>
>>>
>>> [*] bisect-good sample
>>> [O] bisect-bad=C2=A0 sample
>>>
>> Hmm I must be going blind - there isn't even a single * in either of =

>> the graphs.
>> Or perhaps my eyesight is fine and the legend or the graphs need fixing.
>>
>> HTH
>> -Emil
>
>
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org


--===============5522355669826919148==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lspci.ksh"

MDA6MDAuMCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gNTUyMCBJL08gSHViIHRvIEVT
SSBQb3J0IChyZXYgMTMpCjAwOjAxLjAgUENJIGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gNTUy
MC81NTAwL1g1OCBJL08gSHViIFBDSSBFeHByZXNzIFJvb3QgUG9ydCAxIChyZXYgMTMpCjAwOjA5
LjAgUENJIGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gNzUwMC81NTIwLzU1MDAvWDU4IEkvTyBI
dWIgUENJIEV4cHJlc3MgUm9vdCBQb3J0IDkgKHJldiAxMykKMDA6MGEuMCBQQ0kgYnJpZGdlOiBJ
bnRlbCBDb3Jwb3JhdGlvbiA3NTAwLzU1MjAvNTUwMC9YNTggSS9PIEh1YiBQQ0kgRXhwcmVzcyBS
b290IFBvcnQgMTAgKHJldiAxMykKMDA6MTAuMCBQSUM6IEludGVsIENvcnBvcmF0aW9uIDc1MDAv
NTUyMC81NTAwL1g1OCBQaHlzaWNhbCBhbmQgTGluayBMYXllciBSZWdpc3RlcnMgUG9ydCAwIChy
ZXYgMTMpCjAwOjEwLjEgUElDOiBJbnRlbCBDb3Jwb3JhdGlvbiA3NTAwLzU1MjAvNTUwMC9YNTgg
Um91dGluZyBhbmQgUHJvdG9jb2wgTGF5ZXIgUmVnaXN0ZXJzIFBvcnQgMCAocmV2IDEzKQowMDox
MS4wIFBJQzogSW50ZWwgQ29ycG9yYXRpb24gNzUwMC81NTIwLzU1MDAgUGh5c2ljYWwgYW5kIExp
bmsgTGF5ZXIgUmVnaXN0ZXJzIFBvcnQgMSAocmV2IDEzKQowMDoxMS4xIFBJQzogSW50ZWwgQ29y
cG9yYXRpb24gNzUwMC81NTIwLzU1MDAgUm91dGluZyAmIFByb3RvY29sIExheWVyIFJlZ2lzdGVy
IFBvcnQgMSAocmV2IDEzKQowMDoxMy4wIFBJQzogSW50ZWwgQ29ycG9yYXRpb24gNzUwMC81NTIw
LzU1MDAvWDU4IEkvTyBIdWIgSS9PeEFQSUMgSW50ZXJydXB0IENvbnRyb2xsZXIgKHJldiAxMykK
MDA6MTQuMCBQSUM6IEludGVsIENvcnBvcmF0aW9uIDc1MDAvNTUyMC81NTAwL1g1OCBJL08gSHVi
IFN5c3RlbSBNYW5hZ2VtZW50IFJlZ2lzdGVycyAocmV2IDEzKQowMDoxNC4xIFBJQzogSW50ZWwg
Q29ycG9yYXRpb24gNzUwMC81NTIwLzU1MDAvWDU4IEkvTyBIdWIgR1BJTyBhbmQgU2NyYXRjaCBQ
YWQgUmVnaXN0ZXJzIChyZXYgMTMpCjAwOjE0LjIgUElDOiBJbnRlbCBDb3Jwb3JhdGlvbiA3NTAw
LzU1MjAvNTUwMC9YNTggSS9PIEh1YiBDb250cm9sIFN0YXR1cyBhbmQgUkFTIFJlZ2lzdGVycyAo
cmV2IDEzKQowMDoxNC4zIFBJQzogSW50ZWwgQ29ycG9yYXRpb24gNzUwMC81NTIwLzU1MDAvWDU4
IEkvTyBIdWIgVGhyb3R0bGUgUmVnaXN0ZXJzIChyZXYgMTMpCjAwOjE1LjAgUElDOiBJbnRlbCBD
b3Jwb3JhdGlvbiA3NTAwLzU1MjAvNTUwMC9YNTggVHJ1c3RlZCBFeGVjdXRpb24gVGVjaG5vbG9n
eSBSZWdpc3RlcnMgKHJldiAxMykKMDA6MTYuMCBTeXN0ZW0gcGVyaXBoZXJhbDogSW50ZWwgQ29y
cG9yYXRpb24gNTUyMC81NTAwL1g1OCBDaGlwc2V0IFF1aWNrRGF0YSBUZWNobm9sb2d5IERldmlj
ZSAocmV2IDEzKQowMDoxNi4xIFN5c3RlbSBwZXJpcGhlcmFsOiBJbnRlbCBDb3Jwb3JhdGlvbiA1
NTIwLzU1MDAvWDU4IENoaXBzZXQgUXVpY2tEYXRhIFRlY2hub2xvZ3kgRGV2aWNlIChyZXYgMTMp
CjAwOjE2LjIgU3lzdGVtIHBlcmlwaGVyYWw6IEludGVsIENvcnBvcmF0aW9uIDU1MjAvNTUwMC9Y
NTggQ2hpcHNldCBRdWlja0RhdGEgVGVjaG5vbG9neSBEZXZpY2UgKHJldiAxMykKMDA6MTYuMyBT
eXN0ZW0gcGVyaXBoZXJhbDogSW50ZWwgQ29ycG9yYXRpb24gNTUyMC81NTAwL1g1OCBDaGlwc2V0
IFF1aWNrRGF0YSBUZWNobm9sb2d5IERldmljZSAocmV2IDEzKQowMDoxNi40IFN5c3RlbSBwZXJp
cGhlcmFsOiBJbnRlbCBDb3Jwb3JhdGlvbiA1NTIwLzU1MDAvWDU4IENoaXBzZXQgUXVpY2tEYXRh
IFRlY2hub2xvZ3kgRGV2aWNlIChyZXYgMTMpCjAwOjE2LjUgU3lzdGVtIHBlcmlwaGVyYWw6IElu
dGVsIENvcnBvcmF0aW9uIDU1MjAvNTUwMC9YNTggQ2hpcHNldCBRdWlja0RhdGEgVGVjaG5vbG9n
eSBEZXZpY2UgKHJldiAxMykKMDA6MTYuNiBTeXN0ZW0gcGVyaXBoZXJhbDogSW50ZWwgQ29ycG9y
YXRpb24gNTUyMC81NTAwL1g1OCBDaGlwc2V0IFF1aWNrRGF0YSBUZWNobm9sb2d5IERldmljZSAo
cmV2IDEzKQowMDoxNi43IFN5c3RlbSBwZXJpcGhlcmFsOiBJbnRlbCBDb3Jwb3JhdGlvbiA1NTIw
LzU1MDAvWDU4IENoaXBzZXQgUXVpY2tEYXRhIFRlY2hub2xvZ3kgRGV2aWNlIChyZXYgMTMpCjAw
OjFhLjAgVVNCIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkgKElDSDEwIEZh
bWlseSkgVVNCIFVIQ0kgQ29udHJvbGxlciAjNAowMDoxYS4xIFVTQiBjb250cm9sbGVyOiBJbnRl
bCBDb3Jwb3JhdGlvbiA4MjgwMUpJIChJQ0gxMCBGYW1pbHkpIFVTQiBVSENJIENvbnRyb2xsZXIg
IzUKMDA6MWEuMiBVU0IgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gODI4MDFKSSAoSUNI
MTAgRmFtaWx5KSBVU0IgVUhDSSBDb250cm9sbGVyICM2CjAwOjFhLjcgVVNCIGNvbnRyb2xsZXI6
IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkgKElDSDEwIEZhbWlseSkgVVNCMiBFSENJIENvbnRy
b2xsZXIgIzIKMDA6MWMuMCBQQ0kgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUpJIChJ
Q0gxMCBGYW1pbHkpIFBDSSBFeHByZXNzIFJvb3QgUG9ydCAxCjAwOjFjLjQgUENJIGJyaWRnZTog
SW50ZWwgQ29ycG9yYXRpb24gODI4MDFKSSAoSUNIMTAgRmFtaWx5KSBQQ0kgRXhwcmVzcyBSb290
IFBvcnQgNQowMDoxYy41IFBDSSBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkgKElD
SDEwIEZhbWlseSkgUENJIEV4cHJlc3MgUm9vdCBQb3J0IDYKMDA6MWQuMCBVU0IgY29udHJvbGxl
cjogSW50ZWwgQ29ycG9yYXRpb24gODI4MDFKSSAoSUNIMTAgRmFtaWx5KSBVU0IgVUhDSSBDb250
cm9sbGVyICMxCjAwOjFkLjEgVVNCIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIDgyODAx
SkkgKElDSDEwIEZhbWlseSkgVVNCIFVIQ0kgQ29udHJvbGxlciAjMgowMDoxZC4yIFVTQiBjb250
cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUpJIChJQ0gxMCBGYW1pbHkpIFVTQiBVSENJ
IENvbnRyb2xsZXIgIzMKMDA6MWQuNyBVU0IgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24g
ODI4MDFKSSAoSUNIMTAgRmFtaWx5KSBVU0IyIEVIQ0kgQ29udHJvbGxlciAjMQowMDoxZS4wIFBD
SSBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxIFBDSSBCcmlkZ2UgKHJldiA5MCkKMDA6
MWYuMCBJU0EgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUpJUiAoSUNIMTBSKSBMUEMg
SW50ZXJmYWNlIENvbnRyb2xsZXIKMDA6MWYuMiBJREUgaW50ZXJmYWNlOiBJbnRlbCBDb3Jwb3Jh
dGlvbiA4MjgwMUpJIChJQ0gxMCBGYW1pbHkpIDQgcG9ydCBTQVRBIElERSBDb250cm9sbGVyICMx
CjAwOjFmLjMgU01CdXM6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkgKElDSDEwIEZhbWlseSkg
U01CdXMgQ29udHJvbGxlcgowMDoxZi41IElERSBpbnRlcmZhY2U6IEludGVsIENvcnBvcmF0aW9u
IDgyODAxSkkgKElDSDEwIEZhbWlseSkgMiBwb3J0IFNBVEEgSURFIENvbnRyb2xsZXIgIzIKMDE6
MDAuMCBFdGhlcm5ldCBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjU3NUVCIEdpZ2Fi
aXQgTmV0d29yayBDb25uZWN0aW9uIChyZXYgMDIpCjAxOjAwLjEgRXRoZXJuZXQgY29udHJvbGxl
cjogSW50ZWwgQ29ycG9yYXRpb24gODI1NzVFQiBHaWdhYml0IE5ldHdvcmsgQ29ubmVjdGlvbiAo
cmV2IDAyKQowNDowMC4wIFNDU0kgc3RvcmFnZSBjb250cm9sbGVyOiBMU0kgTG9naWMgLyBTeW1i
aW9zIExvZ2ljIFNBUzEwNzggUENJLUV4cHJlc3MgRnVzaW9uLU1QVCBTQVMgKHJldiAwNCkKMDU6
MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBNYXRyb3ggRWxlY3Ryb25pY3MgU3lzdGVt
cyBMdGQuIE1HQSBHMjAwZSBbUGlsb3RdIFNlcnZlckVuZ2luZXMgKFNFUDEpIChyZXYgMDIpCmZl
OjAwLjAgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IFF1
aWNrUGF0aCBBcmNoaXRlY3R1cmUgR2VuZXJpYyBOb24tQ29yZSBSZWdpc3RlcnMgKHJldiAwNSkK
ZmU6MDAuMSBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcg
UXVpY2tQYXRoIEFyY2hpdGVjdHVyZSBTeXN0ZW0gQWRkcmVzcyBEZWNvZGVyIChyZXYgMDUpCmZl
OjAyLjAgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IFFQ
SSBMaW5rIDAgKHJldiAwNSkKZmU6MDIuMSBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24g
WGVvbiA1NTAwL0NvcmUgaTcgUVBJIFBoeXNpY2FsIDAgKHJldiAwNSkKZmU6MDIuNCBIb3N0IGJy
aWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgUVBJIExpbmsgMSAocmV2
IDA1KQpmZTowMi41IEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29y
ZSBpNyBRUEkgUGh5c2ljYWwgMSAocmV2IDA1KQpmZTowMy4wIEhvc3QgYnJpZGdlOiBJbnRlbCBD
b3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVy
IChyZXYgMDUpCmZlOjAzLjEgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUw
MC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgVGFyZ2V0IEFkZHJlc3MgRGVj
b2RlciAocmV2IDA1KQpmZTowMy4yIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9u
IDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIFJBUyBSZWdpc3RlcnMg
KHJldiAwNSkKZmU6MDMuNCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAw
L0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxlciBUZXN0IFJlZ2lzdGVycyAocmV2
IDA1KQpmZTowNC4wIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29y
ZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5uZWwgMCBDb250cm9sIFJlZ2lz
dGVycyAocmV2IDA1KQpmZTowNC4xIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9u
IDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5uZWwgMCBBZGRy
ZXNzIFJlZ2lzdGVycyAocmV2IDA1KQpmZTowNC4yIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3Jh
dGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5u
ZWwgMCBSYW5rIFJlZ2lzdGVycyAocmV2IDA1KQpmZTowNC4zIEhvc3QgYnJpZGdlOiBJbnRlbCBD
b3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVy
IENoYW5uZWwgMCBUaGVybWFsIENvbnRyb2wgUmVnaXN0ZXJzIChyZXYgMDUpCmZlOjA1LjAgSG9z
dCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQg
TWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAxIENvbnRyb2wgUmVnaXN0ZXJzIChyZXYgMDUpCmZl
OjA1LjEgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IElu
dGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAxIEFkZHJlc3MgUmVnaXN0ZXJzIChy
ZXYgMDUpCmZlOjA1LjIgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9D
b3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAxIFJhbmsgUmVnaXN0
ZXJzIChyZXYgMDUpCmZlOjA1LjMgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24g
NTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAxIFRoZXJt
YWwgQ29udHJvbCBSZWdpc3RlcnMgKHJldiAwNSkKZmU6MDYuMCBIb3N0IGJyaWRnZTogSW50ZWwg
Q29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxl
ciBDaGFubmVsIDIgQ29udHJvbCBSZWdpc3RlcnMgKHJldiAwNSkKZmU6MDYuMSBIb3N0IGJyaWRn
ZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkg
Q29udHJvbGxlciBDaGFubmVsIDIgQWRkcmVzcyBSZWdpc3RlcnMgKHJldiAwNSkKZmU6MDYuMiBI
b3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRl
ZCBNZW1vcnkgQ29udHJvbGxlciBDaGFubmVsIDIgUmFuayBSZWdpc3RlcnMgKHJldiAwNSkKZmU6
MDYuMyBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50
ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxlciBDaGFubmVsIDIgVGhlcm1hbCBDb250cm9sIFJlZ2lz
dGVycyAocmV2IDA1KQpmZjowMC4wIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9u
IDU1MDAvQ29yZSBpNyBRdWlja1BhdGggQXJjaGl0ZWN0dXJlIEdlbmVyaWMgTm9uLUNvcmUgUmVn
aXN0ZXJzIChyZXYgMDUpCmZmOjAwLjEgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhl
b24gNTUwMC9Db3JlIGk3IFF1aWNrUGF0aCBBcmNoaXRlY3R1cmUgU3lzdGVtIEFkZHJlc3MgRGVj
b2RlciAocmV2IDA1KQpmZjowMi4wIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9u
IDU1MDAvQ29yZSBpNyBRUEkgTGluayAwIChyZXYgMDUpCmZmOjAyLjEgSG9zdCBicmlkZ2U6IElu
dGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IFFQSSBQaHlzaWNhbCAwIChyZXYgMDUp
CmZmOjAyLjQgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3
IFFQSSBMaW5rIDEgKHJldiAwNSkKZmY6MDIuNSBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRp
b24gWGVvbiA1NTAwL0NvcmUgaTcgUVBJIFBoeXNpY2FsIDEgKHJldiAwNSkKZmY6MDMuMCBIb3N0
IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBN
ZW1vcnkgQ29udHJvbGxlciAocmV2IDA1KQpmZjowMy4xIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jw
b3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIFRh
cmdldCBBZGRyZXNzIERlY29kZXIgKHJldiAwNSkKZmY6MDMuMiBIb3N0IGJyaWRnZTogSW50ZWwg
Q29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxl
ciBSQVMgUmVnaXN0ZXJzIChyZXYgMDUpCmZmOjAzLjQgSG9zdCBicmlkZ2U6IEludGVsIENvcnBv
cmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgVGVz
dCBSZWdpc3RlcnMgKHJldiAwNSkKZmY6MDQuMCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRp
b24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxlciBDaGFubmVs
IDAgQ29udHJvbCBSZWdpc3RlcnMgKHJldiAwNSkKZmY6MDQuMSBIb3N0IGJyaWRnZTogSW50ZWwg
Q29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxl
ciBDaGFubmVsIDAgQWRkcmVzcyBSZWdpc3RlcnMgKHJldiAwNSkKZmY6MDQuMiBIb3N0IGJyaWRn
ZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkg
Q29udHJvbGxlciBDaGFubmVsIDAgUmFuayBSZWdpc3RlcnMgKHJldiAwNSkKZmY6MDQuMyBIb3N0
IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBN
ZW1vcnkgQ29udHJvbGxlciBDaGFubmVsIDAgVGhlcm1hbCBDb250cm9sIFJlZ2lzdGVycyAocmV2
IDA1KQpmZjowNS4wIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29y
ZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5uZWwgMSBDb250cm9sIFJlZ2lz
dGVycyAocmV2IDA1KQpmZjowNS4xIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9u
IDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5uZWwgMSBBZGRy
ZXNzIFJlZ2lzdGVycyAocmV2IDA1KQpmZjowNS4yIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3Jh
dGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5u
ZWwgMSBSYW5rIFJlZ2lzdGVycyAocmV2IDA1KQpmZjowNS4zIEhvc3QgYnJpZGdlOiBJbnRlbCBD
b3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVy
IENoYW5uZWwgMSBUaGVybWFsIENvbnRyb2wgUmVnaXN0ZXJzIChyZXYgMDUpCmZmOjA2LjAgSG9z
dCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQg
TWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAyIENvbnRyb2wgUmVnaXN0ZXJzIChyZXYgMDUpCmZm
OjA2LjEgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IElu
dGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAyIEFkZHJlc3MgUmVnaXN0ZXJzIChy
ZXYgMDUpCmZmOjA2LjIgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9D
b3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAyIFJhbmsgUmVnaXN0
ZXJzIChyZXYgMDUpCmZmOjA2LjMgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24g
NTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAyIFRoZXJt
YWwgQ29udHJvbCBSZWdpc3RlcnMgKHJldiAwNSkK

--===============5522355669826919148==--

