Content-Type: multipart/mixed; boundary="===============1078415756928631394=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [blk] 394534b2c5: fsmark.files_per_sec -44.7% regression
Date: Sun, 07 Feb 2021 14:11:07 +0800
Message-ID: <5bf5b060-23d3-1a1b-2ab4-09942639e6ce@intel.com>
In-Reply-To: <20210204094505.is2cjiyykvtkda6p@linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1078415756928631394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/4/2021 5:45 PM, Sebastian Andrzej Siewior wrote:
> On 2021-02-04 16:46:25 [+0800], kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -44.7% regression of fsmark.files_per_sec due to commi=
t:
>>
>>
>> commit: 394534b2c5302585358c1007a8038e6e6efc465b ("blk-mq: Use llist_hea=
d for blk_cpu_done")
>> https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git blk
> I updated the patches, they were slightly outdated. But this means there
> is a performance regression, right?
I find that the blk branch has been re-based recently (re-based from =

v5.11-rc4 to v5.11-rc5).
I re-test the updated branch, the regression now is -3.4%

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/iterations/nr_threads/disk/fs/f=
ilesize/test_size/sync_method/nr_directories/nr_files_per_directory/cpufreq=
_governor/ucode:
lkp-csl-2sp7/fsmark/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/1=
x/32t/1SSD/f2fs/9B/400M/fsyncBeforeClose/16d/256fpd/performance/0x5003003

commit:
 =C2=A0 cb9615f3ffb846160084d36783c6820845a97ce3 (blk-mq: Always complete =

remote completions requests in softirq)
 =C2=A0 54c06aefd2ea984866db5c24fdc4d1be0a14f221=C2=A0 (blk-mq: Use llist_h=
ead for =

blk_cpu_done)

cb9615f3ffb84616 54c06aefd2ea984866db5c24fdc
---------------- ---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
 =C2=A0=C2=A0=C2=A0=C2=A0 30450=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -3.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29417=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsmark.files_per_sec

>
>> in testcase: fsmark
>> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz wit=
h 512G memory
>> with following parameters:
>>
>> 	iterations: 1x
>> 	nr_threads: 32t
>> 	disk: 1SSD
>> 	fs: f2fs
>> 	filesize: 9B
>> 	test_size: 400M
>> 	sync_method: fsyncBeforeClose
>> 	nr_directories: 16d
>> 	nr_files_per_directory: 256fpd
>> 	cpufreq_governor: performance
>> 	ucode: 0x5003003
> What kind of ssd is this? It is a SSD not NVME. It has one block queue,
> one interrupt. The hardware has 96 threads and the application,
> performing the test, has 32 threads. With 96 threads my guess is that it
> is a two way NUMA. And the application is spread accross the two NUMA
> nodes.
It is a SATA /800G SSD disk.=C2=A0 The test machine has two NUMA nodes, 96 =

CPUs, 512G memory.

>
> Sebastian
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing

--===============1078415756928631394==--

