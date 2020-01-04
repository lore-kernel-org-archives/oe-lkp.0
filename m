Content-Type: multipart/mixed; boundary="===============3386083158242094544=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [IMA] 11b771ffff: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mutex.c
Date: Sat, 04 Jan 2020 19:49:00 +0800
Message-ID: <e30864ab-4867-fffa-bf0c-88a5a9bb6f6e@intel.com>
In-Reply-To: <2a831fe9-30e5-63b4-af10-a69f327f7fb7@linux.microsoft.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3386083158242094544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/31/2019 5:14 AM, Lakshmi Ramasubramanian wrote:
> On 12/27/19 6:23 AM, kernel test robot wrote:
>
> Hi Rong,
>
>>
>>
>> To reproduce:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build kernel
>> =C2=A0=C2=A0=C2=A0=C2=A0cd linux
>> =C2=A0=C2=A0=C2=A0=C2=A0cp config-5.5.0-rc1-00011-g11b771ffff8fc .config
>> =C2=A0=C2=A0=C2=A0=C2=A0make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 old=
defconfig prepare =

>> modules_prepare bzImage
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://githu=
b.com/intel/lkp-tests.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzImag=
e> job-script # job-script is =

>> attached in this email
>>
>>
>>
>> Thanks,
>> Rong Chen
>>
>
> Thanks for reporting this issue.
>
> I built the kernel with the config you'd provided.
>
> When running lkp-tests using the command line given, I see the =

> following error and the test stops.
>
> =C2=A0=C2=A0=C2=A0=C2=A0bin/lkp qemu -k ../linux-5.5/arch/x86/boot/bzImag=
e job-script
>
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

> https://download.01.org/0day-ci/lkp-qemu/pkg/linux/x86_64-rhel-7.6/gcc-7/=
11b771ffff8fc0bfc176b829d986896a7d97a44c/linux-headers.cgz =

> -N -P =

> /root/.lkp/cache/pkg/linux/x86_64-rhel-7.6/gcc-7/11b771ffff8fc0bfc176b829=
d986896a7d97a44c
>
> Failed to download =

> pkg/linux/x86_64-rhel-7.6/gcc-7/11b771ffff8fc0bfc176b829d986896a7d97a44c/=
linux-headers.cgz
>
> Please let me know what I am missing.
>
> Full output of the command is given below:
>
> bin/lkp qemu -k ../linux-5.5/arch/x86/boot/bzImage job-script
>
> result_root: =

> /root/.lkp//result/kernel_selftests/kselftests-03/vm-snb/debian-x86_64-20=
19-11-14.cgz/x86_64-rhel-7.6/gcc-7/11b771ffff8fc0bfc176b829d986896a7d97a44c=
/8
> downloading initrds ...
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

> https://download.01.org/0day-ci/lkp-qemu/osimage/debian/debian-x86_64-201=
9-11-14.cgz =

> -N -P /root/.lkp/cache/osimage/debian
> 408859 blocks
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

> https://download.01.org/0day-ci/lkp-qemu/osimage/deps/debian-x86_64-2018-=
04-03.cgz/run-ipconfig_2018-04-03.cgz =

> -N -P /root/.lkp/cache/osimage/deps/debian-x86_64-2018-04-03.cgz
> 1414 blocks
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

> https://download.01.org/0day-ci/lkp-qemu/osimage/deps/debian-x86_64-2018-=
04-03.cgz/lkp_2019-08-05.cgz =

> -N -P /root/.lkp/cache/osimage/deps/debian-x86_64-2018-04-03.cgz
> 1670 blocks
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

> https://download.01.org/0day-ci/lkp-qemu/osimage/deps/debian-x86_64-2018-=
04-03.cgz/rsync-rootfs_2018-04-03.cgz =

> -N -P /root/.lkp/cache/osimage/deps/debian-x86_64-2018-04-03.cgz
> 8268 blocks
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

> https://download.01.org/0day-ci/lkp-qemu/osimage/deps/debian-x86_64-2018-=
04-03.cgz/kernel_selftests_2019-12-25.cgz =

> -N -P /root/.lkp/cache/osimage/deps/debian-x86_64-2018-04-03.cgz
> 932372 blocks
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

> https://download.01.org/0day-ci/lkp-qemu/osimage/pkg/debian-x86_64-2018-0=
4-03.cgz/kernel_selftests-x86_64-0dcf36db-1_2019-12-25.cgz =

> -N -P /root/.lkp/cache/osimage/pkg/debian-x86_64-2018-04-03.cgz
> 30125 blocks
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

> https://download.01.org/0day-ci/lkp-qemu/pkg/linux/x86_64-rhel-7.6/gcc-7/=
11b771ffff8fc0bfc176b829d986896a7d97a44c/linux-headers.cgz =

> -N -P =

> /root/.lkp/cache/pkg/linux/x86_64-rhel-7.6/gcc-7/11b771ffff8fc0bfc176b829=
d986896a7d97a44c
> Failed to download =

> pkg/linux/x86_64-rhel-7.6/gcc-7/11b771ffff8fc0bfc176b829d986896a7d97a44c/=
linux-headers.cgz
>
>

Hi,

Sorry for the delay, we updated the lkp-tests code and uploaded the =

missing cgz files for this case.

Best Regards,
Rong Chen
--===============3386083158242094544==--

