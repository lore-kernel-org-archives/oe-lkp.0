Content-Type: multipart/mixed; boundary="===============3157225444364775999=="
MIME-Version: 1.0
From: Junxiao Bi <junxiao.bi@oracle.com>
To: lkp@lists.01.org
Subject: Re: [md] e1a86dbbbd: mdadm-selftests.enchmarks/mdadm-selftests/tests/07layouts.fail
Date: Tue, 04 Aug 2020 17:30:27 -0700
Message-ID: <c83149ba-eb06-d24c-95c3-e7bbd3328156@oracle.com>
In-Reply-To: <05662f78-f442-5f1d-4423-bd206a2e8fd8@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3157225444364775999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This issue had been fixed. I send the following patch in another thread. =

Please take a look. Thank you.

[PATCH] md: get sysfs entry after redundancy attr group create

Thanks,

Junxiao.

On 8/3/20 9:00 AM, Junxiao Bi wrote:
> Hi Song,
>
> I am working on setup an env to reproduce, will update soon.
>
> Thanks,
>
> Junxiao.
>
> On 8/2/20 10:52 PM, Song Liu wrote:
>>
>>> On Jul 29, 2020, at 2:04 AM, kernel test robot =

>>> <rong.a.chen@intel.com> wrote:
>>>
>>> Greeting,
>>>
>>> FYI, we noticed the following commit (built with gcc-9):
>>>
>>> commit: e1a86dbbbd6a77f73c3d099030495fa31f181e2f ("md: fix deadlock =

>>> causing by sysfs_notify")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>>
>>> in testcase: mdadm-selftests
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
>>> =C2=A0=C2=A0=C2=A0=C2=A0test_prefix: 07layout
>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x21
>>>
>>>
>>>
>>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz =

>>> with 4G memory
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire =

>>> log/backtrace):
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>>
>>>
>>>
>>> 2020-07-29 01:06:34 mkdir -p /var/tmp
>>> 2020-07-29 01:06:34 mke2fs -t ext3 -b 4096 -J size=3D4 -q /dev/sda3
>>> 2020-07-29 01:07:36 mount -t ext3 /dev/sda3 /var/tmp
>>> sed -e 's/{DEFAULT_METADATA}/1.2/g' \
>>> -e 's,{MAP_PATH},/run/mdadm/map,g'=C2=A0 mdadm.8.in > mdadm.8
>>> /usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
>>> /usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
>>> /usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
>>> /usr/bin/install -D -m 644 mdadm.conf.5 =

>>> /usr/share/man/man5/mdadm.conf.5
>>> /usr/bin/install -D -m 644 udev-md-raid-creating.rules =

>>> /lib/udev/rules.d/01-md-raid-creating.rules
>>> /usr/bin/install -D -m 644 udev-md-raid-arrays.rules =

>>> /lib/udev/rules.d/63-md-raid-arrays.rules
>>> /usr/bin/install -D -m 644 udev-md-raid-assembly.rules =

>>> /lib/udev/rules.d/64-md-raid-assembly.rules
>>> /usr/bin/install -D -m 644 udev-md-clustered-confirm-device.rules =

>>> /lib/udev/rules.d/69-md-clustered-confirm-device.rules
>>> /usr/bin/install -D=C2=A0 -m 755 mdadm /sbin/mdadm
>>> /usr/bin/install -D=C2=A0 -m 755 mdmon /sbin/mdmon
>>> Testing on linux-5.8.0-rc4-00129-ge1a86dbbbd6a7 kernel
>>> /lkp/benchmarks/mdadm-selftests/tests/07layouts... FAILED - see =

>>> /var/tmp/07layouts.log and /var/tmp/fail07layouts.log for details
>>> 07layouts TIMEOUT
>>>
>>>
>>>
>>> To reproduce:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com=
/intel/lkp-tests.git
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install job.yaml=C2=
=A0 # job file is attached in this email
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=A0=C2=A0=C2=
=A0=C2=A0 job.yaml
>>>
>>>
>>>
>>> Thanks,
>>> Rong Chen
>>>
>>> <config-5.8.0-rc4-00129-ge1a86dbbbd6a7><job-script.txt><kmsg.xz><mdadm-=
selftests.txt><job.yaml><reproduce.txt><07layouts.log> =

>>>
>> Hi Junxiao,
>>
>> Could you please look into this issue?
>>
>> Thanks,
>> Song
>>
--===============3157225444364775999==--

