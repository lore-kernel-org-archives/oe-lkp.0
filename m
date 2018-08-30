Content-Type: multipart/mixed; boundary="===============0149497907714411648=="
MIME-Version: 1.0
From: Dave Jiang <dave.jiang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 15d36fecd0: WARNING:at_kernel/memremap.c:#devm_memremap_pages
Date: Thu, 30 Aug 2018 08:39:50 -0700
Message-ID: <40f58aed-f435-8a64-c78c-45dc59e3b769@intel.com>
In-Reply-To: <6c1eb1c3-a46e-8bc8-3647-b4e02d674cc6@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0149497907714411648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/30/2018 02:22 AM, Rong Chen wrote:
> =

> =

> On 08/24/2018 12:55 AM, Dave Jiang wrote:
>> I am not able to reproduce when I booted my test system with "mem=3D8G
>> memmap=3D4G!8G". I ended up with a single pmem:
> The issue seems to be related to specific machines,
> If you need any other debug log, please tell me.

I'm not so sure it's a valid test as no real pmem would be broken up in
weird size like this. This is the side effect of using memmap to create
fake pmem. And I think the patch did it's job by warning and refusing to
create the conflicting region. We do plan to eventually fix this so
regions reside within the section can be done.

> =

> Best Regards,
> Rong Chen
> =

>> [=C2=A0=C2=A0 57.750556] nd_pmem namespace0.0: unable to guarantee persi=
stence of
>> writes
>> [=C2=A0=C2=A0 57.881573] pmem0: detected capacity change from 0 to 42949=
67296
>>
>> However in the reported kmsg, it appears that memmap is splitting into 2
>> namespaces rather than providing a single one, and the first region
>> ended up ending in the same section as start of the second region and
>> thus triggered the warning and having the second namespace rejected.
>>
>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.646531] nd_pmem namespace0.0: =
unable to guarantee
>> persistence of writes
>> kern=C2=A0 :info=C2=A0 : [=C2=A0=C2=A0 76.661660] pmem0: detected capaci=
ty change from 0 to
>> 534773760
>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.670129] nd_pmem namespace1.0: =
unable to guarantee
>> persistence of writes
>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.670290] ------------[ cut here=
 ]------------
>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.670372] nd_pmem namespace1.0: =
Conflicting mapping
>> in same section
>>
>>
>> On 08/22/2018 08:05 PM, kernel test robot wrote:
>>> FYI, we noticed the following commit (built with gcc-7):
>>>
>>> commit: 15d36fecd0bdc7510b70a0e5ec6671140b3fce0c ("mm: disallow
>>> mappings that conflict for devm_memremap_pages()")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=C2=A0 m=
aster
>>>
>>> in testcase: ndctl
>>> with following parameters:
>>>
>>>
>>>
>>>
>>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz
>>> with 8G memory
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire
>>> log/backtrace):
>>>
>>>
>>> +----------------+------------+------------+
>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 03758dbbe2 | 15d36fecd0 |
>>> +----------------+------------+------------+
>>> | boot_successes | 4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> +----------------+------------+------------+
>>>
>>>
>>>
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.670496] WARNING: CPU: 2 PID: =
213 at
>>> kernel/memremap.c:188 devm_memremap_pages+0x9f/0x470
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.670665] Modules linked in: nd=
_pmem(O+)
>>> dax_pmem(O) device_dax(O) nd_btt(O) x86_pkg_temp_thermal
>>> intel_powerclamp coretemp snd_hda_codec_idt kvm_intel
>>> snd_hda_codec_generic kvm irqbypass crct10dif_pclmul crc32_pclmul
>>> crc32c_intel ghash_clmulni_intel cryptd nd_e820(O) pcspkr
>>> libnvdimm(O) ahci libahci nfit_test_iomap(O) libata snd_hda_intel
>>> i915 snd_hda_codec snd_hda_core snd_hwdep snd_pcm drm_kms_helper
>>> snd_timer syscopyarea sysfillrect sysimgblt fb_sys_fops snd soundcore
>>> drm video pcc_cpufreq ip_tables
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.671408] CPU: 2 PID: 213 Comm:=
 systemd-udevd
>>> Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.18.0-rc6-00155-g15d36fe #1
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.671564] Hardware name: Hewlet=
t-Packard
>>> p6-1451cx/2ADA, BIOS 8.15 02/05/2013
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.671690] RIP: 0010:devm_memrem=
ap_pages+0x9f/0x470
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.671774] Code: c6 74 78 49 8b =
5f 50 48 85 db 75
>>> 04 49 8b 5f 10 4c 89 ff e8 13 77 42 00 48 89 da 48 89 c6 48 c7 c7 a8
>>> 62 0e 82 e8 51 8c eb ff <0f> 0b 49 8b be 80 00 00 00 65 ff 05 f1 59
>>> e4 7e 48 8b 47 08 a8 03
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.672107] RSP: 0018:ffffc900012=
5fad8 EFLAGS:
>>> 00010282
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.672197] RAX: 0000000000000000=
 RBX:
>>> ffff8801a969e310 RCX: 0000000000000006
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.672316] RDX: 0000000000000007=
 RSI:
>>> 0000000000000086 RDI: ffff8801ffd16950
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.672434] RBP: ffff8801a98030a0=
 R08:
>>> 000000000000036e R09: 000000000000000a
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.672555] R10: 0000000000000000=
 R11:
>>> ffffffff82d6434d R12: 00000002ffffffff
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.672673] R13: 0000000000000000=
 R14:
>>> ffff8801a98024a0 R15: ffff8801aae09808
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.672793] FS:=C2=A0 00007fae912=
9e8c0(0000)
>>> GS:ffff8801ffd00000(0000) knlGS:0000000000000000
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.672929] CS:=C2=A0 0010 DS: 00=
00 ES: 0000 CR0:
>>> 0000000080050033
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673026] CR2: 00007fae9127ec28=
 CR3:
>>> 00000001aafe8003 CR4: 00000000001606e0
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673145] Call Trace:
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673199]=C2=A0 ? devres_add+0x=
2f/0x40
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673266]=C2=A0 pmem_attach_dis=
k+0x542/0x6a0 [nd_pmem]
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673354]=C2=A0 ? kobject_relea=
se+0x69/0x1a0
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673431]=C2=A0 ? nd_dax_probe+=
0xfc/0x120 [libnvdimm]
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673520]=C2=A0 nvdimm_bus_prob=
e+0x69/0x150 [libnvdimm]
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673608]=C2=A0 driver_probe_de=
vice+0x2fa/0x470
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673685]=C2=A0 __driver_attach=
+0xdc/0x100
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673753]=C2=A0 ? driver_probe_=
device+0x470/0x470
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673831]=C2=A0 bus_for_each_de=
v+0x76/0xc0
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673900]=C2=A0 ? klist_add_tai=
l+0x3b/0x70
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.673968]=C2=A0 bus_add_driver+=
0x161/0x260
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674035]=C2=A0 ? 0xffffffffa05=
04000
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674096]=C2=A0 driver_register=
+0x5b/0xe0
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674162]=C2=A0 ? 0xffffffffa05=
04000
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674223]=C2=A0 do_one_initcall=
+0x46/0x1e4
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674293]=C2=A0 ? preempt_sched=
ule_common+0x15/0x30
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674373]=C2=A0 ? _cond_resched=
+0x22/0x30
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674442]=C2=A0 ? kmem_cache_al=
loc_trace+0x3e/0x1e0
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674525]=C2=A0 do_init_module+=
0x5b/0x203
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674593]=C2=A0 load_module+0x1=
489/0x1b80
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674662]=C2=A0 ? ima_post_read=
_file+0x102/0x110
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674741]=C2=A0 ? __do_sys_fini=
t_module+0xe9/0x110
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674820]=C2=A0 __do_sys_finit_=
module+0xe9/0x110
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674901]=C2=A0 do_syscall_64+0=
x5b/0x180
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.674967]=C2=A0 entry_SYSCALL_6=
4_after_hwframe+0x44/0xa9
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.675055] RIP: 0033:0x7fae9011b=
229
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.675116] Code: 00 f3 c3 66 2e =
0f 1f 84 00 00 00
>>> 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89
>>> c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3f 4c
>>> 2b 00 f7 d8 64 89 01 48
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.675449] RSP: 002b:00007ffeb04=
52908 EFLAGS:
>>> 00000246 ORIG_RAX: 0000000000000139
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.675576] RAX: ffffffffffffffda=
 RBX:
>>> 0000557dd7cccdf0 RCX: 00007fae9011b229
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.675696] RDX: 0000000000000000=
 RSI:
>>> 00007fae90a34265 RDI: 000000000000000f
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.675814] RBP: 00007fae90a34265=
 R08:
>>> 0000000000000000 R09: 00007ffeb0452e80
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.675934] R10: 000000000000000f=
 R11:
>>> 0000000000000246 R12: 0000000000000000
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.676053] R13: 0000557dd7cde3c0=
 R14:
>>> 0000000000020000 R15: 0000557dd5d7dcbc
>>> kern=C2=A0 :warn=C2=A0 : [=C2=A0=C2=A0 76.676175] ---[ end trace 72888c=
be8943c229 ]---
>>>
>>>
>>> To reproduce:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clonehttps://githu=
b.com/intel/lkp-tests.git
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install job.ya=
ml=C2=A0 # job file is attached in this email
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=A0=C2=
=A0=C2=A0=C2=A0 job.yaml
>>>
>>>
>>>
>>> Thanks,
>>> lkp
>>>
>=20

--===============0149497907714411648==--

