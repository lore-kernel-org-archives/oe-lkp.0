Content-Type: multipart/mixed; boundary="===============3672269856031003123=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] d3b6f23f71: stress-ng.fiemap.ops_per_sec -60.5% regression
Date: Wed, 19 Aug 2020 09:52:56 +0800
Message-ID: <b29f6c18-f9c7-7e43-5b13-b5724fbf8d1a@linux.intel.com>
In-Reply-To: <705b788f-aac3-f622-a286-ecd99deb5ca9@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3672269856031003123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 7/22/2020 2:17 PM, Xing Zhengjun wrote:
> =

> =

> On 7/15/2020 7:04 PM, Ritesh Harjani wrote:
>> Hello Xing,
>>
>> On 4/7/20 1:30 PM, kernel test robot wrote:
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
>>
>> I started looking into this issue. But with my unit testing, I didn't
>> find any perf issue with fiemap ioctl call. I haven't yet explored about
>> how stress-ng take fiemap performance numbers, it could be doing
>> something differently. But in my testing I just made sure to create a
>> file with large number of extents and used xfs_io -c "fiemap -v" cmd
>> to check how much time it takes to read all the entries in 1st
>> and subsequent iterations.
>>
>>
>> Setup comprised of qemu machine on x86_64 with latest linux branch.
>>
>> 1. created a file of 10G using fallocate. (this allocated unwritten
>> extents for this file).
>>
>> 2. Then I punched hole on every alternate block of file. This step took
>> a long time. And after sufficiently long time, I had to cancel it.
>> for i in $(seq 1 2 xxxxx); do echo $i; fallocate -p -o $(($i*4096)) -l =

>> 4096; done
>>
>> 3. Then issued fiemap call via xfs_io and took the time measurement.
>> time xfs_io -c "fiemap -v" bigfile > /dev/null
>>
>>
>> Perf numbers on latest default kernel build for above cmd.
>>
>> 1st iteration
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> real=C2=A0=C2=A0=C2=A0 0m31.684s
>> user=C2=A0=C2=A0=C2=A0 0m1.593s
>> sys=C2=A0=C2=A0=C2=A0=C2=A0 0m24.174s
>>
>> 2nd and subsequent iteration
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> real=C2=A0=C2=A0=C2=A0 0m3.379s
>> user=C2=A0=C2=A0=C2=A0 0m1.300s
>> sys=C2=A0=C2=A0=C2=A0=C2=A0 0m2.080s
>>
>>
>> 4. Then I reverted all the iomap_fiemap patches and re-tested this.
>> With this the older ext4_fiemap implementation will be tested:-
>>
>>
>> 1st iteration
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> real=C2=A0=C2=A0=C2=A0 0m31.591s
>> user=C2=A0=C2=A0=C2=A0 0m1.400s
>> sys=C2=A0=C2=A0=C2=A0=C2=A0 0m24.243s
>>
>>
>> 2nd and subsequent iteration (had to cancel it since it was taking =

>> more time then 15m)
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> ^C^C
>> real=C2=A0=C2=A0=C2=A0 15m49.884s
>> user=C2=A0=C2=A0=C2=A0 0m0.032s
>> sys=C2=A0=C2=A0=C2=A0=C2=A0 15m49.722s
>>
>> I guess the reason why 2nd iteration with older implementation is taking
>> too much time is since with previous implementation we never cached
>> extent entries in extent_status tree. And also in 1st iteration the page
>> cache may get filled with lot of buffer_head entries. So maybe page
>> reclaims are taking more time.
>>
>> While with the latest implementation using iomap_fiemap(), the call to =

>> query extent blocks is done using ext4_map_blocks(). ext4_map_blocks()
>> by default will also cache the extent entries into extent_status tree.
>> Hence during 2nd iteration, we will directly read the entries from =

>> extent_status tree and will not do any disk I/O.
>>
>> -ritesh

I re-test it on the v5.9-rc1, the regression still existed. Have you =

tried stress-ng test cases?

> =

> Could you try stress-ng( https://kernel.ubuntu.com/~cking/stress-ng/) =

> test cases?=C2=A0 The tarballs can be get from =

> https://kernel.ubuntu.com/~cking/tarballs/stress-ng/.
> The command for this case you can try "stress-ng --timeout 1 --times =

> --verify --metrics-brief --sequential 9 --class os --minimize --exclude =

> spawn,exec,swap"
> I re-test it on the v5.8-rc6, the regression still existed.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =

> =

> tbox_group/testcase/rootfs/kconfig/compiler/debug-setup/nr_threads/disk/t=
esttime/fs/class/cpufreq_governor/ucode: =

> =

> =

> lkp-csl-2sp5/stress-ng/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gc=
c-9/test/10%/1HDD/1s/ext4/os/performance/0x5002f01 =

> =

> =

> commit:
>  =C2=A0 b2c5764262edded1b1cfff5a6ca82c3d61bb4a4a
>  =C2=A0 d3b6f23f71670007817a5d59f3fbafab2b794e8c
>  =C2=A0 v5.8-rc6
> =

> b2c5764262edded1 d3b6f23f71670007817a5d59f3f=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 v5.8-rc6
> ---------------- --------------------------- ---------------------------
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=
=C2=A0=C2=A0=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 %stddev
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>  =C2=A0=C2=A0=C2=A0=C2=A0 20419 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -4.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19423 =C2=B1=C2=A0 4%=C2=A0=C2=
=A0=C2=A0=C2=A0 +27.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25959   =

> stress-ng.af-alg.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 19655 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -5.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18537 =C2=B1=C2=A0 4%=C2=A0=C2=
=A0=C2=A0=C2=A0 +27.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25111   =

> stress-ng.af-alg.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 64.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -=
17.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 53.67 =C2=B1 38%=C2=A0=C2=A0=C2=A0=C2=
=A0 +22.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 79.00 =C2=B1 =

> 9%=C2=A0 stress-ng.chdir.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 55.34 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -=
13.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47.99 =C2=B1 38%=C2=A0=C2=A0=C2=A0=C2=
=A0 +26.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 69.96 =C2=B1 =

> 10%=C2=A0 stress-ng.chdir.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 64652 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -=
14.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 55545 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=
=A0 -13.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 55842 =C2=B1 =

> 6%=C2=A0 stress-ng.chown.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 64683 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -=
14.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 55565 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=
=A0 -13.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 55858 =C2=B1 =

> 6%=C2=A0 stress-ng.chown.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2805 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2820 =C2=B1=C2=A0 2%=C2=
=A0=C2=A0=C2=A0 +130.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6452   =

> stress-ng.clone.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2802 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2818 =C2=B1=C2=A0 2%=C2=
=A0=C2=A0=C2=A0 +129.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6443   =

> stress-ng.clone.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 34.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +1.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35.33 =C2=B1=
=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 31.33 =C2=B1 =

> 3%=C2=A0 stress-ng.copy-file.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 22297 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 +26.7%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28258 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0 +38.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30783 =C2=B1 =

> 14%=C2=A0 stress-ng.dir.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4743 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=
=A0 -12.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4147 =C2=B1=C2=A0 4%=C2=A0=
=C2=A0=C2=A0=C2=A0 -19.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3801 =C2=B1 =

> 14%=C2=A0 stress-ng.dirdeep.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 24499 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -9.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22223 =C2=B1=C2=A0 3%=C2=A0=C2=
=A0=C2=A0=C2=A0 -19.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19647 =C2=B1 =

> 2%=C2=A0 stress-ng.enosys.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 24494 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -9.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22207 =C2=B1=C2=A0 3%=C2=A0=C2=
=A0=C2=A0=C2=A0 -19.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19637 =C2=B1 =

> 2%=C2=A0 stress-ng.enosys.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 76618=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -63.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27756 =C2=B1=C2=A0 =
5%=C2=A0=C2=A0=C2=A0=C2=A0 -55.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34092 =C2=
=B1 =

> 2%=C2=A0 stress-ng.fiemap.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 76042=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -63.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27492 =C2=B1=C2=A0 =
5%=C2=A0=C2=A0=C2=A0=C2=A0 -55.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33899 =C2=
=B1 =

> 2%=C2=A0 stress-ng.fiemap.ops_per_sec
>  =C2=A0=C2=A0 3816791=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -6.2%=C2=A0=C2=A0=C2=A0 3581880 =C2=B1=C2=A0 2%=C2=A0=C2=A0=
=C2=A0=C2=A0 -10.7%=C2=A0=C2=A0=C2=A0 3409584 =C2=B1 =

> 3%=C2=A0 stress-ng.file-ioctl.ops
>  =C2=A0=C2=A0 3817421=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -6.2%=C2=A0=C2=A0=C2=A0 3582248 =C2=B1=C2=A0 2%=C2=A0=C2=A0=
=C2=A0=C2=A0 -10.7%=C2=A0=C2=A0=C2=A0 3409544 =C2=B1 =

> 3%=C2=A0 stress-ng.file-ioctl.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 27332 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +30.2%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35574=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +37.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37506 =C2=B1 =

> 6%=C2=A0 stress-ng.filename.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 26222 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +28.6%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33722=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +35.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35567 =C2=B1 =

> 6%=C2=A0 stress-ng.filename.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 23431 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23559=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +22.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2871=
1 =C2=B1 =

> 4%=C2=A0 stress-ng.fork.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 23433 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23558=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +22.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2870=
9 =C2=B1 =

> 4%=C2=A0 stress-ng.fork.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 48074 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-0.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47786 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=
=C2=A0 -42.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27623   =

> stress-ng.get.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 48088 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-0.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47793 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=
=C2=A0 -42.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27624   =

> stress-ng.get.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 111379=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -1.4%=C2=A0=C2=A0=C2=A0=C2=A0 109815 =C2=B1=C2=A0 2%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.8%=C2=A0=C2=A0=C2=A0=C2=A0 102662 =C2=B1 =

> 4%=C2=A0 stress-ng.getdent.ops
>  =C2=A0=C2=A0=C2=A0 111398=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -1.4%=C2=A0=C2=A0=C2=A0=C2=A0 109818 =C2=B1=C2=A0 2%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.9%=C2=A0=C2=A0=C2=A0=C2=A0 102651 =C2=B1 =

> 4%=C2=A0 stress-ng.getdent.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 226.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-1.0%=C2=A0=C2=A0=C2=A0=C2=A0 224.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -15.1%=C2=A0=C2=A0=C2=A0=C2=A0 192.33 =C2=B1 =

> 6%=C2=A0 stress-ng.inotify.ops
>  =C2=A0=C2=A0=C2=A0 226.39 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-1.3%=C2=A0=C2=A0=C2=A0=C2=A0 223.53=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -15.3%=C2=A0=C2=A0=C2=A0=C2=A0 191.82 =C2=B1 =

> 6%=C2=A0 stress-ng.inotify.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 18.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +9.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.67 =C2=B1=
=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 18.67 =C2=B1 =

> 2%=C2=A0 stress-ng.iomix.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4846 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +2.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4984 =C2=B1=C2=A0 7%=C2=A0=
=C2=A0=C2=A0=C2=A0 -36.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3062 =C2=B1 =

> 7%=C2=A0 stress-ng.kill.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4846 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +2.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4982 =C2=B1=C2=A0 7%=C2=A0=
=C2=A0=C2=A0=C2=A0 -36.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3058 =C2=B1 =

> 7%=C2=A0 stress-ng.kill.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 851324 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-9.9%=C2=A0=C2=A0=C2=A0=C2=A0 766988 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +2.3%=C2=A0=C2=A0=C2=A0=C2=A0 870703   =

> stress-ng.lease.ops
>  =C2=A0=C2=A0=C2=A0 850238 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-9.9%=C2=A0=C2=A0=C2=A0=C2=A0 766255 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +2.3%=C2=A0=C2=A0=C2=A0=C2=A0 870047   =

> stress-ng.lease.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 134492 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.0%=
=C2=A0=C2=A0=C2=A0=C2=A0 125085 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -19.9%=
=C2=A0=C2=A0=C2=A0=C2=A0 107736 =C2=B1 =

> 3%=C2=A0 stress-ng.mlock.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.38=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.=
42 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -20.2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1.10 =C2=B1 =

> 12%=C2=A0 stress-ng.mmapfork.ops_per_sec
>  =C2=A0=C2=A0 1117721 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.2%=
=C2=A0=C2=A0=C2=A0 1015321 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -36.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 713598   =

> stress-ng.mq.ops
>  =C2=A0=C2=A0 1117186 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.2%=
=C2=A0=C2=A0=C2=A0 1014593 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -36.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 712387   =

> stress-ng.mq.ops_per_sec
>  =C2=A0=C2=A0 4584592 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -2.7%=
=C2=A0=C2=A0=C2=A0 4460470 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -12.0%=
=C2=A0=C2=A0=C2=A0 4036627 =C2=B1 =

> 8%=C2=A0 stress-ng.msg.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8179 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8772 =C2=B1=C2=A0 9%=C2=A0=
=C2=A0=C2=A0=C2=A0 +24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10144   =

> stress-ng.opcode.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8177 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8770 =C2=B1=C2=A0 9%=C2=A0=
=C2=A0=C2=A0=C2=A0 +24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10141   =

> stress-ng.opcode.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5218 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +3.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5408 =C2=B1=C2=A0 2%=C2=
=A0=C2=A0=C2=A0=C2=A0 +27.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6642   =

> stress-ng.reboot.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5217 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +3.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5407 =C2=B1=C2=A0 2%=C2=
=A0=C2=A0=C2=A0=C2=A0 +27.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6640   =

> stress-ng.reboot.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1724 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 +=
27.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2205 =C2=B1 18%=C2=A0=C2=A0=C2=A0=
=C2=A0 +54.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2660 =C2=B1 =

> 19%=C2=A0 stress-ng.resources.ops
>  =C2=A0=C2=A0 1217728=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -31.4%=C2=A0=C2=A0=C2=A0=C2=A0 835808 =C2=B1 14%=C2=A0=C2=A0=C2=
=A0=C2=A0 -18.7%=C2=A0=C2=A0=C2=A0=C2=A0 989423 =C2=B1 =

> 10%=C2=A0 stress-ng.revio.ops
>  =C2=A0=C2=A0 1217899=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -31.4%=C2=A0=C2=A0=C2=A0=C2=A0 835846 =C2=B1 14%=C2=A0=C2=A0=C2=
=A0=C2=A0 -18.8%=C2=A0=C2=A0=C2=A0=C2=A0 989313 =C2=B1 =

> 10%=C2=A0 stress-ng.revio.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 752664 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-7.6%=C2=A0=C2=A0=C2=A0=C2=A0 695116 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.6%=C2=A0=C2=A0=C2=A0=C2=A0 748117 =C2=B1 =

> 6%=C2=A0 stress-ng.seal.ops
>  =C2=A0=C2=A0=C2=A0 752957 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
-7.7%=C2=A0=C2=A0=C2=A0=C2=A0 695278 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.6%=C2=A0=C2=A0=C2=A0=C2=A0 748068 =C2=B1 =

> 6%=C2=A0 stress-ng.seal.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 628.00 =C2=B1 83%=C2=A0=C2=A0=C2=A0=C2=A0 -20.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 502.00 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +176.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1734   =

> stress-ng.seccomp.ops
>  =C2=A0=C2=A0=C2=A0 628.22 =C2=B1 83%=C2=A0=C2=A0=C2=A0=C2=A0 -20.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 502.08 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +176.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1734   =

> stress-ng.seccomp.ops_per_sec
>  =C2=A0=C2=A0 1361741 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.0%=
=C2=A0=C2=A0=C2=A0 1416628 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +17.2%=
=C2=A0=C2=A0=C2=A0 1596549 =C2=B1 =

> 9%=C2=A0 stress-ng.seek.ops
>  =C2=A0=C2=A0 1361799 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.0%=
=C2=A0=C2=A0=C2=A0 1416578 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +17.2%=
=C2=A0=C2=A0=C2=A0 1596376 =C2=B1 =

> 9%=C2=A0 stress-ng.seek.ops_per_sec
>  =C2=A0=C2=A0 1537496=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +1.2%=C2=A0=C2=A0=C2=A0 1556468=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.9%=C2=A0=C2=A0=C2=A0 1385679   =

> stress-ng.sigrt.ops
>  =C2=A0=C2=A0 1532297=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +1.3%=C2=A0=C2=A0=C2=A0 1551993=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.9%=C2=A0=C2=A0=C2=A0 1381175   =

> stress-ng.sigrt.ops_per_sec
>  =C2=A0=C2=A0 1324589 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -26.6%=C2=A0=C2=
=A0=C2=A0=C2=A0 972626 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -14.8%=C2=A0=
=C2=A0=C2=A0 1128923 =C2=B1 =

> 4%=C2=A0 stress-ng.sigsuspend.ops
>  =C2=A0=C2=A0 1323957 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -26.6%=C2=A0=C2=
=A0=C2=A0=C2=A0 972084 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -14.8%=C2=A0=
=C2=A0=C2=A0 1128174 =C2=B1 =

> 4%=C2=A0 stress-ng.sigsuspend.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 806.67 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +11.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 896.67 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +31.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1059 =C2=B1 =

> 4%=C2=A0 stress-ng.sockabuse.ops
>  =C2=A0=C2=A0=C2=A0 806.73 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +11.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 896.44 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +31.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1059 =C2=B1 =

> 4%=C2=A0 stress-ng.sockabuse.ops_per_sec
>  =C2=A0=C2=A0 6224635 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8%=
=C2=A0=C2=A0=C2=A0 6274521 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -12.8%=
=C2=A0=C2=A0=C2=A0 5427883 =C2=B1 =

> 2%=C2=A0 stress-ng.sockpair.ops
>  =C2=A0=C2=A0 5383397=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -1.9%=C2=A0=C2=A0=C2=A0 5279526 =C2=B1=C2=A0 2%=C2=A0=C2=A0=
=C2=A0=C2=A0 -14.9%=C2=A0=C2=A0=C2=A0 4579084 =C2=B1 =

> 4%=C2=A0 stress-ng.sockpair.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 22409 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -2.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21784 =C2=B1=C2=A0 5%=C2=A0=C2=
=A0=C2=A0=C2=A0 -41.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13172 =C2=B1 =

> 9%=C2=A0 stress-ng.sysbadaddr.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 22414 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -2.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21784 =C2=B1=C2=A0 5%=C2=A0=C2=
=A0=C2=A0=C2=A0 -41.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13167 =C2=B1 =

> 9%=C2=A0 stress-ng.sysbadaddr.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 525.33 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.6%=
=C2=A0=C2=A0=C2=A0=C2=A0 539.00 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -42.1%=
=C2=A0=C2=A0=C2=A0=C2=A0 304.33 =C2=B1 =

> 25%=C2=A0 stress-ng.sysfs.ops
>  =C2=A0=C2=A0=C2=A0 524.98 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.6%=
=C2=A0=C2=A0=C2=A0=C2=A0 538.58 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -42.1%=
=C2=A0=C2=A0=C2=A0=C2=A0 303.79 =C2=B1 =

> 25%=C2=A0 stress-ng.sysfs.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3077 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +=
19.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3689 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0 +23.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3786 =C2=B1 =

> 4%=C2=A0 stress-ng.sysinfo.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3009 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +=
22.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3688 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0 +25.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3783 =C2=B1 =

> 4%=C2=A0 stress-ng.sysinfo.ops_per_sec
>  =C2=A0=C2=A0 3001932=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +1.2%=C2=A0=C2=A0=C2=A0 3038017=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +15.7%=C2=A0=C2=A0=C2=A0 3474274   =

> stress-ng.udp.ops
>  =C2=A0=C2=A0 3002618=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +1.2%=C2=A0=C2=A0=C2=A0 3037939=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +15.7%=C2=A0=C2=A0=C2=A0 3473606   =

> stress-ng.udp.ops_per_sec
>  =C2=A0=C2=A0=C2=A0 184634 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -6.9%=
=C2=A0=C2=A0=C2=A0=C2=A0 171823=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +24.5%=C2=A0=C2=A0=C2=A0=C2=A0 229788 =C2=B1 =

> 4%=C2=A0 stress-ng.utime.ops
>  =C2=A0=C2=A0=C2=A0 184678 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.0%=
=C2=A0=C2=A0=C2=A0=C2=A0 171836=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +24.4%=C2=A0=C2=A0=C2=A0=C2=A0 229784 =C2=B1 =

> 4%=C2=A0 stress-ng.utime.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1835 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +2.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1875 =C2=B1=C2=A0 4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +8.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1986 =
=C2=B1 =

> 3%=C2=A0 stress-ng.vforkmany.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1829 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +1.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1863 =C2=B1=C2=A0 4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +8.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1978 =
=C2=B1 =

> 3%=C2=A0 stress-ng.vforkmany.ops_per_sec
>  =C2=A0=C2=A0=C2=A0=C2=A0 14829=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -1.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14682 =C2=B1=
=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -20.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1184=
8 =C2=B1 =

> 3%=C2=A0 stress-ng.vm-segv.ops
>  =C2=A0=C2=A0=C2=A0=C2=A0 14830=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -1.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14682 =C2=B1=
=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -29.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1043=
3 =C2=B1 =

> 13%=C2=A0 stress-ng.vm-segv.ops_per_sec
>  =C2=A0=C2=A0 3527835 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.9%=
=C2=A0=C2=A0=C2=A0 3596613 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +495.6%=C2=A0=
=C2=A0 21010377   =

> stress-ng.vm-splice.ops
>  =C2=A0=C2=A0 3528845 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.9%=
=C2=A0=C2=A0=C2=A0 3597219 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +495.4%=C2=A0=
=C2=A0 21011045   =

> stress-ng.vm-splice.ops_per_sec
> =

> =

> =

> =

> =


-- =

Zhengjun Xing
--===============3672269856031003123==--

