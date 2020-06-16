Content-Type: multipart/mixed; boundary="===============7839882425985307438=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] e44e907dd8: phoronix-test-suite.glmark2.800x600.score -64.9% regression
Date: Tue, 16 Jun 2020 15:49:53 +0200
Message-ID: <30f08ee3-6851-ebae-d645-3f535d536cd6@suse.de>
In-Reply-To: <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7839882425985307438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.06.20 um 05:10 schrieb Rong Chen:
> =

> =

> On 6/16/20 4:58 AM, Emil Velikov wrote:
>> Hi all,
>>
>> On Thu, 4 Jun 2020 at 08:11, kernel test robot <rong.a.chen@intel.com>
>> wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -64.9% regression of
>>> phoronix-test-suite.glmark2.800x600.score due to commit:
>>>
>> On one hand, I'm really happy to see performance testing happening
>> although this report is missing various crucial pieces of information.
>>
>>> commit: e44e907dd8f937313d35615d799d54162c56d173 ("[PATCH v3 05/15]
>>> drm/mgag200: Split MISC register update into PLL selection, SYNC and
>>> I/O")
>>> url:
>>> https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-mgag200-=
Convert-to-atomic-modesetting/20200515-163744
>>>
>>> base: git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>>
>>> in testcase: phoronix-test-suite
>>> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz with
>>> 48G memory
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 need_x: true
>> Replace "need_x" with the Xorg version as seen in `Xorg -version'.
> =

> # Xorg -version
> /bin/sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> =

> X.Org X Server 1.20.4
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 4.9.0-8-amd64 x86_64 Debian
> Current Operating System: Linux lkp-nhm-2ep1
> 5.7.0-rc5-01428-ge44e907dd8f937 #1 SMP Tue Jun 2 19:51:38 CST 2020 x86_64
> Kernel command line:=C2=A0 ip=3D::::lkp-nhm-2ep1::dhcp
> root=3D/dev/disk/by-id/wwn-0x55cd2e4123123127-part2
> rootflags=3Dsubvol=3Ddebian-x86_64-phoronix
> remote_rootfs=3Dinternal-lkp-server:/osimage/debian/debian-x86_64-phoronix
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/lkp-nhm-2ep1/phoronix-test-suite-performance-tr=
ue-glmark2-1.1.0-ucode=3D0x1d-debian-x86_64-phoronix-e44e907dd8f937313d3561=
5d799d54162c56d173-20200616-56456-1kgmjzm-0.yaml
> ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-7.6
> branch=3Dlinux-devel/devel-hourly-2020051600
> commit=3De44e907dd8f937313d35615d799d54162c56d173
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-7.6/gcc-7/e44e907dd8f937313d35615d799=
d54162c56d173/vmlinuz-5.7.0-rc5-01428-ge44e907dd8f937
> console=3DttyS1,115200 console=3Dtty0 max_uptime=3D3600
> RESULT_ROOT=3D/result/phoronix-test-suite/performance-true-glmark2-1.1.0-=
ucode=3D0x1d/lkp-nhm-2ep1/debian-x86_64-phoronix/x86_64-rhel-7.6/gcc-7/e44e=
907dd8f937313d35615d799d54162c56d173/4
> LKP_SERVER=3Dinn nokaslr selinux=3D0 debug apic=3Ddebug sysrq_always_enab=
led
> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don
> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ra=
mdisk=3D2
> prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr
> ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200
> console=3DttyS0,115200 vga=3Dnormal rw
> Build Date: 05 March 2019=C2=A0 08:11:12PM
> xorg-server 2:1.20.4-1 (https://www.debian.org/support)
> Current version of pixman: 0.36.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Before reporting problems, che=
ck http://wiki.x.org
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to make sure that you have the=
 latest version.
> =

>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test: glmark2-1.1.0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpufreq_governor: perf=
ormance
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ucode: 0x1d
>>>
>>> test-description: The Phoronix Test Suite is the most comprehensive
>>> testing and benchmarking platform available that provides an
>>> extensible framework for which new tests can be easily added.
>>> test-url: http://www.phoronix-test-suite.com/
>>>
>> Please remove the test description and url. They don't add any value.
>>
>> Mention which Mesa version is used as well as on what GPU. The output
>> of lspci and glxinfo will help here.
> =

> Attached please find the outputs of lspci and glxinfo
> =

>>
>> For this particular test - there is no Mesa/upstream driver for this
>> GPU, so I imagine one of the swrast drivers was used. Which one -
>> swrast (classic, softpipe, llvmpipe, swr) or kms_swrast.
>> The output of `LD_DEBUG=3Dlibs glxinfo=C2=A0 |& grep _dri.so` will help =
here.
> =

> # LD_DEBUG=3Dlibs glxinfo=C2=A0 |& grep _dri.so
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2132:=C2=A0=C2=A0=C2=A0=C2=A0 calling init=
: /usr/lib/i386-linux-gnu/dri/swrast_dri.so
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2132:=C2=A0=C2=A0=C2=A0=C2=A0 calling fini=
: /usr/lib/i386-linux-gnu/dri/swrast_dri.so [0]
> =

> Best Regards,
> Rong Chen

Thanks for testing. If I send out a patch, could you try it?

Best regards
Thomas

> =

>>
>>> commit:
>>> =C2=A0=C2=A0 bef2303526 ("drm/mgag200: Move mode-setting code into sepa=
rate
>>> helper function")
>>> =C2=A0=C2=A0 e44e907dd8 ("drm/mgag200: Split MISC register update into =
PLL
>>> selection, SYNC and I/O")
>>>
>> Actually the offending commit has a subtle change of behaviour - it
>> adds an extra MGAREG_MISC_RAMMAPEN.
>> That is not documented and I've failed to spot it during review.
>>
>> Thomas - shall we revert that line in itself or at least add an inline
>> comment why it is needed?
>>
>>> =C2=A0=C2=A0 100
>>> +---------------------------------------------------------------------+
>>> =C2=A0=C2=A0=C2=A0 90 |-+=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +=C2=A0=C2=A0 +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 =
+=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 80 |-:=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 =
:=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 70 |-::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=
=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=
=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
 : :=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0 : =
:=C2=A0=C2=A0=C2=A0 : :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 60 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=
=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
=C2=A0 : :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 50 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=
=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
=C2=A0 : :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 40 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0 :=C2=
=A0 :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |:=C2=A0 : : :=C2=A0=C2=A0 :=C2=A0=
 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : =
:=C2=A0=C2=A0 :=C2=A0 : :O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O
>>> O O=C2=A0 O |
>>> =C2=A0=C2=A0=C2=A0 30 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0 :=C2=
=A0 :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 20 |-+ ::=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0 : :=C2=A0=C2=A0 ::=
=C2=A0=C2=A0 :=C2=A0 : O
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 =
: :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 :=C2=
=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 10 |-+=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 0
>>> +---------------------------------------------------------------------+
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phoronix-test-suite.glmark2.1=
024x768.score
>>>
>>> =C2=A0=C2=A0 70
>>> +----------------------------------------------------------------------+
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 +..+=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=
=C2=A0 +=C2=A0=C2=A0=C2=A0
>>> +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
>>> =C2=A0=C2=A0 60 |-:=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=
=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=
=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=
=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 50 |-::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=
=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0 =
: :=C2=A0=C2=A0 : :=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 40 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
 : :=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0 =
: :=C2=A0=C2=A0 : :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>> O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 30 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=
=A0 : :O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>> O=C2=A0=C2=A0 O=C2=A0 O |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |:=C2=A0 : : :=C2=A0=C2=A0 :=C2=A0 : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=
=A0 :=C2=A0=C2=A0 :=C2=A0 :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 20 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=
=A0 :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 ::=C2=A0=C2=A0=
 :=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0 : : O
>>> ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 10 |-+=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 :=C2=
=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=
=A0 O :=C2=A0=C2=A0=C2=A0 O : : O=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : O :=C2=A0=
=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 0
>>> +----------------------------------------------------------------------+
>>>
>>>
>>> [*] bisect-good sample
>>> [O] bisect-bad=C2=A0 sample
>>>
>> Hmm I must be going blind - there isn't even a single * in either of
>> the graphs.
>> Or perhaps my eyesight is fine and the legend or the graphs need fixing.
>>
>> HTH
>> -Emil
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--===============7839882425985307438==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWw3b3pnRUFDZ2tRYUEzQkhWTUwKZWlNb3NRZ0FvR2tQSjU5RGps
blpLOVZZdlZSQUlLZVRTeFRaVVlsOHJHYVdWVHFrdkNoWHZDdG4zY0VadjcvLwpOUHhRanN3WDdR
OE8va3l6Vi9pN0xONHRZN01oVkEvdlBWcTFzZkdXbmMzcTlOSXZjQjZ6QmtkWFo0WWlXR092CkhZ
QUNpZWFYUW9KUzRVbFNqQTRkUHJNeTMyTnlMQ2NrSTY1eWtuLzl0NXIvZlN2dUNZVjFtYXBMNmw2
OE5rV2gKdmdUdWdBWWxVZXFQRTBFbGFHOCtlaGZnNC9OelYzaTRVNVBvYzdzS3FMWlVjcGJUSU00
YnRaTFhicnZvcllXVApJZnZKUE9qaVRJVjNkQmw0ZU9vRjFVUC9sTm1MZDRPZ0VFY1g4SHJSaktE
NWFTOGVoaEx3U200THR1TUxjWEV6CkRiZ0hEdUVSQlNBakRyblIweVV5em1xK255Qmo1Zz09Cj1H
MlRmCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7839882425985307438==--

