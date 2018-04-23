Content-Type: multipart/mixed; boundary="===============1741670195455970773=="
MIME-Version: 1.0
From: Qu Wenruo <wqu@suse.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [btrfs] 7eafb77890: stderr.fs_mark:fsync_failed_Input/output_error
Date: Mon, 23 Apr 2018 09:33:17 +0800
Message-ID: <32f3326a-301c-d0e8-1961-cf22463b4b01@suse.com>
In-Reply-To: <20180423012045.GL5563@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1741670195455970773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The latest patch handles it by introducing new @super_num parameter and
different check timing.

Thanks,
Qu

On 2018=E5=B9=B404=E6=9C=8823=E6=97=A5 09:20, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 7eafb77890ff459863e3bc772465cb641c14f754 ("btrfs: Do super block =
verification before writing it to disk")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: fsmark
> with following parameters:
> =

> 	iterations: 1x
> 	nr_threads: 1t
> 	disk: 1BRD_32G
> 	fs: btrfs
> 	fs2: nfsv4
> 	filesize: 4K
> 	test_size: 4G
> 	sync_method: fsyncBeforeClose
> 	nr_files_per_directory: 1fpd
> 	cpufreq_governor: performance
> =

> test-description: The fsmark is a file system benchmark to test synchrono=
us write workloads, for example, mail servers workload.
> test-url: https://sourceforge.net/projects/fsmark/
> =

> =

> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> [  128.496659] ------------[ cut here ]------------
> [  128.502439] BTRFS: Transaction aborted (error -117)
> [  128.50[  128.521041] Modules linked in: rpcsec_gss_krb5 nfsv4 dns_reso=
lver nfsd auth_rpcgss dm_mod brd btrfs xor zstd_decompress zstd_compress xx=
hash raid6_pq sd_mod sg intel_rapl sb_edac x86_pkg_temp_thermal intel_power=
clamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c=
_intel mgag200 ghash_clmulni_intel snd_pcm ttm snd_timer pcbc drm_kms_helpe=
r ipmi_si mxm_wmi snd syscopyarea aesni_intel ipmi_devintf sysfillrect soun=
dcore crypto_simd sysimgblt ahci fb_sys_fops glue_helper cryptd libahci drm=
 ipmi_msghandler pcspkr libata shpchp wmi acpi_power_meter acpi_pad ip_tabl=
es
> [  128.581706] CPU: 21 PID: 1581 Comm: nfsd Not tainted 4.16.0-rc7-00174-=
g7eafb77 #1
> [  128.590723] Hardware name: Intel Corporation S2600KPR/S2600KPR, BIOS S=
E5C610.86B.01.01.0019.101220160604 10/12/2016
> [  128.602982] RIP: 0010:btrfs_sync_log+0x9c4/0xbe0 [btrfs]
> [  128.609603] RSP: 0018:ffffc90008903ad0 EFLAGS: 00010282
> [  128.616053] RAX: 0000000000000027 RBX: ffff881037f0c800 RCX: 000000000=
0000000
> [  128.624712] RDX: ffff88085f75ed00 RSI: ffff88085f756918 RDI: ffff88085=
f756918
> [  128.633366] RBP: ffffc90008903bb0 R08: 0000000000000807 R09: 000000000=
0aaaaaa
> [  128.641948] R10: ffffc90008903a00 R11: ffff88085a4c2ec0 R12: ffff88107=
4934000
> [  128.650601] R13: 00000000ffffff8b R14: ffff88107a630000 R15: ffff88107=
4933800
> [  128.659213] FS:  0000000000000000(0000) GS:ffff88085f740000(0000) knlG=
S:0000000000000000
> [  128.668879] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  128.675904] CR2: 00007f4a6a747660 CR3: 000000107f20a001 CR4: 000000000=
03606e0
> [  128.684570] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [  128.693185] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [  128.701795] Call Trace:
> [  128.705166]  ? btrfs_sync_file+0x2f3/0x3f0 [btrfs]
> [  128.711151]  btrfs_sync_file+0x2f3/0x3f0 [btrfs]
> [  128.716910]  btrfs_file_write_iter+0x440/0x550 [btrfs]
> [  128.723284]  do_iter_readv_writev+0x116/0x170
> [  128.728753]  do_iter_write+0x80/0x190
> [  128.733487]  nfsd_vfs_write+0xaf/0x370 [nfsd]
> [  128.738885]  nfsd4_write+0x179/0x1c0 [nfsd]
> [  128.744121]  nfsd4_proc_compound+0x3f1/0x640 [nfsd]
> [  128.750123]  nfsd_dispatch+0xf5/0x230 [nfsd]
> [  128.755499]  svc_process_common+0x496/0x680
> [  128.760732]  ? nfsd_destroy+0x60/0x60 [nfsd]
> [  128.765996]  svc_process+0xed/0x1b0
> [  128.770499]  nfsd+0xf1/0x160 [nfsd]
> [  128.774899]  kthread+0x11e/0x140
> [  128.778988]  ? kthread_associate_blkcg+0xb0/0xb0
> [  128.784679]  ret_from_fork+0x35/0x40
> [  128.789187] Code: 00 00 48 8b 42 50 f0 48 0f ba a8 e8 cd 00 00 02 72 1=
b 41 83 fd fb 0f 84 6f 01 00 00 44 89 ee 48 c7 c7 40 ec 76 a0 e8 3c f1 95 e=
0 <0f> 0b 48 8b bd 60 ff ff ff 44 89 e9 ba 1d 0c 00 00 48 c7 c6 20 =

> [  128.811411] ---[ end trace 6c998d6c6547e8f7 ]---
> [  128.817132] BTRFS: error (device ram0) in btrfs_sync_log:3101: errno=
=3D-117 unknown
> [  128.826014] BTRFS info (device ram0): forced readonly
> [  128.835886] fs_mark: fsync failed Input/output error
> =

> 2018-04-19 17:23:24 fs_mark -d /nfs/ram0/1 -D 1000000 -N 1 -n 1000000 -L =
1 -S 1 -s 4096
> =

> #  fs_mark  -d  /nfs/ram0/1  -D  1000000  -N  1  -n  1000000  -L  1  -S  =
1  -s  4096 =

> #	Version 3.3, 1 thread(s) starting at Thu Apr 19 17:23:25 2018
> #	Sync method: INBAND FSYNC: fsync() per file in write loop.
> #	Directories:  Round Robin between directories across 1000000 subdirecto=
ries with 1 files per subdirectory.
> #	File names: 40 bytes long, (16 initial bytes of time stamp with 24 rand=
om bytes at end of name)
> #	Files info: size 4096 bytes, written with an IO size of 16384 bytes per=
 write
> #	App overhead is time in microseconds spent in the test not doing file w=
riting related system calls.
> =

> FSUse%        Count         Size    Files/sec     App Overhead
> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Xiaolong
> =



--===============1741670195455970773==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVMZDl5NWFXbFc2
aWRxa0xod2oyUjg2RWwvcWdGQWxyZE45NEFDZ2tRd2oyUjg2RWwKL3FqeC93Z0FueUwrT2xvRlBR
bnNMTWwzMXNNOEMzWktHYTQ1cVhORm9TcVFIL2dhNkNEWGhMWXdnVDVqQXhSWAoyRWRtQllQclh5
UE1teW9PaXhzMXBWQnNoN1lxWVVkMzlST2FacVZ5b2FFaFd4cmNzeDZyNUdVWkFNNmpiNE14CjBR
R3oxa1hIWDhKZ0pBVDBscEFoTEUwWFlMeVI2bXc4QWUrb0xRS3JlZmk1SDh3K0YvQkJnd1ErYk9m
RWlQMDIKdDVWZklvNzVTNmY3S25kN1Z1L2swWnVsVkR1ai9RUmsxSUl6TTdNL0dwQU91N3YvY1Jq
MHI5STBjNVlIVkQ5ZwpJbTNJV2hUR3VhUDV5cGtoMExtNThHZjk2Wit1MEhJUHR2aWtrcTR3NHdH
R05udHY2UXlwTGpCbEJ1RDBvZmEyCko4NHM3M2ZWSUh4eCtrZHNZL2h3RXhZUnkxY0dCUT09Cj1j
U2dQCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1741670195455970773==--

