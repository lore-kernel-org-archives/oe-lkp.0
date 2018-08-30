Content-Type: multipart/mixed; boundary="===============4194135082867424716=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 15d36fecd0: WARNING:at_kernel/memremap.c:#devm_memremap_pages
Date: Thu, 30 Aug 2018 17:22:16 +0800
Message-ID: <6c1eb1c3-a46e-8bc8-3647-b4e02d674cc6@intel.com>
In-Reply-To: <e358a00a-5981-97e3-2cec-4beab9064267@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4194135082867424716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 08/24/2018 12:55 AM, Dave Jiang wrote:
> I am not able to reproduce when I booted my test system with "mem=3D8G
> memmap=3D4G!8G". I ended up with a single pmem:
The issue seems to be related to specific machines,
If you need any other debug log, please tell me.

Best Regards,
Rong Chen

> [   57.750556] nd_pmem namespace0.0: unable to guarantee persistence of
> writes
> [   57.881573] pmem0: detected capacity change from 0 to 4294967296
>
> However in the reported kmsg, it appears that memmap is splitting into 2
> namespaces rather than providing a single one, and the first region
> ended up ending in the same section as start of the second region and
> thus triggered the warning and having the second namespace rejected.
>
> kern  :warn  : [   76.646531] nd_pmem namespace0.0: unable to guarantee
> persistence of writes
> kern  :info  : [   76.661660] pmem0: detected capacity change from 0 to
> 534773760
> kern  :warn  : [   76.670129] nd_pmem namespace1.0: unable to guarantee
> persistence of writes
> kern  :warn  : [   76.670290] ------------[ cut here ]------------
> kern  :warn  : [   76.670372] nd_pmem namespace1.0: Conflicting mapping
> in same section
>
>
> On 08/22/2018 08:05 PM, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 15d36fecd0bdc7510b70a0e5ec6671140b3fce0c ("mm: disallow mappings=
 that conflict for devm_memremap_pages()")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git  master
>>
>> in testcase: ndctl
>> with following parameters:
>>
>>
>>
>>
>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with =
8G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> +----------------+------------+------------+
>> |                | 03758dbbe2 | 15d36fecd0 |
>> +----------------+------------+------------+
>> | boot_successes | 4          | 4          |
>> +----------------+------------+------------+
>>
>>
>>
>> kern  :warn  : [   76.670496] WARNING: CPU: 2 PID: 213 at kernel/memrema=
p.c:188 devm_memremap_pages+0x9f/0x470
>> kern  :warn  : [   76.670665] Modules linked in: nd_pmem(O+) dax_pmem(O)=
 device_dax(O) nd_btt(O) x86_pkg_temp_thermal intel_powerclamp coretemp snd=
_hda_codec_idt kvm_intel snd_hda_codec_generic kvm irqbypass crct10dif_pclm=
ul crc32_pclmul crc32c_intel ghash_clmulni_intel cryptd nd_e820(O) pcspkr l=
ibnvdimm(O) ahci libahci nfit_test_iomap(O) libata snd_hda_intel i915 snd_h=
da_codec snd_hda_core snd_hwdep snd_pcm drm_kms_helper snd_timer syscopyare=
a sysfillrect sysimgblt fb_sys_fops snd soundcore drm video pcc_cpufreq ip_=
tables
>> kern  :warn  : [   76.671408] CPU: 2 PID: 213 Comm: systemd-udevd Tainte=
d: G           O      4.18.0-rc6-00155-g15d36fe #1
>> kern  :warn  : [   76.671564] Hardware name: Hewlett-Packard p6-1451cx/2=
ADA, BIOS 8.15 02/05/2013
>> kern  :warn  : [   76.671690] RIP: 0010:devm_memremap_pages+0x9f/0x470
>> kern  :warn  : [   76.671774] Code: c6 74 78 49 8b 5f 50 48 85 db 75 04 =
49 8b 5f 10 4c 89 ff e8 13 77 42 00 48 89 da 48 89 c6 48 c7 c7 a8 62 0e 82 =
e8 51 8c eb ff <0f> 0b 49 8b be 80 00 00 00 65 ff 05 f1 59 e4 7e 48 8b 47 0=
8 a8 03
>> kern  :warn  : [   76.672107] RSP: 0018:ffffc9000125fad8 EFLAGS: 00010282
>> kern  :warn  : [   76.672197] RAX: 0000000000000000 RBX: ffff8801a969e31=
0 RCX: 0000000000000006
>> kern  :warn  : [   76.672316] RDX: 0000000000000007 RSI: 000000000000008=
6 RDI: ffff8801ffd16950
>> kern  :warn  : [   76.672434] RBP: ffff8801a98030a0 R08: 000000000000036=
e R09: 000000000000000a
>> kern  :warn  : [   76.672555] R10: 0000000000000000 R11: ffffffff82d6434=
d R12: 00000002ffffffff
>> kern  :warn  : [   76.672673] R13: 0000000000000000 R14: ffff8801a98024a=
0 R15: ffff8801aae09808
>> kern  :warn  : [   76.672793] FS:  00007fae9129e8c0(0000) GS:ffff8801ffd=
00000(0000) knlGS:0000000000000000
>> kern  :warn  : [   76.672929] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
>> kern  :warn  : [   76.673026] CR2: 00007fae9127ec28 CR3: 00000001aafe800=
3 CR4: 00000000001606e0
>> kern  :warn  : [   76.673145] Call Trace:
>> kern  :warn  : [   76.673199]  ? devres_add+0x2f/0x40
>> kern  :warn  : [   76.673266]  pmem_attach_disk+0x542/0x6a0 [nd_pmem]
>> kern  :warn  : [   76.673354]  ? kobject_release+0x69/0x1a0
>> kern  :warn  : [   76.673431]  ? nd_dax_probe+0xfc/0x120 [libnvdimm]
>> kern  :warn  : [   76.673520]  nvdimm_bus_probe+0x69/0x150 [libnvdimm]
>> kern  :warn  : [   76.673608]  driver_probe_device+0x2fa/0x470
>> kern  :warn  : [   76.673685]  __driver_attach+0xdc/0x100
>> kern  :warn  : [   76.673753]  ? driver_probe_device+0x470/0x470
>> kern  :warn  : [   76.673831]  bus_for_each_dev+0x76/0xc0
>> kern  :warn  : [   76.673900]  ? klist_add_tail+0x3b/0x70
>> kern  :warn  : [   76.673968]  bus_add_driver+0x161/0x260
>> kern  :warn  : [   76.674035]  ? 0xffffffffa0504000
>> kern  :warn  : [   76.674096]  driver_register+0x5b/0xe0
>> kern  :warn  : [   76.674162]  ? 0xffffffffa0504000
>> kern  :warn  : [   76.674223]  do_one_initcall+0x46/0x1e4
>> kern  :warn  : [   76.674293]  ? preempt_schedule_common+0x15/0x30
>> kern  :warn  : [   76.674373]  ? _cond_resched+0x22/0x30
>> kern  :warn  : [   76.674442]  ? kmem_cache_alloc_trace+0x3e/0x1e0
>> kern  :warn  : [   76.674525]  do_init_module+0x5b/0x203
>> kern  :warn  : [   76.674593]  load_module+0x1489/0x1b80
>> kern  :warn  : [   76.674662]  ? ima_post_read_file+0x102/0x110
>> kern  :warn  : [   76.674741]  ? __do_sys_finit_module+0xe9/0x110
>> kern  :warn  : [   76.674820]  __do_sys_finit_module+0xe9/0x110
>> kern  :warn  : [   76.674901]  do_syscall_64+0x5b/0x180
>> kern  :warn  : [   76.674967]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> kern  :warn  : [   76.675055] RIP: 0033:0x7fae9011b229
>> kern  :warn  : [   76.675116] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 =
00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b =
4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3f 4c 2b 00 f7 d8 64 8=
9 01 48
>> kern  :warn  : [   76.675449] RSP: 002b:00007ffeb0452908 EFLAGS: 0000024=
6 ORIG_RAX: 0000000000000139
>> kern  :warn  : [   76.675576] RAX: ffffffffffffffda RBX: 0000557dd7cccdf=
0 RCX: 00007fae9011b229
>> kern  :warn  : [   76.675696] RDX: 0000000000000000 RSI: 00007fae90a3426=
5 RDI: 000000000000000f
>> kern  :warn  : [   76.675814] RBP: 00007fae90a34265 R08: 000000000000000=
0 R09: 00007ffeb0452e80
>> kern  :warn  : [   76.675934] R10: 000000000000000f R11: 000000000000024=
6 R12: 0000000000000000
>> kern  :warn  : [   76.676053] R13: 0000557dd7cde3c0 R14: 000000000002000=
0 R15: 0000557dd5d7dcbc
>> kern  :warn  : [   76.676175] ---[ end trace 72888cbe8943c229 ]---
>>
>>
>> To reproduce:
>>
>>          git clonehttps://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install job.yaml  # job file is attached in this email
>>          bin/lkp run     job.yaml
>>
>>
>>
>> Thanks,
>> lkp
>>


--===============4194135082867424716==--

