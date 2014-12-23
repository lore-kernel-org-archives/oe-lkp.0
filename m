Content-Type: multipart/mixed; boundary="===============4825396053602894518=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/fb] 6cadd306033:
Date: Tue, 23 Dec 2014 13:42:02 +0800
Message-ID: <1419313322.26403.57.camel@intel.com>
In-Reply-To: <1419313251.26403.56.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4825396053602894518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, similar information for 4a91ebc4ec70e83a2fbca622653da22bf8afda7b
too.

Best Regards,
Huang, Ying

On Tue, 2014-12-23 at 13:40 +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 6cadd306033e70b4edb136815807060e168cac67 ("drm/fb-helper: Propagat=
e errors from initial config failure")
> =

> =

> testbox/testcase/testparams: vm-kbuild-yocto-ia32/boot/1
> =

> drm-intel/topic/  6cadd306033e70b4edb1368158  =

> ----------------  --------------------------  =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :10         100%          10:10    kmsg.drm:cirrus_modeset_ini=
t]*ERROR*cirrus_fbdev_init_failed
>            :10         100%          10:10    kmsg.cirrus#:#:#:Fatal_erro=
r_during_modeset_init
>           1:10         -10%            :10    kmsg.Initramfs_unpacking_fa=
iled:junk_in_compressed_archive
>           1:10         -10%            :10    kmsg.BUG:kernel_boot_hang
>           1:10         -10%            :10    dmesg.Initramfs_unpacking_f=
ailed
>           1:10         -10%            :10    dmesg.BUG:kernel_boot_hang
>            :2           50%           1:2     kmsg.BUG:kernel_test_crashed
>            :2          100%           2:2     kmsg.APIC_calibration_not_c=
onsistent_with_PM-Timer:#ms_instead_of#ms
>            :2           50%           1:2     kmsg.i6300esb:Unexpected_cl=
ose,not_stopping_watchdog
>            :2           50%           1:2     dmesg.BUG:kernel_test_crash=
ed
> =

> vm-kbuild-yocto-ia32: qemu-system-x86_64 -enable-kvm -cpu Westmere
> Memory: 320M
> =

> =

> To reproduce:
> =

> 	apt-get install ruby ruby-oj
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Huang, Ying
> =

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> _______________________________________________ LKP mailing list LKP(a)li=
sts.01.org https://lists.01.org/mailman/listinfo/lkp



--===============4825396053602894518==--

