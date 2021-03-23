Content-Type: multipart/mixed; boundary="===============8875399932384817255=="
MIME-Version: 1.0
From: Douglas Gilbert <dgilbert@interlog.com>
To: lkp@lists.01.org
Subject: Re: [scsi_debug] 20b58d1e6b: blktests.block.001.fail
Date: Tue, 23 Mar 2021 11:29:33 -0400
Message-ID: <d771d5a1-d411-fb34-1c72-81d16e0588d4@interlog.com>
In-Reply-To: <20210323132620.GA23032@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8875399932384817255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-03-23 9:26 a.m., kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 20b58d1e6b9cda142cd142a0a2f94c0d04b0a5a0 ("[RFC] scsi_debug: add =
hosts initialization --> worker")
> url: https://github.com/0day-ci/linux/commits/Douglas-Gilbert/scsi_debug-=
add-hosts-initialization-worker/20210319-230817
> base: https://git.kernel.org/cgit/linux/kernel/git/jejb/scsi.git for-next
> =

> in testcase: blktests
> version: blktests-x86_64-a210761-1_20210124
> with following parameters:
> =

> 	disk: 1SSD
> 	test: block-group-00
> 	ucode: 0xe2
> =

> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 3=
2G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

This RFC was proposed for Luis Chamberlain to consider for this report:
    https://bugzilla.kernel.org/show_bug.cgi?id=3D212337

Luis predicted that this change would trip up some blktests which is exactl=
y =

what has happened here. The question here is whether it is reasonable (i.e.
a correct simulation of what real hardware does) to assume that as soon as
the loading of the scsi_debug is complete, that _all_ LUNs (devices) specif=
ied
in its parameters are ready for media access?

If yes then this RFC can be dropped or relegated to only occur when a driver
parameter is set to a non-default value.

If no then those blktest scripts need to be fixed to reflect that after a
HBA is loaded, all the targets and LUNs connected to it do _not_ immediately
become available.

Doug Gilbert


> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> 2021-03-21 02:40:23 sed "s:^:block/:" /lkp/benchmarks/blktests/tests/bloc=
k-group-00
> 2021-03-21 02:40:23 ./check block/001
> block/001 (stress device hotplugging)
> block/001 (stress device hotplugging)                        [failed]
>      runtime  ...  30.370s
>      --- tests/block/001.out	2021-01-24 06:04:08.000000000 +0000
>      +++ /lkp/benchmarks/blktests/results/nodev/block/001.out.bad	2021-03=
-21 02:40:53.652003261 +0000
>      @@ -1,4 +1,7 @@
>       Running block/001
>       Stressing sd
>      +ls: cannot access '/sys/class/scsi_device/4:0:0:0/device/block': No=
 such file or directory
>      +ls: cannot access '/sys/class/scsi_device/5:0:0:0/device/block': No=
 such file or directory
>       Stressing sr
>      +ls: cannot access '/sys/class/scsi_device/4:0:0:0/device/block': No=
 such file or directory
>       Test complete
> =

> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install                job.yaml  # job file is attached =
in this email
>          bin/lkp split-job --compatible job.yaml
>          bin/lkp run                    compatible-job.yaml
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
>=20

--===============8875399932384817255==--

