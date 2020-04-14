Content-Type: multipart/mixed; boundary="===============2488359581327403731=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] d3b6f23f71: stress-ng.fiemap.ops_per_sec -60.5% regression
Date: Tue, 14 Apr 2020 13:49:15 +0800
Message-ID: <bf06a978-828a-9676-0ff8-fa47826d0bdd@linux.intel.com>
In-Reply-To: <20200413105656.9B0D1AE04D@d06av26.portsmouth.uk.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2488359581327403731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for your quick response, if you need any more test information =

about the regression, please let me known.

On 4/13/2020 6:56 PM, Ritesh Harjani wrote:
> =

> =

> On 4/13/20 2:07 PM, Xing Zhengjun wrote:
>> Hi Harjani,
>>
>> =C2=A0=C2=A0=C2=A0 Do you have time to take a look at this? Thanks.
> =

> Hello Xing,
> =

> I do want to look into this. But as of now I am stuck with another
> mballoc failure issue. I will get back at this once I have some handle
> over that one.
> =

> BTW, are you planning to take look at this?
> =

> -ritesh
> =

> =

>>
>> On 4/7/2020 4:00 PM, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -60.5% regression of stress-ng.fiemap.ops_per_sec =

>>> due to commit:
>>>
>>>
>>> commit: d3b6f23f71670007817a5d59f3fbafab2b794e8c ("ext4: move =

>>> ext4_fiemap to use iomap framework")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>> in testcase: stress-ng
>>> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz =

>>> with 192G memory
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0nr_threads: 10%
>>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
>>> =C2=A0=C2=A0=C2=A0=C2=A0testtime: 1s
>>> =C2=A0=C2=A0=C2=A0=C2=A0class: os
>>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x500002c
>>> =C2=A0=C2=A0=C2=A0=C2=A0fs: ext4
>>>
>>>
>>>
>>>
>>>
>>>
>>> Details are as below:
>>> -----------------------------------------------------------------------=
---------------------------> =

>>>
>>>
>>>
>>> To reproduce:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://gith=
ub.com/intel/lkp-tests.git
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install job.ya=
ml=C2=A0 # job file is attached in this email
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=A0=C2=
=A0=C2=A0=C2=A0 job.yaml
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =

>>>
>>> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_=
group/testcase/testtime/ucode: =

>>>
>>> os/gcc-7/performance/1HDD/ext4/x86_64-rhel-7.6/10%/debian-x86_64-201911=
14.cgz/lkp-csl-2sp5/stress-ng/1s/0x500002c =

>>>
>>>
>>> commit:
>>> =C2=A0=C2=A0 b2c5764262 ("ext4: make ext4_ind_map_blocks work with fiem=
ap")
>>> =C2=A0=C2=A0 d3b6f23f71 ("ext4: move ext4_fiemap to use iomap framework=
")
>>>
>>> b2c5764262edded1 d3b6f23f71670007817a5d59f3f
>>> ---------------- ---------------------------
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproductio=
n=C2=A0=C2=A0=C2=A0 fail:runs
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :4=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25%=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:4 =

>>> dmesg.WARNING:at#for_ip_interrupt_entry/0x
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2:4=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2:4 =

>>> perf-profile.calltrace.cycles-pp.sync_regs.error_entry
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2:4=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3:4 =

>>> perf-profile.calltrace.cycles-pp.error_entry
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3:4=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3:4 =

>>> perf-profile.children.cycles-pp.error_entry
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:4=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:4 =

>>> perf-profile.self.cycles-pp.error_entry
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=
=A0=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %st=
ddev
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28623=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +28.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36703 =C2=
=B1 12%=C2=A0 stress-ng.daemon.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28632=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +28.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36704 =C2=
=B1 12% =

>>> stress-ng.daemon.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0 566.00 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -53.=
2%=C2=A0=C2=A0=C2=A0=C2=A0 265.00 =C2=B1 53%=C2=A0 stress-ng.dev.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0 278.81 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -53.=
0%=C2=A0=C2=A0=C2=A0=C2=A0 131.00 =C2=B1 54%=C2=A0 stress-ng.dev.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 73160=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -60.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28849 =C2=
=B1=C2=A0 3%=C2=A0 stress-ng.fiemap.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72471=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -60.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28612 =C2=
=B1=C2=A0 3% =

>>> stress-ng.fiemap.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23421 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28388 =C2=B1=C2=A0 6%=C2=A0 stress-ng=
.filename.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22638 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27241 =C2=B1=C2=A0 6% =

>>> stress-ng.filename.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.25 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=
=C2=A0 -10.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.00 =C2=B1=C2=A0 3%=C2=A0 str=
ess-ng.iomix.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38.75 =C2=B1 49%=C2=A0=C2=A0=C2=A0=C2=A0=
 -47.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20.25 =C2=B1 96%=C2=A0 stress-ng.memh=
otplug.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.45 =C2=B1 52%=C2=A0=C2=A0=C2=A0=C2=A0=
 -51.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16.62 =C2=B1106% =

>>> stress-ng.memhotplug.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1734 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0 +31.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2278 =C2=B1 10%=C2=A0 str=
ess-ng.resources.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0 807.56 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +35.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1091 =C2=B1=C2=A0 8% =

>>> stress-ng.resources.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0 1007356 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -16.=
5%=C2=A0=C2=A0=C2=A0=C2=A0 840642 =C2=B1=C2=A0 9%=C2=A0 stress-ng.revio.ops
>>> =C2=A0=C2=A0=C2=A0 1007692 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -16.=
6%=C2=A0=C2=A0=C2=A0=C2=A0 840711 =C2=B1=C2=A0 9% =

>>> stress-ng.revio.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21812 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=
=C2=A0 +16.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25294 =C2=B1=C2=A0 5%=C2=A0 str=
ess-ng.sysbadaddr.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21821 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=
=C2=A0 +15.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25294 =C2=B1=C2=A0 5% =

>>> stress-ng.sysbadaddr.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0 440.75 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.9%=C2=A0=C2=A0=C2=A0=C2=A0 537.25 =C2=B1=C2=A0 9%=C2=A0 stress-ng.sysf=
s.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0 440.53 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.9%=C2=A0=C2=A0=C2=A0=C2=A0 536.86 =C2=B1=C2=A0 9% =

>>> stress-ng.sysfs.ops_per_sec
>>> =C2=A0=C2=A0 13286582=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -11.1%=C2=A0=C2=A0 11805520 =C2=B1=C2=A0 6% =

>>> stress-ng.time.file_system_outputs
>>> =C2=A0=C2=A0 68253896=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +2.4%=C2=A0=C2=A0 69860122 stress-ng.time.minor_page_fau=
lts
>>> =C2=A0=C2=A0=C2=A0=C2=A0 197.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -15.9%=C2=A0=C2=A0=C2=A0=C2=A0 165.75 =C2=B1 12%=C2=A0 stress-ng.xattr.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0 192.45 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -16.1%=C2=A0=C2=A0=C2=A0=C2=A0 161.46 =C2=B1 11% =

>>> stress-ng.xattr.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15310=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +62.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24875 =C2=
=B1 22%=C2=A0 stress-ng.zombie.ops
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15310=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +62.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24874 =C2=
=B1 22% =

>>> stress-ng.zombie.ops_per_sec
>>> =C2=A0=C2=A0=C2=A0=C2=A0 203.50 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -47.=
3%=C2=A0=C2=A0=C2=A0=C2=A0 107.25 =C2=B1 49%=C2=A0 vmstat.io.bi
>>> =C2=A0=C2=A0=C2=A0=C2=A0 861318 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -29.=
7%=C2=A0=C2=A0=C2=A0=C2=A0 605884 =C2=B1=C2=A0 5%=C2=A0 meminfo.AnonHugePag=
es
>>> =C2=A0=C2=A0=C2=A0 1062742 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -20.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 847853 =C2=B1=C2=A0 3%=C2=A0 meminfo.AnonPages
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31093 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +9.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34090 =C2=B1=C2=A0 3%=C2=
=A0 meminfo.KernelStack
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7151 =C2=B1 34%=C2=A0=C2=A0=C2=A0=
=C2=A0 +55.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11145 =C2=B1=C2=A0 9%=C2=A0 mem=
info.Mlocked
>>> =C2=A0 1.082e+08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -40.2%=C2=A0=
=C2=A0 64705429 =C2=B1 31% =

>>> numa-numastat.node0.local_node
>>> =C2=A0 1.082e+08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -40.2%=C2=A0=
=C2=A0 64739883 =C2=B1 31% =

>>> numa-numastat.node0.numa_hit
>>> =C2=A0=C2=A0 46032662 =C2=B1 21%=C2=A0=C2=A0=C2=A0 +104.3%=C2=A0=C2=A0 =
94042918 =C2=B1 20% =

>>> numa-numastat.node1.local_node
>>> =C2=A0=C2=A0 46074205 =C2=B1 21%=C2=A0=C2=A0=C2=A0 +104.2%=C2=A0=C2=A0 =
94072810 =C2=B1 20% =

>>> numa-numastat.node1.numa_hit
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3942 =C2=B1=C2=A0 3%=C2=A0=C2=A0=
=C2=A0=C2=A0 +14.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4501 =C2=B1=C2=A0 4=
% =

>>> slabinfo.pool_workqueue.active_objs
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4098 =C2=B1=C2=A0 3%=C2=A0=C2=A0=
=C2=A0=C2=A0 +14.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4683 =C2=B1=C2=A0 4=
% =

>>> slabinfo.pool_workqueue.num_objs
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4817 =C2=B1=C2=A0 7%=C2=A0=C2=A0=
=C2=A0=C2=A0 +13.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5456 =C2=B1=C2=A0 8=
% =

>>> slabinfo.proc_dir_entry.active_objs
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5153 =C2=B1=C2=A0 6%=C2=A0=C2=A0=
=C2=A0=C2=A0 +12.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5797 =C2=B1=C2=A0 8=
% =

>>> slabinfo.proc_dir_entry.num_objs
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18598 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12437 =C2=B1 20% =

>>> sched_debug.cfs_rq:/.load.avg
>>> =C2=A0=C2=A0=C2=A0=C2=A0 452595 =C2=B1 56%=C2=A0=C2=A0=C2=A0=C2=A0 -71.=
4%=C2=A0=C2=A0=C2=A0=C2=A0 129637 =C2=B1 76% =

>>> sched_debug.cfs_rq:/.load.max
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 67675 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0=
 -55.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30377 =C2=B1 42% =

>>> sched_debug.cfs_rq:/.load.stddev
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18114 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12011 =C2=B1 20% =

>>> sched_debug.cfs_rq:/.runnable_weight.avg
>>> =C2=A0=C2=A0=C2=A0=C2=A0 448215 =C2=B1 58%=C2=A0=C2=A0=C2=A0=C2=A0 -72.=
8%=C2=A0=C2=A0=C2=A0=C2=A0 121789 =C2=B1 82% =

>>> sched_debug.cfs_rq:/.runnable_weight.max
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 67083 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0=
 -56.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29305 =C2=B1 43% =

>>> sched_debug.cfs_rq:/.runnable_weight.stddev
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -38032=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +434.3%=C2=A0=C2=A0=C2=A0 -203212 sched_debug.cfs_rq:/.spre=
ad0.avg
>>> =C2=A0=C2=A0=C2=A0 -204466=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +95.8%=C2=A0=C2=A0=C2=A0 -400301 sched_debug.cfs_rq:/.sprea=
d0.min
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 90.02 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0=
 -58.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37.69 =C2=B1 52% =

>>> sched_debug.cfs_rq:/.util_est_enqueued.avg
>>> =C2=A0=C2=A0=C2=A0=C2=A0 677.54 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 -39.3%=C2=A0=C2=A0=C2=A0=C2=A0 411.50 =C2=B1 22% =

>>> sched_debug.cfs_rq:/.util_est_enqueued.max
>>> =C2=A0=C2=A0=C2=A0=C2=A0 196.57 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 -47.6%=C2=A0=C2=A0=C2=A0=C2=A0 103.05 =C2=B1 36% =

>>> sched_debug.cfs_rq:/.util_est_enqueued.stddev
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.34 =C2=B1 23%=C2=A0=C2=A0=C2=A0=
=C2=A0 +34.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.48 =C2=B1=C2=A0 4% =

>>> sched_debug.cpu.clock.stddev
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.34 =C2=B1 23%=C2=A0=C2=A0=C2=A0=
=C2=A0 +34.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.48 =C2=B1=C2=A0 4% =

>>> sched_debug.cpu.clock_task.stddev
>>> =C2=A0=C2=A0=C2=A0=C2=A0 402872 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 -11.9%=C2=A0=C2=A0=C2=A0=C2=A0 354819 =C2=B1=C2=A0 2%  =

>>> proc-vmstat.nr_active_anon
>>> =C2=A0=C2=A0=C2=A0 1730331=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -9.5%=C2=A0=C2=A0=C2=A0 1566418 =C2=B1=C2=A0 5%=C2=A0=
 proc-vmstat.nr_dirtied
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31042 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +9.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33915 =C2=B1=C2=A0 3% =

>>> proc-vmstat.nr_kernel_stack
>>> =C2=A0=C2=A0=C2=A0=C2=A0 229047=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -2.4%=C2=A0=C2=A0=C2=A0=C2=A0 223615=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_mapped
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 74008 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=
=C2=A0 +20.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 89163 =C2=B1=C2=A0 8%=C2=A0 pro=
c-vmstat.nr_written
>>> =C2=A0=C2=A0=C2=A0=C2=A0 402872 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 -11.9%=C2=A0=C2=A0=C2=A0=C2=A0 354819 =C2=B1=C2=A0 2% =

>>> proc-vmstat.nr_zone_active_anon
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 50587 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37829 =C2=B1 14% =

>>> proc-vmstat.numa_pages_migrated
>>> =C2=A0=C2=A0=C2=A0=C2=A0 457500=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -23.1%=C2=A0=C2=A0=C2=A0=C2=A0 351918 =C2=B1 31% =

>>> proc-vmstat.numa_pte_updates
>>> =C2=A0=C2=A0 81382485=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.9%=C2=A0=C2=A0 82907822=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 proc-vmstat.pgfault
>>> =C2=A0 2.885e+08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -13.3%=C2=A0 2=
.502e+08 =C2=B1=C2=A0 6%=C2=A0 proc-vmstat.pgfree
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42206 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=
 -46.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22399 =C2=B1 49%=C2=A0 proc-vmstat.pg=
pgin
>>> =C2=A0=C2=A0=C2=A0=C2=A0 431233 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -64.=
8%=C2=A0=C2=A0=C2=A0=C2=A0 151736 =C2=B1109%=C2=A0 proc-vmstat.pgrotated
>>> =C2=A0=C2=A0=C2=A0=C2=A0 176754 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 -40.2%=C2=A0=C2=A0=C2=A0=C2=A0 105637 =C2=B1 31% =

>>> proc-vmstat.thp_fault_alloc
>>> =C2=A0=C2=A0=C2=A0=C2=A0 314.50 =C2=B1 82%=C2=A0=C2=A0=C2=A0 +341.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1388 =C2=B1 44% =

>>> proc-vmstat.unevictable_pgs_stranded
>>> =C2=A0=C2=A0=C2=A0 1075269 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -41.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 631388 =C2=B1 17%=C2=A0 numa-meminfo.node0.Active
>>> =C2=A0=C2=A0=C2=A0=C2=A0 976056 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -39.=
7%=C2=A0=C2=A0=C2=A0=C2=A0 588727 =C2=B1 19% =

>>> numa-meminfo.node0.Active(anon)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 426857 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -36.=
4%=C2=A0=C2=A0=C2=A0=C2=A0 271375 =C2=B1 13% =

>>> numa-meminfo.node0.AnonHugePages
>>> =C2=A0=C2=A0=C2=A0=C2=A0 558590 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -36.=
4%=C2=A0=C2=A0=C2=A0=C2=A0 355402 =C2=B1 14% =

>>> numa-meminfo.node0.AnonPages
>>> =C2=A0=C2=A0=C2=A0 1794824 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -28.=
8%=C2=A0=C2=A0=C2=A0 1277157 =C2=B1 20% =

>>> numa-meminfo.node0.FilePages
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8517 =C2=B1 92%=C2=A0=C2=A0=C2=A0=
=C2=A0 -82.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1473 =C2=B1 89% =

>>> numa-meminfo.node0.Inactive(file)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 633118 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -41.7%=C2=A0=C2=A0=C2=A0=C2=A0 368920 =C2=B1 36%=C2=A0 numa-meminfo.node0.=
Mapped
>>> =C2=A0=C2=A0=C2=A0 2958038 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -27.7%=C2=
=A0=C2=A0=C2=A0 2139271 =C2=B1 12%  =

>>> numa-meminfo.node0.MemUsed
>>> =C2=A0=C2=A0=C2=A0=C2=A0 181401 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -13.7%=C2=A0=C2=A0=C2=A0=C2=A0 156561 =C2=B1=C2=A0 4% =

>>> numa-meminfo.node0.SUnreclaim
>>> =C2=A0=C2=A0=C2=A0=C2=A0 258124 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 -13.0%=C2=A0=C2=A0=C2=A0=C2=A0 224535 =C2=B1=C2=A0 5%=C2=A0 numa-meminfo.n=
ode0.Slab
>>> =C2=A0=C2=A0=C2=A0=C2=A0 702083 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +31.=
0%=C2=A0=C2=A0=C2=A0=C2=A0 919406 =C2=B1 11%=C2=A0 numa-meminfo.node1.Active
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38663 =C2=B1107%=C2=A0=C2=A0=C2=A0 +137.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 91951 =C2=B1 31% =

>>> numa-meminfo.node1.Active(file)
>>> =C2=A0=C2=A0=C2=A0 1154975 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
6%=C2=A0=C2=A0=C2=A0 1635593 =C2=B1 12% =

>>> numa-meminfo.node1.FilePages
>>> =C2=A0=C2=A0=C2=A0=C2=A0 395813 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0 +62.=
8%=C2=A0=C2=A0=C2=A0=C2=A0 644533 =C2=B1 16% =

>>> numa-meminfo.node1.Inactive
>>> =C2=A0=C2=A0=C2=A0=C2=A0 394313 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0 +62.=
5%=C2=A0=C2=A0=C2=A0=C2=A0 640686 =C2=B1 16% =

>>> numa-meminfo.node1.Inactive(anon)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 273317=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +88.8%=C2=A0=C2=A0=C2=A0=C2=A0 515976 =C2=B1 25%=C2=
=A0 numa-meminfo.node1.Mapped
>>> =C2=A0=C2=A0=C2=A0 2279237 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +25.=
7%=C2=A0=C2=A0=C2=A0 2865582 =C2=B1=C2=A0 7%  =

>>> numa-meminfo.node1.MemUsed
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10830 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=
 +29.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14033 =C2=B1=C2=A0 9% =

>>> numa-meminfo.node1.PageTables
>>> =C2=A0=C2=A0=C2=A0=C2=A0 149390 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.2%=C2=A0=C2=A0=C2=A0=C2=A0 184085 =C2=B1=C2=A0 3% =

>>> numa-meminfo.node1.SUnreclaim
>>> =C2=A0=C2=A0=C2=A0=C2=A0 569542 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +74.=
8%=C2=A0=C2=A0=C2=A0=C2=A0 995336 =C2=B1 21%=C2=A0 numa-meminfo.node1.Shmem
>>> =C2=A0=C2=A0=C2=A0=C2=A0 220774 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0 265656 =C2=B1=C2=A0 3%=C2=A0 numa-meminfo.n=
ode1.Slab
>>> =C2=A0=C2=A0 35623587 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -11.7%=C2=
=A0=C2=A0 31444514 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.cache-misses
>>> =C2=A0 2.576e+08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -6.8%=C2=
=A0=C2=A0=C2=A0 2.4e+08 =C2=B1=C2=A0 2% =

>>> perf-stat.i.cache-references
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3585=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 3323 =C2=B1=C2=A0 5%  =

>>> perf-stat.i.cpu-migrations
>>> =C2=A0=C2=A0=C2=A0=C2=A0 180139 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +4.2%=C2=A0=C2=A0=C2=A0=C2=A0 187668=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 perf-stat.i.minor-faults
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 69.13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
71.75 perf-stat.i.node-load-miss-rate%
>>> =C2=A0=C2=A0=C2=A0 4313695 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.4%=C2=A0=C2=A0=C2=A0 3994957 =C2=B1=C2=A0 2% =

>>> perf-stat.i.node-load-misses
>>> =C2=A0=C2=A0=C2=A0 5466253 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 -17.3%=C2=
=A0=C2=A0=C2=A0 4521173 =C2=B1=C2=A0 6%=C2=A0 perf-stat.i.node-loads
>>> =C2=A0=C2=A0=C2=A0 2818674 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -15.=
8%=C2=A0=C2=A0=C2=A0 2372542 =C2=B1=C2=A0 5%=C2=A0 perf-stat.i.node-stores
>>> =C2=A0=C2=A0=C2=A0=C2=A0 227810=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.6%=C2=A0=C2=A0=C2=A0=C2=A0 238290=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.page-faults
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -7.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.76 =C2=B1=C2=A0 2%=C2=
=A0 perf-stat.overall.MPKI
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.01 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.97 =C2=
=B1=C2=A0 3% =

>>> perf-stat.overall.branch-miss-rate%
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1044=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +13.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=
181 =C2=B1=C2=A0 4% =

>>> perf-stat.overall.cycles-between-cache-misses
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40.37 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +3.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 44.00 =C2=B1=C2=A0 2% =

>>> perf-stat.overall.node-store-miss-rate%
>>> =C2=A0=C2=A0 36139526 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -12.5%=C2=
=A0=C2=A0 31625519 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.cache-misses
>>> =C2=A0 2.566e+08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -6.9%=C2=
=A0 2.389e+08 =C2=B1=C2=A0 2% =

>>> perf-stat.ps.cache-references
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3562=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 3306 =C2=B1=C2=A0 5% =

>>> perf-stat.ps.cpu-migrations
>>> =C2=A0=C2=A0=C2=A0=C2=A0 179088=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.2%=C2=A0=C2=A0=C2=A0=C2=A0 186579=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.minor-faults
>>> =C2=A0=C2=A0=C2=A0 4323383 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.5%=C2=A0=C2=A0=C2=A0 3999214 perf-stat.ps.node-load-misses
>>> =C2=A0=C2=A0=C2=A0 5607721 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -18.5%=C2=
=A0=C2=A0=C2=A0 4568664 =C2=B1=C2=A0 6%=C2=A0 perf-stat.ps.node-loads
>>> =C2=A0=C2=A0=C2=A0 2855134 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -16.=
4%=C2=A0=C2=A0=C2=A0 2387345 =C2=B1=C2=A0 5%=C2=A0 perf-stat.ps.node-stores
>>> =C2=A0=C2=A0=C2=A0=C2=A0 226270=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.6%=C2=A0=C2=A0=C2=A0=C2=A0 236709=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.page-faults
>>> =C2=A0=C2=A0=C2=A0=C2=A0 242305 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -42.=
4%=C2=A0=C2=A0=C2=A0=C2=A0 139551 =C2=B1 18% =

>>> numa-vmstat.node0.nr_active_anon
>>> =C2=A0=C2=A0=C2=A0=C2=A0 135983 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 -37.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 85189 =C2=B1 10% =

>>> numa-vmstat.node0.nr_anon_pages
>>> =C2=A0=C2=A0=C2=A0=C2=A0 209.25 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -38.=
1%=C2=A0=C2=A0=C2=A0=C2=A0 129.50 =C2=B1 10% =

>>> numa-vmstat.node0.nr_anon_transparent_hugepages
>>> =C2=A0=C2=A0=C2=A0=C2=A0 449367 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 -29.7%=C2=A0=C2=A0=C2=A0=C2=A0 315804 =C2=B1 20% =

>>> numa-vmstat.node0.nr_file_pages
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2167 =C2=B1 90%=C2=A0=C2=A0=C2=A0=
=C2=A0 -80.6%=C2=A0=C2=A0=C2=A0=C2=A0 419.75 =C2=B1 98% =

>>> numa-vmstat.node0.nr_inactive_file
>>> =C2=A0=C2=A0=C2=A0=C2=A0 157405 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -41.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 92206 =C2=B1 35% =

>>> numa-vmstat.node0.nr_mapped
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2022 =C2=B1 30%=C2=A0=C2=A0=C2=A0=
=C2=A0 -73.3%=C2=A0=C2=A0=C2=A0=C2=A0 539.25 =C2=B1 91%  =

>>> numa-vmstat.node0.nr_mlock
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3336 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0 -24.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2524 =C2=B1 25% =

>>> numa-vmstat.node0.nr_page_table_pages
>>> =C2=A0=C2=A0=C2=A0=C2=A0 286158 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -41.=
2%=C2=A0=C2=A0=C2=A0=C2=A0 168337 =C2=B1 37%  =

>>> numa-vmstat.node0.nr_shmem
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 45493 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=
=C2=A0 -14.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39094 =C2=B1=C2=A0 4% =

>>> numa-vmstat.node0.nr_slab_unreclaimable
>>> =C2=A0=C2=A0=C2=A0=C2=A0 242294 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -42.=
4%=C2=A0=C2=A0=C2=A0=C2=A0 139547 =C2=B1 18% =

>>> numa-vmstat.node0.nr_zone_active_anon
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2167 =C2=B1 90%=C2=A0=C2=A0=C2=A0=
=C2=A0 -80.6%=C2=A0=C2=A0=C2=A0=C2=A0 419.75 =C2=B1 98% =

>>> numa-vmstat.node0.nr_zone_inactive_file
>>> =C2=A0=C2=A0 54053924 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -39.3%=C2=
=A0=C2=A0 32786242 =C2=B1 34%  =

>>> numa-vmstat.node0.numa_hit
>>> =C2=A0=C2=A0 53929628 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -39.5%=C2=
=A0=C2=A0 32619715 =C2=B1 34% =

>>> numa-vmstat.node0.numa_local
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9701 =C2=B1107%=C2=A0=C2=A0=C2=A0 =
+136.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22985 =C2=B1 31% =

>>> numa-vmstat.node1.nr_active_file
>>> =C2=A0=C2=A0=C2=A0=C2=A0 202.50 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -25.=
1%=C2=A0=C2=A0=C2=A0=C2=A0 151.75 =C2=B1 23% =

>>> numa-vmstat.node1.nr_anon_transparent_hugepages
>>> =C2=A0=C2=A0=C2=A0=C2=A0 284922 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +43.3%=C2=A0=C2=A0=C2=A0=C2=A0 408195 =C2=B1 13% =

>>> numa-vmstat.node1.nr_file_pages
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 96002 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0=
 +67.5%=C2=A0=C2=A0=C2=A0=C2=A0 160850 =C2=B1 17% =

>>> numa-vmstat.node1.nr_inactive_anon
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 68077 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 +90.3%=C2=A0=C2=A0=C2=A0=C2=A0 129533 =C2=B1 25% =

>>> numa-vmstat.node1.nr_mapped
>>> =C2=A0=C2=A0=C2=A0=C2=A0 138482 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +79.=
2%=C2=A0=C2=A0=C2=A0=C2=A0 248100 =C2=B1 22%  =

>>> numa-vmstat.node1.nr_shmem
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37396 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=
=C2=A0 +23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46094 =C2=B1=C2=A0 3% =

>>> numa-vmstat.node1.nr_slab_unreclaimable
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9701 =C2=B1107%=C2=A0=C2=A0=C2=A0 =
+136.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22985 =C2=B1 31% =

>>> numa-vmstat.node1.nr_zone_active_file
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 96005 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0=
 +67.5%=C2=A0=C2=A0=C2=A0=C2=A0 160846 =C2=B1 17% =

>>> numa-vmstat.node1.nr_zone_inactive_anon
>>> =C2=A0=C2=A0 23343661 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +99.9%=C2=A0=
=C2=A0 46664267 =C2=B1 23%  =

>>> numa-vmstat.node1.numa_hit
>>> =C2=A0=C2=A0 23248487 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +100.5%=C2=A0=C2=A0 =
46610447 =C2=B1 23% =

>>> numa-vmstat.node1.numa_local
>>> =C2=A0=C2=A0=C2=A0=C2=A0 105745 =C2=B1 23%=C2=A0=C2=A0=C2=A0 +112.6%=C2=
=A0=C2=A0=C2=A0=C2=A0 224805 =C2=B1 24%=C2=A0 softirqs.CPU0.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 133310 =C2=B1 36%=C2=A0=C2=A0=C2=A0=C2=A0 -45.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72987 =C2=B1 52%=C2=A0 softirqs.CPU1.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 170110 =C2=B1 55%=C2=A0=C2=A0=C2=A0=C2=A0 -66.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 56407 =C2=B1147%=C2=A0 softirqs.CPU11.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 91465 =C2=B1 36%=C2=A0=C2=A0=C2=A0=C2=A0=
 -65.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31858 =C2=B1112%=C2=A0 softirqs.CPU13=
.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 164491 =C2=B1 57%=C2=A0=C2=A0=C2=A0=C2=A0 -77.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36641 =C2=B1121%=C2=A0 softirqs.CPU15.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 121069 =C2=B1 55%=C2=A0=C2=A0=C2=A0=C2=A0 -99.=
3%=C2=A0=C2=A0=C2=A0=C2=A0 816.75 =C2=B1 96%=C2=A0 softirqs.CPU17.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 81019 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -8.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 73967 =C2=B1=C2=A0 4%=C2=
=A0 softirqs.CPU20.RCU
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72143 =C2=B1 63%=C2=A0=C2=A0=C2=A0=C2=A0=
 -89.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7360 =C2=B1172%=C2=A0 softirqs.=
CPU22.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 270663 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 -57.=
9%=C2=A0=C2=A0=C2=A0=C2=A0 113915 =C2=B1 45%=C2=A0 softirqs.CPU24.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20149 =C2=B1 76%=C2=A0=C2=A0=C2=A0 +474.=
1%=C2=A0=C2=A0=C2=A0=C2=A0 115680 =C2=B1 62%=C2=A0 softirqs.CPU26.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14033 =C2=B1 70%=C2=A0=C2=A0=C2=A0 +977.=
5%=C2=A0=C2=A0=C2=A0=C2=A0 151211 =C2=B1 75%=C2=A0 softirqs.CPU27.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27834 =C2=B1 94%=C2=A0=C2=A0=C2=A0 +476.=
1%=C2=A0=C2=A0=C2=A0=C2=A0 160357 =C2=B1 28%=C2=A0 softirqs.CPU28.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35346 =C2=B1 68%=C2=A0=C2=A0=C2=A0 +212.=
0%=C2=A0=C2=A0=C2=A0=C2=A0 110290 =C2=B1 30%=C2=A0 softirqs.CPU29.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34347 =C2=B1103%=C2=A0=C2=A0=C2=A0 +336.=
5%=C2=A0=C2=A0=C2=A0=C2=A0 149941 =C2=B1 32%=C2=A0 softirqs.CPU32.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 70077 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=
=C2=A0 +10.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 77624 =C2=B1=C2=A0 3%=C2=A0 sof=
tirqs.CPU34.RCU
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36453 =C2=B1 84%=C2=A0=C2=A0=C2=A0 +339.=
6%=C2=A0=C2=A0=C2=A0=C2=A0 160253 =C2=B1 42%=C2=A0 softirqs.CPU36.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72367 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 +10.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 80043=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 softirqs.CPU37.RCU
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25239 =C2=B1118%=C2=A0=C2=A0=C2=A0 +267.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 92799 =C2=B1 45%=C2=A0 softirqs.CPU38.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4995 =C2=B1170%=C2=A0=C2=A0 +1155.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 62734 =C2=B1 62%=C2=A0 softirqs.CPU39.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4641 =C2=B1145%=C2=A0=C2=A0 +1611.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 79432 =C2=B1 90%=C2=A0 softirqs.CPU42.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7192 =C2=B1 65%=C2=A0=C2=A0=C2=A0 =
+918.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 73225 =C2=B1 66%=C2=A0 softirqs.CPU45=
.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1772 =C2=B1166%=C2=A0=C2=A0 +1837.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34344 =C2=B1 63%=C2=A0 softirqs.CPU46.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13149 =C2=B1 81%=C2=A0=C2=A0=C2=A0 +874.=
7%=C2=A0=C2=A0=C2=A0=C2=A0 128170 =C2=B1 58%=C2=A0 softirqs.CPU47.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 86484 =C2=B1 94%=C2=A0=C2=A0=C2=A0=C2=A0=
 -92.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6357 =C2=B1172%=C2=A0 softirqs.=
CPU48.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 129128 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -95.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5434 =C2=B1172%=C2=A0 softirqs.CPU55=
.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 82772 =C2=B1 59%=C2=A0=C2=A0=C2=A0=C2=A0=
 -91.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6891 =C2=B1164%=C2=A0 softirqs.=
CPU56.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 145313 =C2=B1 57%=C2=A0=C2=A0=C2=A0=C2=A0 -87.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 17796 =C2=B1 88%=C2=A0 softirqs.CPU57.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 118160 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0 -86.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16226 =C2=B1109%=C2=A0 softirqs.CPU58.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 94576 =C2=B1 56%=C2=A0=C2=A0=C2=A0=C2=A0=
 -94.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5557 =C2=B1173%=C2=A0 softirqs.=
CPU6.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 82900 =C2=B1 77%=C2=A0=C2=A0=C2=A0=C2=A0=
 -66.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27508 =C2=B1171%=C2=A0 softirqs.CPU62=
.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 157291 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 -81.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29656 =C2=B1111%=C2=A0 softirqs.CPU64.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 135101 =C2=B1 28%=C2=A0=C2=A0=C2=A0=C2=A0 -80.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26748 =C2=B1 90%=C2=A0 softirqs.CPU67.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 146574 =C2=B1 56%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 69.75 =C2=B1 98%=C2=A0 softirqs.CPU68.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 81347 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -9.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 74024 =C2=B1=C2=A0 2%=C2=
=A0 softirqs.CPU68.RCU
>>> =C2=A0=C2=A0=C2=A0=C2=A0 201729 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0 -99.=
6%=C2=A0=C2=A0=C2=A0=C2=A0 887.50 =C2=B1107%=C2=A0 softirqs.CPU69.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0 108454 =C2=B1 78%=C2=A0=C2=A0=C2=A0=C2=A0 -97.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2254 =C2=B1169%=C2=A0 softirqs.CPU70=
.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 55289 =C2=B1104%=C2=A0=C2=A0=C2=A0=C2=A0=
 -89.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5942 =C2=B1172%=C2=A0 softirqs.=
CPU71.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10112 =C2=B1172%=C2=A0=C2=A0=C2=A0 +964.=
6%=C2=A0=C2=A0=C2=A0=C2=A0 107651 =C2=B1 89%=C2=A0 softirqs.CPU72.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3136 =C2=B1171%=C2=A0=C2=A0 +1522.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 50879 =C2=B1 66%=C2=A0 softirqs.CPU73.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13353 =C2=B1 79%=C2=A0=C2=A0=C2=A0 +809.=
2%=C2=A0=C2=A0=C2=A0=C2=A0 121407 =C2=B1101%=C2=A0 softirqs.CPU74.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75194 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=
=C2=A0 +10.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 82957 =C2=B1=C2=A0 5%=C2=A0 sof=
tirqs.CPU75.RCU
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11002 =C2=B1173%=C2=A0=C2=A0 +1040.8%=C2=
=A0=C2=A0=C2=A0=C2=A0 125512 =C2=B1 61%=C2=A0 softirqs.CPU76.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2463 =C2=B1173%=C2=A0=C2=A0 +2567.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 65708 =C2=B1 77%=C2=A0 softirqs.CPU78.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25956 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -7.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23932 =C2=B1=C2=A0 3%=C2=
=A0 softirqs.CPU78.SCHED
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16366 =C2=B1150%=C2=A0=C2=A0=C2=A0 +340.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72125 =C2=B1 91%=C2=A0 softirqs.CPU82.NET_=
RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14553 =C2=B1130%=C2=A0=C2=A0 +1513.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 234809 =C2=B1 27%=C2=A0 softirqs.CPU93.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26314=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23884=
 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU93.SCHED
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4582 =C2=B1 88%=C2=A0=C2=A0 +4903.=
4%=C2=A0=C2=A0=C2=A0=C2=A0 229268 =C2=B1 23%=C2=A0 softirqs.CPU94.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11214 =C2=B1111%=C2=A0=C2=A0 +1762.5%=C2=
=A0=C2=A0=C2=A0=C2=A0 208867 =C2=B1 18%=C2=A0 softirqs.CPU95.NET_RX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.53 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.99 =C2=B1 17% =

>>> perf-profile.calltrace.cycles-pp.exit_to_usermode_loop.do_syscall_64.en=
try_SYSCALL_64_after_hwframe =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.52 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.99 =C2=B1 17% =

>>> perf-profile.calltrace.cycles-pp.do_signal.exit_to_usermode_loop.do_sys=
call_64.entry_SYSCALL_64_after_hwframe =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.39 =C2=B1 29%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.88 =C2=B1 21% =

>>> perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.do_signal.exi=
t_to_usermode_loop.do_syscall_64 =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.39 =C2=B1 29%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.88 =C2=B1 21% =

>>> perf-profile.calltrace.cycles-pp.get_signal.do_signal.exit_to_usermode_=
loop.do_syscall_64.entry_SYSCALL_64_after_hwframe =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 59%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1 13% =

>>> perf-profile.calltrace.cycles-pp.filemap_map_pages.handle_pte_fault.__h=
andle_mm_fault.handle_mm_fault.do_page_fault =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.70 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.47 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.do_si=
gnal.exit_to_usermode_loop =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.48 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.27 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.=
get_signal =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.49 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.28 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.mmput.do_exit.do_group_exit.get_signal=
.do_signal =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.30 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.60 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.do_signal.exi=
t_to_usermode_loop.prepare_exit_to_usermode =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.40 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.69 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.prepare_exit_to_usermode.swapgs_restor=
e_regs_and_return_to_usermode =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.37 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.66 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.exit_to_usermode_loop.prepare_exit_to_=
usermode.swapgs_restore_regs_and_return_to_usermode =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.36 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.66 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.do_signal.exit_to_usermode_loop.prepar=
e_exit_to_usermode.swapgs_restore_regs_and_return_to_usermode =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.62 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.get_signal.do_signal.exit_to_usermode_=
loop.prepare_exit_to_usermode.swapgs_restore_regs_and_return_to_usermode =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.44 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.74 =C2=
=B1=C2=A0 7% =

>>> perf-profile.calltrace.cycles-pp.swapgs_restore_regs_and_return_to_user=
mode =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.20 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -2.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.78 =C2=B1156% =

>>> perf-profile.children.cycles-pp.copy_page
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=
=B1 64% =

>>> perf-profile.children.cycles-pp.irq_work_interrupt
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=
=B1 64% =

>>> perf-profile.children.cycles-pp.smp_irq_work_interrupt
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=
=B1 18% =

>>> perf-profile.children.cycles-pp.irq_work_run_list
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=
=B1 24% =

>>> perf-profile.children.cycles-pp.irq_work_run
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=
=B1 24% =

>>> perf-profile.children.cycles-pp.printk
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1=C2=A0 6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=
=B1=C2=A0 9% =

>>> perf-profile.children.cycles-pp.__do_execve_file
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 14%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1100% =

>>> perf-profile.children.cycles-pp.delay_tsc
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=
=B1=C2=A0 9% =

>>> perf-profile.children.cycles-pp.load_elf_binary
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 7%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=
=B1 13% =

>>> perf-profile.children.cycles-pp.search_binary_handler
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1=C2=A0 7%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=
=B1 10% =

>>> perf-profile.children.cycles-pp.call_usermodehelper_exec_async
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=
=B1 11% =

>>> perf-profile.children.cycles-pp.do_execve
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 59% =

>>> perf-profile.children.cycles-pp.__vunmap
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 3%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=
=B1=C2=A0 7% =

>>> perf-profile.children.cycles-pp.rcu_idle_exit
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 14% =

>>> perf-profile.children.cycles-pp.__switch_to_asm
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 13%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1=C2=
=A0 5% =

>>> perf-profile.children.cycles-pp.des3_ede_encrypt
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 11%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 13% =

>>> perf-profile.children.cycles-pp.mark_page_accessed
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=
=B1 12% =

>>> perf-profile.children.cycles-pp.apparmor_cred_prepare
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1=C2=A0 8%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=
=B1 11% =

>>> perf-profile.children.cycles-pp.mem_cgroup_throttle_swaprate
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1=C2=A0 2%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=
=B1 12% =

>>> perf-profile.children.cycles-pp.security_prepare_creds
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.95 =C2=B1 17%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.22 =C2=B1 14% =

>>> perf-profile.children.cycles-pp.filemap_map_pages
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.92 =C2=B1=C2=A0 8%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.65 =C2=
=B1=C2=A0 7% =

>>> perf-profile.children.cycles-pp.get_signal
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.66 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.44 =C2=
=B1=C2=A0 7% =

>>> perf-profile.children.cycles-pp.mmput
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.65 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.43 =C2=
=B1=C2=A0 7% =

>>> perf-profile.children.cycles-pp.exit_mmap
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.40 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.70 =C2=
=B1=C2=A0 7% =

>>> perf-profile.children.cycles-pp.prepare_exit_to_usermode
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.45 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.75 =C2=
=B1=C2=A0 7% =

>>> perf-profile.children.cycles-pp.swapgs_restore_regs_and_return_to_userm=
ode =

>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.16 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -2.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1155% =

>>> perf-profile.self.cycles-pp.copy_page
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 14%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1100% =

>>> perf-profile.self.cycles-pp.delay_tsc
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 14% =

>>> perf-profile.self.cycles-pp.__switch_to_asm
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 12%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 17% =

>>> perf-profile.self.cycles-pp.enqueue_task_fair
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 13%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1=C2=
=A0 5% =

>>> perf-profile.self.cycles-pp.des3_ede_encrypt
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 13%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 19% =

>>> perf-profile.self.cycles-pp.__lru_cache_add
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=
=B1 10% =

>>> perf-profile.self.cycles-pp.mem_cgroup_throttle_swaprate
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=
=B1 11% =

>>> perf-profile.self.cycles-pp.apparmor_cred_prepare
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 58%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 13% =

>>> perf-profile.self.cycles-pp.mark_page_accessed
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.80 =C2=B1 20% =

>>> perf-profile.self.cycles-pp.release_pages
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1173%=C2=A0 +1.3e+05%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1005 =C2=B1100% =

>>> interrupts.127:PCI-MSI.31981660-edge.i40e-eth0-TxRx-91
>>> =C2=A0=C2=A0=C2=A0=C2=A0 820.75 =C2=B1111%=C2=A0=C2=A0=C2=A0=C2=A0 -99.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1173% =

>>> interrupts.47:PCI-MSI.31981580-edge.i40e-eth0-TxRx-11
>>> =C2=A0=C2=A0=C2=A0=C2=A0 449.25 =C2=B1 86%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =

>>> interrupts.53:PCI-MSI.31981586-edge.i40e-eth0-TxRx-17
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.25 =C2=B1157%=C2=A0=C2=A0=C2=A0 -100.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =

>>> interrupts.57:PCI-MSI.31981590-edge.i40e-eth0-TxRx-21
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1110%=C2=A0 +63533.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 477.25 =C2=B1162% =

>>> interrupts.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
>>> =C2=A0=C2=A0=C2=A0=C2=A0 561.50 =C2=B1160%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =

>>> interrupts.65:PCI-MSI.31981598-edge.i40e-eth0-TxRx-29
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 82921 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=
=C2=A0 -11.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 73748 =C2=B1=C2=A0 6% =

>>> interrupts.CPU11.CAL:Function_call_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 66509 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 44828 =C2=B1=C2=A0 8% =

>>> interrupts.CPU14.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43105 =C2=B1 98%=C2=A0=C2=A0=C2=A0=C2=A0=
 -90.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4183 =C2=B1 21% =

>>> interrupts.CPU17.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0 148719 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0 -69.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 45471 =C2=B1 16% =

>>> interrupts.CPU17.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 85589 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=
 -52.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40884 =C2=B1=C2=A0 5% =

>>> interrupts.CPU20.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0 222472 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0 -98.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4360 =C2=B1 45% =

>>> interrupts.CPU22.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1173%=C2=A0 +95350.0%=C2=
=A0=C2=A0=C2=A0=C2=A0 477.25 =C2=B1162% =

>>> interrupts.CPU25.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 76029 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=
 +14.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 87389 =C2=B1=C2=A0 5% =

>>> interrupts.CPU25.CAL:Function_call_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0 399042 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +13.4%=C2=A0=C2=A0=C2=A0=C2=A0 452479 =C2=B1=C2=A0 8% =

>>> interrupts.CPU27.LOC:Local_timer_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0 561.00 =C2=B1161%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =

>>> interrupts.CPU29.65:PCI-MSI.31981598-edge.i40e-eth0-TxRx-29
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7034 =C2=B1 46%=C2=A0=C2=A0 +1083.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83279 =C2=B1138% =

>>> interrupts.CPU29.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 17829 =C2=B1 99%=C2=A0=C2=A0=C2=A0=C2=A0=
 -71.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5172 =C2=B1 16% =

>>> interrupts.CPU30.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5569 =C2=B1 15%=C2=A0=C2=A0 +2414.=
7%=C2=A0=C2=A0=C2=A0=C2=A0 140059 =C2=B1 94% =

>>> interrupts.CPU31.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37674 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=
 +36.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 51473 =C2=B1 25% =

>>> interrupts.CPU31.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47905 =C2=B1 39%=C2=A0=C2=A0=C2=A0=C2=A0=
 +76.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 84583 =C2=B1 38% =

>>> interrupts.CPU34.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0 568.75 =C2=B1140%=C2=A0=C2=A0=C2=A0 +224.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1847 =C2=B1 90% =

>>> interrupts.CPU36.NMI:Non-maskable_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0 568.75 =C2=B1140%=C2=A0=C2=A0=C2=A0 +224.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1847 =C2=B1 90% =

>>> interrupts.CPU36.PMI:Performance_monitoring_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4236 =C2=B1 25%=C2=A0=C2=A0 +2168.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 96092 =C2=B1 90% =

>>> interrupts.CPU36.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 52717 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0=
 +43.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75565 =C2=B1 28% =

>>> interrupts.CPU37.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41418 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0 =
+136.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 98010 =C2=B1 50% =

>>> interrupts.CPU39.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5551 =C2=B1=C2=A0 8%=C2=A0=C2=A0=
=C2=A0 +847.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 52615 =C2=B1 66% =

>>> interrupts.CPU40.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4746 =C2=B1 25%=C2=A0=C2=A0=C2=A0 =
+865.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 45841 =C2=B1 91% =

>>> interrupts.CPU42.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37556 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46808 =C2=B1=C2=A0 6% =

>>> interrupts.CPU42.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21846 =C2=B1124%=C2=A0=C2=A0=C2=A0=C2=A0=
 -84.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3415 =C2=B1 46% =

>>> interrupts.CPU48.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0 891.50 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -35.=
2%=C2=A0=C2=A0=C2=A0=C2=A0 577.25 =C2=B1 40% =

>>> interrupts.CPU49.NMI:Non-maskable_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0 891.50 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -35.=
2%=C2=A0=C2=A0=C2=A0=C2=A0 577.25 =C2=B1 40% =

>>> interrupts.CPU49.PMI:Performance_monitoring_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20459 =C2=B1120%=C2=A0=C2=A0=C2=A0=C2=A0=
 -79.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4263 =C2=B1 14% =

>>> interrupts.CPU49.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 59840 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46042 =C2=B1 16% =

>>> interrupts.CPU5.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 65200 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42678 =C2=B1=C2=A0 9% =

>>> interrupts.CPU51.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 70923 =C2=B1153%=C2=A0=C2=A0=C2=A0=C2=A0=
 -94.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4270 =C2=B1 29% =

>>> interrupts.CPU53.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 65312 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=
 -28.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46578 =C2=B1 14% =

>>> interrupts.CPU56.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 65828 =C2=B1 24%=C2=A0=C2=A0=C2=A0=EF=BF=
=BD=EF=BF=BD -33.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43846 =C2=B1=C2=A0 4% =

>>> interrupts.CPU59.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72558 =C2=B1156%=C2=A0=C2=A0=C2=A0=C2=A0=
 -93.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4906 =C2=B1=C2=A0 9% =

>>> interrupts.CPU6.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 68698 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46327 =C2=B1 18% =

>>> interrupts.CPU61.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0 109745 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0 -57.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46711 =C2=B1 16% =

>>> interrupts.CPU62.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 89714 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=
 -48.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46198 =C2=B1=C2=A0 7% =

>>> interrupts.CPU63.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 59380 =C2=B1136%=C2=A0=C2=A0=C2=A0=C2=A0=
 -91.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5066 =C2=B1 13% =

>>> interrupts.CPU69.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40094 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +133.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 93798 =C2=B1 44% =

>>> interrupts.CPU78.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0 129884 =C2=B1 72%=C2=A0=C2=A0=C2=A0=C2=A0 -55.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 58034 =C2=B1157% =

>>> interrupts.CPU8.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 69984 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=
 +51.4%=C2=A0=C2=A0=C2=A0=C2=A0 105957 =C2=B1 20% =

>>> interrupts.CPU80.CAL:Function_call_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32857 =C2=B1 10%=C2=A0=C2=A0=C2=A0 +128.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75131 =C2=B1 36% =

>>> interrupts.CPU80.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35726 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=
 +34.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 48081 =C2=B1 12% =

>>> interrupts.CPU82.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 73820 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=
 +28.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 94643 =C2=B1=C2=A0 8% =

>>> interrupts.CPU84.CAL:Function_call_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38829 =C2=B1 28%=C2=A0=C2=A0=C2=A0 +190.=
3%=C2=A0=C2=A0=C2=A0=C2=A0 112736 =C2=B1 42% =

>>> interrupts.CPU84.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36129 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=
=C2=A0 +47.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 53329 =C2=B1 13% =

>>> interrupts.CPU85.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4693 =C2=B1=C2=A0 7%=C2=A0=C2=A0 +=
1323.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 66793 =C2=B1145% =

>>> interrupts.CPU86.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38003 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=
 +94.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 74031 =C2=B1 43% =

>>> interrupts.CPU86.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 78022 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +7.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 84210 =C2=B1=C2=A0 3% =

>>> interrupts.CPU87.CAL:Function_call_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36359 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=
=C2=A0 +54.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 56304 =C2=B1 48% =

>>> interrupts.CPU88.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 89031 =C2=B1105%=C2=A0=C2=A0=C2=A0=C2=A0=
 -95.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4475 =C2=B1 40% =

>>> interrupts.CPU9.RES:Rescheduling_interrupts
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40085 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=
 +60.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64368 =C2=B1 27% =

>>> interrupts.CPU91.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42244 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=
 +44.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 61162 =C2=B1 35% =

>>> interrupts.CPU94.TLB:TLB_shootdowns
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40959 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +109.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 85780 =C2=B1 41% =

>>> interrupts.CPU95.TLB:TLB_shootdowns
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.fiemap.ops
>>> =C2=A0=C2=A0 80000 =

>>> +-------------------------------------------------------------------+
>>> =C2=A0=C2=A0 75000 |..+.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 .+..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .+..+..=C2=A0 .+. =

>>> .+..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 +.=
.+..+..+.+.=C2=A0=C2=A0=C2=A0=C2=A0 .+..+..=C2=A0 .+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +.=C2=A0=C2=A0 +. =

>>> +.+..+..+..+.+..|
>>> =C2=A0=C2=A0 70000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + +.=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 65000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 60000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 55000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 50000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 45000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 40000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 35000 |-+ O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 O=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0 O =

>>> O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 30000 |-+=C2=A0 O=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0 O O=C2=
=A0=C2=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0 O=C2=A0=C2=A0=C2=
=A0 O=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0 O=C2=A0 O O=C2=A0 O =

>>> O=C2=A0 O O=C2=A0 |
>>> =C2=A0=C2=A0 25000 =

>>> +-------------------------------------------------------------------+
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.fiemap.ops_per_sec
>>> =C2=A0=C2=A0 80000 =

>>> +-------------------------------------------------------------------+
>>> =C2=A0=C2=A0 75000 |..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .+.. .+..=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 +.=C2=A0 .+..+=
..+.+.=C2=A0=C2=A0=C2=A0=C2=A0 .+..+..=C2=A0 .+.+. =

>>> +..+.+..+..+.+..+..+..+.+..|
>>> =C2=A0=C2=A0 70000 |-+=C2=A0 +.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + +.=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 65000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 60000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 55000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 50000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 45000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 40000 =

>>> |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 35000 |-+ O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 O=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 O =

>>> O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
>>> =C2=A0=C2=A0 30000 |-+=C2=A0 O=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0 O O=C2=
=A0=C2=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0 O O=C2=A0 O=C2=A0 O=C2=A0=C2=A0=C2=
=A0 O =

>>> O=C2=A0 O O=C2=A0 |
>>> =C2=A0=C2=A0 25000 =

>>> +-------------------------------------------------------------------+
>>> [*] bisect-good sample
>>> [O] bisect-bad=C2=A0 sample
>>>
>>>
>>>
>>> Disclaimer:
>>> Results have been estimated based on internal Intel analysis and are =

>>> provided
>>> for informational purposes only. Any difference in system hardware or =

>>> software
>>> design or configuration may affect actual performance.
>>>
>>>
>>> Thanks,
>>> Rong Chen
>>>
>>>
>>> _______________________________________________
>>> LKP mailing list -- lkp(a)lists.01.org
>>> To unsubscribe send an email to lkp-leave(a)lists.01.org
>>>
>>
> =


-- =

Zhengjun Xing
--===============2488359581327403731==--

