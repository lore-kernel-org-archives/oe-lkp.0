Content-Type: multipart/mixed; boundary="===============0426735907385829269=="
MIME-Version: 1.0
From: Nick Terrell <terrelln@fb.com>
To: lkp@lists.01.org
Subject: Re: 5c1aab1dd5 ("btrfs: Add zstd support"): BUG: kernel hang in early-boot stage, last printk: Booting the kernel.
Date: Tue, 29 Aug 2017 23:06:16 +0000
Message-ID: <0271FBD7-803B-4147-B4CF-459D6C89EB8D@fb.com>
In-Reply-To: <59a4e199.wyCxZm/7Ay1mDqgZ%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0426735907385829269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/28/17, 8:39 PM, "kernel test robot" <fengguang.wu@intel.com> wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 5c1aab1dd5445ed8bdcdbb575abc1b0d7ee5b2e7
> Author:     Nick Terrell <terrelln@fb.com>
> AuthorDate: Wed Aug 9 19:39:02 2017 -0700
> Commit:     Chris Mason <clm@fb.com>
> CommitDate: Tue Aug 15 09:02:09 2017 -0700
> =

>     btrfs: Add zstd support
>     =

>     Add zstd compression and decompression support to BtrFS. zstd at its
>     fastest level compresses almost as well as zlib, while offering much
>     faster compression and decompression, approaching lzo speeds.
>     =

>     I benchmarked btrfs with zstd compression against no compression, lzo
>     compression, and zlib compression. I benchmarked two scenarios. Copyi=
ng
>     a set of files to btrfs, and then reading the files. Copying a tarball
>     to btrfs, extracting it to btrfs, and then reading the extracted file=
s.
>     After every operation, I call `sync` and include the sync time.
>     Between every pair of operations I unmount and remount the filesystem
>     to avoid caching. The benchmark files can be found in the upstream
>     zstd source repository under
>     `contrib/linux-kernel/{btrfs-benchmark.sh,btrfs-extract-benchmark.sh}`
>     [1] [2].
>     =

>     I ran the benchmarks on a Ubuntu 14.04 VM with 2 cores and 4 GiB of R=
AM.
>     The VM is running on a MacBook Pro with a 3.1 GHz Intel Core i7 proce=
ssor,
>     16 GB of RAM, and a SSD.
>     =

>     The first compression benchmark is copying 10 copies of the unzipped
>     Silesia corpus [3] into a BtrFS filesystem mounted with
>     `-o compress-force=3DMethod`. The decompression benchmark times how l=
ong
>     it takes to `tar` all 10 copies into `/dev/null`. The compression rat=
io is
>     measured by comparing the output of `df` and `du`. See the benchmark =
file
>     [1] for details. I benchmarked multiple zstd compression levels, alth=
ough
>     the patch uses zstd level 1.
>     =

>     | Method  | Ratio | Compression MB/s | Decompression speed |
>     |---------|-------|------------------|---------------------|
>     | None    |  0.99 |              504 |                 686 |
>     | lzo     |  1.66 |              398 |                 442 |
>     | zlib    |  2.58 |               65 |                 241 |
>     | zstd 1  |  2.57 |              260 |                 383 |
>     | zstd 3  |  2.71 |              174 |                 408 |
>     | zstd 6  |  2.87 |               70 |                 398 |
>     | zstd 9  |  2.92 |               43 |                 406 |
>     | zstd 12 |  2.93 |               21 |                 408 |
>     | zstd 15 |  3.01 |               11 |                 354 |
>     =

>     The next benchmark first copies `linux-4.11.6.tar` [4] to btrfs. Then=
 it
>     measures the compression ratio, extracts the tar, and deletes the tar.
>     Then it measures the compression ratio again, and `tar`s the extracted
>     files into `/dev/null`. See the benchmark file [2] for details.
>     =

>     | Method | Tar Ratio | Extract Ratio | Copy (s) | Extract (s)| Read (=
s) |
>     |--------|-----------|---------------|----------|------------|-------=
---|
>     | None   |      0.97 |          0.78 |    0.981 |      5.501 |    8.8=
07 |
>     | lzo    |      2.06 |          1.38 |    1.631 |      8.458 |    8.5=
85 |
>     | zlib   |      3.40 |          1.86 |    7.750 |     21.544 |   11.7=
44 |
>     | zstd 1 |      3.57 |          1.85 |    2.579 |     11.479 |    9.3=
89 |
>     =

>     [1] https://github.com/facebook/zstd/blob/dev/contrib/linux-kernel/bt=
rfs-benchmark.sh
>     [2] https://github.com/facebook/zstd/blob/dev/contrib/linux-kernel/bt=
rfs-extract-benchmark.sh
>     [3] https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__sun.aei.pol=
sl.pl_-7Esdeor_index.php-3Fpage-3Dsilesia&d=3DDwICAg&c=3D5VD0RTtNlTh3ycd41b=
3MUw&r=3DHQM5IQdWOB8WaMoii2dYTw&m=3DjKbTw_D1YPuKLOwR-K2a-Jr4XtdNiz4rTSEQA3y=
Ov6E&s=3D2rrCeLrxEl7CwQIV25514qTmsvT3DKiKnpXW7QPcU20&e=3D =

>     [4] https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.11.6.tar.xz
>     =

>     zstd source repository: https://github.com/facebook/zstd
>     =

>     Signed-off-by: Nick Terrell <terrelln@fb.com>
>     Signed-off-by: Chris Mason <clm@fb.com>
> =

> 73f3d1b48f  lib: Add zstd modules
> 5c1aab1dd5  btrfs: Add zstd support
> adc4148c10  Add linux-next specific files for 20170828
> +--------------------------------------------------------------------+---=
---------+------------+---------------+
> |                                                                    | 73=
f3d1b48f | 5c1aab1dd5 | next-20170828 |
> +--------------------------------------------------------------------+---=
---------+------------+---------------+
> | boot_successes                                                     | 31=
         | 0          | 0             |
> | boot_failures                                                      | 4 =
         | 21         | 23            |
> | IP-Config:Auto-configuration_of_network_failed                     | 4 =
         |            |               |
> | BUG:kernel_hang_in_early-boot_stage,last_printk:Booting_the_kernel | 0 =
         | 21         | 23            |
> +--------------------------------------------------------------------+---=
---------+------------+---------------+
> =

> =

> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> =

> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 7d744d9889d3bf6d18152cc7ab2eff4b541e91ac 14ccee78fc82f55=
12908f4424f541549a5705b89 --
> git bisect good 7a40daca5117a71f893b75929e7d6cce24eeb15a  # 03:50  G     =
11     0    0   0  Merge 'linux-review/Vadim-Lomovtsev/net-sunrpc-svcsock-f=
ix-NULL-pointer-exception/20170823-212714' into devel-spot-201708240558
> git bisect good 0f3e945501ce5af141983e83078f1aea933ae2ee  # 04:36  G     =
11     0    0   0  Merge 'linux-review/Dmitry-Fleytman/usb-Add-device-quirk=
-for-Logitech-HD-Pro-Webcam-C920-C/20170823-145321' into devel-spot-2017082=
40558
> git bisect  bad 5c3677900758dfd87eec1bade63f66853683f00e  # 06:43  B     =
 0     3   16   0  Merge 'char-misc/char-misc-testing' into devel-spot-2017=
08240558
> git bisect good 871b4817f99d09e8294a7f4f6e550603ce23a599  # 08:56  G     =
10     0    0   2  Merge 'linux-review/Christophe-JAILLET/phy-qcom-usb-hsic=
-Fix-error-handling/20170823-114654' into devel-spot-201708240558
> git bisect  bad 32771c0528f294c21f373021a6b7facbb6ca3af1  # 08:56  B     =
 0     6   18   0  Merge 'stffrdhrn/openrisc-4.13-smp-qspinlock' into devel=
-spot-201708240558
> git bisect  bad 202e19b651a4ede36ae1cfbaea0fad6f68a5eee3  # 09:50  B     =
 0    11   33   9  Merge 'linux-review/SF-Markus-Elfring/btrfs-Use-common-e=
rror-handling-code-in-update_ref_path/20170823-105603' into devel-spot-2017=
08240558
> git bisect  bad 5c1aab1dd5445ed8bdcdbb575abc1b0d7ee5b2e7  # 10:21  B     =
 0    11   25   2  btrfs: Add zstd support
> git bisect good 73f3d1b48f5069d46ba48aa28c2898dc93185560  # 10:42  G     =
11     0    0   0  lib: Add zstd modules
> # first bad commit: [5c1aab1dd5445ed8bdcdbb575abc1b0d7ee5b2e7] btrfs: Add=
 zstd support
> git bisect good 73f3d1b48f5069d46ba48aa28c2898dc93185560  # 10:53  G     =
31     0    0   4  lib: Add zstd modules
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 5c1aab1dd5445ed8bdcdbb575abc1b0d7ee5b2e7  # 11:12  B     =
 0    11   23   0  btrfs: Add zstd support
> # extra tests on HEAD of linux-devel/devel-spot-201708240558
> git bisect  bad 7d744d9889d3bf6d18152cc7ab2eff4b541e91ac  # 11:13  B     =
 0    17   32   0  0day head guard for 'devel-spot-201708240558'
> # extra tests on tree/branch linux-next/master
> git bisect  bad adc4148c101c038bc105ca4539083dcd1a246596  # 11:32  B     =
 0     3   15   0  Add linux-next specific files for 20170828
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.01.org_piper=
mail_lkp&d=3DDwICAg&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3DHQM5IQdWOB8WaMoii2dYTw&m=
=3DjKbTw_D1YPuKLOwR-K2a-Jr4XtdNiz4rTSEQA3yOv6E&s=3DvyJpcaq6bmI9UvAmrgoO22Zv=
q47hlKS_i33NkppQJpI&e=3D                           Intel Corporation
> =


Omar and I have been debugging this issue. We've reproduced it with the
reproduction config/script attached with gcc-6.4, but not gcc-7. The QEMU
and dmesg output of the reproduced crash is

early console in setup code
early console in extract_kernel
input_data: 0x0000000006382276
input_len: 0x0000000000c7f75c
output: 0x0000000001000000
output_len: 0x0000000003c28878
kernel_total_size: 0x000000000601f000

Decompressing Linux... Parsing ELF... done.
Booting the kernel.
KVM internal error. Suberror: 3
extra data[0]: 80000b0e
extra data[1]: 31
RAX=3D1ffffffff0859ef4 RBX=3Dffffffff842cf7c0 RCX=3D0000000000000001 RDX=3D=
0000000000000000
RSI=3D000000000000000d RDI=3Dffffffff800bffa8 RBP=3Dffffffff826a08b0 RSP=3D=
ffffffff800bff98
R8 =3D0000000000000007 R9 =3D0000000000000004 R10=3Dffffffff8552db6c R11=3D=
ffffffff8552db43
R12=3D0000000000000008 R13=3D0000000000000000 R14=3D0000000000000001 R15=3D=
0000000000000001
RIP=3Dffffffff826a0910 RFL=3D00010097 [--S-APC] CPL=3D0 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0000 0000000000000000 ffffffff 00000000
CS =3D0010 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
SS =3D0000 0000000000000000 ffffffff 00000000
DS =3D0000 0000000000000000 ffffffff 00000000
FS =3D0000 0000000000000000 ffffffff 00000000
GS =3D0000 ffffffff843fa000 ffffffff 00000000
LDT=3D0000 0000000000000000 ffffffff 00000000
TR =3D0020 0000000000000000 00000fff 00808b00 DPL=3D0 TSS64-busy
GDT=3D     ffffffff8440c000 0000007f
IDT=3D     ffffffff84829000 00000fff
CR0=3D80050033 CR2=3D000000000000000d CR3=3D00000000046a6000 CR4=3D000006a0
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000
DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
EFER=3D0000000000000d01
Code=3Dff ff ff ff 01 00 00 00 00 00 00 00 48 09 6a 82 ff ff ff ff <a7> 71 =
2b 81 ff ff ff ff 07 00 00 00 00 00 00 00 c0 f7 2c 84 ff ff ff ff 08 00 00 =
00 00 00

I think the KVM error is a page fault.

We believe that the issue is caused by the size of the kernel image.
The error goes away if you disable any of XFS, F2FS, FUSE, BTRFS_ASSERT,
KASAN, or likely any large chunk of code.

The page fault happens in an unrelated piece of code (partial manually
gathered stack trace):

kernel/sched/core.c      task_rq_lock()
kernel/sched/core.c:1068 __set_cpus_allowed_ptr()
init/main.c:409          rest_init()
init/main.c:701          start_kernel()



--===============0426735907385829269==--

