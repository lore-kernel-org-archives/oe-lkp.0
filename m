Content-Type: multipart/mixed; boundary="===============2635541296497604904=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] "fio: pid=2214, got signal=7" error showed in fio test for btrfs
Date: Fri, 19 May 2017 14:28:14 +0800
Message-ID: <20170519062814.GC1795@yexl-desktop>
In-Reply-To: <20170329075048.GA300@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2635541296497604904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/29, Ye Xiaolong wrote:
>Attach kmsg and reproduce script.
>
>Note: kernel cmdline contained "memmap=3D104G!4G memmap=3D104G!132G"

Hi,

Any feedback about this issue?

Thanks,
Xiaolong

>
>Thanks,
>Xiaolong
>
>On 03/29, kernel test robot wrote:
>>Hi,
>>
>>We detected below error messages in fio pmem test for btrfs.
>>
>>machine: Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz with 256G memory
>>kernel: v4.10 =

>>test parameters:
>>
>>[global]
>>bs=3D2M
>>ioengine=3Dmmap
>>iodepth=3D32
>>size=3D7669584457
>>direct=3D0
>>runtime=3D200
>>invalidate=3D1
>>fallocate=3Dposix
>>group_reporting
>>
>>time_based
>>
>>[task_0]
>>rw=3Dwrite
>>directory=3D/fs/pmem0
>>numjobs=3D14
>>
>>[task_1]
>>rw=3Dwrite
>>directory=3D/fs/pmem1
>>numjobs=3D14
>>
>>
>>=3D=3D> /tmp/stderr <=3D=3D
>>fio: pid=3D2214, got signal=3D7
>>fio: pid=3D2215, got signal=3D7
>>fio: pid=3D2217, got signal=3D7
>>fio: pid=3D2220, got signal=3D7
>>fio: pid=3D2222, got signal=3D7
>>fio: pid=3D2224, got signal=3D7
>>fio: pid=3D2225, got signal=3D7
>>fio: pid=3D2227, got signal=3D7
>>fio: pid=3D2216, got signal=3D7
>>fio: pid=3D2218, got signal=3D7
>>fio: pid=3D2219, got signal=3D7
>>fio: pid=3D2221, got signal=3D7
>>fio: pid=3D2223, got signal=3D7
>>fio: pid=3D2226, got signal=3D7
>>fio: pid=3D2200, got signal=3D7
>>fio: pid=3D2201, got signal=3D7
>>fio: pid=3D2203, got signal=3D7
>>fio: pid=3D2204, got signal=3D7
>>fio: pid=3D2205, got signal=3D7
>>fio: pid=3D2208, got signal=3D7
>>fio: pid=3D2209, got signal=3D7
>>fio: pid=3D2210, got signal=3D7
>>fio: pid=3D2211, got signal=3D7
>>fio: pid=3D2212, got signal=3D7
>>fio: pid=3D2213, got signal=3D7
>>fio: pid=3D2202, got signal=3D7
>>fio: pid=3D2206, got signal=3D7
>>fio: pid=3D2207, got signal=3D7
>>fio: file hash not empty on exit
>>
>>while fio test is ok for ext4 with the same test parameters.
>>Attached reproduce.sh may help reproduce the problem.
>>
>>Thanks,
>>Xiaolong
>
>


>modprobe nd_e820
>dmsetup remove_all
>wipefs -a --force /dev/pmem0
>wipefs -a --force /dev/pmem1
>mkfs -t btrfs /dev/pmem1
>mkfs -t btrfs /dev/pmem0
>mkdir -p /fs/pmem0
>mount -t btrfs /dev/pmem0 /fs/pmem0
>mkdir -p /fs/pmem1
>mount -t btrfs /dev/pmem1 /fs/pmem1
>
>for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
>do
>	echo performance > $file
>done
>
>echo '
>[global]
>bs=3D2M
>ioengine=3Dmmap
>iodepth=3D32
>size=3D7669584457
>direct=3D0
>runtime=3D200
>invalidate=3D1
>fallocate=3Dposix
>group_reporting
>
>time_based
>
>[task_0]
>rw=3Dwrite
>directory=3D/fs/pmem0
>numjobs=3D14
>
>[task_1]
>rw=3Dwrite
>directory=3D/fs/pmem1
>numjobs=3D14' | fio --output-format=3Djson -

>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp


--===============2635541296497604904==--

