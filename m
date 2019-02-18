Content-Type: multipart/mixed; boundary="===============3626484190826959427=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: efad4e475c [ 40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
Date: Mon, 18 Feb 2019 16:47:26 +0800
Message-ID: <79a3d305-1d96-3938-dc14-617a9e475648@intel.com>
In-Reply-To: <20190218070844.GC4525@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3626484190826959427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2/18/19 3:08 PM, Michal Hocko wrote:
> On Mon 18-02-19 13:28:23, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> commit efad4e475c312456edb3c789d0996d12ed744c13
>> Author:     Michal Hocko <mhocko@suse.com>
>> AuthorDate: Fri Feb 1 14:20:34 2019 -0800
>> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
>> CommitDate: Fri Feb 1 15:46:23 2019 -0800
>>
>>      mm, memory_hotplug: is_mem_section_removable do not pass the end of=
 a zone
>>      =

>>      Patch series "mm, memory_hotplug: fix uninitialized pages fallouts"=
, v2.
>>      =

>>      Mikhail Zaslonko has posted fixes for the two bugs quite some time =
ago
>>      [1].  I have pushed back on those fixes because I believed that it =
is
>>      much better to plug the problem at the initialization time rather t=
han
>>      play whack-a-mole all over the hotplug code and find all the places
>>      which expect the full memory section to be initialized.
>>      =

>>      We have ended up with commit 2830bf6f05fb ("mm, memory_hotplug:
>>      initialize struct pages for the full memory section") merged and ca=
use a
>>      regression [2][3].  The reason is that there might be memory layouts
>>      when two NUMA nodes share the same memory section so the merged fix=
 is
>>      simply incorrect.
>>      =

>>      In order to plug this hole we really have to be zone range aware in
>>      those handlers.  I have split up the original patch into two.  One =
is
>>      unchanged (patch 2) and I took a different approach for `removable'
>>      crash.
>>      =

>>      [1] http://lkml.kernel.org/r/20181105150401.97287-2-zaslonko(a)linu=
x.ibm.com
>>      [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D1666948
>>      [3] http://lkml.kernel.org/r/20190125163938.GA20411(a)dhcp22.suse.cz
>>      =

>>      This patch (of 2):
>>      =

>>      Mikhail has reported the following VM_BUG_ON triggered when reading=
 sysfs
>>      removable state of a memory block:
>>      =

>>       page:000003d08300c000 is uninitialized and poisoned
>>       page dumped because: VM_BUG_ON_PAGE(PagePoisoned(p))
>>       Call Trace:
>>         is_mem_section_removable+0xb4/0x190
>>         show_mem_removable+0x9a/0xd8
>>         dev_attr_show+0x34/0x70
>>         sysfs_kf_seq_show+0xc8/0x148
>>         seq_read+0x204/0x480
>>         __vfs_read+0x32/0x178
>>         vfs_read+0x82/0x138
>>         ksys_read+0x5a/0xb0
>>         system_call+0xdc/0x2d8
>>       Last Breaking-Event-Address:
>>         is_mem_section_removable+0xb4/0x190
>>       Kernel panic - not syncing: Fatal exception: panic_on_oops
>>      =

>>      The reason is that the memory block spans the zone boundary and we =
are
>>      stumbling over an unitialized struct page.  Fix this by enforcing z=
one
>>      range in is_mem_section_removable so that we never run away from a =
zone.
>>      =

>>      Link: http://lkml.kernel.org/r/20190128144506.15603-2-mhocko(a)kern=
el.org
>>      Signed-off-by: Michal Hocko <mhocko@suse.com>
>>      Reported-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
>>      Debugged-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
>>      Tested-by: Gerald Schaefer <gerald.schaefer@de.ibm.com>
>>      Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>      Reviewed-by: Oscar Salvador <osalvador@suse.de>
>>      Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>>      Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
>>      Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
>>      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>>      Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
>>
>> 9bcdeb51bd  oom, oom_reaper: do not enqueue same task twice
>> efad4e475c  mm, memory_hotplug: is_mem_section_removable do not pass the=
 end of a zone
>> f17b5f06cb  Linux 5.0-rc4
>> 7a92eb7cc1  Add linux-next specific files for 20190215
>> +-----------------------------------------------------+------------+----=
--------+----------+---------------+
>> |                                                     | 9bcdeb51bd | efa=
d4e475c | v5.0-rc4 | next-20190215 |
>> +-----------------------------------------------------+------------+----=
--------+----------+---------------+
>> | boot_successes                                      | 31         | 2  =
        | 21       | 0             |
>> | boot_failures                                       | 0          | 11 =
        | 6        | 10            |
>> | Oops:#[##]                                          | 0          | 11 =
        |          |               |
>> | RIP:page_mapping                                    | 0          | 11 =
        |          |               |
>> | WARNING:at_kernel/locking/lockdep.c:#lock_downgrade | 0          | 3  =
        |          |               |
>> | RIP:lock_downgrade                                  | 0          | 3  =
        |          |               |
>> | Kernel_panic-not_syncing:Fatal_exception            | 0          | 11 =
        | 0        | 10            |
>> | BUG:unable_to_handle_kernel                         | 0          | 6  =
        |          |               |
>> | BUG:kernel_in_stage                                 | 0          | 0  =
        | 6        |               |
>> | kernel_BUG_at_include/linux/mm.h                    | 0          | 0  =
        | 0        | 10            |
>> | invalid_opcode:#[##]                                | 0          | 0  =
        | 0        | 10            |
>> | RIP:is_mem_section_removable                        | 0          | 0  =
        | 0        | 10            |
>> +-----------------------------------------------------+------------+----=
--------+----------+---------------+
>>
>> udevd[311]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v=
00001234d00001111sv00001AF4sd00001100bc03sc00i00': No such file or directory
>> udevd[312]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:=
QEMU0002:': No such file or directory
>> udevd[314]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platf=
orm:Fixed MDIO bus': No such file or directory
>> udevd[315]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:=
PNP0103:': No such file or directory
>> [   40.305212] PGD 0 P4D 0
>> [   40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
>> [   40.313055] CPU: 1 PID: 239 Comm: udevd Not tainted 5.0.0-rc4-00149-g=
efad4e4 #1
>> [   40.321348] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.10.2-1 04/01/2014
>> [   40.330813] RIP: 0010:page_mapping+0x12/0x80
>> [   40.335709] Code: 5d c3 48 89 df e8 0e ad 02 00 85 c0 75 da 89 e8 5b =
5d c3 0f 1f 44 00 00 53 48 89 fb 48 8b 43 08 48 8d 50 ff a8 01 48 0f 45 da =
<48> 8b 53 08 48 8d 42 ff 83 e2 01 48 0f 44 c3 48 83 38 ff 74 2f 48
>> [   40.356704] RSP: 0018:ffff88801fa87cd8 EFLAGS: 00010202
>> [   40.362714] RAX: ffffffffffffffff RBX: fffffffffffffffe RCX: 00000000=
0000000a
>> [   40.370798] RDX: fffffffffffffffe RSI: ffffffff820b9a20 RDI: ffff8880=
1e5c0000
>> [   40.378830] RBP: 6db6db6db6db6db7 R08: ffff88801e8bb000 R09: 00000000=
01b64d13
>> [   40.386902] R10: ffff88801fa87cf8 R11: 0000000000000001 R12: ffff8880=
1e640000
>> [   40.395033] R13: ffffffff820b9a20 R14: ffff88801f145258 R15: 00000000=
00000001
>> [   40.403138] FS:  00007fb2079817c0(0000) GS:ffff88801dd00000(0000) knl=
GS:0000000000000000
>> [   40.412243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   40.418846] CR2: 0000000000000006 CR3: 000000001fa82000 CR4: 00000000=
000006a0
>> [   40.426951] Call Trace:
>> [   40.429843]  __dump_page+0x14/0x2c0
>> [   40.433947]  is_mem_section_removable+0x24c/0x2c0
> This looks like we are stumbling over an unitialized struct page again.
> Something this patch should prevent from. Could you try to apply [1]
> which will make __dump_page more robust so that we do not blow up there
> and give some more details in return.


Hi Hocko,

I have applied [1] and attached the dmesg file.


>
> Btw. is this reproducible all the time? I will have a look at the memory
> layout later today.


yes, it's reproducible all the time.

Best Regards,
Rong Chen


>
> [1] http://lkml.kernel.org/r/dbbcd36ca1f045ec81f49c7657928a1cdf24872b.155=
0065120.git.robin.murphy(a)arm.com
>> [   40.439327]  removable_show+0x87/0xa0
>> [   40.443613]  dev_attr_show+0x25/0x60
>> [   40.447763]  sysfs_kf_seq_show+0xba/0x110
>> [   40.452363]  seq_read+0x196/0x3f0
>> [   40.456282]  __vfs_read+0x34/0x180
>> [   40.460233]  ? lock_acquire+0xb6/0x1e0
>> [   40.464610]  vfs_read+0xa0/0x150
>> [   40.468372]  ksys_read+0x44/0xb0
>> [   40.472129]  ? do_syscall_64+0x1f/0x4a0
>> [   40.476593]  do_syscall_64+0x5e/0x4a0
>> [   40.480809]  ? trace_hardirqs_off_thunk+0x1a/0x1c
>> [   40.486195]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> [   40.491961] RIP: 0033:0x7fb2070680a0
>> [   40.496078] Code: 73 01 c3 48 8b 0d a0 0d 2d 00 31 d2 48 29 c2 64 89 =
11 48 83 c8 ff eb ea 90 90 83 3d 3d 71 2d 00 00 75 10 b8 00 00 00 00 0f 05 =
<48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 3e b1 01 00 48 89 04 24
>> [   40.517047] RSP: 002b:00007ffeee09f0b8 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000000
>> [   40.525660] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007fb2=
070680a0
>> [   40.533780] RDX: 0000000000001000 RSI: 00007ffeee09f158 RDI: 00000000=
00000005
>> [   40.541853] RBP: 000056092c0f0ac3 R08: 7379732f73656369 R09: 6f6d656d=
2f6d6574
>> [   40.549930] R10: 726f6d656d2f7972 R11: 0000000000000246 R12: 00000000=
00000000
>> [   40.557982] R13: 000056092c0ef7a0 R14: 0000000000000000 R15: 00007ffe=
ee0a4f08
>> [   40.566089] Modules linked in:
>> [   40.569651] CR2: 0000000000000006
>>
>> udevd[316]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platf=
orm:i5k_amb': No such file or directory
>> [   40.609875] WARNING: CPU: 1 PID: 235 at kernel/locking/lockdep.c:3553=
 lock_downgrade+0x167/0x1b0
>> [   40.626045] Modules linked in:
>> [   40.629632] CPU: 1 PID: 235 Comm: udevd Tainted: G      D           5=
.0.0-rc4-00149-gefad4e4 #1
>> [   40.639486] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.10.2-1 04/01/2014
>> [   40.648956] RIP: 0010:lock_downgrade+0x167/0x1b0
>> [   40.654231] Code: c9 75 a9 48 c7 c6 c7 08 0c 82 48 c7 c7 58 f9 0a 82 =
e8 dd e6 fa ff 0f 0b eb 92 48 c7 c7 eb 08 0c 82 48 89 04 24 e8 c9 e6 fa ff =
<0f> 0b 8b 54 24 0c 48 8b 04 24 e9 2e ff ff ff e8 e5 fb 1e 00 85 c0
>> [   40.675231] RSP: 0018:ffff88801fa13de8 EFLAGS: 00010096
>> [   40.681229] RAX: 0000000000000017 RBX: ffff88801fa0c000 RCX: 00000000=
00000000
>> [   40.689326] RDX: ffffffff811285f4 RSI: 0000000000000001 RDI: ffffffff=
81128610
>> [   40.697401] RBP: ffff88801f93e0f8 R08: 0000000000000000 R09: 65722061=
20676e69
>> [   40.705498] R10: ffff88801fa13e08 R11: 6b636f6c20646165 R12: 00000000=
00000246
>> [   40.713630] R13: ffffffff812145c1 R14: 0000000000000001 R15: ffff8880=
1f16a1d0
>> [   40.721734] FS:  00007fb2079817c0(0000) GS:ffff88801dd00000(0000) knl=
GS:0000000000000000
>> [   40.730878] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   40.737418] CR2: 0000000000fa8000 CR3: 000000001fa0e000 CR4: 00000000=
000006a0
>> [   40.745516] Call Trace:
>> [   40.748404]  downgrade_write+0x12/0x80
>> [   40.752748]  __do_munmap+0x3f1/0x430
>> [   40.756926]  __vm_munmap+0x5d/0x90
>> [   40.760854]  __x64_sys_munmap+0x25/0x30
>> [   40.765257]  do_syscall_64+0x5e/0x4a0
>> [   40.769566]  ? trace_hardirqs_off_thunk+0x1a/0x1c
>> [   40.774950]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> [   40.780753] RIP: 0033:0x7fb207071897
>> [   40.784895] Code: f0 ff ff 73 01 c3 48 8b 0d a6 75 2c 00 31 d2 48 29 =
c2 64 89 11 48 83 c8 ff eb ea 90 90 90 90 90 90 90 90 b8 0b 00 00 00 0f 05 =
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 79 75 2c 00 31 d2 48 29 c2 64
>> [   40.806706] RSP: 002b:00007ffeee09c9e8 EFLAGS: 00000206 ORIG_RAX: 000=
000000000000b
>> [   40.816041] RAX: ffffffffffffffda RBX: 000056092c0e9720 RCX: 00007fb2=
07071897
>> [   40.824406] RDX: 0000000000000000 RSI: 0000000000001000 RDI: 00007fb2=
07986000
>> [   40.832697] RBP: 0000000000000000 R08: 00007fb2079817c0 R09: 00000000=
ffffffff
>> [   40.840871] R10: 0000000000000022 R11: 0000000000000206 R12: 00000000=
00000000
>> [   40.848911] R13: 0000000000000000 R14: 0000000000000000 R15: 00007ffe=
ee09ca6e
>> [   40.857009] irq event stamp: 8258
>> [   40.860875] hardirqs last  enabled at (8257): [<ffffffff8191b0cb>] pr=
eempt_schedule_irq+0x3b/0x90
>> [   40.870941] hardirqs last disabled at (8258): [<ffffffff8191a2a9>] __=
schedule+0x99/0x9e0
>> [   40.880106] softirqs last  enabled at (8256): [<ffffffff81c003f4>] __=
do_softirq+0x3f4/0x4c1
>> [   40.889506] softirqs last disabled at (8249): [<ffffffff810d108d>] ir=
q_exit+0xdd/0xf0
>> [   40.898329] ---[ end trace 0f9a24fdf9c73c71 ]---
>>
>>
>>                                                            # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start 5bb0643c4108bb06d8766b4bd48d20215deef4af f17b5f06cb92ef=
2250513a1e154c47b78df07d40 --
>> git bisect  bad 8e26062e1c829f1656e91461f95a7b83bda16ffd  # 02:34  B    =
  0    10   25   0  Merge 'tip/ras/core' into devel-hourly-2019021719
>> git bisect  bad 39b94eff9f252bd7b6f2dfe716f6b5dd894ada6f  # 02:49  B    =
  0     4   19   0  Merge 'sunxi/sunxi/h3-h5-for-5.1' into devel-hourly-201=
9021719
>> git bisect  bad cce96fc008ac0e3a5f96280557b02dcb83e70eee  # 03:02  B    =
  0    10   25   0  Merge 'linux-review/Gustavo-A-R-Silva/igc-Use-struct_si=
ze-helper/20190208-163630' into devel-hourly-2019021719
>> git bisect  bad 544d67be09fcf4054db60b0b2b6fcb7386c095fe  # 03:13  B    =
  0     7   22   0  Merge 'linux-review/Noralf-Tr-nnes/drm-drv-Rework-drm_d=
ev_unplug-was-Remove-drm_dev_unplug/20190208-223952' into devel-hourly-2019=
021719
>> git bisect good 6dfcfd278beadb8857b94c0382348625943044be  # 03:25  G    =
 11     0    0   0  Merge 'linux-review/Qing-Xia/staging-android-ion-fix-sy=
s-heap-pool-s-gfp_flags/20190204-124705' into devel-hourly-2019021719
>> git bisect  bad 238358184e8bfb7c34701fc858f93400ffd8207d  # 03:35  B    =
  0    10   25   0  Merge 'linux-review/Colin-King-via-dri-devel/video-fbde=
v-savage-fix-indentation-issue/20190212-234031' into devel-hourly-2019021719
>> git bisect good 8833753cc966fbe02ec9dadcd73601f23da7dc2d  # 03:44  G    =
 10     0    0   0  Merge 'linux-review/Kamalesh-Babulal/static_keys-txt-Fi=
x-trivial-spelling-mistake/20190204-230620' into devel-hourly-2019021719
>> git bisect  bad efcb5c0b0e4e5bd29320ef5d7ef3e0654c182abf  # 03:52  B    =
  0     8   23   0  Merge 'net/master' into devel-hourly-2019021719
>> git bisect good 9312d5340da6a6018c851d03107ae24ef1a7ccb5  # 04:08  G    =
 11     0    0   0  Merge 'linux-review/Yuri-Benditovich/virtio_net-Introdu=
ce-extended-RSC-feature/20190204-114604' into devel-hourly-2019021719
>> git bisect  bad 680905431b9de8c7224b15b76b1826a1481cfeaf  # 04:18  B    =
  0     9   24   0  Merge tag 'char-misc-5.0-rc6' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/gregkh/char-misc
>> git bisect  bad b9de6efed25cb713c1648e71302f4af83bd14ee6  # 04:31  B    =
  0    11   26   0  Merge branch 'akpm' (patches from Andrew)
>> git bisect good 44e56f325b7d63e8a53008956ce7b28e4272a599  # 04:39  G    =
 11     0    0   0  Merge tag 'pci-v5.0-fixes-3' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/helgaas/pci
>> git bisect good a8e911d13540487942d53137c156bd7707f66e5d  # 04:50  G    =
 10     0    0   0  x86_64: increase stack size for KASAN_EXTRA
>> git bisect good cd984a5be21549273a3f13b52a8b7b84097b32a7  # 05:01  G    =
 11     0    0   0  Merge tag 'xtensa-20190201' of git://github.com/jcmvbkb=
c/linux-xtensa
>> git bisect  bad db7ddeab3ce5d64c9696e70d61f45ea9909cd196  # 05:10  B    =
  0     7   22   0  lib/test_kmod.c: potential double free in error handling
>> git bisect  bad 24feb47c5fa5b825efb0151f28906dfdad027e61  # 05:20  B    =
  0     4   19   0  mm, memory_hotplug: test_pages_in_a_zone do not pass th=
e end of zone
>> git bisect good 80409c65e2c6cd1540045ee01fc55e50d95e0983  # 05:50  G    =
 11     0    1   1  mm: migrate: make buffer_migrate_page_norefs() actually=
 succeed
>> git bisect  bad efad4e475c312456edb3c789d0996d12ed744c13  # 06:03  B    =
  0     3   18   0  mm, memory_hotplug: is_mem_section_removable do not pas=
s the end of a zone
>> git bisect good 9bcdeb51bd7d2ae9fe65ea4d60643d2aeef5bfe3  # 06:25  G    =
 11     0    0   0  oom, oom_reaper: do not enqueue same task twice
>> # first bad commit: [efad4e475c312456edb3c789d0996d12ed744c13] mm, memor=
y_hotplug: is_mem_section_removable do not pass the end of a zone
>> git bisect good 9bcdeb51bd7d2ae9fe65ea4d60643d2aeef5bfe3  # 06:29  G    =
 31     0    0   0  oom, oom_reaper: do not enqueue same task twice
>> # extra tests with debug options
>> git bisect  bad efad4e475c312456edb3c789d0996d12ed744c13  # 06:50  B    =
  0     2   17   0  mm, memory_hotplug: is_mem_section_removable do not pas=
s the end of a zone
>> # extra tests on HEAD of linux-devel/devel-hourly-2019021719
>> git bisect  bad 5bb0643c4108bb06d8766b4bd48d20215deef4af  # 06:55  B    =
  0    12   31   1  0day head guard for 'devel-hourly-2019021719'
>> # extra tests on tree/branch linus/master
>> git bisect good f17b5f06cb92ef2250513a1e154c47b78df07d40  # 06:56  G    =
 10     0    0   6  Linux 5.0-rc4
>> # extra tests with first bad commit reverted
>> git bisect good cc8685c9af14503b93c6aca3330789384fcb62ac  # 07:25  G    =
 10     0    0   0  Revert "mm, memory_hotplug: is_mem_section_removable do=
 not pass the end of a zone"
>> # extra tests on tree/branch linux-next/master
>> git bisect  bad 7a92eb7cc1dc4c63e3a2fa9ab8e3c1049f199249  # 07:50  B    =
  0    10   25   0  Add linux-next specific files for 20190215
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology C=
enter
>> https://lists.01.org/pipermail/lkp                          Intel Corpor=
ation
>
>> #!/bin/bash
>>
>> kernel=3D$1
>> initrd=3Dquantal-trinity-x86_64.cgz
>>
>> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/=
master/quantal/$initrd
>>
>> kvm=3D(
>> 	qemu-system-x86_64
>> 	-enable-kvm
>> 	-cpu kvm64
>> 	-kernel $kernel
>> 	-initrd $initrd
>> 	-m 512
>> 	-smp 2
>> 	-device e1000,netdev=3Dnet0
>> 	-netdev user,id=3Dnet0
>> 	-boot order=3Dnc
>> 	-no-reboot
>> 	-watchdog i6300esb
>> 	-watchdog-action debug
>> 	-rtc base=3Dlocaltime
>> 	-serial stdio
>> 	-display none
>> 	-monitor null
>> )
>>
>> append=3D(
>> 	root=3D/dev/ram0
>> 	hung_task_panic=3D1
>> 	debug
>> 	apic=3Ddebug
>> 	sysrq_always_enabled
>> 	rcupdate.rcu_cpu_stall_timeout=3D100
>> 	net.ifnames=3D0
>> 	printk.devkmsg=3Don
>> 	panic=3D-1
>> 	softlockup_panic=3D1
>> 	nmi_watchdog=3Dpanic
>> 	oops=3Dpanic
>> 	load_ramdisk=3D2
>> 	prompt_ramdisk=3D0
>> 	drbd.minor_count=3D8
>> 	systemd.log_level=3Derr
>> 	ignore_loglevel
>> 	console=3Dtty0
>> 	earlyprintk=3DttyS0,115200
>> 	console=3DttyS0,115200
>> 	vga=3Dnormal
>> 	rw
>> 	drbd.minor_count=3D8
>> 	rcuperf.shutdown=3D0
>> )
>>
>> "${kvm[@]}" -append "${append[*]}"
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86_64 5.0.0-rc4 Kernel Configuration
>> #
>>
>> #
>> # Compiler: gcc-6 (Debian 6.5.0-2) 6.5.0 20181026
>> #
>> CONFIG_CC_IS_GCC=3Dy
>> CONFIG_GCC_VERSION=3D60500
>> CONFIG_CLANG_VERSION=3D0
>> CONFIG_CC_HAS_ASM_GOTO=3Dy
>> CONFIG_CONSTRUCTORS=3Dy
>> CONFIG_IRQ_WORK=3Dy
>> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
>> CONFIG_THREAD_INFO_IN_TASK=3Dy
>>
>> #
>> # General setup
>> #
>> CONFIG_INIT_ENV_ARG_LIMIT=3D32
>> # CONFIG_COMPILE_TEST is not set
>> CONFIG_LOCALVERSION=3D""
>> CONFIG_LOCALVERSION_AUTO=3Dy
>> CONFIG_BUILD_SALT=3D""
>> CONFIG_HAVE_KERNEL_GZIP=3Dy
>> CONFIG_HAVE_KERNEL_BZIP2=3Dy
>> CONFIG_HAVE_KERNEL_LZMA=3Dy
>> CONFIG_HAVE_KERNEL_XZ=3Dy
>> CONFIG_HAVE_KERNEL_LZO=3Dy
>> CONFIG_HAVE_KERNEL_LZ4=3Dy
>> # CONFIG_KERNEL_GZIP is not set
>> CONFIG_KERNEL_BZIP2=3Dy
>> # CONFIG_KERNEL_LZMA is not set
>> # CONFIG_KERNEL_XZ is not set
>> # CONFIG_KERNEL_LZO is not set
>> # CONFIG_KERNEL_LZ4 is not set
>> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>> # CONFIG_SYSVIPC is not set
>> # CONFIG_POSIX_MQUEUE is not set
>> # CONFIG_CROSS_MEMORY_ATTACH is not set
>> # CONFIG_USELIB is not set
>> CONFIG_AUDIT=3Dy
>> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>> CONFIG_AUDITSYSCALL=3Dy
>>
>> #
>> # IRQ subsystem
>> #
>> CONFIG_GENERIC_IRQ_PROBE=3Dy
>> CONFIG_GENERIC_IRQ_SHOW=3Dy
>> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
>> CONFIG_GENERIC_PENDING_IRQ=3Dy
>> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
>> CONFIG_GENERIC_IRQ_CHIP=3Dy
>> CONFIG_IRQ_DOMAIN=3Dy
>> CONFIG_IRQ_SIM=3Dy
>> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
>> CONFIG_GENERIC_MSI_IRQ=3Dy
>> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
>> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
>> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
>> CONFIG_IRQ_FORCED_THREADING=3Dy
>> CONFIG_SPARSE_IRQ=3Dy
>> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
>> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
>> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
>> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
>> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
>> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
>> CONFIG_GENERIC_CMOS_UPDATE=3Dy
>>
>> #
>> # Timers subsystem
>> #
>> CONFIG_TICK_ONESHOT=3Dy
>> CONFIG_NO_HZ_COMMON=3Dy
>> # CONFIG_HZ_PERIODIC is not set
>> # CONFIG_NO_HZ_IDLE is not set
>> CONFIG_NO_HZ_FULL=3Dy
>> # CONFIG_NO_HZ is not set
>> # CONFIG_HIGH_RES_TIMERS is not set
>> # CONFIG_PREEMPT_NONE is not set
>> # CONFIG_PREEMPT_VOLUNTARY is not set
>> CONFIG_PREEMPT=3Dy
>> CONFIG_PREEMPT_COUNT=3Dy
>>
>> #
>> # CPU/Task time and stats accounting
>> #
>> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
>> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
>> # CONFIG_IRQ_TIME_ACCOUNTING is not set
>> # CONFIG_BSD_PROCESS_ACCT is not set
>> CONFIG_TASKSTATS=3Dy
>> CONFIG_TASK_DELAY_ACCT=3Dy
>> CONFIG_TASK_XACCT=3Dy
>> # CONFIG_TASK_IO_ACCOUNTING is not set
>> # CONFIG_PSI is not set
>> CONFIG_CPU_ISOLATION=3Dy
>>
>> #
>> # RCU Subsystem
>> #
>> CONFIG_PREEMPT_RCU=3Dy
>> # CONFIG_RCU_EXPERT is not set
>> CONFIG_SRCU=3Dy
>> CONFIG_TREE_SRCU=3Dy
>> CONFIG_TASKS_RCU=3Dy
>> CONFIG_RCU_STALL_COMMON=3Dy
>> CONFIG_RCU_NEED_SEGCBLIST=3Dy
>> CONFIG_CONTEXT_TRACKING=3Dy
>> CONFIG_CONTEXT_TRACKING_FORCE=3Dy
>> CONFIG_RCU_NOCB_CPU=3Dy
>> CONFIG_BUILD_BIN2C=3Dy
>> CONFIG_IKCONFIG=3Dy
>> CONFIG_IKCONFIG_PROC=3Dy
>> CONFIG_LOG_BUF_SHIFT=3D20
>> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
>> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
>> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
>> CONFIG_ARCH_SUPPORTS_INT128=3Dy
>> # CONFIG_NUMA_BALANCING is not set
>> CONFIG_CGROUPS=3Dy
>> # CONFIG_MEMCG is not set
>> CONFIG_CGROUP_SCHED=3Dy
>> # CONFIG_FAIR_GROUP_SCHED is not set
>> # CONFIG_RT_GROUP_SCHED is not set
>> # CONFIG_CGROUP_PIDS is not set
>> CONFIG_CGROUP_RDMA=3Dy
>> CONFIG_CGROUP_FREEZER=3Dy
>> # CONFIG_CGROUP_HUGETLB is not set
>> CONFIG_CPUSETS=3Dy
>> CONFIG_PROC_PID_CPUSET=3Dy
>> CONFIG_CGROUP_DEVICE=3Dy
>> # CONFIG_CGROUP_CPUACCT is not set
>> CONFIG_CGROUP_PERF=3Dy
>> CONFIG_CGROUP_DEBUG=3Dy
>> CONFIG_NAMESPACES=3Dy
>> # CONFIG_UTS_NS is not set
>> CONFIG_USER_NS=3Dy
>> CONFIG_PID_NS=3Dy
>> # CONFIG_NET_NS is not set
>> CONFIG_CHECKPOINT_RESTORE=3Dy
>> # CONFIG_SCHED_AUTOGROUP is not set
>> # CONFIG_SYSFS_DEPRECATED is not set
>> # CONFIG_RELAY is not set
>> CONFIG_BLK_DEV_INITRD=3Dy
>> CONFIG_INITRAMFS_SOURCE=3D""
>> CONFIG_RD_GZIP=3Dy
>> # CONFIG_RD_BZIP2 is not set
>> # CONFIG_RD_LZMA is not set
>> CONFIG_RD_XZ=3Dy
>> # CONFIG_RD_LZO is not set
>> # CONFIG_RD_LZ4 is not set
>> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
>> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
>> CONFIG_SYSCTL=3Dy
>> CONFIG_ANON_INODES=3Dy
>> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
>> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
>> CONFIG_BPF=3Dy
>> CONFIG_EXPERT=3Dy
>> CONFIG_MULTIUSER=3Dy
>> # CONFIG_SGETMASK_SYSCALL is not set
>> CONFIG_SYSFS_SYSCALL=3Dy
>> # CONFIG_SYSCTL_SYSCALL is not set
>> CONFIG_FHANDLE=3Dy
>> CONFIG_POSIX_TIMERS=3Dy
>> CONFIG_PRINTK=3Dy
>> CONFIG_PRINTK_NMI=3Dy
>> CONFIG_BUG=3Dy
>> CONFIG_PCSPKR_PLATFORM=3Dy
>> # CONFIG_BASE_FULL is not set
>> CONFIG_FUTEX=3Dy
>> CONFIG_FUTEX_PI=3Dy
>> CONFIG_EPOLL=3Dy
>> CONFIG_SIGNALFD=3Dy
>> CONFIG_TIMERFD=3Dy
>> # CONFIG_EVENTFD is not set
>> CONFIG_SHMEM=3Dy
>> # CONFIG_AIO is not set
>> CONFIG_ADVISE_SYSCALLS=3Dy
>> CONFIG_MEMBARRIER=3Dy
>> CONFIG_KALLSYMS=3Dy
>> CONFIG_KALLSYMS_ALL=3Dy
>> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
>> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>> # CONFIG_BPF_SYSCALL is not set
>> # CONFIG_USERFAULTFD is not set
>> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
>> # CONFIG_RSEQ is not set
>> CONFIG_EMBEDDED=3Dy
>> CONFIG_HAVE_PERF_EVENTS=3Dy
>> CONFIG_PERF_USE_VMALLOC=3Dy
>> # CONFIG_PC104 is not set
>>
>> #
>> # Kernel Performance Events And Counters
>> #
>> CONFIG_PERF_EVENTS=3Dy
>> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
>> # CONFIG_VM_EVENT_COUNTERS is not set
>> # CONFIG_COMPAT_BRK is not set
>> # CONFIG_SLAB is not set
>> # CONFIG_SLUB is not set
>> CONFIG_SLOB=3Dy
>> # CONFIG_SLAB_MERGE_DEFAULT is not set
>> CONFIG_PROFILING=3Dy
>> CONFIG_TRACEPOINTS=3Dy
>> CONFIG_64BIT=3Dy
>> CONFIG_X86_64=3Dy
>> CONFIG_X86=3Dy
>> CONFIG_INSTRUCTION_DECODER=3Dy
>> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
>> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
>> CONFIG_LOCKDEP_SUPPORT=3Dy
>> CONFIG_STACKTRACE_SUPPORT=3Dy
>> CONFIG_MMU=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
>> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
>> CONFIG_GENERIC_BUG=3Dy
>> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
>> CONFIG_GENERIC_HWEIGHT=3Dy
>> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
>> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
>> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
>> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
>> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
>> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
>> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
>> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
>> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
>> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
>> CONFIG_ZONE_DMA32=3Dy
>> CONFIG_AUDIT_ARCH=3Dy
>> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
>> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
>> CONFIG_X86_64_SMP=3Dy
>> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>> CONFIG_FIX_EARLYCON_MEM=3Dy
>> CONFIG_PGTABLE_LEVELS=3D4
>> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
>>
>> #
>> # Processor type and features
>> #
>> # CONFIG_ZONE_DMA is not set
>> CONFIG_SMP=3Dy
>> CONFIG_X86_FEATURE_NAMES=3Dy
>> # CONFIG_X86_X2APIC is not set
>> CONFIG_X86_MPPARSE=3Dy
>> # CONFIG_GOLDFISH is not set
>> CONFIG_RETPOLINE=3Dy
>> # CONFIG_X86_RESCTRL is not set
>> # CONFIG_X86_EXTENDED_PLATFORM is not set
>> # CONFIG_X86_INTEL_LPSS is not set
>> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
>> CONFIG_IOSF_MBI=3Dy
>> CONFIG_IOSF_MBI_DEBUG=3Dy
>> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>> CONFIG_HYPERVISOR_GUEST=3Dy
>> CONFIG_PARAVIRT=3Dy
>> # CONFIG_PARAVIRT_DEBUG is not set
>> # CONFIG_PARAVIRT_SPINLOCKS is not set
>> # CONFIG_XEN is not set
>> CONFIG_KVM_GUEST=3Dy
>> # CONFIG_PVH is not set
>> # CONFIG_KVM_DEBUG_FS is not set
>> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>> CONFIG_PARAVIRT_CLOCK=3Dy
>> # CONFIG_JAILHOUSE_GUEST is not set
>> # CONFIG_MK8 is not set
>> # CONFIG_MPSC is not set
>> # CONFIG_MCORE2 is not set
>> # CONFIG_MATOM is not set
>> CONFIG_GENERIC_CPU=3Dy
>> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
>> CONFIG_X86_L1_CACHE_SHIFT=3D6
>> CONFIG_X86_TSC=3Dy
>> CONFIG_X86_CMPXCHG64=3Dy
>> CONFIG_X86_CMOV=3Dy
>> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
>> CONFIG_X86_DEBUGCTLMSR=3Dy
>> CONFIG_PROCESSOR_SELECT=3Dy
>> CONFIG_CPU_SUP_INTEL=3Dy
>> # CONFIG_CPU_SUP_AMD is not set
>> # CONFIG_CPU_SUP_HYGON is not set
>> # CONFIG_CPU_SUP_CENTAUR is not set
>> CONFIG_HPET_TIMER=3Dy
>> CONFIG_HPET_EMULATE_RTC=3Dy
>> CONFIG_DMI=3Dy
>> CONFIG_CALGARY_IOMMU=3Dy
>> CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT=3Dy
>> # CONFIG_MAXSMP is not set
>> CONFIG_NR_CPUS_RANGE_BEGIN=3D2
>> CONFIG_NR_CPUS_RANGE_END=3D512
>> CONFIG_NR_CPUS_DEFAULT=3D64
>> CONFIG_NR_CPUS=3D64
>> CONFIG_SCHED_SMT=3Dy
>> # CONFIG_SCHED_MC is not set
>> CONFIG_X86_LOCAL_APIC=3Dy
>> CONFIG_X86_IO_APIC=3Dy
>> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
>> # CONFIG_X86_MCE is not set
>>
>> #
>> # Performance monitoring
>> #
>> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
>> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
>> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
>> CONFIG_X86_VSYSCALL_EMULATION=3Dy
>> CONFIG_I8K=3Dm
>> CONFIG_MICROCODE=3Dy
>> CONFIG_MICROCODE_INTEL=3Dy
>> # CONFIG_MICROCODE_AMD is not set
>> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
>> # CONFIG_X86_MSR is not set
>> CONFIG_X86_CPUID=3Dm
>> # CONFIG_X86_5LEVEL is not set
>> CONFIG_X86_CPA_STATISTICS=3Dy
>> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
>> CONFIG_NUMA=3Dy
>> CONFIG_AMD_NUMA=3Dy
>> CONFIG_X86_64_ACPI_NUMA=3Dy
>> CONFIG_NODES_SPAN_OTHER_NODES=3Dy
>> # CONFIG_NUMA_EMU is not set
>> CONFIG_NODES_SHIFT=3D6
>> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
>> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>> # CONFIG_ARCH_MEMORY_PROBE is not set
>> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
>> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
>> CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
>> CONFIG_X86_RESERVE_LOW=3D64
>> # CONFIG_MTRR is not set
>> # CONFIG_ARCH_RANDOM is not set
>> CONFIG_X86_SMAP=3Dy
>> # CONFIG_X86_INTEL_UMIP is not set
>> CONFIG_X86_INTEL_MPX=3Dy
>> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
>> # CONFIG_EFI is not set
>> CONFIG_SECCOMP=3Dy
>> # CONFIG_HZ_100 is not set
>> # CONFIG_HZ_250 is not set
>> # CONFIG_HZ_300 is not set
>> CONFIG_HZ_1000=3Dy
>> CONFIG_HZ=3D1000
>> CONFIG_KEXEC=3Dy
>> # CONFIG_KEXEC_FILE is not set
>> CONFIG_CRASH_DUMP=3Dy
>> CONFIG_PHYSICAL_START=3D0x1000000
>> # CONFIG_RELOCATABLE is not set
>> CONFIG_PHYSICAL_ALIGN=3D0x200000
>> CONFIG_HOTPLUG_CPU=3Dy
>> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
>> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
>> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
>> # CONFIG_LEGACY_VSYSCALL_NONE is not set
>> # CONFIG_CMDLINE_BOOL is not set
>> # CONFIG_MODIFY_LDT_SYSCALL is not set
>> CONFIG_HAVE_LIVEPATCH=3Dy
>> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
>> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
>> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
>> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
>>
>> #
>> # Power management and ACPI options
>> #
>> CONFIG_SUSPEND=3Dy
>> CONFIG_SUSPEND_FREEZER=3Dy
>> # CONFIG_SUSPEND_SKIP_SYNC is not set
>> CONFIG_PM_SLEEP=3Dy
>> CONFIG_PM_SLEEP_SMP=3Dy
>> # CONFIG_PM_AUTOSLEEP is not set
>> CONFIG_PM_WAKELOCKS=3Dy
>> CONFIG_PM_WAKELOCKS_LIMIT=3D100
>> CONFIG_PM_WAKELOCKS_GC=3Dy
>> CONFIG_PM=3Dy
>> CONFIG_PM_DEBUG=3Dy
>> CONFIG_PM_ADVANCED_DEBUG=3Dy
>> CONFIG_PM_TEST_SUSPEND=3Dy
>> CONFIG_PM_SLEEP_DEBUG=3Dy
>> CONFIG_PM_TRACE=3Dy
>> CONFIG_PM_TRACE_RTC=3Dy
>> CONFIG_PM_CLK=3Dy
>> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
>> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
>> CONFIG_ACPI=3Dy
>> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
>> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
>> # CONFIG_ACPI_DEBUGGER is not set
>> CONFIG_ACPI_SPCR_TABLE=3Dy
>> CONFIG_ACPI_LPIT=3Dy
>> CONFIG_ACPI_SLEEP=3Dy
>> # CONFIG_ACPI_PROCFS_POWER is not set
>> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
>> # CONFIG_ACPI_EC_DEBUGFS is not set
>> CONFIG_ACPI_AC=3Dy
>> CONFIG_ACPI_BATTERY=3Dy
>> CONFIG_ACPI_BUTTON=3Dy
>> # CONFIG_ACPI_VIDEO is not set
>> CONFIG_ACPI_FAN=3Dy
>> # CONFIG_ACPI_TAD is not set
>> # CONFIG_ACPI_DOCK is not set
>> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
>> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
>> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
>> CONFIG_ACPI_PROCESSOR=3Dy
>> # CONFIG_ACPI_IPMI is not set
>> CONFIG_ACPI_HOTPLUG_CPU=3Dy
>> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
>> CONFIG_ACPI_THERMAL=3Dy
>> CONFIG_ACPI_NUMA=3Dy
>> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
>> CONFIG_ACPI_TABLE_UPGRADE=3Dy
>> # CONFIG_ACPI_DEBUG is not set
>> # CONFIG_ACPI_PCI_SLOT is not set
>> CONFIG_ACPI_CONTAINER=3Dy
>> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
>> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
>> # CONFIG_ACPI_SBS is not set
>> # CONFIG_ACPI_HED is not set
>> # CONFIG_ACPI_CUSTOM_METHOD is not set
>> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
>> CONFIG_HAVE_ACPI_APEI=3Dy
>> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
>> # CONFIG_ACPI_APEI is not set
>> # CONFIG_DPTF_POWER is not set
>> # CONFIG_PMIC_OPREGION is not set
>> # CONFIG_ACPI_CONFIGFS is not set
>> CONFIG_X86_PM_TIMER=3Dy
>> # CONFIG_SFI is not set
>>
>> #
>> # CPU Frequency scaling
>> #
>> # CONFIG_CPU_FREQ is not set
>>
>> #
>> # CPU Idle
>> #
>> CONFIG_CPU_IDLE=3Dy
>> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
>> CONFIG_CPU_IDLE_GOV_MENU=3Dy
>> CONFIG_INTEL_IDLE=3Dy
>>
>> #
>> # Bus options (PCI etc.)
>> #
>> CONFIG_PCI_DIRECT=3Dy
>> CONFIG_PCI_MMCONFIG=3Dy
>> CONFIG_MMCONF_FAM10H=3Dy
>> # CONFIG_PCI_CNB20LE_QUIRK is not set
>> # CONFIG_ISA_BUS is not set
>> # CONFIG_ISA_DMA_API is not set
>> CONFIG_X86_SYSFB=3Dy
>>
>> #
>> # Binary Emulations
>> #
>> # CONFIG_IA32_EMULATION is not set
>> # CONFIG_X86_X32 is not set
>> CONFIG_X86_DEV_DMA_OPS=3Dy
>> CONFIG_HAVE_GENERIC_GUP=3Dy
>>
>> #
>> # Firmware Drivers
>> #
>> CONFIG_EDD=3Dy
>> # CONFIG_EDD_OFF is not set
>> # CONFIG_FIRMWARE_MEMMAP is not set
>> CONFIG_DMIID=3Dy
>> # CONFIG_DMI_SYSFS is not set
>> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
>> # CONFIG_ISCSI_IBFT_FIND is not set
>> # CONFIG_FW_CFG_SYSFS is not set
>> # CONFIG_GOOGLE_FIRMWARE is not set
>>
>> #
>> # Tegra firmware driver
>> #
>> CONFIG_HAVE_KVM=3Dy
>> CONFIG_VIRTUALIZATION=3Dy
>> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
>>
>> #
>> # General architecture-dependent options
>> #
>> CONFIG_CRASH_CORE=3Dy
>> CONFIG_KEXEC_CORE=3Dy
>> CONFIG_HOTPLUG_SMT=3Dy
>> # CONFIG_OPROFILE is not set
>> CONFIG_HAVE_OPROFILE=3Dy
>> CONFIG_OPROFILE_NMI_TIMER=3Dy
>> # CONFIG_KPROBES is not set
>> CONFIG_JUMP_LABEL=3Dy
>> # CONFIG_STATIC_KEYS_SELFTEST is not set
>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
>> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
>> CONFIG_HAVE_IOREMAP_PROT=3Dy
>> CONFIG_HAVE_KPROBES=3Dy
>> CONFIG_HAVE_KRETPROBES=3Dy
>> CONFIG_HAVE_OPTPROBES=3Dy
>> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
>> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
>> CONFIG_HAVE_NMI=3Dy
>> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
>> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
>> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
>> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
>> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
>> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
>> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
>> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
>> CONFIG_HAVE_RSEQ=3Dy
>> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
>> CONFIG_HAVE_CLK=3Dy
>> CONFIG_HAVE_HW_BREAKPOINT=3Dy
>> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
>> CONFIG_HAVE_PERF_REGS=3Dy
>> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
>> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
>> CONFIG_HAVE_RCU_TABLE_INVALIDATE=3Dy
>> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>> CONFIG_SECCOMP_FILTER=3Dy
>> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
>> CONFIG_HAVE_STACKPROTECTOR=3Dy
>> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
>> # CONFIG_STACKPROTECTOR is not set
>> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
>> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
>> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_HAVE_MOVE_PMD=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
>> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
>> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
>> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
>> CONFIG_MODULES_USE_ELF_RELA=3Dy
>> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
>> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>> CONFIG_HAVE_EXIT_THREAD=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS=3D28
>> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
>> CONFIG_HAVE_STACK_VALIDATION=3Dy
>> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
>> CONFIG_ISA_BUS_API=3Dy
>> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
>> # CONFIG_VMAP_STACK is not set
>> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
>> CONFIG_STRICT_KERNEL_RWX=3Dy
>> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
>> CONFIG_STRICT_MODULE_RWX=3Dy
>> CONFIG_ARCH_HAS_REFCOUNT=3Dy
>> CONFIG_REFCOUNT_FULL=3Dy
>> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
>>
>> #
>> # GCOV-based kernel profiling
>> #
>> CONFIG_GCOV_KERNEL=3Dy
>> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
>> # CONFIG_GCOV_PROFILE_ALL is not set
>> CONFIG_GCOV_FORMAT_4_7=3Dy
>> CONFIG_PLUGIN_HOSTCC=3D"g++"
>> CONFIG_HAVE_GCC_PLUGINS=3Dy
>> CONFIG_GCC_PLUGINS=3Dy
>> # CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
>> # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
>> # CONFIG_GCC_PLUGIN_STRUCTLEAK is not set
>> # CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
>> CONFIG_GCC_PLUGIN_STACKLEAK=3Dy
>> CONFIG_STACKLEAK_TRACK_MIN_SIZE=3D100
>> CONFIG_STACKLEAK_METRICS=3Dy
>> # CONFIG_STACKLEAK_RUNTIME_DISABLE is not set
>> CONFIG_RT_MUTEXES=3Dy
>> CONFIG_BASE_SMALL=3D1
>> CONFIG_MODULES=3Dy
>> # CONFIG_MODULE_FORCE_LOAD is not set
>> # CONFIG_MODULE_UNLOAD is not set
>> # CONFIG_MODVERSIONS is not set
>> # CONFIG_MODULE_SRCVERSION_ALL is not set
>> # CONFIG_MODULE_SIG is not set
>> # CONFIG_MODULE_COMPRESS is not set
>> # CONFIG_TRIM_UNUSED_KSYMS is not set
>> CONFIG_MODULES_TREE_LOOKUP=3Dy
>> # CONFIG_BLOCK is not set
>> CONFIG_PADATA=3Dy
>> CONFIG_ASN1=3Dm
>> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
>> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
>> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
>> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
>> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
>> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>> CONFIG_QUEUED_SPINLOCKS=3Dy
>> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
>> CONFIG_QUEUED_RWLOCKS=3Dy
>> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
>> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
>> CONFIG_FREEZER=3Dy
>>
>> #
>> # Executable file formats
>> #
>> CONFIG_BINFMT_ELF=3Dy
>> CONFIG_ELFCORE=3Dy
>> CONFIG_BINFMT_SCRIPT=3Dy
>> # CONFIG_BINFMT_MISC is not set
>> # CONFIG_COREDUMP is not set
>>
>> #
>> # Memory Management options
>> #
>> CONFIG_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_SPARSEMEM_MANUAL=3Dy
>> CONFIG_SPARSEMEM=3Dy
>> CONFIG_NEED_MULTIPLE_NODES=3Dy
>> CONFIG_HAVE_MEMORY_PRESENT=3Dy
>> CONFIG_SPARSEMEM_EXTREME=3Dy
>> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
>> # CONFIG_SPARSEMEM_VMEMMAP is not set
>> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
>> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
>> CONFIG_MEMORY_ISOLATION=3Dy
>> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
>> CONFIG_MEMORY_HOTPLUG=3Dy
>> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
>> CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=3Dy
>> CONFIG_MEMORY_HOTREMOVE=3Dy
>> CONFIG_SPLIT_PTLOCK_CPUS=3D4
>> # CONFIG_COMPACTION is not set
>> CONFIG_MIGRATION=3Dy
>> CONFIG_PHYS_ADDR_T_64BIT=3Dy
>> CONFIG_VIRT_TO_BUS=3Dy
>> # CONFIG_KSM is not set
>> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>> # CONFIG_TRANSPARENT_HUGEPAGE is not set
>> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
>> # CONFIG_CLEANCACHE is not set
>> CONFIG_CMA=3Dy
>> CONFIG_CMA_DEBUG=3Dy
>> # CONFIG_CMA_DEBUGFS is not set
>> CONFIG_CMA_AREAS=3D7
>> # CONFIG_MEM_SOFT_DIRTY is not set
>> CONFIG_ZPOOL=3Dm
>> # CONFIG_ZBUD is not set
>> CONFIG_Z3FOLD=3Dm
>> CONFIG_ZSMALLOC=3Dm
>> # CONFIG_PGTABLE_MAPPING is not set
>> # CONFIG_ZSMALLOC_STAT is not set
>> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
>> # CONFIG_IDLE_PAGE_TRACKING is not set
>> CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
>> CONFIG_FRAME_VECTOR=3Dy
>> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
>> CONFIG_ARCH_HAS_PKEYS=3Dy
>> CONFIG_PERCPU_STATS=3Dy
>> # CONFIG_GUP_BENCHMARK is not set
>> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
>> CONFIG_NET=3Dy
>> CONFIG_NET_INGRESS=3Dy
>> CONFIG_SKB_EXTENSIONS=3Dy
>>
>> #
>> # Networking options
>> #
>> CONFIG_PACKET=3Dy
>> CONFIG_PACKET_DIAG=3Dm
>> CONFIG_UNIX=3Dy
>> CONFIG_UNIX_DIAG=3Dm
>> # CONFIG_TLS is not set
>> CONFIG_XFRM=3Dy
>> CONFIG_XFRM_ALGO=3Dy
>> # CONFIG_XFRM_USER is not set
>> # CONFIG_XFRM_INTERFACE is not set
>> CONFIG_XFRM_SUB_POLICY=3Dy
>> CONFIG_XFRM_MIGRATE=3Dy
>> # CONFIG_XFRM_STATISTICS is not set
>> CONFIG_NET_KEY=3Dy
>> # CONFIG_NET_KEY_MIGRATE is not set
>> CONFIG_INET=3Dy
>> # CONFIG_IP_MULTICAST is not set
>> # CONFIG_IP_ADVANCED_ROUTER is not set
>> CONFIG_IP_PNP=3Dy
>> CONFIG_IP_PNP_DHCP=3Dy
>> # CONFIG_IP_PNP_BOOTP is not set
>> # CONFIG_IP_PNP_RARP is not set
>> # CONFIG_NET_IPIP is not set
>> # CONFIG_NET_IPGRE_DEMUX is not set
>> CONFIG_NET_IP_TUNNEL=3Dy
>> # CONFIG_SYN_COOKIES is not set
>> # CONFIG_NET_IPVTI is not set
>> # CONFIG_NET_FOU is not set
>> # CONFIG_NET_FOU_IP_TUNNELS is not set
>> # CONFIG_INET_AH is not set
>> # CONFIG_INET_ESP is not set
>> # CONFIG_INET_IPCOMP is not set
>> CONFIG_INET_TUNNEL=3Dy
>> CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
>> CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
>> CONFIG_INET_XFRM_MODE_BEET=3Dy
>> CONFIG_INET_DIAG=3Dy
>> CONFIG_INET_TCP_DIAG=3Dy
>> # CONFIG_INET_UDP_DIAG is not set
>> # CONFIG_INET_RAW_DIAG is not set
>> # CONFIG_INET_DIAG_DESTROY is not set
>> # CONFIG_TCP_CONG_ADVANCED is not set
>> CONFIG_TCP_CONG_CUBIC=3Dy
>> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
>> # CONFIG_TCP_MD5SIG is not set
>> CONFIG_IPV6=3Dy
>> # CONFIG_IPV6_ROUTER_PREF is not set
>> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
>> # CONFIG_INET6_AH is not set
>> # CONFIG_INET6_ESP is not set
>> # CONFIG_INET6_IPCOMP is not set
>> # CONFIG_IPV6_MIP6 is not set
>> # CONFIG_IPV6_ILA is not set
>> CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
>> CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
>> CONFIG_INET6_XFRM_MODE_BEET=3Dy
>> # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
>> # CONFIG_IPV6_VTI is not set
>> CONFIG_IPV6_SIT=3Dy
>> # CONFIG_IPV6_SIT_6RD is not set
>> CONFIG_IPV6_NDISC_NODETYPE=3Dy
>> # CONFIG_IPV6_TUNNEL is not set
>> # CONFIG_IPV6_MULTIPLE_TABLES is not set
>> # CONFIG_IPV6_MROUTE is not set
>> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
>> # CONFIG_IPV6_SEG6_HMAC is not set
>> CONFIG_NETWORK_SECMARK=3Dy
>> CONFIG_NET_PTP_CLASSIFY=3Dy
>> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
>> CONFIG_NETFILTER=3Dy
>> CONFIG_NETFILTER_ADVANCED=3Dy
>> CONFIG_BRIDGE_NETFILTER=3Dm
>>
>> #
>> # Core Netfilter Configuration
>> #
>> CONFIG_NETFILTER_INGRESS=3Dy
>> CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
>> # CONFIG_NETFILTER_NETLINK_ACCT is not set
>> # CONFIG_NETFILTER_NETLINK_QUEUE is not set
>> # CONFIG_NETFILTER_NETLINK_LOG is not set
>> # CONFIG_NETFILTER_NETLINK_OSF is not set
>> # CONFIG_NF_CONNTRACK is not set
>> # CONFIG_NF_LOG_NETDEV is not set
>> # CONFIG_NF_TABLES is not set
>> # CONFIG_NETFILTER_XTABLES is not set
>> # CONFIG_IP_SET is not set
>> # CONFIG_IP_VS is not set
>>
>> #
>> # IP: Netfilter Configuration
>> #
>> # CONFIG_NF_SOCKET_IPV4 is not set
>> # CONFIG_NF_TPROXY_IPV4 is not set
>> # CONFIG_NF_DUP_IPV4 is not set
>> # CONFIG_NF_LOG_ARP is not set
>> # CONFIG_NF_LOG_IPV4 is not set
>> # CONFIG_NF_REJECT_IPV4 is not set
>> # CONFIG_IP_NF_IPTABLES is not set
>> # CONFIG_IP_NF_ARPTABLES is not set
>>
>> #
>> # IPv6: Netfilter Configuration
>> #
>> # CONFIG_NF_SOCKET_IPV6 is not set
>> # CONFIG_NF_TPROXY_IPV6 is not set
>> # CONFIG_NF_DUP_IPV6 is not set
>> # CONFIG_NF_REJECT_IPV6 is not set
>> # CONFIG_NF_LOG_IPV6 is not set
>> # CONFIG_IP6_NF_IPTABLES is not set
>> # CONFIG_BPFILTER is not set
>> # CONFIG_IP_DCCP is not set
>> # CONFIG_IP_SCTP is not set
>> # CONFIG_RDS is not set
>> # CONFIG_TIPC is not set
>> CONFIG_ATM=3Dy
>> # CONFIG_ATM_CLIP is not set
>> CONFIG_ATM_LANE=3Dy
>> # CONFIG_ATM_MPOA is not set
>> # CONFIG_ATM_BR2684 is not set
>> # CONFIG_L2TP is not set
>> CONFIG_STP=3Dm
>> CONFIG_GARP=3Dm
>> CONFIG_BRIDGE=3Dm
>> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
>> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
>> CONFIG_HAVE_NET_DSA=3Dy
>> # CONFIG_NET_DSA is not set
>> CONFIG_VLAN_8021Q=3Dm
>> CONFIG_VLAN_8021Q_GVRP=3Dy
>> # CONFIG_VLAN_8021Q_MVRP is not set
>> # CONFIG_DECNET is not set
>> CONFIG_LLC=3Dy
>> CONFIG_LLC2=3Dm
>> CONFIG_ATALK=3Dy
>> # CONFIG_DEV_APPLETALK is not set
>> CONFIG_X25=3Dy
>> # CONFIG_LAPB is not set
>> CONFIG_PHONET=3Dy
>> # CONFIG_6LOWPAN is not set
>> CONFIG_IEEE802154=3Dm
>> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
>> # CONFIG_IEEE802154_SOCKET is not set
>> CONFIG_MAC802154=3Dm
>> CONFIG_NET_SCHED=3Dy
>>
>> #
>> # Queueing/Scheduling
>> #
>> # CONFIG_NET_SCH_CBQ is not set
>> # CONFIG_NET_SCH_HTB is not set
>> CONFIG_NET_SCH_HFSC=3Dm
>> CONFIG_NET_SCH_ATM=3Dy
>> CONFIG_NET_SCH_PRIO=3Dy
>> CONFIG_NET_SCH_MULTIQ=3Dm
>> # CONFIG_NET_SCH_RED is not set
>> CONFIG_NET_SCH_SFB=3Dm
>> # CONFIG_NET_SCH_SFQ is not set
>> # CONFIG_NET_SCH_TEQL is not set
>> CONFIG_NET_SCH_TBF=3Dy
>> # CONFIG_NET_SCH_CBS is not set
>> CONFIG_NET_SCH_ETF=3Dy
>> CONFIG_NET_SCH_TAPRIO=3Dm
>> CONFIG_NET_SCH_GRED=3Dy
>> CONFIG_NET_SCH_DSMARK=3Dm
>> CONFIG_NET_SCH_NETEM=3Dy
>> CONFIG_NET_SCH_DRR=3Dm
>> # CONFIG_NET_SCH_MQPRIO is not set
>> # CONFIG_NET_SCH_SKBPRIO is not set
>> CONFIG_NET_SCH_CHOKE=3Dm
>> # CONFIG_NET_SCH_QFQ is not set
>> CONFIG_NET_SCH_CODEL=3Dy
>> CONFIG_NET_SCH_FQ_CODEL=3Dm
>> # CONFIG_NET_SCH_CAKE is not set
>> CONFIG_NET_SCH_FQ=3Dm
>> CONFIG_NET_SCH_HHF=3Dy
>> CONFIG_NET_SCH_PIE=3Dm
>> CONFIG_NET_SCH_PLUG=3Dy
>> # CONFIG_NET_SCH_DEFAULT is not set
>>
>> #
>> # Classification
>> #
>> CONFIG_NET_CLS=3Dy
>> CONFIG_NET_CLS_BASIC=3Dm
>> CONFIG_NET_CLS_TCINDEX=3Dm
>> # CONFIG_NET_CLS_ROUTE4 is not set
>> # CONFIG_NET_CLS_FW is not set
>> CONFIG_NET_CLS_U32=3Dm
>> # CONFIG_CLS_U32_PERF is not set
>> CONFIG_CLS_U32_MARK=3Dy
>> CONFIG_NET_CLS_RSVP=3Dm
>> # CONFIG_NET_CLS_RSVP6 is not set
>> CONFIG_NET_CLS_FLOW=3Dy
>> # CONFIG_NET_CLS_CGROUP is not set
>> CONFIG_NET_CLS_BPF=3Dm
>> CONFIG_NET_CLS_FLOWER=3Dm
>> CONFIG_NET_CLS_MATCHALL=3Dy
>> CONFIG_NET_EMATCH=3Dy
>> CONFIG_NET_EMATCH_STACK=3D32
>> # CONFIG_NET_EMATCH_CMP is not set
>> CONFIG_NET_EMATCH_NBYTE=3Dm
>> CONFIG_NET_EMATCH_U32=3Dm
>> # CONFIG_NET_EMATCH_META is not set
>> CONFIG_NET_EMATCH_TEXT=3Dy
>> # CONFIG_NET_EMATCH_CANID is not set
>> # CONFIG_NET_CLS_ACT is not set
>> # CONFIG_NET_CLS_IND is not set
>> CONFIG_NET_SCH_FIFO=3Dy
>> CONFIG_DCB=3Dy
>> CONFIG_DNS_RESOLVER=3Dm
>> # CONFIG_BATMAN_ADV is not set
>> # CONFIG_OPENVSWITCH is not set
>> CONFIG_VSOCKETS=3Dm
>> # CONFIG_VSOCKETS_DIAG is not set
>> CONFIG_VMWARE_VMCI_VSOCKETS=3Dm
>> CONFIG_VIRTIO_VSOCKETS=3Dm
>> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
>> CONFIG_NETLINK_DIAG=3Dy
>> CONFIG_MPLS=3Dy
>> # CONFIG_NET_MPLS_GSO is not set
>> # CONFIG_MPLS_ROUTING is not set
>> CONFIG_NET_NSH=3Dm
>> CONFIG_HSR=3Dm
>> # CONFIG_NET_SWITCHDEV is not set
>> # CONFIG_NET_L3_MASTER_DEV is not set
>> # CONFIG_NET_NCSI is not set
>> CONFIG_RPS=3Dy
>> CONFIG_RFS_ACCEL=3Dy
>> CONFIG_XPS=3Dy
>> # CONFIG_CGROUP_NET_PRIO is not set
>> # CONFIG_CGROUP_NET_CLASSID is not set
>> CONFIG_NET_RX_BUSY_POLL=3Dy
>> CONFIG_BQL=3Dy
>> CONFIG_BPF_JIT=3Dy
>> CONFIG_NET_FLOW_LIMIT=3Dy
>>
>> #
>> # Network testing
>> #
>> # CONFIG_NET_PKTGEN is not set
>> # CONFIG_NET_DROP_MONITOR is not set
>> # CONFIG_HAMRADIO is not set
>> CONFIG_CAN=3Dy
>> CONFIG_CAN_RAW=3Dm
>> CONFIG_CAN_BCM=3Dy
>> CONFIG_CAN_GW=3Dm
>>
>> #
>> # CAN Device Drivers
>> #
>> CONFIG_CAN_VCAN=3Dy
>> CONFIG_CAN_VXCAN=3Dy
>> CONFIG_CAN_SLCAN=3Dy
>> CONFIG_CAN_DEV=3Dy
>> # CONFIG_CAN_CALC_BITTIMING is not set
>> # CONFIG_CAN_FLEXCAN is not set
>> CONFIG_CAN_GRCAN=3Dm
>> CONFIG_CAN_JANZ_ICAN3=3Dm
>> CONFIG_CAN_C_CAN=3Dy
>> CONFIG_CAN_C_CAN_PLATFORM=3Dm
>> CONFIG_CAN_C_CAN_PCI=3Dm
>> CONFIG_CAN_CC770=3Dm
>> # CONFIG_CAN_CC770_ISA is not set
>> CONFIG_CAN_CC770_PLATFORM=3Dm
>> CONFIG_CAN_IFI_CANFD=3Dy
>> CONFIG_CAN_M_CAN=3Dm
>> # CONFIG_CAN_PEAK_PCIEFD is not set
>> CONFIG_CAN_SJA1000=3Dy
>> CONFIG_CAN_SJA1000_ISA=3Dm
>> CONFIG_CAN_SJA1000_PLATFORM=3Dm
>> # CONFIG_CAN_EMS_PCMCIA is not set
>> # CONFIG_CAN_EMS_PCI is not set
>> CONFIG_CAN_PEAK_PCMCIA=3Dy
>> CONFIG_CAN_PEAK_PCI=3Dy
>> # CONFIG_CAN_PEAK_PCIEC is not set
>> CONFIG_CAN_KVASER_PCI=3Dm
>> # CONFIG_CAN_PLX_PCI is not set
>> CONFIG_CAN_SOFTING=3Dm
>> CONFIG_CAN_SOFTING_CS=3Dm
>> # CONFIG_CAN_DEBUG_DEVICES is not set
>> # CONFIG_BT is not set
>> # CONFIG_AF_RXRPC is not set
>> # CONFIG_AF_KCM is not set
>> CONFIG_WIRELESS=3Dy
>> CONFIG_WIRELESS_EXT=3Dy
>> CONFIG_WEXT_CORE=3Dy
>> CONFIG_WEXT_PROC=3Dy
>> CONFIG_WEXT_SPY=3Dy
>> CONFIG_WEXT_PRIV=3Dy
>> CONFIG_CFG80211=3Dm
>> # CONFIG_NL80211_TESTMODE is not set
>> CONFIG_CFG80211_DEVELOPER_WARNINGS=3Dy
>> CONFIG_CFG80211_CERTIFICATION_ONUS=3Dy
>> # CONFIG_CFG80211_REQUIRE_SIGNED_REGDB is not set
>> # CONFIG_CFG80211_REG_CELLULAR_HINTS is not set
>> # CONFIG_CFG80211_REG_RELAX_NO_IR is not set
>> CONFIG_CFG80211_DEFAULT_PS=3Dy
>> CONFIG_CFG80211_DEBUGFS=3Dy
>> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
>> # CONFIG_CFG80211_WEXT is not set
>> CONFIG_MAC80211=3Dm
>> CONFIG_MAC80211_HAS_RC=3Dy
>> CONFIG_MAC80211_RC_MINSTREL=3Dy
>> CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
>> CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
>> # CONFIG_MAC80211_MESH is not set
>> # CONFIG_MAC80211_LEDS is not set
>> CONFIG_MAC80211_DEBUGFS=3Dy
>> CONFIG_MAC80211_MESSAGE_TRACING=3Dy
>> # CONFIG_MAC80211_DEBUG_MENU is not set
>> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
>> # CONFIG_WIMAX is not set
>> CONFIG_RFKILL=3Dy
>> CONFIG_RFKILL_LEDS=3Dy
>> # CONFIG_RFKILL_INPUT is not set
>> # CONFIG_RFKILL_GPIO is not set
>> CONFIG_NET_9P=3Dy
>> CONFIG_NET_9P_VIRTIO=3Dy
>> # CONFIG_NET_9P_DEBUG is not set
>> CONFIG_CAIF=3Dy
>> # CONFIG_CAIF_DEBUG is not set
>> CONFIG_CAIF_NETDEV=3Dm
>> # CONFIG_CAIF_USB is not set
>> # CONFIG_CEPH_LIB is not set
>> CONFIG_NFC=3Dm
>> # CONFIG_NFC_DIGITAL is not set
>> # CONFIG_NFC_NCI is not set
>> # CONFIG_NFC_HCI is not set
>>
>> #
>> # Near Field Communication (NFC) devices
>> #
>> # CONFIG_NFC_PN533_I2C is not set
>> CONFIG_PSAMPLE=3Dy
>> CONFIG_NET_IFE=3Dy
>> # CONFIG_LWTUNNEL is not set
>> CONFIG_DST_CACHE=3Dy
>> CONFIG_GRO_CELLS=3Dy
>> CONFIG_NET_DEVLINK=3Dm
>> CONFIG_MAY_USE_DEVLINK=3Dm
>> CONFIG_FAILOVER=3Dm
>> CONFIG_HAVE_EBPF_JIT=3Dy
>>
>> #
>> # Device Drivers
>> #
>> CONFIG_HAVE_EISA=3Dy
>> # CONFIG_EISA is not set
>> CONFIG_HAVE_PCI=3Dy
>> CONFIG_PCI=3Dy
>> CONFIG_PCI_DOMAINS=3Dy
>> CONFIG_PCIEPORTBUS=3Dy
>> # CONFIG_HOTPLUG_PCI_PCIE is not set
>> # CONFIG_PCIEAER is not set
>> CONFIG_PCIEASPM=3Dy
>> # CONFIG_PCIEASPM_DEBUG is not set
>> # CONFIG_PCIEASPM_DEFAULT is not set
>> # CONFIG_PCIEASPM_POWERSAVE is not set
>> CONFIG_PCIEASPM_POWER_SUPERSAVE=3Dy
>> # CONFIG_PCIEASPM_PERFORMANCE is not set
>> CONFIG_PCIE_PME=3Dy
>> CONFIG_PCIE_PTM=3Dy
>> CONFIG_PCI_MSI=3Dy
>> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
>> CONFIG_PCI_QUIRKS=3Dy
>> # CONFIG_PCI_DEBUG is not set
>> # CONFIG_PCI_STUB is not set
>> CONFIG_PCI_ATS=3Dy
>> CONFIG_PCI_ECAM=3Dy
>> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
>> # CONFIG_PCI_IOV is not set
>> # CONFIG_PCI_PRI is not set
>> CONFIG_PCI_PASID=3Dy
>> CONFIG_PCI_LABEL=3Dy
>> CONFIG_HOTPLUG_PCI=3Dy
>> # CONFIG_HOTPLUG_PCI_ACPI is not set
>> # CONFIG_HOTPLUG_PCI_CPCI is not set
>> CONFIG_HOTPLUG_PCI_SHPC=3Dy
>>
>> #
>> # PCI controller drivers
>> #
>>
>> #
>> # Cadence PCIe controllers support
>> #
>> CONFIG_PCIE_CADENCE=3Dy
>> CONFIG_PCIE_CADENCE_HOST=3Dy
>> # CONFIG_PCI_FTPCI100 is not set
>> CONFIG_PCI_HOST_COMMON=3Dy
>> CONFIG_PCI_HOST_GENERIC=3Dy
>> # CONFIG_PCIE_XILINX is not set
>> CONFIG_VMD=3Dm
>>
>> #
>> # DesignWare PCI Core Support
>> #
>> CONFIG_PCIE_DW=3Dy
>> CONFIG_PCIE_DW_HOST=3Dy
>> CONFIG_PCIE_DW_PLAT=3Dy
>> CONFIG_PCIE_DW_PLAT_HOST=3Dy
>> # CONFIG_PCI_MESON is not set
>>
>> #
>> # PCI Endpoint
>> #
>> # CONFIG_PCI_ENDPOINT is not set
>>
>> #
>> # PCI switch controller drivers
>> #
>> CONFIG_PCI_SW_SWITCHTEC=3Dy
>> CONFIG_PCCARD=3Dy
>> CONFIG_PCMCIA=3Dy
>> # CONFIG_PCMCIA_LOAD_CIS is not set
>> CONFIG_CARDBUS=3Dy
>>
>> #
>> # PC-card bridges
>> #
>> CONFIG_YENTA=3Dy
>> CONFIG_YENTA_O2=3Dy
>> CONFIG_YENTA_RICOH=3Dy
>> CONFIG_YENTA_TI=3Dy
>> # CONFIG_YENTA_ENE_TUNE is not set
>> # CONFIG_YENTA_TOSHIBA is not set
>> CONFIG_PD6729=3Dm
>> CONFIG_I82092=3Dm
>> CONFIG_PCCARD_NONSTATIC=3Dy
>> # CONFIG_RAPIDIO is not set
>>
>> #
>> # Generic Driver Options
>> #
>> # CONFIG_UEVENT_HELPER is not set
>> CONFIG_DEVTMPFS=3Dy
>> # CONFIG_DEVTMPFS_MOUNT is not set
>> CONFIG_STANDALONE=3Dy
>> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
>>
>> #
>> # Firmware loader
>> #
>> CONFIG_FW_LOADER=3Dy
>> CONFIG_EXTRA_FIRMWARE=3D""
>> CONFIG_FW_LOADER_USER_HELPER=3Dy
>> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
>> CONFIG_WANT_DEV_COREDUMP=3Dy
>> CONFIG_ALLOW_DEV_COREDUMP=3Dy
>> CONFIG_DEV_COREDUMP=3Dy
>> # CONFIG_DEBUG_DRIVER is not set
>> # CONFIG_DEBUG_DEVRES is not set
>> CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy
>> CONFIG_TEST_ASYNC_DRIVER_PROBE=3Dm
>> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
>> CONFIG_REGMAP=3Dy
>> CONFIG_REGMAP_I2C=3Dy
>> CONFIG_REGMAP_W1=3Dm
>> CONFIG_REGMAP_MMIO=3Dy
>> CONFIG_REGMAP_IRQ=3Dy
>> CONFIG_DMA_SHARED_BUFFER=3Dy
>> CONFIG_DMA_FENCE_TRACE=3Dy
>> # CONFIG_DMA_CMA is not set
>>
>> #
>> # Bus devices
>> #
>> # CONFIG_SIMPLE_PM_BUS is not set
>> # CONFIG_CONNECTOR is not set
>> CONFIG_GNSS=3Dy
>> CONFIG_MTD=3Dm
>> CONFIG_MTD_TESTS=3Dm
>> CONFIG_MTD_CMDLINE_PARTS=3Dm
>> CONFIG_MTD_OF_PARTS=3Dm
>> CONFIG_MTD_AR7_PARTS=3Dm
>>
>> #
>> # Partition parsers
>> #
>> CONFIG_MTD_REDBOOT_PARTS=3Dm
>> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
>> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
>> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
>>
>> #
>> # User Modules And Translation Layers
>> #
>> CONFIG_MTD_OOPS=3Dm
>> # CONFIG_MTD_PARTITIONED_MASTER is not set
>>
>> #
>> # RAM/ROM/Flash chip drivers
>> #
>> CONFIG_MTD_CFI=3Dm
>> CONFIG_MTD_JEDECPROBE=3Dm
>> CONFIG_MTD_GEN_PROBE=3Dm
>> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
>> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
>> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
>> CONFIG_MTD_CFI_I1=3Dy
>> CONFIG_MTD_CFI_I2=3Dy
>> CONFIG_MTD_CFI_INTELEXT=3Dm
>> CONFIG_MTD_CFI_AMDSTD=3Dm
>> CONFIG_MTD_CFI_STAA=3Dm
>> CONFIG_MTD_CFI_UTIL=3Dm
>> CONFIG_MTD_RAM=3Dm
>> # CONFIG_MTD_ROM is not set
>> # CONFIG_MTD_ABSENT is not set
>>
>> #
>> # Mapping drivers for chip access
>> #
>> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
>> CONFIG_MTD_PHYSMAP=3Dm
>> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
>> CONFIG_MTD_PHYSMAP_START=3D0x8000000
>> CONFIG_MTD_PHYSMAP_LEN=3D0
>> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
>> # CONFIG_MTD_PHYSMAP_OF is not set
>> # CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
>> CONFIG_MTD_SBC_GXX=3Dm
>> CONFIG_MTD_AMD76XROM=3Dm
>> # CONFIG_MTD_ICHXROM is not set
>> CONFIG_MTD_ESB2ROM=3Dm
>> CONFIG_MTD_CK804XROM=3Dm
>> CONFIG_MTD_SCB2_FLASH=3Dm
>> CONFIG_MTD_NETtel=3Dm
>> CONFIG_MTD_L440GX=3Dm
>> # CONFIG_MTD_PCI is not set
>> CONFIG_MTD_PCMCIA=3Dm
>> # CONFIG_MTD_PCMCIA_ANONYMOUS is not set
>> CONFIG_MTD_INTEL_VR_NOR=3Dm
>> CONFIG_MTD_PLATRAM=3Dm
>>
>> #
>> # Self-contained MTD device drivers
>> #
>> # CONFIG_MTD_PMC551 is not set
>> # CONFIG_MTD_SLRAM is not set
>> # CONFIG_MTD_PHRAM is not set
>> CONFIG_MTD_MTDRAM=3Dm
>> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
>> CONFIG_MTDRAM_ERASE_SIZE=3D128
>>
>> #
>> # Disk-On-Chip Device Drivers
>> #
>> CONFIG_MTD_DOCG3=3Dm
>> CONFIG_BCH_CONST_M=3D14
>> CONFIG_BCH_CONST_T=3D4
>> CONFIG_MTD_ONENAND=3Dm
>> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
>> # CONFIG_MTD_ONENAND_GENERIC is not set
>> # CONFIG_MTD_ONENAND_OTP is not set
>> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
>> # CONFIG_MTD_NAND is not set
>>
>> #
>> # LPDDR & LPDDR2 PCM memory drivers
>> #
>> CONFIG_MTD_LPDDR=3Dm
>> CONFIG_MTD_QINFO_PROBE=3Dm
>> # CONFIG_MTD_SPI_NOR is not set
>> CONFIG_MTD_UBI=3Dm
>> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
>> CONFIG_MTD_UBI_BEB_LIMIT=3D20
>> CONFIG_MTD_UBI_FASTMAP=3Dy
>> CONFIG_MTD_UBI_GLUEBI=3Dm
>> CONFIG_DTC=3Dy
>> CONFIG_OF=3Dy
>> # CONFIG_OF_UNITTEST is not set
>> CONFIG_OF_FLATTREE=3Dy
>> CONFIG_OF_KOBJ=3Dy
>> CONFIG_OF_DYNAMIC=3Dy
>> CONFIG_OF_ADDRESS=3Dy
>> CONFIG_OF_IRQ=3Dy
>> CONFIG_OF_NET=3Dy
>> CONFIG_OF_MDIO=3Dy
>> CONFIG_OF_RESOLVE=3Dy
>> CONFIG_OF_OVERLAY=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>> # CONFIG_PARPORT is not set
>> CONFIG_PNP=3Dy
>> CONFIG_PNP_DEBUG_MESSAGES=3Dy
>>
>> #
>> # Protocols
>> #
>> CONFIG_PNPACPI=3Dy
>>
>> #
>> # NVME Support
>> #
>>
>> #
>> # Misc devices
>> #
>> CONFIG_AD525X_DPOT=3Dy
>> CONFIG_AD525X_DPOT_I2C=3Dm
>> CONFIG_DUMMY_IRQ=3Dy
>> # CONFIG_IBM_ASM is not set
>> CONFIG_PHANTOM=3Dy
>> CONFIG_SGI_IOC4=3Dm
>> CONFIG_TIFM_CORE=3Dm
>> # CONFIG_TIFM_7XX1 is not set
>> CONFIG_ICS932S401=3Dy
>> CONFIG_ENCLOSURE_SERVICES=3Dy
>> # CONFIG_HP_ILO is not set
>> CONFIG_APDS9802ALS=3Dy
>> CONFIG_ISL29003=3Dy
>> CONFIG_ISL29020=3Dy
>> CONFIG_SENSORS_TSL2550=3Dy
>> CONFIG_SENSORS_BH1770=3Dy
>> CONFIG_SENSORS_APDS990X=3Dm
>> CONFIG_HMC6352=3Dm
>> # CONFIG_DS1682 is not set
>> # CONFIG_VMWARE_BALLOON is not set
>> CONFIG_USB_SWITCH_FSA9480=3Dm
>> CONFIG_SRAM=3Dy
>> CONFIG_PCI_ENDPOINT_TEST=3Dy
>> CONFIG_MISC_RTSX=3Dy
>> # CONFIG_PVPANIC is not set
>> CONFIG_C2PORT=3Dy
>> CONFIG_C2PORT_DURAMAR_2150=3Dm
>>
>> #
>> # EEPROM support
>> #
>> # CONFIG_EEPROM_AT24 is not set
>> # CONFIG_EEPROM_LEGACY is not set
>> # CONFIG_EEPROM_MAX6875 is not set
>> CONFIG_EEPROM_93CX6=3Dy
>> CONFIG_EEPROM_IDT_89HPESX=3Dy
>> CONFIG_EEPROM_EE1004=3Dy
>> CONFIG_CB710_CORE=3Dy
>> # CONFIG_CB710_DEBUG is not set
>> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
>>
>> #
>> # Texas Instruments shared transport line discipline
>> #
>> # CONFIG_TI_ST is not set
>> # CONFIG_SENSORS_LIS3_I2C is not set
>> CONFIG_ALTERA_STAPL=3Dy
>> CONFIG_INTEL_MEI=3Dy
>> # CONFIG_INTEL_MEI_ME is not set
>> CONFIG_INTEL_MEI_TXE=3Dy
>> CONFIG_VMWARE_VMCI=3Dy
>>
>> #
>> # Intel MIC & related support
>> #
>>
>> #
>> # Intel MIC Bus Driver
>> #
>> CONFIG_INTEL_MIC_BUS=3Dm
>>
>> #
>> # SCIF Bus Driver
>> #
>> CONFIG_SCIF_BUS=3Dy
>>
>> #
>> # VOP Bus Driver
>> #
>> CONFIG_VOP_BUS=3Dm
>>
>> #
>> # Intel MIC Host Driver
>> #
>>
>> #
>> # Intel MIC Card Driver
>> #
>>
>> #
>> # SCIF Driver
>> #
>>
>> #
>> # Intel MIC Coprocessor State Management (COSM) Drivers
>> #
>>
>> #
>> # VOP Driver
>> #
>> CONFIG_VOP=3Dm
>> CONFIG_VHOST_RING=3Dm
>> # CONFIG_GENWQE is not set
>> CONFIG_ECHO=3Dm
>> CONFIG_MISC_ALCOR_PCI=3Dy
>> CONFIG_MISC_RTSX_PCI=3Dy
>> CONFIG_HAVE_IDE=3Dy
>>
>> #
>> # SCSI device support
>> #
>> CONFIG_SCSI_MOD=3Dy
>> CONFIG_FUSION=3Dy
>> CONFIG_FUSION_MAX_SGE=3D128
>> CONFIG_FUSION_LOGGING=3Dy
>>
>> #
>> # IEEE 1394 (FireWire) support
>> #
>> # CONFIG_FIREWIRE is not set
>> # CONFIG_FIREWIRE_NOSY is not set
>> # CONFIG_MACINTOSH_DRIVERS is not set
>> CONFIG_NETDEVICES=3Dy
>> CONFIG_MII=3Dy
>> # CONFIG_NET_CORE is not set
>> CONFIG_ARCNET=3Dm
>> CONFIG_ARCNET_1201=3Dm
>> CONFIG_ARCNET_1051=3Dm
>> # CONFIG_ARCNET_RAW is not set
>> # CONFIG_ARCNET_CAP is not set
>> CONFIG_ARCNET_COM90xx=3Dm
>> # CONFIG_ARCNET_COM90xxIO is not set
>> CONFIG_ARCNET_RIM_I=3Dm
>> CONFIG_ARCNET_COM20020=3Dm
>> # CONFIG_ARCNET_COM20020_PCI is not set
>> CONFIG_ARCNET_COM20020_CS=3Dm
>> CONFIG_ATM_DRIVERS=3Dy
>> CONFIG_ATM_DUMMY=3Dy
>> # CONFIG_ATM_TCP is not set
>> # CONFIG_ATM_LANAI is not set
>> CONFIG_ATM_ENI=3Dm
>> # CONFIG_ATM_ENI_DEBUG is not set
>> # CONFIG_ATM_ENI_TUNE_BURST is not set
>> # CONFIG_ATM_FIRESTREAM is not set
>> CONFIG_ATM_ZATM=3Dm
>> CONFIG_ATM_ZATM_DEBUG=3Dy
>> CONFIG_ATM_NICSTAR=3Dy
>> CONFIG_ATM_NICSTAR_USE_SUNI=3Dy
>> CONFIG_ATM_NICSTAR_USE_IDT77105=3Dy
>> # CONFIG_ATM_IDT77252 is not set
>> CONFIG_ATM_AMBASSADOR=3Dy
>> # CONFIG_ATM_AMBASSADOR_DEBUG is not set
>> CONFIG_ATM_HORIZON=3Dy
>> # CONFIG_ATM_HORIZON_DEBUG is not set
>> # CONFIG_ATM_IA is not set
>> CONFIG_ATM_FORE200E=3Dy
>> CONFIG_ATM_FORE200E_USE_TASKLET=3Dy
>> CONFIG_ATM_FORE200E_TX_RETRY=3D16
>> CONFIG_ATM_FORE200E_DEBUG=3D0
>> CONFIG_ATM_HE=3Dy
>> CONFIG_ATM_HE_USE_SUNI=3Dy
>> # CONFIG_ATM_SOLOS is not set
>>
>> #
>> # CAIF transport drivers
>> #
>> # CONFIG_CAIF_TTY is not set
>> CONFIG_CAIF_SPI_SLAVE=3Dm
>> CONFIG_CAIF_SPI_SYNC=3Dy
>> # CONFIG_CAIF_HSI is not set
>> CONFIG_CAIF_VIRTIO=3Dm
>>
>> #
>> # Distributed Switch Architecture drivers
>> #
>> CONFIG_ETHERNET=3Dy
>> CONFIG_MDIO=3Dy
>> CONFIG_NET_VENDOR_3COM=3Dy
>> # CONFIG_PCMCIA_3C574 is not set
>> CONFIG_PCMCIA_3C589=3Dm
>> CONFIG_VORTEX=3Dm
>> # CONFIG_TYPHOON is not set
>> # CONFIG_NET_VENDOR_ADAPTEC is not set
>> # CONFIG_NET_VENDOR_AGERE is not set
>> # CONFIG_NET_VENDOR_ALACRITECH is not set
>> # CONFIG_NET_VENDOR_ALTEON is not set
>> # CONFIG_ALTERA_TSE is not set
>> # CONFIG_NET_VENDOR_AMAZON is not set
>> CONFIG_NET_VENDOR_AMD=3Dy
>> # CONFIG_AMD8111_ETH is not set
>> CONFIG_PCNET32=3Dy
>> CONFIG_PCMCIA_NMCLAN=3Dy
>> CONFIG_AMD_XGBE=3Dy
>> CONFIG_AMD_XGBE_DCB=3Dy
>> CONFIG_AMD_XGBE_HAVE_ECC=3Dy
>> CONFIG_NET_VENDOR_AQUANTIA=3Dy
>> # CONFIG_AQTION is not set
>> CONFIG_NET_VENDOR_ARC=3Dy
>> CONFIG_NET_VENDOR_ATHEROS=3Dy
>> CONFIG_ATL2=3Dm
>> CONFIG_ATL1=3Dm
>> # CONFIG_ATL1E is not set
>> CONFIG_ATL1C=3Dy
>> CONFIG_ALX=3Dy
>> CONFIG_NET_VENDOR_AURORA=3Dy
>> # CONFIG_AURORA_NB8800 is not set
>> # CONFIG_NET_VENDOR_BROADCOM is not set
>> # CONFIG_NET_VENDOR_BROCADE is not set
>> # CONFIG_NET_VENDOR_CADENCE is not set
>> CONFIG_NET_VENDOR_CAVIUM=3Dy
>> # CONFIG_THUNDER_NIC_PF is not set
>> CONFIG_THUNDER_NIC_VF=3Dm
>> # CONFIG_THUNDER_NIC_BGX is not set
>> CONFIG_THUNDER_NIC_RGX=3Dy
>> CONFIG_CAVIUM_PTP=3Dm
>> # CONFIG_LIQUIDIO is not set
>> CONFIG_LIQUIDIO_VF=3Dy
>> CONFIG_NET_VENDOR_CHELSIO=3Dy
>> CONFIG_CHELSIO_T1=3Dy
>> CONFIG_CHELSIO_T1_1G=3Dy
>> # CONFIG_CHELSIO_T3 is not set
>> # CONFIG_CHELSIO_T4 is not set
>> # CONFIG_CHELSIO_T4VF is not set
>> CONFIG_NET_VENDOR_CISCO=3Dy
>> CONFIG_ENIC=3Dm
>> # CONFIG_NET_VENDOR_CORTINA is not set
>> CONFIG_CX_ECAT=3Dm
>> # CONFIG_DNET is not set
>> CONFIG_NET_VENDOR_DEC=3Dy
>> CONFIG_NET_TULIP=3Dy
>> CONFIG_DE2104X=3Dm
>> CONFIG_DE2104X_DSL=3D0
>> CONFIG_TULIP=3Dy
>> CONFIG_TULIP_MWI=3Dy
>> # CONFIG_TULIP_MMIO is not set
>> # CONFIG_TULIP_NAPI is not set
>> CONFIG_DE4X5=3Dy
>> CONFIG_WINBOND_840=3Dy
>> # CONFIG_DM9102 is not set
>> # CONFIG_ULI526X is not set
>> CONFIG_PCMCIA_XIRCOM=3Dy
>> CONFIG_NET_VENDOR_DLINK=3Dy
>> CONFIG_DL2K=3Dy
>> CONFIG_SUNDANCE=3Dm
>> CONFIG_SUNDANCE_MMIO=3Dy
>> CONFIG_NET_VENDOR_EMULEX=3Dy
>> CONFIG_BE2NET=3Dm
>> CONFIG_BE2NET_HWMON=3Dy
>> CONFIG_BE2NET_BE2=3Dy
>> # CONFIG_BE2NET_BE3 is not set
>> CONFIG_BE2NET_LANCER=3Dy
>> CONFIG_BE2NET_SKYHAWK=3Dy
>> CONFIG_NET_VENDOR_EZCHIP=3Dy
>> CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=3Dm
>> # CONFIG_NET_VENDOR_FUJITSU is not set
>> CONFIG_NET_VENDOR_HP=3Dy
>> # CONFIG_HP100 is not set
>> CONFIG_NET_VENDOR_HUAWEI=3Dy
>> CONFIG_HINIC=3Dy
>> CONFIG_NET_VENDOR_I825XX=3Dy
>> CONFIG_NET_VENDOR_INTEL=3Dy
>> # CONFIG_E100 is not set
>> CONFIG_E1000=3Dy
>> CONFIG_E1000E=3Dm
>> CONFIG_E1000E_HWTS=3Dy
>> CONFIG_IGB=3Dm
>> CONFIG_IGB_HWMON=3Dy
>> CONFIG_IGB_DCA=3Dy
>> # CONFIG_IGBVF is not set
>> # CONFIG_IXGB is not set
>> CONFIG_IXGBE=3Dm
>> CONFIG_IXGBE_HWMON=3Dy
>> CONFIG_IXGBE_DCA=3Dy
>> # CONFIG_IXGBE_DCB is not set
>> # CONFIG_IXGBEVF is not set
>> # CONFIG_I40E is not set
>> # CONFIG_I40EVF is not set
>> # CONFIG_ICE is not set
>> # CONFIG_FM10K is not set
>> # CONFIG_IGC is not set
>> # CONFIG_JME is not set
>> CONFIG_NET_VENDOR_MARVELL=3Dy
>> CONFIG_MVMDIO=3Dm
>> # CONFIG_SKGE is not set
>> CONFIG_SKY2=3Dm
>> CONFIG_SKY2_DEBUG=3Dy
>> CONFIG_NET_VENDOR_MELLANOX=3Dy
>> # CONFIG_MLX4_EN is not set
>> # CONFIG_MLX5_CORE is not set
>> # CONFIG_MLXSW_CORE is not set
>> # CONFIG_MLXFW is not set
>> CONFIG_NET_VENDOR_MICREL=3Dy
>> CONFIG_KS8842=3Dy
>> CONFIG_KS8851_MLL=3Dm
>> CONFIG_KSZ884X_PCI=3Dy
>> CONFIG_NET_VENDOR_MICROCHIP=3Dy
>> CONFIG_LAN743X=3Dy
>> CONFIG_NET_VENDOR_MICROSEMI=3Dy
>> CONFIG_NET_VENDOR_MYRI=3Dy
>> # CONFIG_MYRI10GE is not set
>> CONFIG_FEALNX=3Dm
>> # CONFIG_NET_VENDOR_NATSEMI is not set
>> # CONFIG_NET_VENDOR_NETERION is not set
>> CONFIG_NET_VENDOR_NETRONOME=3Dy
>> # CONFIG_NFP is not set
>> # CONFIG_NET_VENDOR_NI is not set
>> CONFIG_NET_VENDOR_NVIDIA=3Dy
>> CONFIG_FORCEDETH=3Dy
>> CONFIG_NET_VENDOR_OKI=3Dy
>> # CONFIG_ETHOC is not set
>> # CONFIG_NET_VENDOR_PACKET_ENGINES is not set
>> CONFIG_NET_VENDOR_QLOGIC=3Dy
>> CONFIG_QLA3XXX=3Dy
>> # CONFIG_QLCNIC is not set
>> CONFIG_QLGE=3Dm
>> CONFIG_NETXEN_NIC=3Dy
>> CONFIG_QED=3Dm
>> CONFIG_QEDE=3Dm
>> # CONFIG_NET_VENDOR_QUALCOMM is not set
>> # CONFIG_NET_VENDOR_RDC is not set
>> CONFIG_NET_VENDOR_REALTEK=3Dy
>> CONFIG_8139CP=3Dy
>> CONFIG_8139TOO=3Dm
>> # CONFIG_8139TOO_PIO is not set
>> # CONFIG_8139TOO_TUNE_TWISTER is not set
>> CONFIG_8139TOO_8129=3Dy
>> CONFIG_8139_OLD_RX_RESET=3Dy
>> CONFIG_R8169=3Dy
>> CONFIG_NET_VENDOR_RENESAS=3Dy
>> # CONFIG_NET_VENDOR_ROCKER is not set
>> # CONFIG_NET_VENDOR_SAMSUNG is not set
>> # CONFIG_NET_VENDOR_SEEQ is not set
>> # CONFIG_NET_VENDOR_SOLARFLARE is not set
>> CONFIG_NET_VENDOR_SILAN=3Dy
>> CONFIG_SC92031=3Dm
>> CONFIG_NET_VENDOR_SIS=3Dy
>> # CONFIG_SIS900 is not set
>> # CONFIG_SIS190 is not set
>> CONFIG_NET_VENDOR_SMSC=3Dy
>> CONFIG_PCMCIA_SMC91C92=3Dy
>> # CONFIG_EPIC100 is not set
>> CONFIG_SMSC911X=3Dy
>> # CONFIG_SMSC9420 is not set
>> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
>> # CONFIG_NET_VENDOR_STMICRO is not set
>> # CONFIG_NET_VENDOR_SUN is not set
>> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
>> CONFIG_DWC_XLGMAC=3Dy
>> # CONFIG_DWC_XLGMAC_PCI is not set
>> # CONFIG_NET_VENDOR_TEHUTI is not set
>> # CONFIG_NET_VENDOR_TI is not set
>> CONFIG_NET_VENDOR_VIA=3Dy
>> # CONFIG_VIA_RHINE is not set
>> CONFIG_VIA_VELOCITY=3Dy
>> CONFIG_NET_VENDOR_WIZNET=3Dy
>> # CONFIG_WIZNET_W5100 is not set
>> CONFIG_WIZNET_W5300=3Dm
>> # CONFIG_WIZNET_BUS_DIRECT is not set
>> # CONFIG_WIZNET_BUS_INDIRECT is not set
>> CONFIG_WIZNET_BUS_ANY=3Dy
>> # CONFIG_NET_VENDOR_XIRCOM is not set
>> CONFIG_FDDI=3Dy
>> CONFIG_DEFXX=3Dy
>> # CONFIG_DEFXX_MMIO is not set
>> CONFIG_SKFP=3Dm
>> # CONFIG_HIPPI is not set
>> # CONFIG_NET_SB1000 is not set
>> CONFIG_MDIO_DEVICE=3Dy
>> CONFIG_MDIO_BUS=3Dy
>> CONFIG_MDIO_BCM_UNIMAC=3Dm
>> CONFIG_MDIO_BITBANG=3Dm
>> CONFIG_MDIO_BUS_MUX=3Dm
>> CONFIG_MDIO_BUS_MUX_GPIO=3Dm
>> CONFIG_MDIO_BUS_MUX_MMIOREG=3Dm
>> CONFIG_MDIO_CAVIUM=3Dy
>> CONFIG_MDIO_GPIO=3Dm
>> CONFIG_MDIO_HISI_FEMAC=3Dm
>> # CONFIG_MDIO_MSCC_MIIM is not set
>> # CONFIG_MDIO_OCTEON is not set
>> CONFIG_MDIO_THUNDER=3Dy
>> CONFIG_PHYLIB=3Dy
>> CONFIG_SWPHY=3Dy
>> # CONFIG_LED_TRIGGER_PHY is not set
>>
>> #
>> # MII PHY device drivers
>> #
>> CONFIG_AMD_PHY=3Dm
>> CONFIG_AQUANTIA_PHY=3Dy
>> # CONFIG_ASIX_PHY is not set
>> # CONFIG_AT803X_PHY is not set
>> CONFIG_BCM7XXX_PHY=3Dy
>> # CONFIG_BCM87XX_PHY is not set
>> CONFIG_BCM_NET_PHYLIB=3Dy
>> CONFIG_BROADCOM_PHY=3Dy
>> CONFIG_CICADA_PHY=3Dm
>> CONFIG_CORTINA_PHY=3Dm
>> CONFIG_DAVICOM_PHY=3Dm
>> # CONFIG_DP83822_PHY is not set
>> CONFIG_DP83TC811_PHY=3Dm
>> CONFIG_DP83848_PHY=3Dy
>> # CONFIG_DP83867_PHY is not set
>> CONFIG_FIXED_PHY=3Dy
>> CONFIG_ICPLUS_PHY=3Dy
>> CONFIG_INTEL_XWAY_PHY=3Dy
>> CONFIG_LSI_ET1011C_PHY=3Dy
>> CONFIG_LXT_PHY=3Dm
>> CONFIG_MARVELL_PHY=3Dm
>> # CONFIG_MARVELL_10G_PHY is not set
>> CONFIG_MICREL_PHY=3Dm
>> # CONFIG_MICROCHIP_PHY is not set
>> CONFIG_MICROCHIP_T1_PHY=3Dy
>> CONFIG_MICROSEMI_PHY=3Dy
>> # CONFIG_NATIONAL_PHY is not set
>> # CONFIG_QSEMI_PHY is not set
>> CONFIG_REALTEK_PHY=3Dy
>> CONFIG_RENESAS_PHY=3Dm
>> # CONFIG_ROCKCHIP_PHY is not set
>> CONFIG_SMSC_PHY=3Dm
>> CONFIG_STE10XP=3Dy
>> CONFIG_TERANETICS_PHY=3Dm
>> # CONFIG_VITESSE_PHY is not set
>> CONFIG_XILINX_GMII2RGMII=3Dy
>> CONFIG_PPP=3Dy
>> CONFIG_PPP_BSDCOMP=3Dm
>> CONFIG_PPP_DEFLATE=3Dm
>> # CONFIG_PPP_FILTER is not set
>> CONFIG_PPP_MPPE=3Dm
>> CONFIG_PPP_MULTILINK=3Dy
>> CONFIG_PPPOATM=3Dm
>> # CONFIG_PPPOE is not set
>> # CONFIG_PPP_ASYNC is not set
>> # CONFIG_PPP_SYNC_TTY is not set
>> CONFIG_SLIP=3Dm
>> CONFIG_SLHC=3Dy
>> # CONFIG_SLIP_COMPRESSED is not set
>> CONFIG_SLIP_SMART=3Dy
>> # CONFIG_SLIP_MODE_SLIP6 is not set
>>
>> #
>> # Host-side USB support is needed for USB Network Adapter support
>> #
>> CONFIG_WLAN=3Dy
>> CONFIG_WIRELESS_WDS=3Dy
>> # CONFIG_WLAN_VENDOR_ADMTEK is not set
>> # CONFIG_WLAN_VENDOR_ATH is not set
>> # CONFIG_WLAN_VENDOR_ATMEL is not set
>> # CONFIG_WLAN_VENDOR_BROADCOM is not set
>> CONFIG_WLAN_VENDOR_CISCO=3Dy
>> CONFIG_AIRO_CS=3Dm
>> # CONFIG_WLAN_VENDOR_INTEL is not set
>> # CONFIG_WLAN_VENDOR_INTERSIL is not set
>> # CONFIG_WLAN_VENDOR_MARVELL is not set
>> # CONFIG_WLAN_VENDOR_MEDIATEK is not set
>> # CONFIG_WLAN_VENDOR_RALINK is not set
>> # CONFIG_WLAN_VENDOR_REALTEK is not set
>> # CONFIG_WLAN_VENDOR_RSI is not set
>> CONFIG_WLAN_VENDOR_ST=3Dy
>> # CONFIG_CW1200 is not set
>> # CONFIG_WLAN_VENDOR_TI is not set
>> # CONFIG_WLAN_VENDOR_ZYDAS is not set
>> # CONFIG_WLAN_VENDOR_QUANTENNA is not set
>> CONFIG_PCMCIA_RAYCS=3Dm
>> CONFIG_PCMCIA_WL3501=3Dm
>> CONFIG_MAC80211_HWSIM=3Dm
>> # CONFIG_VIRT_WIFI is not set
>>
>> #
>> # Enable WiMAX (Networking options) to see the WiMAX drivers
>> #
>> CONFIG_WAN=3Dy
>> CONFIG_LANMEDIA=3Dm
>> CONFIG_HDLC=3Dm
>> # CONFIG_HDLC_RAW is not set
>> CONFIG_HDLC_RAW_ETH=3Dm
>> CONFIG_HDLC_CISCO=3Dm
>> # CONFIG_HDLC_FR is not set
>> CONFIG_HDLC_PPP=3Dm
>>
>> #
>> # X.25/LAPB support is disabled
>> #
>> CONFIG_PCI200SYN=3Dm
>> CONFIG_WANXL=3Dm
>> CONFIG_PC300TOO=3Dm
>> # CONFIG_FARSYNC is not set
>> # CONFIG_DSCC4 is not set
>> CONFIG_DLCI=3Dm
>> CONFIG_DLCI_MAX=3D8
>> CONFIG_SBNI=3Dm
>> CONFIG_SBNI_MULTILINE=3Dy
>> # CONFIG_IEEE802154_DRIVERS is not set
>> # CONFIG_VMXNET3 is not set
>> # CONFIG_FUJITSU_ES is not set
>> # CONFIG_THUNDERBOLT_NET is not set
>> CONFIG_NETDEVSIM=3Dm
>> # CONFIG_NET_FAILOVER is not set
>> # CONFIG_ISDN is not set
>>
>> #
>> # Input device support
>> #
>> CONFIG_INPUT=3Dy
>> # CONFIG_INPUT_LEDS is not set
>> CONFIG_INPUT_FF_MEMLESS=3Dm
>> CONFIG_INPUT_POLLDEV=3Dm
>> CONFIG_INPUT_SPARSEKMAP=3Dm
>> CONFIG_INPUT_MATRIXKMAP=3Dm
>>
>> #
>> # Userland interfaces
>> #
>> # CONFIG_INPUT_MOUSEDEV is not set
>> CONFIG_INPUT_JOYDEV=3Dm
>> CONFIG_INPUT_EVDEV=3Dm
>> CONFIG_INPUT_EVBUG=3Dm
>>
>> #
>> # Input Device Drivers
>> #
>> CONFIG_INPUT_KEYBOARD=3Dy
>> # CONFIG_KEYBOARD_ADC is not set
>> # CONFIG_KEYBOARD_ADP5588 is not set
>> # CONFIG_KEYBOARD_ADP5589 is not set
>> CONFIG_KEYBOARD_ATKBD=3Dy
>> # CONFIG_KEYBOARD_QT1070 is not set
>> # CONFIG_KEYBOARD_QT2160 is not set
>> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
>> # CONFIG_KEYBOARD_LKKBD is not set
>> # CONFIG_KEYBOARD_GPIO is not set
>> # CONFIG_KEYBOARD_GPIO_POLLED is not set
>> # CONFIG_KEYBOARD_TCA6416 is not set
>> # CONFIG_KEYBOARD_TCA8418 is not set
>> # CONFIG_KEYBOARD_MATRIX is not set
>> # CONFIG_KEYBOARD_LM8323 is not set
>> # CONFIG_KEYBOARD_LM8333 is not set
>> # CONFIG_KEYBOARD_MAX7359 is not set
>> # CONFIG_KEYBOARD_MCS is not set
>> # CONFIG_KEYBOARD_MPR121 is not set
>> # CONFIG_KEYBOARD_NEWTON is not set
>> # CONFIG_KEYBOARD_OPENCORES is not set
>> # CONFIG_KEYBOARD_SAMSUNG is not set
>> # CONFIG_KEYBOARD_STOWAWAY is not set
>> # CONFIG_KEYBOARD_SUNKBD is not set
>> # CONFIG_KEYBOARD_OMAP4 is not set
>> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
>> # CONFIG_KEYBOARD_XTKBD is not set
>> # CONFIG_KEYBOARD_CROS_EC is not set
>> # CONFIG_KEYBOARD_CAP11XX is not set
>> # CONFIG_KEYBOARD_BCM is not set
>> # CONFIG_KEYBOARD_MTK_PMIC is not set
>> # CONFIG_INPUT_MOUSE is not set
>> # CONFIG_INPUT_JOYSTICK is not set
>> CONFIG_INPUT_TABLET=3Dy
>> # CONFIG_TABLET_USB_ACECAD is not set
>> # CONFIG_TABLET_USB_AIPTEK is not set
>> # CONFIG_TABLET_USB_HANWANG is not set
>> # CONFIG_TABLET_USB_KBTAB is not set
>> # CONFIG_TABLET_USB_PEGASUS is not set
>> # CONFIG_TABLET_SERIAL_WACOM4 is not set
>> CONFIG_INPUT_TOUCHSCREEN=3Dy
>> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
>> CONFIG_TOUCHSCREEN_AD7879=3Dm
>> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dm
>> CONFIG_TOUCHSCREEN_ADC=3Dm
>> # CONFIG_TOUCHSCREEN_AR1021_I2C is not set
>> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm
>> # CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
>> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dm
>> CONFIG_TOUCHSCREEN_BU21013=3Dm
>> CONFIG_TOUCHSCREEN_BU21029=3Dm
>> CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=3Dm
>> # CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
>> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dm
>> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dm
>> CONFIG_TOUCHSCREEN_CYTTSP_I2C=3Dm
>> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dm
>> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dm
>> CONFIG_TOUCHSCREEN_DYNAPRO=3Dm
>> # CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
>> CONFIG_TOUCHSCREEN_EETI=3Dm
>> CONFIG_TOUCHSCREEN_EGALAX=3Dm
>> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dm
>> CONFIG_TOUCHSCREEN_EXC3000=3Dm
>> CONFIG_TOUCHSCREEN_FUJITSU=3Dm
>> # CONFIG_TOUCHSCREEN_GOODIX is not set
>> CONFIG_TOUCHSCREEN_HIDEEP=3Dm
>> CONFIG_TOUCHSCREEN_ILI210X=3Dm
>> # CONFIG_TOUCHSCREEN_S6SY761 is not set
>> CONFIG_TOUCHSCREEN_GUNZE=3Dm
>> CONFIG_TOUCHSCREEN_EKTF2127=3Dm
>> CONFIG_TOUCHSCREEN_ELAN=3Dm
>> # CONFIG_TOUCHSCREEN_ELO is not set
>> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
>> # CONFIG_TOUCHSCREEN_WACOM_I2C is not set
>> CONFIG_TOUCHSCREEN_MAX11801=3Dm
>> # CONFIG_TOUCHSCREEN_MCS5000 is not set
>> # CONFIG_TOUCHSCREEN_MMS114 is not set
>> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dm
>> CONFIG_TOUCHSCREEN_MTOUCH=3Dm
>> # CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
>> CONFIG_TOUCHSCREEN_INEXIO=3Dm
>> # CONFIG_TOUCHSCREEN_MK712 is not set
>> CONFIG_TOUCHSCREEN_PENMOUNT=3Dm
>> # CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
>> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
>> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dm
>> CONFIG_TOUCHSCREEN_PIXCIR=3Dm
>> # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
>> CONFIG_TOUCHSCREEN_WM831X=3Dm
>> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
>> CONFIG_TOUCHSCREEN_MC13783=3Dm
>> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dm
>> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dm
>> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dm
>> CONFIG_TOUCHSCREEN_TSC2004=3Dm
>> CONFIG_TOUCHSCREEN_TSC2007=3Dm
>> # CONFIG_TOUCHSCREEN_TSC2007_IIO is not set
>> # CONFIG_TOUCHSCREEN_RM_TS is not set
>> # CONFIG_TOUCHSCREEN_SILEAD is not set
>> CONFIG_TOUCHSCREEN_SIS_I2C=3Dm
>> # CONFIG_TOUCHSCREEN_ST1232 is not set
>> CONFIG_TOUCHSCREEN_STMFTS=3Dm
>> CONFIG_TOUCHSCREEN_SX8654=3Dm
>> CONFIG_TOUCHSCREEN_TPS6507X=3Dm
>> CONFIG_TOUCHSCREEN_ZET6223=3Dm
>> # CONFIG_TOUCHSCREEN_ZFORCE is not set
>> CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dm
>> # CONFIG_INPUT_MISC is not set
>> CONFIG_RMI4_CORE=3Dm
>> CONFIG_RMI4_I2C=3Dm
>> # CONFIG_RMI4_SMB is not set
>> CONFIG_RMI4_F03=3Dy
>> CONFIG_RMI4_F03_SERIO=3Dm
>> CONFIG_RMI4_2D_SENSOR=3Dy
>> CONFIG_RMI4_F11=3Dy
>> CONFIG_RMI4_F12=3Dy
>> CONFIG_RMI4_F30=3Dy
>> # CONFIG_RMI4_F34 is not set
>> # CONFIG_RMI4_F54 is not set
>> CONFIG_RMI4_F55=3Dy
>>
>> #
>> # Hardware I/O ports
>> #
>> CONFIG_SERIO=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>> CONFIG_SERIO_I8042=3Dy
>> CONFIG_SERIO_SERPORT=3Dm
>> CONFIG_SERIO_CT82C710=3Dm
>> CONFIG_SERIO_PCIPS2=3Dm
>> CONFIG_SERIO_LIBPS2=3Dy
>> CONFIG_SERIO_RAW=3Dm
>> # CONFIG_SERIO_ALTERA_PS2 is not set
>> # CONFIG_SERIO_PS2MULT is not set
>> CONFIG_SERIO_ARC_PS2=3Dm
>> # CONFIG_SERIO_APBPS2 is not set
>> # CONFIG_SERIO_OLPC_APSP is not set
>> CONFIG_SERIO_GPIO_PS2=3Dm
>> CONFIG_USERIO=3Dm
>> # CONFIG_GAMEPORT is not set
>>
>> #
>> # Character devices
>> #
>> CONFIG_TTY=3Dy
>> # CONFIG_VT is not set
>> CONFIG_UNIX98_PTYS=3Dy
>> # CONFIG_LEGACY_PTYS is not set
>> # CONFIG_SERIAL_NONSTANDARD is not set
>> CONFIG_NOZOMI=3Dy
>> CONFIG_N_GSM=3Dm
>> CONFIG_TRACE_ROUTER=3Dm
>> CONFIG_TRACE_SINK=3Dm
>> CONFIG_DEVMEM=3Dy
>> # CONFIG_DEVKMEM is not set
>>
>> #
>> # Serial drivers
>> #
>> CONFIG_SERIAL_EARLYCON=3Dy
>> CONFIG_SERIAL_8250=3Dy
>> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
>> CONFIG_SERIAL_8250_PNP=3Dy
>> CONFIG_SERIAL_8250_FINTEK=3Dy
>> CONFIG_SERIAL_8250_CONSOLE=3Dy
>> CONFIG_SERIAL_8250_DMA=3Dy
>> CONFIG_SERIAL_8250_PCI=3Dm
>> CONFIG_SERIAL_8250_EXAR=3Dm
>> CONFIG_SERIAL_8250_CS=3Dm
>> # CONFIG_SERIAL_8250_MEN_MCB is not set
>> CONFIG_SERIAL_8250_NR_UARTS=3D4
>> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>> CONFIG_SERIAL_8250_EXTENDED=3Dy
>> # CONFIG_SERIAL_8250_MANY_PORTS is not set
>> CONFIG_SERIAL_8250_ASPEED_VUART=3Dm
>> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
>> CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
>> CONFIG_SERIAL_8250_RSA=3Dy
>> CONFIG_SERIAL_8250_DW=3Dm
>> CONFIG_SERIAL_8250_RT288X=3Dy
>> CONFIG_SERIAL_8250_LPSS=3Dm
>> CONFIG_SERIAL_8250_MID=3Dy
>> CONFIG_SERIAL_8250_MOXA=3Dy
>> CONFIG_SERIAL_OF_PLATFORM=3Dm
>>
>> #
>> # Non-8250 serial port support
>> #
>> CONFIG_SERIAL_UARTLITE=3Dm
>> CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
>> CONFIG_SERIAL_CORE=3Dy
>> CONFIG_SERIAL_CORE_CONSOLE=3Dy
>> CONFIG_SERIAL_JSM=3Dm
>> CONFIG_SERIAL_SCCNXP=3Dm
>> CONFIG_SERIAL_SC16IS7XX=3Dm
>> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
>> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
>> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
>> CONFIG_SERIAL_ALTERA_UART=3Dm
>> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
>> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
>> # CONFIG_SERIAL_XILINX_PS_UART is not set
>> # CONFIG_SERIAL_ARC is not set
>> CONFIG_SERIAL_RP2=3Dy
>> CONFIG_SERIAL_RP2_NR_UARTS=3D32
>> # CONFIG_SERIAL_FSL_LPUART is not set
>> CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dy
>> CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=3Dy
>> CONFIG_SERIAL_MEN_Z135=3Dm
>> # CONFIG_SERIAL_DEV_BUS is not set
>> CONFIG_TTY_PRINTK=3Dy
>> CONFIG_TTY_PRINTK_LEVEL=3D6
>> CONFIG_HVC_DRIVER=3Dy
>> CONFIG_VIRTIO_CONSOLE=3Dm
>> CONFIG_IPMI_HANDLER=3Dm
>> CONFIG_IPMI_DMI_DECODE=3Dy
>> CONFIG_IPMI_PANIC_EVENT=3Dy
>> CONFIG_IPMI_PANIC_STRING=3Dy
>> CONFIG_IPMI_DEVICE_INTERFACE=3Dm
>> CONFIG_IPMI_SI=3Dm
>> # CONFIG_IPMI_SSIF is not set
>> # CONFIG_IPMI_WATCHDOG is not set
>> # CONFIG_IPMI_POWEROFF is not set
>> # CONFIG_HW_RANDOM is not set
>> # CONFIG_NVRAM is not set
>> # CONFIG_R3964 is not set
>> # CONFIG_APPLICOM is not set
>>
>> #
>> # PCMCIA character devices
>> #
>> CONFIG_SYNCLINK_CS=3Dm
>> # CONFIG_CARDMAN_4000 is not set
>> CONFIG_CARDMAN_4040=3Dm
>> CONFIG_SCR24X=3Dy
>> CONFIG_IPWIRELESS=3Dy
>> CONFIG_MWAVE=3Dm
>> # CONFIG_HPET is not set
>> # CONFIG_HANGCHECK_TIMER is not set
>> CONFIG_TCG_TPM=3Dy
>> CONFIG_TCG_TIS_CORE=3Dm
>> CONFIG_TCG_TIS=3Dm
>> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
>> # CONFIG_TCG_TIS_I2C_INFINEON is not set
>> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
>> CONFIG_TCG_NSC=3Dy
>> # CONFIG_TCG_ATMEL is not set
>> # CONFIG_TCG_INFINEON is not set
>> # CONFIG_TCG_CRB is not set
>> CONFIG_TCG_VTPM_PROXY=3Dm
>> CONFIG_TCG_TIS_ST33ZP24=3Dy
>> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
>> # CONFIG_TELCLOCK is not set
>> CONFIG_DEVPORT=3Dy
>> CONFIG_XILLYBUS=3Dm
>> CONFIG_XILLYBUS_PCIE=3Dm
>> # CONFIG_XILLYBUS_OF is not set
>> CONFIG_RANDOM_TRUST_CPU=3Dy
>>
>> #
>> # I2C support
>> #
>> CONFIG_I2C=3Dy
>> CONFIG_ACPI_I2C_OPREGION=3Dy
>> CONFIG_I2C_BOARDINFO=3Dy
>> CONFIG_I2C_COMPAT=3Dy
>> CONFIG_I2C_CHARDEV=3Dm
>> CONFIG_I2C_MUX=3Dy
>>
>> #
>> # Multiplexer I2C Chip support
>> #
>> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dm
>> CONFIG_I2C_MUX_GPIO=3Dm
>> CONFIG_I2C_MUX_GPMUX=3Dm
>> CONFIG_I2C_MUX_LTC4306=3Dm
>> CONFIG_I2C_MUX_PCA9541=3Dy
>> CONFIG_I2C_MUX_PCA954x=3Dy
>> CONFIG_I2C_MUX_PINCTRL=3Dy
>> CONFIG_I2C_MUX_REG=3Dy
>> # CONFIG_I2C_DEMUX_PINCTRL is not set
>> CONFIG_I2C_MUX_MLXCPLD=3Dm
>> # CONFIG_I2C_HELPER_AUTO is not set
>> CONFIG_I2C_SMBUS=3Dy
>>
>> #
>> # I2C Algorithms
>> #
>> CONFIG_I2C_ALGOBIT=3Dy
>> CONFIG_I2C_ALGOPCF=3Dy
>> CONFIG_I2C_ALGOPCA=3Dy
>>
>> #
>> # I2C Hardware Bus support
>> #
>>
>> #
>> # PC SMBus host controller drivers
>> #
>> CONFIG_I2C_ALI1535=3Dm
>> CONFIG_I2C_ALI1563=3Dy
>> CONFIG_I2C_ALI15X3=3Dm
>> CONFIG_I2C_AMD756=3Dm
>> CONFIG_I2C_AMD756_S4882=3Dm
>> # CONFIG_I2C_AMD8111 is not set
>> # CONFIG_I2C_I801 is not set
>> CONFIG_I2C_ISCH=3Dm
>> # CONFIG_I2C_ISMT is not set
>> CONFIG_I2C_PIIX4=3Dy
>> CONFIG_I2C_NFORCE2=3Dm
>> # CONFIG_I2C_NFORCE2_S4985 is not set
>> CONFIG_I2C_NVIDIA_GPU=3Dm
>> CONFIG_I2C_SIS5595=3Dy
>> CONFIG_I2C_SIS630=3Dm
>> CONFIG_I2C_SIS96X=3Dy
>> CONFIG_I2C_VIA=3Dy
>> CONFIG_I2C_VIAPRO=3Dm
>>
>> #
>> # ACPI drivers
>> #
>> # CONFIG_I2C_SCMI is not set
>>
>> #
>> # I2C system bus drivers (mostly embedded / system-on-chip)
>> #
>> CONFIG_I2C_CBUS_GPIO=3Dy
>> CONFIG_I2C_DESIGNWARE_CORE=3Dm
>> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
>> CONFIG_I2C_DESIGNWARE_PCI=3Dm
>> # CONFIG_I2C_EMEV2 is not set
>> CONFIG_I2C_GPIO=3Dy
>> CONFIG_I2C_GPIO_FAULT_INJECTOR=3Dy
>> CONFIG_I2C_KEMPLD=3Dm
>> CONFIG_I2C_OCORES=3Dm
>> CONFIG_I2C_PCA_PLATFORM=3Dy
>> # CONFIG_I2C_RK3X is not set
>> # CONFIG_I2C_SIMTEC is not set
>> CONFIG_I2C_XILINX=3Dm
>>
>> #
>> # External I2C/SMBus adapter drivers
>> #
>> CONFIG_I2C_PARPORT_LIGHT=3Dm
>> CONFIG_I2C_TAOS_EVM=3Dm
>>
>> #
>> # Other I2C/SMBus bus drivers
>> #
>> CONFIG_I2C_MLXCPLD=3Dm
>> CONFIG_I2C_CROS_EC_TUNNEL=3Dm
>> # CONFIG_I2C_FSI is not set
>> # CONFIG_I2C_STUB is not set
>> CONFIG_I2C_SLAVE=3Dy
>> CONFIG_I2C_SLAVE_EEPROM=3Dm
>> # CONFIG_I2C_DEBUG_CORE is not set
>> # CONFIG_I2C_DEBUG_ALGO is not set
>> # CONFIG_I2C_DEBUG_BUS is not set
>> # CONFIG_I3C is not set
>> # CONFIG_SPI is not set
>> # CONFIG_SPMI is not set
>> CONFIG_HSI=3Dy
>> CONFIG_HSI_BOARDINFO=3Dy
>>
>> #
>> # HSI controllers
>> #
>>
>> #
>> # HSI clients
>> #
>> CONFIG_HSI_CHAR=3Dm
>> CONFIG_PPS=3Dy
>> # CONFIG_PPS_DEBUG is not set
>>
>> #
>> # PPS clients support
>> #
>> CONFIG_PPS_CLIENT_KTIMER=3Dy
>> CONFIG_PPS_CLIENT_LDISC=3Dm
>> # CONFIG_PPS_CLIENT_GPIO is not set
>>
>> #
>> # PPS generators support
>> #
>>
>> #
>> # PTP clock support
>> #
>> CONFIG_PTP_1588_CLOCK=3Dy
>>
>> #
>> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clock=
s.
>> #
>> CONFIG_PTP_1588_CLOCK_KVM=3Dy
>> CONFIG_PINCTRL=3Dy
>> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
>> CONFIG_PINMUX=3Dy
>> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
>> CONFIG_PINCONF=3Dy
>> CONFIG_GENERIC_PINCONF=3Dy
>> # CONFIG_DEBUG_PINCTRL is not set
>> # CONFIG_PINCTRL_AS3722 is not set
>> CONFIG_PINCTRL_AXP209=3Dm
>> CONFIG_PINCTRL_AMD=3Dm
>> CONFIG_PINCTRL_MCP23S08=3Dy
>> CONFIG_PINCTRL_SINGLE=3Dy
>> # CONFIG_PINCTRL_SX150X is not set
>> CONFIG_PINCTRL_RK805=3Dm
>> # CONFIG_PINCTRL_OCELOT is not set
>> # CONFIG_PINCTRL_BAYTRAIL is not set
>> # CONFIG_PINCTRL_CHERRYVIEW is not set
>> # CONFIG_PINCTRL_BROXTON is not set
>> # CONFIG_PINCTRL_CANNONLAKE is not set
>> # CONFIG_PINCTRL_CEDARFORK is not set
>> # CONFIG_PINCTRL_DENVERTON is not set
>> # CONFIG_PINCTRL_GEMINILAKE is not set
>> # CONFIG_PINCTRL_ICELAKE is not set
>> # CONFIG_PINCTRL_LEWISBURG is not set
>> # CONFIG_PINCTRL_SUNRISEPOINT is not set
>> CONFIG_PINCTRL_MADERA=3Dy
>> CONFIG_PINCTRL_CS47L85=3Dy
>> CONFIG_PINCTRL_CS47L90=3Dy
>> CONFIG_GPIOLIB=3Dy
>> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
>> CONFIG_OF_GPIO=3Dy
>> CONFIG_GPIO_ACPI=3Dy
>> CONFIG_GPIOLIB_IRQCHIP=3Dy
>> # CONFIG_DEBUG_GPIO is not set
>> CONFIG_GPIO_SYSFS=3Dy
>> CONFIG_GPIO_GENERIC=3Dy
>> CONFIG_GPIO_MAX730X=3Dm
>>
>> #
>> # Memory mapped GPIO drivers
>> #
>> # CONFIG_GPIO_74XX_MMIO is not set
>> CONFIG_GPIO_ALTERA=3Dm
>> # CONFIG_GPIO_AMDPT is not set
>> # CONFIG_GPIO_CADENCE is not set
>> # CONFIG_GPIO_DWAPB is not set
>> CONFIG_GPIO_EXAR=3Dm
>> CONFIG_GPIO_FTGPIO010=3Dy
>> CONFIG_GPIO_GENERIC_PLATFORM=3Dm
>> CONFIG_GPIO_GRGPIO=3Dm
>> CONFIG_GPIO_HLWD=3Dy
>> CONFIG_GPIO_ICH=3Dm
>> # CONFIG_GPIO_LYNXPOINT is not set
>> CONFIG_GPIO_MB86S7X=3Dy
>> CONFIG_GPIO_MENZ127=3Dm
>> CONFIG_GPIO_MOCKUP=3Dm
>> # CONFIG_GPIO_SAMA5D2_PIOBU is not set
>> CONFIG_GPIO_SIOX=3Dm
>> CONFIG_GPIO_SYSCON=3Dy
>> CONFIG_GPIO_VX855=3Dy
>> CONFIG_GPIO_XILINX=3Dy
>>
>> #
>> # Port-mapped I/O GPIO drivers
>> #
>> # CONFIG_GPIO_F7188X is not set
>> CONFIG_GPIO_IT87=3Dy
>> # CONFIG_GPIO_SCH is not set
>> CONFIG_GPIO_SCH311X=3Dm
>> CONFIG_GPIO_WINBOND=3Dy
>> # CONFIG_GPIO_WS16C48 is not set
>>
>> #
>> # I2C GPIO expanders
>> #
>> # CONFIG_GPIO_ADP5588 is not set
>> CONFIG_GPIO_ADNP=3Dy
>> CONFIG_GPIO_MAX7300=3Dm
>> CONFIG_GPIO_MAX732X=3Dy
>> CONFIG_GPIO_MAX732X_IRQ=3Dy
>> # CONFIG_GPIO_PCA953X is not set
>> CONFIG_GPIO_PCF857X=3Dy
>> # CONFIG_GPIO_TPIC2810 is not set
>>
>> #
>> # MFD GPIO expanders
>> #
>> CONFIG_GPIO_ARIZONA=3Dy
>> CONFIG_GPIO_BD9571MWV=3Dy
>> CONFIG_GPIO_JANZ_TTL=3Dm
>> CONFIG_GPIO_KEMPLD=3Dy
>> # CONFIG_GPIO_LP3943 is not set
>> CONFIG_GPIO_MADERA=3Dy
>> # CONFIG_GPIO_RC5T583 is not set
>> CONFIG_GPIO_TPS65086=3Dm
>> CONFIG_GPIO_TPS65218=3Dm
>> CONFIG_GPIO_TPS6586X=3Dy
>> # CONFIG_GPIO_TPS65912 is not set
>> CONFIG_GPIO_TWL6040=3Dm
>> CONFIG_GPIO_WM831X=3Dy
>> CONFIG_GPIO_WM8994=3Dm
>>
>> #
>> # PCI GPIO expanders
>> #
>> CONFIG_GPIO_AMD8111=3Dm
>> CONFIG_GPIO_BT8XX=3Dy
>> CONFIG_GPIO_ML_IOH=3Dm
>> # CONFIG_GPIO_PCI_IDIO_16 is not set
>> CONFIG_GPIO_PCIE_IDIO_24=3Dy
>> CONFIG_GPIO_RDC321X=3Dm
>> # CONFIG_GPIO_SODAVILLE is not set
>> CONFIG_W1=3Dy
>>
>> #
>> # 1-wire Bus Masters
>> #
>> CONFIG_W1_MASTER_MATROX=3Dy
>> # CONFIG_W1_MASTER_DS2482 is not set
>> CONFIG_W1_MASTER_DS1WM=3Dm
>> CONFIG_W1_MASTER_GPIO=3Dy
>>
>> #
>> # 1-wire Slaves
>> #
>> # CONFIG_W1_SLAVE_THERM is not set
>> CONFIG_W1_SLAVE_SMEM=3Dm
>> CONFIG_W1_SLAVE_DS2405=3Dy
>> CONFIG_W1_SLAVE_DS2408=3Dy
>> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
>> CONFIG_W1_SLAVE_DS2413=3Dy
>> # CONFIG_W1_SLAVE_DS2406 is not set
>> CONFIG_W1_SLAVE_DS2423=3Dy
>> CONFIG_W1_SLAVE_DS2805=3Dy
>> CONFIG_W1_SLAVE_DS2431=3Dy
>> CONFIG_W1_SLAVE_DS2433=3Dy
>> # CONFIG_W1_SLAVE_DS2433_CRC is not set
>> # CONFIG_W1_SLAVE_DS2438 is not set
>> CONFIG_W1_SLAVE_DS2780=3Dy
>> CONFIG_W1_SLAVE_DS2781=3Dm
>> # CONFIG_W1_SLAVE_DS28E04 is not set
>> CONFIG_W1_SLAVE_DS28E17=3Dm
>> CONFIG_POWER_AVS=3Dy
>> CONFIG_POWER_RESET=3Dy
>> CONFIG_POWER_RESET_AS3722=3Dy
>> CONFIG_POWER_RESET_GPIO=3Dy
>> # CONFIG_POWER_RESET_GPIO_RESTART is not set
>> # CONFIG_POWER_RESET_LTC2952 is not set
>> CONFIG_POWER_RESET_RESTART=3Dy
>> # CONFIG_POWER_RESET_SYSCON is not set
>> CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
>> # CONFIG_SYSCON_REBOOT_MODE is not set
>> CONFIG_POWER_SUPPLY=3Dy
>> # CONFIG_POWER_SUPPLY_DEBUG is not set
>> CONFIG_PDA_POWER=3Dy
>> # CONFIG_GENERIC_ADC_BATTERY is not set
>> # CONFIG_MAX8925_POWER is not set
>> CONFIG_WM831X_BACKUP=3Dy
>> CONFIG_WM831X_POWER=3Dm
>> # CONFIG_TEST_POWER is not set
>> CONFIG_CHARGER_ADP5061=3Dy
>> CONFIG_BATTERY_ACT8945A=3Dm
>> CONFIG_BATTERY_DS2760=3Dy
>> CONFIG_BATTERY_DS2780=3Dy
>> CONFIG_BATTERY_DS2781=3Dm
>> CONFIG_BATTERY_DS2782=3Dm
>> # CONFIG_BATTERY_LEGO_EV3 is not set
>> # CONFIG_BATTERY_SBS is not set
>> # CONFIG_CHARGER_SBS is not set
>> CONFIG_MANAGER_SBS=3Dy
>> CONFIG_BATTERY_BQ27XXX=3Dm
>> CONFIG_BATTERY_BQ27XXX_I2C=3Dm
>> CONFIG_BATTERY_BQ27XXX_HDQ=3Dm
>> CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=3Dy
>> CONFIG_BATTERY_DA9150=3Dm
>> # CONFIG_CHARGER_AXP20X is not set
>> CONFIG_BATTERY_AXP20X=3Dy
>> CONFIG_AXP20X_POWER=3Dm
>> CONFIG_AXP288_FUEL_GAUGE=3Dm
>> CONFIG_BATTERY_MAX17040=3Dy
>> CONFIG_BATTERY_MAX17042=3Dy
>> CONFIG_BATTERY_MAX1721X=3Dm
>> CONFIG_CHARGER_PCF50633=3Dm
>> # CONFIG_CHARGER_MAX8903 is not set
>> CONFIG_CHARGER_LP8727=3Dm
>> CONFIG_CHARGER_LP8788=3Dm
>> CONFIG_CHARGER_GPIO=3Dm
>> # CONFIG_CHARGER_MANAGER is not set
>> CONFIG_CHARGER_LTC3651=3Dy
>> CONFIG_CHARGER_DETECTOR_MAX14656=3Dm
>> CONFIG_CHARGER_MAX8997=3Dm
>> # CONFIG_CHARGER_BQ2415X is not set
>> CONFIG_CHARGER_BQ24190=3Dm
>> # CONFIG_CHARGER_BQ24257 is not set
>> CONFIG_CHARGER_BQ24735=3Dm
>> CONFIG_CHARGER_BQ25890=3Dm
>> CONFIG_CHARGER_SMB347=3Dm
>> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
>> # CONFIG_BATTERY_RT5033 is not set
>> CONFIG_CHARGER_RT9455=3Dy
>> CONFIG_CHARGER_CROS_USBPD=3Dm
>> CONFIG_HWMON=3Dy
>> CONFIG_HWMON_VID=3Dy
>> CONFIG_HWMON_DEBUG_CHIP=3Dy
>>
>> #
>> # Native drivers
>> #
>> CONFIG_SENSORS_ABITUGURU=3Dy
>> CONFIG_SENSORS_ABITUGURU3=3Dm
>> CONFIG_SENSORS_AD7414=3Dm
>> CONFIG_SENSORS_AD7418=3Dm
>> # CONFIG_SENSORS_ADM1021 is not set
>> CONFIG_SENSORS_ADM1025=3Dm
>> CONFIG_SENSORS_ADM1026=3Dm
>> CONFIG_SENSORS_ADM1029=3Dm
>> CONFIG_SENSORS_ADM1031=3Dy
>> CONFIG_SENSORS_ADM9240=3Dm
>> CONFIG_SENSORS_ADT7X10=3Dm
>> CONFIG_SENSORS_ADT7410=3Dm
>> CONFIG_SENSORS_ADT7411=3Dm
>> # CONFIG_SENSORS_ADT7462 is not set
>> CONFIG_SENSORS_ADT7470=3Dm
>> CONFIG_SENSORS_ADT7475=3Dm
>> CONFIG_SENSORS_ASC7621=3Dm
>> # CONFIG_SENSORS_K8TEMP is not set
>> CONFIG_SENSORS_APPLESMC=3Dm
>> CONFIG_SENSORS_ASB100=3Dy
>> CONFIG_SENSORS_ASPEED=3Dm
>> # CONFIG_SENSORS_ATXP1 is not set
>> CONFIG_SENSORS_DS620=3Dy
>> # CONFIG_SENSORS_DS1621 is not set
>> CONFIG_SENSORS_DELL_SMM=3Dm
>> CONFIG_SENSORS_I5K_AMB=3Dy
>> # CONFIG_SENSORS_F71805F is not set
>> CONFIG_SENSORS_F71882FG=3Dy
>> CONFIG_SENSORS_F75375S=3Dm
>> CONFIG_SENSORS_MC13783_ADC=3Dm
>> # CONFIG_SENSORS_FSCHMD is not set
>> CONFIG_SENSORS_FTSTEUTATES=3Dm
>> # CONFIG_SENSORS_GL518SM is not set
>> # CONFIG_SENSORS_GL520SM is not set
>> CONFIG_SENSORS_G760A=3Dm
>> CONFIG_SENSORS_G762=3Dy
>> CONFIG_SENSORS_GPIO_FAN=3Dm
>> CONFIG_SENSORS_HIH6130=3Dy
>> CONFIG_SENSORS_IBMAEM=3Dm
>> CONFIG_SENSORS_IBMPEX=3Dm
>> # CONFIG_SENSORS_IIO_HWMON is not set
>> # CONFIG_SENSORS_I5500 is not set
>> CONFIG_SENSORS_CORETEMP=3Dm
>> # CONFIG_SENSORS_IT87 is not set
>> CONFIG_SENSORS_JC42=3Dm
>> # CONFIG_SENSORS_POWR1220 is not set
>> CONFIG_SENSORS_LINEAGE=3Dm
>> CONFIG_SENSORS_LTC2945=3Dy
>> CONFIG_SENSORS_LTC2990=3Dm
>> # CONFIG_SENSORS_LTC4151 is not set
>> # CONFIG_SENSORS_LTC4215 is not set
>> CONFIG_SENSORS_LTC4222=3Dy
>> CONFIG_SENSORS_LTC4245=3Dy
>> CONFIG_SENSORS_LTC4260=3Dm
>> CONFIG_SENSORS_LTC4261=3Dm
>> CONFIG_SENSORS_MAX16065=3Dm
>> # CONFIG_SENSORS_MAX1619 is not set
>> # CONFIG_SENSORS_MAX1668 is not set
>> CONFIG_SENSORS_MAX197=3Dm
>> # CONFIG_SENSORS_MAX6621 is not set
>> CONFIG_SENSORS_MAX6639=3Dm
>> CONFIG_SENSORS_MAX6642=3Dm
>> CONFIG_SENSORS_MAX6650=3Dm
>> CONFIG_SENSORS_MAX6697=3Dm
>> CONFIG_SENSORS_MAX31790=3Dy
>> # CONFIG_SENSORS_MCP3021 is not set
>> CONFIG_SENSORS_TC654=3Dy
>> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
>> CONFIG_SENSORS_LM63=3Dy
>> CONFIG_SENSORS_LM73=3Dm
>> CONFIG_SENSORS_LM75=3Dm
>> CONFIG_SENSORS_LM77=3Dm
>> CONFIG_SENSORS_LM78=3Dy
>> # CONFIG_SENSORS_LM80 is not set
>> CONFIG_SENSORS_LM83=3Dy
>> CONFIG_SENSORS_LM85=3Dy
>> # CONFIG_SENSORS_LM87 is not set
>> CONFIG_SENSORS_LM90=3Dy
>> CONFIG_SENSORS_LM92=3Dm
>> CONFIG_SENSORS_LM93=3Dy
>> CONFIG_SENSORS_LM95234=3Dm
>> # CONFIG_SENSORS_LM95241 is not set
>> # CONFIG_SENSORS_LM95245 is not set
>> CONFIG_SENSORS_PC87360=3Dy
>> CONFIG_SENSORS_PC87427=3Dy
>> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
>> # CONFIG_SENSORS_NCT6683 is not set
>> CONFIG_SENSORS_NCT6775=3Dy
>> CONFIG_SENSORS_NCT7802=3Dy
>> CONFIG_SENSORS_NCT7904=3Dy
>> # CONFIG_SENSORS_NPCM7XX is not set
>> # CONFIG_SENSORS_OCC_P8_I2C is not set
>> CONFIG_SENSORS_OCC_P9_SBE=3Dm
>> CONFIG_SENSORS_OCC=3Dy
>> CONFIG_SENSORS_PCF8591=3Dm
>> # CONFIG_PMBUS is not set
>> CONFIG_SENSORS_PWM_FAN=3Dy
>> CONFIG_SENSORS_SHT15=3Dm
>> CONFIG_SENSORS_SHT21=3Dy
>> # CONFIG_SENSORS_SHT3x is not set
>> CONFIG_SENSORS_SHTC1=3Dm
>> CONFIG_SENSORS_SIS5595=3Dm
>> CONFIG_SENSORS_DME1737=3Dy
>> # CONFIG_SENSORS_EMC1403 is not set
>> # CONFIG_SENSORS_EMC2103 is not set
>> CONFIG_SENSORS_EMC6W201=3Dm
>> CONFIG_SENSORS_SMSC47M1=3Dy
>> CONFIG_SENSORS_SMSC47M192=3Dy
>> CONFIG_SENSORS_SMSC47B397=3Dy
>> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
>> CONFIG_SENSORS_SCH5627=3Dy
>> CONFIG_SENSORS_SCH5636=3Dy
>> CONFIG_SENSORS_STTS751=3Dm
>> CONFIG_SENSORS_SMM665=3Dy
>> CONFIG_SENSORS_ADC128D818=3Dm
>> # CONFIG_SENSORS_ADS1015 is not set
>> CONFIG_SENSORS_ADS7828=3Dm
>> # CONFIG_SENSORS_AMC6821 is not set
>> CONFIG_SENSORS_INA209=3Dy
>> # CONFIG_SENSORS_INA2XX is not set
>> # CONFIG_SENSORS_INA3221 is not set
>> CONFIG_SENSORS_TC74=3Dm
>> CONFIG_SENSORS_THMC50=3Dm
>> CONFIG_SENSORS_TMP102=3Dy
>> # CONFIG_SENSORS_TMP103 is not set
>> CONFIG_SENSORS_TMP108=3Dy
>> # CONFIG_SENSORS_TMP401 is not set
>> CONFIG_SENSORS_TMP421=3Dm
>> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
>> # CONFIG_SENSORS_VIA686A is not set
>> # CONFIG_SENSORS_VT1211 is not set
>> # CONFIG_SENSORS_VT8231 is not set
>> CONFIG_SENSORS_W83773G=3Dy
>> CONFIG_SENSORS_W83781D=3Dm
>> CONFIG_SENSORS_W83791D=3Dy
>> CONFIG_SENSORS_W83792D=3Dm
>> CONFIG_SENSORS_W83793=3Dm
>> CONFIG_SENSORS_W83795=3Dy
>> # CONFIG_SENSORS_W83795_FANCTRL is not set
>> # CONFIG_SENSORS_W83L785TS is not set
>> CONFIG_SENSORS_W83L786NG=3Dy
>> CONFIG_SENSORS_W83627HF=3Dm
>> # CONFIG_SENSORS_W83627EHF is not set
>> # CONFIG_SENSORS_WM831X is not set
>>
>> #
>> # ACPI drivers
>> #
>> # CONFIG_SENSORS_ACPI_POWER is not set
>> # CONFIG_SENSORS_ATK0110 is not set
>> CONFIG_THERMAL=3Dy
>> # CONFIG_THERMAL_STATISTICS is not set
>> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
>> CONFIG_THERMAL_HWMON=3Dy
>> CONFIG_THERMAL_OF=3Dy
>> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
>> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
>> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
>> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
>> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
>> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
>> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
>> # CONFIG_THERMAL_GOV_BANG_BANG is not set
>> # CONFIG_THERMAL_GOV_USER_SPACE is not set
>> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
>> # CONFIG_THERMAL_EMULATION is not set
>> # CONFIG_QORIQ_THERMAL is not set
>> # CONFIG_DA9062_THERMAL is not set
>>
>> #
>> # Intel thermal drivers
>> #
>> # CONFIG_INTEL_POWERCLAMP is not set
>> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
>>
>> #
>> # ACPI INT340X thermal drivers
>> #
>> # CONFIG_INT340X_THERMAL is not set
>> # CONFIG_INTEL_PCH_THERMAL is not set
>> # CONFIG_GENERIC_ADC_THERMAL is not set
>> CONFIG_WATCHDOG=3Dy
>> CONFIG_WATCHDOG_CORE=3Dy
>> # CONFIG_WATCHDOG_NOWAYOUT is not set
>> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
>> CONFIG_WATCHDOG_SYSFS=3Dy
>>
>> #
>> # Watchdog Device Drivers
>> #
>> CONFIG_SOFT_WATCHDOG=3Dm
>> # CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
>> # CONFIG_DA9063_WATCHDOG is not set
>> CONFIG_DA9062_WATCHDOG=3Dm
>> CONFIG_GPIO_WATCHDOG=3Dm
>> CONFIG_MENF21BMC_WATCHDOG=3Dm
>> # CONFIG_MENZ069_WATCHDOG is not set
>> # CONFIG_WDAT_WDT is not set
>> CONFIG_WM831X_WATCHDOG=3Dy
>> # CONFIG_XILINX_WATCHDOG is not set
>> CONFIG_ZIIRAVE_WATCHDOG=3Dm
>> CONFIG_CADENCE_WATCHDOG=3Dm
>> CONFIG_DW_WATCHDOG=3Dm
>> # CONFIG_RN5T618_WATCHDOG is not set
>> CONFIG_MAX63XX_WATCHDOG=3Dm
>> CONFIG_ACQUIRE_WDT=3Dm
>> CONFIG_ADVANTECH_WDT=3Dy
>> CONFIG_ALIM1535_WDT=3Dy
>> CONFIG_ALIM7101_WDT=3Dy
>> # CONFIG_EBC_C384_WDT is not set
>> CONFIG_F71808E_WDT=3Dm
>> CONFIG_SP5100_TCO=3Dy
>> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
>> # CONFIG_EUROTECH_WDT is not set
>> CONFIG_IB700_WDT=3Dy
>> CONFIG_IBMASR=3Dy
>> CONFIG_WAFER_WDT=3Dy
>> CONFIG_I6300ESB_WDT=3Dy
>> CONFIG_IE6XX_WDT=3Dy
>> CONFIG_ITCO_WDT=3Dy
>> # CONFIG_ITCO_VENDOR_SUPPORT is not set
>> CONFIG_IT8712F_WDT=3Dy
>> CONFIG_IT87_WDT=3Dm
>> CONFIG_HP_WATCHDOG=3Dm
>> CONFIG_KEMPLD_WDT=3Dm
>> # CONFIG_HPWDT_NMI_DECODING is not set
>> CONFIG_SC1200_WDT=3Dm
>> # CONFIG_PC87413_WDT is not set
>> CONFIG_NV_TCO=3Dm
>> CONFIG_60XX_WDT=3Dm
>> # CONFIG_CPU5_WDT is not set
>> # CONFIG_SMSC_SCH311X_WDT is not set
>> CONFIG_SMSC37B787_WDT=3Dm
>> CONFIG_TQMX86_WDT=3Dy
>> CONFIG_VIA_WDT=3Dy
>> CONFIG_W83627HF_WDT=3Dm
>> CONFIG_W83877F_WDT=3Dy
>> CONFIG_W83977F_WDT=3Dy
>> CONFIG_MACHZ_WDT=3Dm
>> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
>> CONFIG_INTEL_MEI_WDT=3Dy
>> # CONFIG_NI903X_WDT is not set
>> # CONFIG_NIC7018_WDT is not set
>> CONFIG_MEN_A21_WDT=3Dm
>>
>> #
>> # PCI-based Watchdog Cards
>> #
>> CONFIG_PCIPCWATCHDOG=3Dy
>> CONFIG_WDTPCI=3Dy
>>
>> #
>> # Watchdog Pretimeout Governors
>> #
>> CONFIG_WATCHDOG_PRETIMEOUT_GOV=3Dy
>> # CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP is not set
>> CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=3Dy
>> CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=3Dm
>> CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dy
>> CONFIG_SSB_POSSIBLE=3Dy
>> # CONFIG_SSB is not set
>> CONFIG_BCMA_POSSIBLE=3Dy
>> CONFIG_BCMA=3Dy
>> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
>> CONFIG_BCMA_HOST_PCI=3Dy
>> CONFIG_BCMA_HOST_SOC=3Dy
>> CONFIG_BCMA_DRIVER_PCI=3Dy
>> CONFIG_BCMA_SFLASH=3Dy
>> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
>> CONFIG_BCMA_DRIVER_GPIO=3Dy
>> # CONFIG_BCMA_DEBUG is not set
>>
>> #
>> # Multifunction device drivers
>> #
>> CONFIG_MFD_CORE=3Dy
>> CONFIG_MFD_ACT8945A=3Dy
>> CONFIG_MFD_AS3711=3Dy
>> CONFIG_MFD_AS3722=3Dm
>> # CONFIG_PMIC_ADP5520 is not set
>> CONFIG_MFD_AAT2870_CORE=3Dy
>> CONFIG_MFD_ATMEL_FLEXCOM=3Dm
>> # CONFIG_MFD_ATMEL_HLCDC is not set
>> # CONFIG_MFD_BCM590XX is not set
>> CONFIG_MFD_BD9571MWV=3Dy
>> CONFIG_MFD_AXP20X=3Dy
>> CONFIG_MFD_AXP20X_I2C=3Dy
>> CONFIG_MFD_CROS_EC=3Dm
>> CONFIG_MFD_CROS_EC_CHARDEV=3Dm
>> CONFIG_MFD_MADERA=3Dy
>> CONFIG_MFD_MADERA_I2C=3Dy
>> # CONFIG_MFD_CS47L35 is not set
>> CONFIG_MFD_CS47L85=3Dy
>> CONFIG_MFD_CS47L90=3Dy
>> # CONFIG_PMIC_DA903X is not set
>> # CONFIG_MFD_DA9052_I2C is not set
>> # CONFIG_MFD_DA9055 is not set
>> CONFIG_MFD_DA9062=3Dm
>> CONFIG_MFD_DA9063=3Dm
>> CONFIG_MFD_DA9150=3Dy
>> CONFIG_MFD_MC13XXX=3Dm
>> CONFIG_MFD_MC13XXX_I2C=3Dm
>> CONFIG_MFD_HI6421_PMIC=3Dy
>> # CONFIG_HTC_PASIC3 is not set
>> # CONFIG_HTC_I2CPLD is not set
>> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dm
>> CONFIG_LPC_ICH=3Dy
>> CONFIG_LPC_SCH=3Dy
>> # CONFIG_INTEL_SOC_PMIC is not set
>> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
>> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
>> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
>> # CONFIG_MFD_INTEL_LPSS_PCI is not set
>> CONFIG_MFD_JANZ_CMODIO=3Dm
>> CONFIG_MFD_KEMPLD=3Dy
>> CONFIG_MFD_88PM800=3Dy
>> CONFIG_MFD_88PM805=3Dy
>> # CONFIG_MFD_88PM860X is not set
>> # CONFIG_MFD_MAX14577 is not set
>> # CONFIG_MFD_MAX77620 is not set
>> CONFIG_MFD_MAX77686=3Dy
>> # CONFIG_MFD_MAX77693 is not set
>> CONFIG_MFD_MAX77843=3Dy
>> CONFIG_MFD_MAX8907=3Dm
>> CONFIG_MFD_MAX8925=3Dy
>> CONFIG_MFD_MAX8997=3Dy
>> # CONFIG_MFD_MAX8998 is not set
>> CONFIG_MFD_MT6397=3Dy
>> CONFIG_MFD_MENF21BMC=3Dm
>> # CONFIG_MFD_RETU is not set
>> CONFIG_MFD_PCF50633=3Dy
>> CONFIG_PCF50633_ADC=3Dm
>> CONFIG_PCF50633_GPIO=3Dy
>> CONFIG_MFD_RDC321X=3Dm
>> CONFIG_MFD_RT5033=3Dm
>> CONFIG_MFD_RC5T583=3Dy
>> CONFIG_MFD_RK808=3Dm
>> CONFIG_MFD_RN5T618=3Dm
>> CONFIG_MFD_SEC_CORE=3Dm
>> CONFIG_MFD_SI476X_CORE=3Dy
>> CONFIG_MFD_SM501=3Dm
>> CONFIG_MFD_SM501_GPIO=3Dy
>> CONFIG_MFD_SKY81452=3Dy
>> # CONFIG_MFD_SMSC is not set
>> # CONFIG_ABX500_CORE is not set
>> # CONFIG_MFD_STMPE is not set
>> CONFIG_MFD_SYSCON=3Dy
>> # CONFIG_MFD_TI_AM335X_TSCADC is not set
>> CONFIG_MFD_LP3943=3Dy
>> CONFIG_MFD_LP8788=3Dy
>> # CONFIG_MFD_TI_LMU is not set
>> # CONFIG_MFD_PALMAS is not set
>> CONFIG_TPS6105X=3Dy
>> # CONFIG_TPS65010 is not set
>> # CONFIG_TPS6507X is not set
>> CONFIG_MFD_TPS65086=3Dm
>> # CONFIG_MFD_TPS65090 is not set
>> # CONFIG_MFD_TPS65217 is not set
>> # CONFIG_MFD_TPS68470 is not set
>> # CONFIG_MFD_TI_LP873X is not set
>> # CONFIG_MFD_TI_LP87565 is not set
>> CONFIG_MFD_TPS65218=3Dm
>> CONFIG_MFD_TPS6586X=3Dy
>> # CONFIG_MFD_TPS65910 is not set
>> CONFIG_MFD_TPS65912=3Dm
>> CONFIG_MFD_TPS65912_I2C=3Dm
>> # CONFIG_MFD_TPS80031 is not set
>> # CONFIG_TWL4030_CORE is not set
>> CONFIG_TWL6040_CORE=3Dy
>> CONFIG_MFD_WL1273_CORE=3Dy
>> # CONFIG_MFD_LM3533 is not set
>> # CONFIG_MFD_TC3589X is not set
>> CONFIG_MFD_VX855=3Dy
>> CONFIG_MFD_ARIZONA=3Dy
>> CONFIG_MFD_ARIZONA_I2C=3Dm
>> CONFIG_MFD_CS47L24=3Dy
>> CONFIG_MFD_WM5102=3Dy
>> CONFIG_MFD_WM5110=3Dy
>> # CONFIG_MFD_WM8997 is not set
>> CONFIG_MFD_WM8998=3Dy
>> CONFIG_MFD_WM8400=3Dy
>> CONFIG_MFD_WM831X=3Dy
>> CONFIG_MFD_WM831X_I2C=3Dy
>> # CONFIG_MFD_WM8350_I2C is not set
>> CONFIG_MFD_WM8994=3Dm
>> # CONFIG_MFD_ROHM_BD718XX is not set
>> CONFIG_REGULATOR=3Dy
>> CONFIG_REGULATOR_DEBUG=3Dy
>> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
>> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dm
>> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
>> CONFIG_REGULATOR_88PG86X=3Dm
>> CONFIG_REGULATOR_88PM800=3Dm
>> CONFIG_REGULATOR_ACT8865=3Dy
>> CONFIG_REGULATOR_ACT8945A=3Dm
>> # CONFIG_REGULATOR_AD5398 is not set
>> CONFIG_REGULATOR_ANATOP=3Dy
>> CONFIG_REGULATOR_AAT2870=3Dy
>> CONFIG_REGULATOR_AS3711=3Dy
>> CONFIG_REGULATOR_AS3722=3Dm
>> # CONFIG_REGULATOR_AXP20X is not set
>> CONFIG_REGULATOR_BD9571MWV=3Dm
>> CONFIG_REGULATOR_DA9062=3Dm
>> # CONFIG_REGULATOR_DA9063 is not set
>> CONFIG_REGULATOR_DA9210=3Dm
>> # CONFIG_REGULATOR_DA9211 is not set
>> # CONFIG_REGULATOR_FAN53555 is not set
>> CONFIG_REGULATOR_GPIO=3Dy
>> # CONFIG_REGULATOR_HI6421 is not set
>> # CONFIG_REGULATOR_HI6421V530 is not set
>> # CONFIG_REGULATOR_ISL9305 is not set
>> # CONFIG_REGULATOR_ISL6271A is not set
>> CONFIG_REGULATOR_LP3971=3Dm
>> CONFIG_REGULATOR_LP3972=3Dy
>> CONFIG_REGULATOR_LP872X=3Dm
>> CONFIG_REGULATOR_LP8755=3Dy
>> CONFIG_REGULATOR_LP8788=3Dm
>> # CONFIG_REGULATOR_LTC3589 is not set
>> CONFIG_REGULATOR_LTC3676=3Dy
>> # CONFIG_REGULATOR_MAX1586 is not set
>> # CONFIG_REGULATOR_MAX8649 is not set
>> # CONFIG_REGULATOR_MAX8660 is not set
>> # CONFIG_REGULATOR_MAX8907 is not set
>> CONFIG_REGULATOR_MAX8925=3Dy
>> CONFIG_REGULATOR_MAX8952=3Dm
>> # CONFIG_REGULATOR_MAX8973 is not set
>> CONFIG_REGULATOR_MAX8997=3Dm
>> CONFIG_REGULATOR_MAX77686=3Dy
>> # CONFIG_REGULATOR_MAX77693 is not set
>> CONFIG_REGULATOR_MAX77802=3Dm
>> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
>> # CONFIG_REGULATOR_MC13783 is not set
>> CONFIG_REGULATOR_MC13892=3Dm
>> # CONFIG_REGULATOR_MCP16502 is not set
>> CONFIG_REGULATOR_MT6311=3Dm
>> CONFIG_REGULATOR_MT6323=3Dy
>> CONFIG_REGULATOR_MT6397=3Dm
>> CONFIG_REGULATOR_PCF50633=3Dy
>> CONFIG_REGULATOR_PFUZE100=3Dm
>> CONFIG_REGULATOR_PV88060=3Dy
>> # CONFIG_REGULATOR_PV88080 is not set
>> CONFIG_REGULATOR_PV88090=3Dm
>> # CONFIG_REGULATOR_PWM is not set
>> CONFIG_REGULATOR_RC5T583=3Dy
>> CONFIG_REGULATOR_RK808=3Dm
>> CONFIG_REGULATOR_RN5T618=3Dm
>> # CONFIG_REGULATOR_RT5033 is not set
>> CONFIG_REGULATOR_S2MPA01=3Dm
>> # CONFIG_REGULATOR_S2MPS11 is not set
>> # CONFIG_REGULATOR_S5M8767 is not set
>> CONFIG_REGULATOR_SKY81452=3Dy
>> # CONFIG_REGULATOR_SY8106A is not set
>> # CONFIG_REGULATOR_TPS51632 is not set
>> # CONFIG_REGULATOR_TPS6105X is not set
>> CONFIG_REGULATOR_TPS62360=3Dm
>> CONFIG_REGULATOR_TPS65023=3Dy
>> CONFIG_REGULATOR_TPS6507X=3Dm
>> CONFIG_REGULATOR_TPS65086=3Dm
>> CONFIG_REGULATOR_TPS65132=3Dm
>> CONFIG_REGULATOR_TPS65218=3Dm
>> # CONFIG_REGULATOR_TPS6586X is not set
>> CONFIG_REGULATOR_TPS65912=3Dm
>> CONFIG_REGULATOR_VCTRL=3Dy
>> # CONFIG_REGULATOR_WM831X is not set
>> CONFIG_REGULATOR_WM8400=3Dy
>> # CONFIG_REGULATOR_WM8994 is not set
>> CONFIG_CEC_CORE=3Dm
>> CONFIG_CEC_NOTIFIER=3Dy
>> CONFIG_RC_CORE=3Dm
>> CONFIG_RC_MAP=3Dm
>> # CONFIG_LIRC is not set
>> # CONFIG_RC_DECODERS is not set
>> # CONFIG_RC_DEVICES is not set
>> CONFIG_MEDIA_SUPPORT=3Dy
>>
>> #
>> # Multimedia core support
>> #
>> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
>> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
>> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
>> # CONFIG_MEDIA_RADIO_SUPPORT is not set
>> CONFIG_MEDIA_SDR_SUPPORT=3Dy
>> CONFIG_MEDIA_CEC_SUPPORT=3Dy
>> # CONFIG_MEDIA_CEC_RC is not set
>> # CONFIG_MEDIA_CONTROLLER is not set
>> CONFIG_VIDEO_DEV=3Dy
>> CONFIG_VIDEO_V4L2=3Dy
>> # CONFIG_VIDEO_ADV_DEBUG is not set
>> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
>> CONFIG_VIDEO_TUNER=3Dy
>> CONFIG_VIDEOBUF_GEN=3Dy
>> CONFIG_VIDEOBUF_DMA_SG=3Dy
>> CONFIG_VIDEOBUF_VMALLOC=3Dm
>> CONFIG_DVB_CORE=3Dy
>> # CONFIG_DVB_MMAP is not set
>> CONFIG_DVB_NET=3Dy
>> CONFIG_TTPCI_EEPROM=3Dm
>> CONFIG_DVB_MAX_ADAPTERS=3D16
>> # CONFIG_DVB_DYNAMIC_MINORS is not set
>> CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=3Dy
>> CONFIG_DVB_ULE_DEBUG=3Dy
>>
>> #
>> # Media drivers
>> #
>> CONFIG_MEDIA_PCI_SUPPORT=3Dy
>>
>> #
>> # Media capture support
>> #
>> CONFIG_VIDEO_TW5864=3Dy
>> # CONFIG_VIDEO_TW68 is not set
>>
>> #
>> # Media capture/analog TV support
>> #
>> # CONFIG_VIDEO_IVTV is not set
>> CONFIG_VIDEO_HEXIUM_GEMINI=3Dm
>> CONFIG_VIDEO_HEXIUM_ORION=3Dy
>> CONFIG_VIDEO_MXB=3Dy
>> CONFIG_VIDEO_DT3155=3Dm
>>
>> #
>> # Media capture/analog/hybrid TV support
>> #
>> CONFIG_VIDEO_CX18=3Dm
>> CONFIG_VIDEO_CX25821=3Dy
>> CONFIG_VIDEO_CX88=3Dm
>> # CONFIG_VIDEO_CX88_BLACKBIRD is not set
>> CONFIG_VIDEO_CX88_DVB=3Dm
>> CONFIG_VIDEO_CX88_ENABLE_VP3054=3Dy
>> CONFIG_VIDEO_CX88_VP3054=3Dm
>> CONFIG_VIDEO_CX88_MPEG=3Dm
>> CONFIG_VIDEO_SAA7134=3Dm
>> CONFIG_VIDEO_SAA7134_RC=3Dy
>> CONFIG_VIDEO_SAA7134_DVB=3Dm
>> CONFIG_VIDEO_SAA7164=3Dm
>>
>> #
>> # Media digital TV PCI Adapters
>> #
>> CONFIG_DVB_AV7110_IR=3Dy
>> CONFIG_DVB_AV7110=3Dm
>> CONFIG_DVB_AV7110_OSD=3Dy
>> # CONFIG_DVB_BUDGET_CORE is not set
>> CONFIG_DVB_B2C2_FLEXCOP_PCI=3Dy
>> CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG=3Dy
>> CONFIG_DVB_PLUTO2=3Dm
>> CONFIG_DVB_DM1105=3Dm
>> CONFIG_DVB_PT1=3Dm
>> CONFIG_DVB_PT3=3Dy
>> # CONFIG_MANTIS_CORE is not set
>> CONFIG_DVB_NGENE=3Dy
>> CONFIG_DVB_DDBRIDGE=3Dm
>> # CONFIG_DVB_DDBRIDGE_MSIENABLE is not set
>> CONFIG_DVB_SMIPCIE=3Dm
>> # CONFIG_V4L_PLATFORM_DRIVERS is not set
>> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
>> # CONFIG_V4L_TEST_DRIVERS is not set
>> # CONFIG_DVB_PLATFORM_DRIVERS is not set
>> CONFIG_CEC_PLATFORM_DRIVERS=3Dy
>> CONFIG_VIDEO_CROS_EC_CEC=3Dm
>> # CONFIG_CEC_GPIO is not set
>> # CONFIG_VIDEO_SECO_CEC is not set
>> # CONFIG_SDR_PLATFORM_DRIVERS is not set
>>
>> #
>> # Supported MMC/SDIO adapters
>> #
>> # CONFIG_SMS_SDIO_DRV is not set
>> CONFIG_VIDEO_CX2341X=3Dm
>> CONFIG_VIDEO_TVEEPROM=3Dm
>> CONFIG_VIDEOBUF2_CORE=3Dy
>> CONFIG_VIDEOBUF2_V4L2=3Dy
>> CONFIG_VIDEOBUF2_MEMOPS=3Dy
>> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
>> CONFIG_VIDEOBUF2_DMA_SG=3Dy
>> CONFIG_VIDEOBUF2_DVB=3Dm
>> CONFIG_DVB_B2C2_FLEXCOP=3Dy
>> CONFIG_DVB_B2C2_FLEXCOP_DEBUG=3Dy
>> CONFIG_VIDEO_SAA7146=3Dy
>> CONFIG_VIDEO_SAA7146_VV=3Dy
>>
>> #
>> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
>> #
>> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
>> CONFIG_MEDIA_ATTACH=3Dy
>> CONFIG_VIDEO_IR_I2C=3Dm
>>
>> #
>> # Audio decoders, processors and mixers
>> #
>> CONFIG_VIDEO_TDA9840=3Dy
>> CONFIG_VIDEO_TEA6415C=3Dy
>> CONFIG_VIDEO_TEA6420=3Dy
>> CONFIG_VIDEO_CS5345=3Dm
>> CONFIG_VIDEO_WM8775=3Dm
>>
>> #
>> # RDS decoders
>> #
>> CONFIG_VIDEO_SAA6588=3Dm
>>
>> #
>> # Video decoders
>> #
>> CONFIG_VIDEO_SAA7110=3Dm
>> CONFIG_VIDEO_SAA711X=3Dy
>> CONFIG_VIDEO_VPX3220=3Dm
>>
>> #
>> # Video and audio decoders
>> #
>>
>> #
>> # Video encoders
>> #
>> CONFIG_VIDEO_SAA7185=3Dm
>> CONFIG_VIDEO_ADV7170=3Dm
>> CONFIG_VIDEO_ADV7175=3Dm
>>
>> #
>> # Camera sensor devices
>> #
>>
>> #
>> # Flash devices
>> #
>>
>> #
>> # Video improvement chips
>> #
>>
>> #
>> # Audio/Video compression chips
>> #
>> CONFIG_VIDEO_SAA6752HS=3Dm
>>
>> #
>> # SDR tuner chips
>> #
>>
>> #
>> # Miscellaneous helper chips
>> #
>>
>> #
>> # Sensors used on soc_camera driver
>> #
>> CONFIG_MEDIA_TUNER=3Dy
>> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
>> CONFIG_MEDIA_TUNER_TDA8290=3Dy
>> CONFIG_MEDIA_TUNER_TDA827X=3Dy
>> CONFIG_MEDIA_TUNER_TDA18271=3Dy
>> CONFIG_MEDIA_TUNER_TDA9887=3Dy
>> CONFIG_MEDIA_TUNER_MT20XX=3Dy
>> CONFIG_MEDIA_TUNER_MT2131=3Dy
>> CONFIG_MEDIA_TUNER_XC2028=3Dy
>> CONFIG_MEDIA_TUNER_XC5000=3Dy
>> CONFIG_MEDIA_TUNER_XC4000=3Dy
>> CONFIG_MEDIA_TUNER_MXL5005S=3Dm
>> CONFIG_MEDIA_TUNER_MC44S803=3Dy
>> CONFIG_MEDIA_TUNER_TDA18212=3Dy
>> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
>> CONFIG_MEDIA_TUNER_SI2157=3Dm
>> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
>> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dy
>> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
>>
>> #
>> # Multistandard (satellite) frontends
>> #
>> CONFIG_DVB_STB6100=3Dm
>> CONFIG_DVB_STV090x=3Dy
>> CONFIG_DVB_STV0910=3Dy
>> CONFIG_DVB_STV6110x=3Dy
>> CONFIG_DVB_STV6111=3Dy
>> CONFIG_DVB_MXL5XX=3Dm
>> CONFIG_DVB_M88DS3103=3Dm
>>
>> #
>> # Multistandard (cable + terrestrial) frontends
>> #
>> CONFIG_DVB_DRXK=3Dy
>> CONFIG_DVB_TDA18271C2DD=3Dy
>>
>> #
>> # DVB-S (satellite) frontends
>> #
>> CONFIG_DVB_CX24123=3Dy
>> CONFIG_DVB_MT312=3Dy
>> CONFIG_DVB_ZL10036=3Dm
>> CONFIG_DVB_ZL10039=3Dm
>> CONFIG_DVB_S5H1420=3Dy
>> CONFIG_DVB_STV0288=3Dm
>> CONFIG_DVB_STB6000=3Dm
>> CONFIG_DVB_STV0299=3Dy
>> CONFIG_DVB_STV0900=3Dm
>> CONFIG_DVB_TDA8083=3Dm
>> CONFIG_DVB_TDA10086=3Dm
>> CONFIG_DVB_VES1X93=3Dm
>> CONFIG_DVB_TUNER_ITD1000=3Dy
>> CONFIG_DVB_TUNER_CX24113=3Dy
>> CONFIG_DVB_TDA826X=3Dm
>> CONFIG_DVB_CX24116=3Dm
>> CONFIG_DVB_CX24120=3Dy
>> CONFIG_DVB_SI21XX=3Dm
>> CONFIG_DVB_TS2020=3Dm
>> CONFIG_DVB_DS3000=3Dm
>>
>> #
>> # DVB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_SP8870=3Dm
>> CONFIG_DVB_CX22702=3Dm
>> CONFIG_DVB_L64781=3Dm
>> CONFIG_DVB_TDA1004X=3Dm
>> CONFIG_DVB_MT352=3Dy
>> CONFIG_DVB_ZL10353=3Dm
>> CONFIG_DVB_TDA10048=3Dm
>> CONFIG_DVB_STV0367=3Dy
>> CONFIG_DVB_CXD2841ER=3Dy
>> CONFIG_DVB_SI2168=3Dm
>>
>> #
>> # DVB-C (cable) frontends
>> #
>> CONFIG_DVB_VES1820=3Dm
>> CONFIG_DVB_STV0297=3Dy
>>
>> #
>> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
>> #
>> CONFIG_DVB_NXT200X=3Dy
>> CONFIG_DVB_OR51132=3Dm
>> CONFIG_DVB_BCM3510=3Dy
>> CONFIG_DVB_LGDT330X=3Dy
>> CONFIG_DVB_LGDT3305=3Dm
>> CONFIG_DVB_S5H1409=3Dm
>> CONFIG_DVB_S5H1411=3Dm
>>
>> #
>> # ISDB-T (terrestrial) frontends
>> #
>>
>> #
>> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_TC90522=3Dy
>>
>> #
>> # Digital terrestrial only tuners/PLL
>> #
>> CONFIG_DVB_PLL=3Dy
>>
>> #
>> # SEC control devices for DVB-S
>> #
>> CONFIG_DVB_LNBH25=3Dy
>> CONFIG_DVB_LNBP21=3Dy
>> CONFIG_DVB_ISL6405=3Dm
>> CONFIG_DVB_ISL6421=3Dy
>>
>> #
>> # Common Interface (EN50221) controller drivers
>> #
>> CONFIG_DVB_CXD2099=3Dy
>>
>> #
>> # Tools to develop new frontends
>> #
>> CONFIG_DVB_DUMMY_FE=3Dm
>>
>> #
>> # Graphics support
>> #
>> CONFIG_AGP=3Dy
>> CONFIG_AGP_INTEL=3Dm
>> CONFIG_AGP_SIS=3Dy
>> CONFIG_AGP_VIA=3Dm
>> CONFIG_INTEL_GTT=3Dm
>> CONFIG_VGA_ARB=3Dy
>> CONFIG_VGA_ARB_MAX_GPUS=3D16
>> # CONFIG_VGA_SWITCHEROO is not set
>> # CONFIG_DRM is not set
>> # CONFIG_DRM_DP_CEC is not set
>>
>> #
>> # ACP (Audio CoProcessor) Configuration
>> #
>>
>> #
>> # AMD Library routines
>> #
>>
>> #
>> # Frame buffer Devices
>> #
>> CONFIG_FB_CMDLINE=3Dy
>> CONFIG_FB_NOTIFY=3Dy
>> CONFIG_FB=3Dm
>> CONFIG_FIRMWARE_EDID=3Dy
>> CONFIG_FB_DDC=3Dm
>> CONFIG_FB_CFB_FILLRECT=3Dm
>> CONFIG_FB_CFB_COPYAREA=3Dm
>> CONFIG_FB_CFB_IMAGEBLIT=3Dm
>> CONFIG_FB_SYS_FILLRECT=3Dm
>> CONFIG_FB_SYS_COPYAREA=3Dm
>> CONFIG_FB_SYS_IMAGEBLIT=3Dm
>> # CONFIG_FB_FOREIGN_ENDIAN is not set
>> CONFIG_FB_SYS_FOPS=3Dm
>> CONFIG_FB_DEFERRED_IO=3Dy
>> CONFIG_FB_HECUBA=3Dm
>> CONFIG_FB_SVGALIB=3Dm
>> CONFIG_FB_BACKLIGHT=3Dm
>> CONFIG_FB_MODE_HELPERS=3Dy
>> CONFIG_FB_TILEBLITTING=3Dy
>>
>> #
>> # Frame buffer hardware drivers
>> #
>> CONFIG_FB_CIRRUS=3Dm
>> CONFIG_FB_PM2=3Dm
>> CONFIG_FB_PM2_FIFO_DISCONNECT=3Dy
>> # CONFIG_FB_CYBER2000 is not set
>> CONFIG_FB_ARC=3Dm
>> # CONFIG_FB_VGA16 is not set
>> CONFIG_FB_N411=3Dm
>> CONFIG_FB_HGA=3Dm
>> CONFIG_FB_OPENCORES=3Dm
>> # CONFIG_FB_S1D13XXX is not set
>> CONFIG_FB_NVIDIA=3Dm
>> CONFIG_FB_NVIDIA_I2C=3Dy
>> CONFIG_FB_NVIDIA_DEBUG=3Dy
>> # CONFIG_FB_NVIDIA_BACKLIGHT is not set
>> # CONFIG_FB_RIVA is not set
>> CONFIG_FB_I740=3Dm
>> CONFIG_FB_LE80578=3Dm
>> CONFIG_FB_CARILLO_RANCH=3Dm
>> CONFIG_FB_INTEL=3Dm
>> CONFIG_FB_INTEL_DEBUG=3Dy
>> # CONFIG_FB_INTEL_I2C is not set
>> CONFIG_FB_MATROX=3Dm
>> CONFIG_FB_MATROX_MILLENIUM=3Dy
>> # CONFIG_FB_MATROX_MYSTIQUE is not set
>> CONFIG_FB_MATROX_G=3Dy
>> CONFIG_FB_MATROX_I2C=3Dm
>> # CONFIG_FB_MATROX_MAVEN is not set
>> CONFIG_FB_RADEON=3Dm
>> CONFIG_FB_RADEON_I2C=3Dy
>> CONFIG_FB_RADEON_BACKLIGHT=3Dy
>> CONFIG_FB_RADEON_DEBUG=3Dy
>> CONFIG_FB_ATY128=3Dm
>> # CONFIG_FB_ATY128_BACKLIGHT is not set
>> CONFIG_FB_ATY=3Dm
>> # CONFIG_FB_ATY_CT is not set
>> CONFIG_FB_ATY_GX=3Dy
>> # CONFIG_FB_ATY_BACKLIGHT is not set
>> CONFIG_FB_S3=3Dm
>> CONFIG_FB_S3_DDC=3Dy
>> CONFIG_FB_SAVAGE=3Dm
>> CONFIG_FB_SAVAGE_I2C=3Dy
>> # CONFIG_FB_SAVAGE_ACCEL is not set
>> CONFIG_FB_SIS=3Dm
>> CONFIG_FB_SIS_300=3Dy
>> # CONFIG_FB_SIS_315 is not set
>> CONFIG_FB_VIA=3Dm
>> CONFIG_FB_VIA_DIRECT_PROCFS=3Dy
>> CONFIG_FB_VIA_X_COMPATIBILITY=3Dy
>> # CONFIG_FB_NEOMAGIC is not set
>> CONFIG_FB_KYRO=3Dm
>> CONFIG_FB_3DFX=3Dm
>> # CONFIG_FB_3DFX_ACCEL is not set
>> CONFIG_FB_3DFX_I2C=3Dy
>> CONFIG_FB_VOODOO1=3Dm
>> CONFIG_FB_VT8623=3Dm
>> CONFIG_FB_TRIDENT=3Dm
>> CONFIG_FB_ARK=3Dm
>> CONFIG_FB_PM3=3Dm
>> CONFIG_FB_CARMINE=3Dm
>> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
>> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
>> CONFIG_FB_SM501=3Dm
>> CONFIG_FB_IBM_GXT4500=3Dm
>> # CONFIG_FB_VIRTUAL is not set
>> # CONFIG_FB_METRONOME is not set
>> # CONFIG_FB_MB862XX is not set
>> # CONFIG_FB_SSD1307 is not set
>> # CONFIG_FB_SM712 is not set
>> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>> CONFIG_LCD_CLASS_DEVICE=3Dy
>> CONFIG_LCD_PLATFORM=3Dy
>> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>> CONFIG_BACKLIGHT_GENERIC=3Dm
>> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dm
>> # CONFIG_BACKLIGHT_PWM is not set
>> CONFIG_BACKLIGHT_MAX8925=3Dm
>> # CONFIG_BACKLIGHT_APPLE is not set
>> CONFIG_BACKLIGHT_PM8941_WLED=3Dm
>> CONFIG_BACKLIGHT_SAHARA=3Dm
>> CONFIG_BACKLIGHT_WM831X=3Dm
>> CONFIG_BACKLIGHT_ADP8860=3Dy
>> CONFIG_BACKLIGHT_ADP8870=3Dm
>> CONFIG_BACKLIGHT_PCF50633=3Dm
>> CONFIG_BACKLIGHT_AAT2870=3Dy
>> CONFIG_BACKLIGHT_LM3630A=3Dy
>> CONFIG_BACKLIGHT_LM3639=3Dm
>> CONFIG_BACKLIGHT_LP855X=3Dy
>> CONFIG_BACKLIGHT_LP8788=3Dy
>> CONFIG_BACKLIGHT_SKY81452=3Dm
>> # CONFIG_BACKLIGHT_AS3711 is not set
>> CONFIG_BACKLIGHT_GPIO=3Dy
>> CONFIG_BACKLIGHT_LV5207LP=3Dy
>> CONFIG_BACKLIGHT_BD6107=3Dm
>> # CONFIG_BACKLIGHT_ARCXCNN is not set
>> CONFIG_VGASTATE=3Dm
>> # CONFIG_LOGO is not set
>> CONFIG_SOUND=3Dy
>> # CONFIG_SND is not set
>>
>> #
>> # HID support
>> #
>> CONFIG_HID=3Dm
>> # CONFIG_HID_BATTERY_STRENGTH is not set
>> # CONFIG_HIDRAW is not set
>> # CONFIG_UHID is not set
>> # CONFIG_HID_GENERIC is not set
>>
>> #
>> # Special HID drivers
>> #
>> # CONFIG_HID_A4TECH is not set
>> CONFIG_HID_ACRUX=3Dm
>> # CONFIG_HID_ACRUX_FF is not set
>> CONFIG_HID_APPLE=3Dm
>> CONFIG_HID_ASUS=3Dm
>> CONFIG_HID_AUREAL=3Dm
>> CONFIG_HID_BELKIN=3Dm
>> CONFIG_HID_CHERRY=3Dm
>> CONFIG_HID_CHICONY=3Dm
>> CONFIG_HID_COUGAR=3Dm
>> # CONFIG_HID_CMEDIA is not set
>> CONFIG_HID_CYPRESS=3Dm
>> CONFIG_HID_DRAGONRISE=3Dm
>> CONFIG_DRAGONRISE_FF=3Dy
>> CONFIG_HID_EMS_FF=3Dm
>> CONFIG_HID_ELECOM=3Dm
>> # CONFIG_HID_EZKEY is not set
>> CONFIG_HID_GEMBIRD=3Dm
>> CONFIG_HID_GFRM=3Dm
>> # CONFIG_HID_KEYTOUCH is not set
>> CONFIG_HID_KYE=3Dm
>> CONFIG_HID_WALTOP=3Dm
>> CONFIG_HID_GYRATION=3Dm
>> CONFIG_HID_ICADE=3Dm
>> CONFIG_HID_ITE=3Dm
>> CONFIG_HID_JABRA=3Dm
>> # CONFIG_HID_TWINHAN is not set
>> # CONFIG_HID_KENSINGTON is not set
>> CONFIG_HID_LCPOWER=3Dm
>> CONFIG_HID_LED=3Dm
>> # CONFIG_HID_LENOVO is not set
>> CONFIG_HID_LOGITECH=3Dm
>> # CONFIG_HID_LOGITECH_HIDPP is not set
>> CONFIG_LOGITECH_FF=3Dy
>> # CONFIG_LOGIRUMBLEPAD2_FF is not set
>> # CONFIG_LOGIG940_FF is not set
>> # CONFIG_LOGIWHEELS_FF is not set
>> # CONFIG_HID_MAGICMOUSE is not set
>> CONFIG_HID_MAYFLASH=3Dm
>> CONFIG_HID_REDRAGON=3Dm
>> CONFIG_HID_MICROSOFT=3Dm
>> CONFIG_HID_MONTEREY=3Dm
>> # CONFIG_HID_MULTITOUCH is not set
>> CONFIG_HID_NTI=3Dm
>> CONFIG_HID_ORTEK=3Dm
>> CONFIG_HID_PANTHERLORD=3Dm
>> CONFIG_PANTHERLORD_FF=3Dy
>> # CONFIG_HID_PETALYNX is not set
>> CONFIG_HID_PICOLCD=3Dm
>> # CONFIG_HID_PICOLCD_FB is not set
>> # CONFIG_HID_PICOLCD_BACKLIGHT is not set
>> CONFIG_HID_PICOLCD_LCD=3Dy
>> CONFIG_HID_PICOLCD_LEDS=3Dy
>> CONFIG_HID_PICOLCD_CIR=3Dy
>> CONFIG_HID_PLANTRONICS=3Dm
>> # CONFIG_HID_PRIMAX is not set
>> CONFIG_HID_SAITEK=3Dm
>> # CONFIG_HID_SAMSUNG is not set
>> CONFIG_HID_SPEEDLINK=3Dm
>> # CONFIG_HID_STEAM is not set
>> # CONFIG_HID_STEELSERIES is not set
>> # CONFIG_HID_SUNPLUS is not set
>> CONFIG_HID_RMI=3Dm
>> CONFIG_HID_GREENASIA=3Dm
>> CONFIG_GREENASIA_FF=3Dy
>> CONFIG_HID_SMARTJOYPLUS=3Dm
>> CONFIG_SMARTJOYPLUS_FF=3Dy
>> # CONFIG_HID_TIVO is not set
>> CONFIG_HID_TOPSEED=3Dm
>> CONFIG_HID_THINGM=3Dm
>> CONFIG_HID_THRUSTMASTER=3Dm
>> CONFIG_THRUSTMASTER_FF=3Dy
>> CONFIG_HID_UDRAW_PS3=3Dm
>> CONFIG_HID_WIIMOTE=3Dm
>> CONFIG_HID_XINMO=3Dm
>> CONFIG_HID_ZEROPLUS=3Dm
>> # CONFIG_ZEROPLUS_FF is not set
>> # CONFIG_HID_ZYDACRON is not set
>> # CONFIG_HID_SENSOR_HUB is not set
>> CONFIG_HID_ALPS=3Dm
>>
>> #
>> # I2C HID support
>> #
>> # CONFIG_I2C_HID is not set
>>
>> #
>> # Intel ISH HID support
>> #
>> CONFIG_INTEL_ISH_HID=3Dm
>> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
>> CONFIG_USB_SUPPORT=3Dy
>> CONFIG_USB_ARCH_HAS_HCD=3Dy
>> # CONFIG_USB is not set
>> CONFIG_USB_PCI=3Dy
>>
>> #
>> # USB port drivers
>> #
>>
>> #
>> # USB Physical Layer drivers
>> #
>> # CONFIG_NOP_USB_XCEIV is not set
>> # CONFIG_USB_GPIO_VBUS is not set
>> # CONFIG_USB_GADGET is not set
>> # CONFIG_TYPEC is not set
>> # CONFIG_USB_ROLE_SWITCH is not set
>> # CONFIG_USB_LED_TRIG is not set
>> # CONFIG_USB_ULPI_BUS is not set
>> CONFIG_UWB=3Dm
>> CONFIG_UWB_WHCI=3Dm
>> CONFIG_MMC=3Dm
>> # CONFIG_PWRSEQ_EMMC is not set
>> CONFIG_PWRSEQ_SIMPLE=3Dm
>> # CONFIG_SDIO_UART is not set
>> CONFIG_MMC_TEST=3Dm
>>
>> #
>> # MMC/SD/SDIO Host Controller Drivers
>> #
>> CONFIG_MMC_DEBUG=3Dy
>> CONFIG_MMC_SDHCI=3Dm
>> CONFIG_MMC_SDHCI_PCI=3Dm
>> # CONFIG_MMC_RICOH_MMC is not set
>> # CONFIG_MMC_SDHCI_ACPI is not set
>> # CONFIG_MMC_SDHCI_PLTFM is not set
>> CONFIG_MMC_ALCOR=3Dm
>> CONFIG_MMC_TIFM_SD=3Dm
>> CONFIG_MMC_SDRICOH_CS=3Dm
>> CONFIG_MMC_CB710=3Dm
>> # CONFIG_MMC_VIA_SDMMC is not set
>> CONFIG_MMC_USDHI6ROL0=3Dm
>> # CONFIG_MMC_REALTEK_PCI is not set
>> CONFIG_MMC_CQHCI=3Dm
>> CONFIG_MMC_TOSHIBA_PCI=3Dm
>> CONFIG_MMC_MTK=3Dm
>> # CONFIG_MEMSTICK is not set
>> CONFIG_NEW_LEDS=3Dy
>> CONFIG_LEDS_CLASS=3Dy
>> CONFIG_LEDS_CLASS_FLASH=3Dy
>> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
>>
>> #
>> # LED drivers
>> #
>> # CONFIG_LEDS_AAT1290 is not set
>> # CONFIG_LEDS_AN30259A is not set
>> CONFIG_LEDS_APU=3Dm
>> CONFIG_LEDS_AS3645A=3Dm
>> CONFIG_LEDS_BCM6328=3Dy
>> CONFIG_LEDS_BCM6358=3Dm
>> # CONFIG_LEDS_LM3530 is not set
>> CONFIG_LEDS_LM3642=3Dy
>> # CONFIG_LEDS_LM3692X is not set
>> CONFIG_LEDS_LM3601X=3Dm
>> CONFIG_LEDS_MT6323=3Dy
>> CONFIG_LEDS_PCA9532=3Dm
>> CONFIG_LEDS_PCA9532_GPIO=3Dy
>> # CONFIG_LEDS_GPIO is not set
>> # CONFIG_LEDS_LP3944 is not set
>> # CONFIG_LEDS_LP3952 is not set
>> CONFIG_LEDS_LP55XX_COMMON=3Dy
>> # CONFIG_LEDS_LP5521 is not set
>> CONFIG_LEDS_LP5523=3Dm
>> CONFIG_LEDS_LP5562=3Dy
>> CONFIG_LEDS_LP8501=3Dy
>> # CONFIG_LEDS_LP8788 is not set
>> # CONFIG_LEDS_LP8860 is not set
>> CONFIG_LEDS_CLEVO_MAIL=3Dm
>> # CONFIG_LEDS_PCA955X is not set
>> # CONFIG_LEDS_PCA963X is not set
>> CONFIG_LEDS_WM831X_STATUS=3Dm
>> CONFIG_LEDS_PWM=3Dy
>> # CONFIG_LEDS_REGULATOR is not set
>> # CONFIG_LEDS_BD2802 is not set
>> CONFIG_LEDS_INTEL_SS4200=3Dy
>> CONFIG_LEDS_LT3593=3Dm
>> # CONFIG_LEDS_MC13783 is not set
>> CONFIG_LEDS_TCA6507=3Dy
>> CONFIG_LEDS_TLC591XX=3Dy
>> CONFIG_LEDS_MAX8997=3Dm
>> CONFIG_LEDS_LM355x=3Dy
>> # CONFIG_LEDS_MENF21BMC is not set
>> CONFIG_LEDS_KTD2692=3Dy
>> CONFIG_LEDS_IS31FL319X=3Dm
>> CONFIG_LEDS_IS31FL32XX=3Dy
>>
>> #
>> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_=
THINGM)
>> #
>> # CONFIG_LEDS_BLINKM is not set
>> CONFIG_LEDS_SYSCON=3Dy
>> CONFIG_LEDS_MLXCPLD=3Dy
>> CONFIG_LEDS_MLXREG=3Dy
>> CONFIG_LEDS_USER=3Dy
>> # CONFIG_LEDS_NIC78BX is not set
>>
>> #
>> # LED Triggers
>> #
>> CONFIG_LEDS_TRIGGERS=3Dy
>> CONFIG_LEDS_TRIGGER_TIMER=3Dm
>> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
>> CONFIG_LEDS_TRIGGER_MTD=3Dy
>> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
>> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
>> # CONFIG_LEDS_TRIGGER_CPU is not set
>> CONFIG_LEDS_TRIGGER_ACTIVITY=3Dm
>> CONFIG_LEDS_TRIGGER_GPIO=3Dm
>> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
>>
>> #
>> # iptables trigger is under Netfilter config (LED target)
>> #
>> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
>> # CONFIG_LEDS_TRIGGER_CAMERA is not set
>> CONFIG_LEDS_TRIGGER_PANIC=3Dy
>> CONFIG_LEDS_TRIGGER_NETDEV=3Dm
>> CONFIG_LEDS_TRIGGER_PATTERN=3Dm
>> CONFIG_LEDS_TRIGGER_AUDIO=3Dm
>> # CONFIG_ACCESSIBILITY is not set
>> # CONFIG_INFINIBAND is not set
>> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>> CONFIG_EDAC_SUPPORT=3Dy
>> # CONFIG_EDAC is not set
>> CONFIG_RTC_LIB=3Dy
>> CONFIG_RTC_MC146818_LIB=3Dy
>> CONFIG_RTC_CLASS=3Dy
>> # CONFIG_RTC_HCTOSYS is not set
>> # CONFIG_RTC_SYSTOHC is not set
>> # CONFIG_RTC_DEBUG is not set
>> # CONFIG_RTC_NVMEM is not set
>>
>> #
>> # RTC interfaces
>> #
>> CONFIG_RTC_INTF_SYSFS=3Dy
>> # CONFIG_RTC_INTF_PROC is not set
>> CONFIG_RTC_INTF_DEV=3Dy
>> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
>> CONFIG_RTC_DRV_TEST=3Dy
>>
>> #
>> # I2C RTC drivers
>> #
>> CONFIG_RTC_DRV_88PM80X=3Dm
>> CONFIG_RTC_DRV_ABB5ZES3=3Dy
>> # CONFIG_RTC_DRV_ABX80X is not set
>> CONFIG_RTC_DRV_AS3722=3Dm
>> CONFIG_RTC_DRV_DS1307=3Dy
>> CONFIG_RTC_DRV_DS1307_CENTURY=3Dy
>> # CONFIG_RTC_DRV_DS1374 is not set
>> CONFIG_RTC_DRV_DS1672=3Dy
>> # CONFIG_RTC_DRV_HYM8563 is not set
>> # CONFIG_RTC_DRV_LP8788 is not set
>> CONFIG_RTC_DRV_MAX6900=3Dm
>> CONFIG_RTC_DRV_MAX8907=3Dm
>> # CONFIG_RTC_DRV_MAX8925 is not set
>> CONFIG_RTC_DRV_MAX8997=3Dm
>> CONFIG_RTC_DRV_MAX77686=3Dy
>> CONFIG_RTC_DRV_RK808=3Dm
>> CONFIG_RTC_DRV_RS5C372=3Dy
>> CONFIG_RTC_DRV_ISL1208=3Dm
>> # CONFIG_RTC_DRV_ISL12022 is not set
>> CONFIG_RTC_DRV_ISL12026=3Dy
>> # CONFIG_RTC_DRV_X1205 is not set
>> CONFIG_RTC_DRV_PCF8523=3Dm
>> CONFIG_RTC_DRV_PCF85063=3Dy
>> # CONFIG_RTC_DRV_PCF85363 is not set
>> # CONFIG_RTC_DRV_PCF8563 is not set
>> CONFIG_RTC_DRV_PCF8583=3Dm
>> # CONFIG_RTC_DRV_M41T80 is not set
>> CONFIG_RTC_DRV_BQ32K=3Dm
>> CONFIG_RTC_DRV_TPS6586X=3Dm
>> CONFIG_RTC_DRV_RC5T583=3Dy
>> CONFIG_RTC_DRV_S35390A=3Dy
>> CONFIG_RTC_DRV_FM3130=3Dm
>> CONFIG_RTC_DRV_RX8010=3Dm
>> CONFIG_RTC_DRV_RX8581=3Dy
>> CONFIG_RTC_DRV_RX8025=3Dm
>> CONFIG_RTC_DRV_EM3027=3Dm
>> # CONFIG_RTC_DRV_RV8803 is not set
>> CONFIG_RTC_DRV_S5M=3Dm
>>
>> #
>> # SPI RTC drivers
>> #
>> CONFIG_RTC_I2C_AND_SPI=3Dy
>>
>> #
>> # SPI and I2C RTC drivers
>> #
>> # CONFIG_RTC_DRV_DS3232 is not set
>> CONFIG_RTC_DRV_PCF2127=3Dm
>> CONFIG_RTC_DRV_RV3029C2=3Dm
>> CONFIG_RTC_DRV_RV3029_HWMON=3Dy
>>
>> #
>> # Platform RTC drivers
>> #
>> CONFIG_RTC_DRV_CMOS=3Dm
>> CONFIG_RTC_DRV_DS1286=3Dy
>> CONFIG_RTC_DRV_DS1511=3Dm
>> CONFIG_RTC_DRV_DS1553=3Dy
>> CONFIG_RTC_DRV_DS1685_FAMILY=3Dm
>> # CONFIG_RTC_DRV_DS1685 is not set
>> CONFIG_RTC_DRV_DS1689=3Dy
>> # CONFIG_RTC_DRV_DS17285 is not set
>> # CONFIG_RTC_DRV_DS17485 is not set
>> # CONFIG_RTC_DRV_DS17885 is not set
>> # CONFIG_RTC_DRV_DS1742 is not set
>> CONFIG_RTC_DRV_DS2404=3Dm
>> # CONFIG_RTC_DRV_DA9063 is not set
>> CONFIG_RTC_DRV_STK17TA8=3Dy
>> CONFIG_RTC_DRV_M48T86=3Dy
>> # CONFIG_RTC_DRV_M48T35 is not set
>> CONFIG_RTC_DRV_M48T59=3Dm
>> # CONFIG_RTC_DRV_MSM6242 is not set
>> # CONFIG_RTC_DRV_BQ4802 is not set
>> # CONFIG_RTC_DRV_RP5C01 is not set
>> CONFIG_RTC_DRV_V3020=3Dy
>> CONFIG_RTC_DRV_WM831X=3Dm
>> # CONFIG_RTC_DRV_PCF50633 is not set
>> CONFIG_RTC_DRV_ZYNQMP=3Dy
>> # CONFIG_RTC_DRV_CROS_EC is not set
>>
>> #
>> # on-CPU RTC drivers
>> #
>> # CONFIG_RTC_DRV_FTRTC010 is not set
>> CONFIG_RTC_DRV_MC13XXX=3Dm
>> # CONFIG_RTC_DRV_SNVS is not set
>> CONFIG_RTC_DRV_MT6397=3Dm
>> CONFIG_RTC_DRV_R7301=3Dm
>>
>> #
>> # HID Sensor RTC drivers
>> #
>> CONFIG_DMADEVICES=3Dy
>> # CONFIG_DMADEVICES_DEBUG is not set
>>
>> #
>> # DMA Devices
>> #
>> CONFIG_DMA_ENGINE=3Dy
>> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
>> CONFIG_DMA_ACPI=3Dy
>> CONFIG_DMA_OF=3Dy
>> CONFIG_ALTERA_MSGDMA=3Dy
>> CONFIG_DW_AXI_DMAC=3Dy
>> CONFIG_FSL_EDMA=3Dy
>> # CONFIG_INTEL_IDMA64 is not set
>> CONFIG_INTEL_IOATDMA=3Dy
>> # CONFIG_INTEL_MIC_X100_DMA is not set
>> CONFIG_QCOM_HIDMA_MGMT=3Dm
>> CONFIG_QCOM_HIDMA=3Dy
>> CONFIG_DW_DMAC_CORE=3Dy
>> CONFIG_DW_DMAC=3Dm
>> CONFIG_DW_DMAC_PCI=3Dy
>> CONFIG_HSU_DMA=3Dy
>>
>> #
>> # DMA Clients
>> #
>> CONFIG_ASYNC_TX_DMA=3Dy
>> CONFIG_DMATEST=3Dy
>> CONFIG_DMA_ENGINE_RAID=3Dy
>>
>> #
>> # DMABUF options
>> #
>> CONFIG_SYNC_FILE=3Dy
>> CONFIG_SW_SYNC=3Dy
>> CONFIG_UDMABUF=3Dy
>> CONFIG_DCA=3Dy
>> CONFIG_AUXDISPLAY=3Dy
>> # CONFIG_HD44780 is not set
>> CONFIG_IMG_ASCII_LCD=3Dy
>> CONFIG_HT16K33=3Dm
>> # CONFIG_UIO is not set
>> CONFIG_VIRT_DRIVERS=3Dy
>> CONFIG_VBOXGUEST=3Dm
>> CONFIG_VIRTIO=3Dy
>> CONFIG_VIRTIO_MENU=3Dy
>> CONFIG_VIRTIO_PCI=3Dy
>> CONFIG_VIRTIO_PCI_LEGACY=3Dy
>> # CONFIG_VIRTIO_BALLOON is not set
>> CONFIG_VIRTIO_INPUT=3Dm
>> # CONFIG_VIRTIO_MMIO is not set
>>
>> #
>> # Microsoft Hyper-V guest support
>> #
>> # CONFIG_HYPERV is not set
>> CONFIG_STAGING=3Dy
>> # CONFIG_COMEDI is not set
>> # CONFIG_RTLLIB is not set
>> CONFIG_RTL8723BS=3Dm
>> CONFIG_R8822BE=3Dm
>> CONFIG_RTLWIFI_DEBUG_ST=3Dy
>> CONFIG_VT6655=3Dm
>>
>> #
>> # IIO staging drivers
>> #
>>
>> #
>> # Accelerometers
>> #
>>
>> #
>> # Analog to digital converters
>> #
>> CONFIG_AD7606=3Dy
>> # CONFIG_AD7606_IFACE_PARALLEL is not set
>>
>> #
>> # Analog digital bi-direction converters
>> #
>> # CONFIG_ADT7316 is not set
>>
>> #
>> # Capacitance to digital converters
>> #
>> CONFIG_AD7150=3Dy
>> # CONFIG_AD7152 is not set
>> CONFIG_AD7746=3Dy
>>
>> #
>> # Direct Digital Synthesis
>> #
>>
>> #
>> # Network Analyzer, Impedance Converters
>> #
>> CONFIG_AD5933=3Dm
>>
>> #
>> # Active energy metering IC
>> #
>> # CONFIG_ADE7854 is not set
>>
>> #
>> # Resolver to digital converters
>> #
>> # CONFIG_FB_SM750 is not set
>> # CONFIG_FB_XGI is not set
>>
>> #
>> # Speakup console speech
>> #
>> CONFIG_STAGING_MEDIA=3Dy
>> CONFIG_VIDEO_ZORAN=3Dm
>> CONFIG_VIDEO_ZORAN_DC30=3Dm
>> CONFIG_VIDEO_ZORAN_ZR36060=3Dm
>> CONFIG_VIDEO_ZORAN_BUZ=3Dm
>> CONFIG_VIDEO_ZORAN_DC10=3Dm
>> # CONFIG_VIDEO_ZORAN_LML33 is not set
>> CONFIG_VIDEO_ZORAN_LML33R10=3Dm
>> # CONFIG_VIDEO_ZORAN_AVS6EYES is not set
>>
>> #
>> # Android
>> #
>> CONFIG_ASHMEM=3Dy
>> CONFIG_ANDROID_VSOC=3Dy
>> # CONFIG_ION is not set
>> # CONFIG_STAGING_BOARD is not set
>> CONFIG_GS_FPGABOOT=3Dm
>> # CONFIG_UNISYSSPAR is not set
>> CONFIG_COMMON_CLK_XLNX_CLKWZRD=3Dy
>> # CONFIG_WILC1000_SDIO is not set
>> CONFIG_MOST=3Dm
>> CONFIG_MOST_CDEV=3Dm
>> CONFIG_MOST_NET=3Dm
>> # CONFIG_MOST_VIDEO is not set
>> # CONFIG_MOST_DIM2 is not set
>> CONFIG_MOST_I2C=3Dm
>> # CONFIG_KS7010 is not set
>> CONFIG_GREYBUS=3Dm
>> CONFIG_GREYBUS_AUDIO=3Dm
>> CONFIG_GREYBUS_BOOTROM=3Dm
>> CONFIG_GREYBUS_HID=3Dm
>> CONFIG_GREYBUS_LIGHT=3Dm
>> CONFIG_GREYBUS_LOG=3Dm
>> # CONFIG_GREYBUS_LOOPBACK is not set
>> # CONFIG_GREYBUS_POWER is not set
>> CONFIG_GREYBUS_RAW=3Dm
>> # CONFIG_GREYBUS_VIBRATOR is not set
>> CONFIG_GREYBUS_BRIDGED_PHY=3Dm
>> # CONFIG_GREYBUS_GPIO is not set
>> # CONFIG_GREYBUS_I2C is not set
>> CONFIG_GREYBUS_PWM=3Dm
>> CONFIG_GREYBUS_SDIO=3Dm
>> CONFIG_GREYBUS_UART=3Dm
>> CONFIG_MTK_MMC=3Dm
>> # CONFIG_MTK_AEE_KDUMP is not set
>> CONFIG_MTK_MMC_CD_POLL=3Dy
>>
>> #
>> # Gasket devices
>> #
>> CONFIG_STAGING_GASKET_FRAMEWORK=3Dy
>> # CONFIG_STAGING_APEX_DRIVER is not set
>> CONFIG_XIL_AXIS_FIFO=3Dy
>> CONFIG_X86_PLATFORM_DEVICES=3Dy
>> # CONFIG_ACER_WIRELESS is not set
>> # CONFIG_ACERHDF is not set
>> # CONFIG_ASUS_LAPTOP is not set
>> CONFIG_DCDBAS=3Dm
>> CONFIG_DELL_SMBIOS=3Dm
>> CONFIG_DELL_SMBIOS_SMM=3Dy
>> CONFIG_DELL_LAPTOP=3Dm
>> # CONFIG_DELL_SMO8800 is not set
>> # CONFIG_DELL_RBTN is not set
>> # CONFIG_DELL_RBU is not set
>> # CONFIG_FUJITSU_LAPTOP is not set
>> # CONFIG_FUJITSU_TABLET is not set
>> CONFIG_AMILO_RFKILL=3Dm
>> # CONFIG_GPD_POCKET_FAN is not set
>> # CONFIG_HP_ACCEL is not set
>> # CONFIG_HP_WIRELESS is not set
>> # CONFIG_MSI_LAPTOP is not set
>> # CONFIG_PANASONIC_LAPTOP is not set
>> # CONFIG_COMPAL_LAPTOP is not set
>> # CONFIG_SONY_LAPTOP is not set
>> # CONFIG_IDEAPAD_LAPTOP is not set
>> # CONFIG_THINKPAD_ACPI is not set
>> CONFIG_SENSORS_HDAPS=3Dm
>> # CONFIG_INTEL_MENLOW is not set
>> # CONFIG_EEEPC_LAPTOP is not set
>> # CONFIG_ASUS_WIRELESS is not set
>> # CONFIG_ACPI_WMI is not set
>> # CONFIG_TOPSTAR_LAPTOP is not set
>> # CONFIG_TOSHIBA_BT_RFKILL is not set
>> # CONFIG_TOSHIBA_HAPS is not set
>> # CONFIG_ACPI_CMPC is not set
>> # CONFIG_INTEL_INT0002_VGPIO is not set
>> # CONFIG_INTEL_HID_EVENT is not set
>> # CONFIG_INTEL_VBTN is not set
>> # CONFIG_INTEL_IPS is not set
>> CONFIG_INTEL_PMC_CORE=3Dm
>> CONFIG_IBM_RTL=3Dm
>> # CONFIG_SAMSUNG_LAPTOP is not set
>> # CONFIG_INTEL_OAKTRAIL is not set
>> # CONFIG_SAMSUNG_Q10 is not set
>> # CONFIG_APPLE_GMUX is not set
>> # CONFIG_INTEL_RST is not set
>> # CONFIG_INTEL_SMARTCONNECT is not set
>> # CONFIG_INTEL_PMC_IPC is not set
>> # CONFIG_SURFACE_PRO3_BUTTON is not set
>> CONFIG_INTEL_PUNIT_IPC=3Dy
>> # CONFIG_MLX_PLATFORM is not set
>> # CONFIG_I2C_MULTI_INSTANTIATE is not set
>> CONFIG_INTEL_ATOMISP2_PM=3Dm
>> CONFIG_PMC_ATOM=3Dy
>> CONFIG_CHROME_PLATFORMS=3Dy
>> # CONFIG_CHROMEOS_LAPTOP is not set
>> CONFIG_CHROMEOS_PSTORE=3Dm
>> # CONFIG_CHROMEOS_TBMC is not set
>> CONFIG_CROS_EC_CTL=3Dm
>> CONFIG_CROS_EC_I2C=3Dm
>> # CONFIG_CROS_EC_LPC is not set
>> CONFIG_CROS_EC_PROTO=3Dy
>> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
>> # CONFIG_MELLANOX_PLATFORM is not set
>> CONFIG_CLKDEV_LOOKUP=3Dy
>> CONFIG_HAVE_CLK_PREPARE=3Dy
>> CONFIG_COMMON_CLK=3Dy
>>
>> #
>> # Common Clock Framework
>> #
>> CONFIG_COMMON_CLK_WM831X=3Dm
>> CONFIG_CLK_HSDK=3Dy
>> CONFIG_COMMON_CLK_MAX77686=3Dy
>> # CONFIG_COMMON_CLK_MAX9485 is not set
>> CONFIG_COMMON_CLK_RK808=3Dm
>> CONFIG_COMMON_CLK_SI5351=3Dm
>> CONFIG_COMMON_CLK_SI514=3Dm
>> CONFIG_COMMON_CLK_SI544=3Dy
>> # CONFIG_COMMON_CLK_SI570 is not set
>> CONFIG_COMMON_CLK_CDCE706=3Dy
>> # CONFIG_COMMON_CLK_CDCE925 is not set
>> CONFIG_COMMON_CLK_CS2000_CP=3Dm
>> CONFIG_COMMON_CLK_S2MPS11=3Dm
>> CONFIG_CLK_TWL6040=3Dy
>> CONFIG_COMMON_CLK_PWM=3Dm
>> # CONFIG_COMMON_CLK_VC5 is not set
>> CONFIG_HWSPINLOCK=3Dy
>>
>> #
>> # Clock Source drivers
>> #
>> CONFIG_CLKEVT_I8253=3Dy
>> CONFIG_I8253_LOCK=3Dy
>> CONFIG_CLKBLD_I8253=3Dy
>> CONFIG_MAILBOX=3Dy
>> CONFIG_PLATFORM_MHU=3Dy
>> # CONFIG_PCC is not set
>> CONFIG_ALTERA_MBOX=3Dm
>> # CONFIG_MAILBOX_TEST is not set
>> # CONFIG_IOMMU_SUPPORT is not set
>>
>> #
>> # Remoteproc drivers
>> #
>> CONFIG_REMOTEPROC=3Dm
>>
>> #
>> # Rpmsg drivers
>> #
>> CONFIG_RPMSG=3Dm
>> CONFIG_RPMSG_CHAR=3Dm
>> CONFIG_RPMSG_QCOM_GLINK_NATIVE=3Dm
>> CONFIG_RPMSG_QCOM_GLINK_RPM=3Dm
>> # CONFIG_RPMSG_VIRTIO is not set
>> CONFIG_SOUNDWIRE=3Dy
>>
>> #
>> # SoundWire Devices
>> #
>>
>> #
>> # SOC (System On Chip) specific Drivers
>> #
>>
>> #
>> # Amlogic SoC drivers
>> #
>>
>> #
>> # Broadcom SoC drivers
>> #
>>
>> #
>> # NXP/Freescale QorIQ SoC drivers
>> #
>>
>> #
>> # i.MX SoC drivers
>> #
>>
>> #
>> # Qualcomm SoC drivers
>> #
>> CONFIG_SOC_TI=3Dy
>>
>> #
>> # Xilinx SoC drivers
>> #
>> CONFIG_XILINX_VCU=3Dm
>> # CONFIG_PM_DEVFREQ is not set
>> CONFIG_EXTCON=3Dy
>>
>> #
>> # Extcon Device Drivers
>> #
>> # CONFIG_EXTCON_ADC_JACK is not set
>> # CONFIG_EXTCON_AXP288 is not set
>> # CONFIG_EXTCON_GPIO is not set
>> # CONFIG_EXTCON_INTEL_INT3496 is not set
>> CONFIG_EXTCON_MAX3355=3Dy
>> # CONFIG_EXTCON_MAX77843 is not set
>> CONFIG_EXTCON_MAX8997=3Dy
>> CONFIG_EXTCON_RT8973A=3Dm
>> CONFIG_EXTCON_SM5502=3Dy
>> CONFIG_EXTCON_USB_GPIO=3Dy
>> # CONFIG_EXTCON_USBC_CROS_EC is not set
>> # CONFIG_MEMORY is not set
>> CONFIG_IIO=3Dy
>> CONFIG_IIO_BUFFER=3Dy
>> CONFIG_IIO_BUFFER_CB=3Dy
>> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
>> CONFIG_IIO_KFIFO_BUF=3Dy
>> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
>> CONFIG_IIO_CONFIGFS=3Dm
>> CONFIG_IIO_TRIGGER=3Dy
>> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
>> CONFIG_IIO_SW_DEVICE=3Dm
>> CONFIG_IIO_SW_TRIGGER=3Dm
>>
>> #
>> # Accelerometers
>> #
>> CONFIG_ADXL345=3Dy
>> CONFIG_ADXL345_I2C=3Dy
>> CONFIG_ADXL372=3Dm
>> CONFIG_ADXL372_I2C=3Dm
>> CONFIG_BMA180=3Dy
>> CONFIG_BMC150_ACCEL=3Dy
>> CONFIG_BMC150_ACCEL_I2C=3Dy
>> # CONFIG_DA280 is not set
>> CONFIG_DA311=3Dm
>> CONFIG_DMARD06=3Dy
>> CONFIG_DMARD09=3Dm
>> # CONFIG_DMARD10 is not set
>> # CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
>> CONFIG_IIO_ST_ACCEL_3AXIS=3Dm
>> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dm
>> CONFIG_KXSD9=3Dy
>> CONFIG_KXSD9_I2C=3Dy
>> CONFIG_KXCJK1013=3Dy
>> CONFIG_MC3230=3Dm
>> CONFIG_MMA7455=3Dy
>> CONFIG_MMA7455_I2C=3Dy
>> # CONFIG_MMA7660 is not set
>> CONFIG_MMA8452=3Dm
>> CONFIG_MMA9551_CORE=3Dm
>> # CONFIG_MMA9551 is not set
>> CONFIG_MMA9553=3Dm
>> # CONFIG_MXC4005 is not set
>> # CONFIG_MXC6255 is not set
>> CONFIG_STK8312=3Dy
>> # CONFIG_STK8BA50 is not set
>>
>> #
>> # Analog to digital converters
>> #
>> # CONFIG_AD7291 is not set
>> # CONFIG_AD799X is not set
>> CONFIG_AXP20X_ADC=3Dy
>> CONFIG_AXP288_ADC=3Dy
>> CONFIG_CC10001_ADC=3Dm
>> # CONFIG_DA9150_GPADC is not set
>> CONFIG_ENVELOPE_DETECTOR=3Dy
>> # CONFIG_HX711 is not set
>> # CONFIG_INA2XX_ADC is not set
>> CONFIG_LP8788_ADC=3Dm
>> CONFIG_LTC2471=3Dm
>> # CONFIG_LTC2485 is not set
>> # CONFIG_LTC2497 is not set
>> # CONFIG_MAX1363 is not set
>> # CONFIG_MAX9611 is not set
>> CONFIG_MCP3422=3Dm
>> CONFIG_MEN_Z188_ADC=3Dm
>> # CONFIG_NAU7802 is not set
>> # CONFIG_SD_ADC_MODULATOR is not set
>> CONFIG_TI_ADC081C=3Dm
>> CONFIG_TI_ADS1015=3Dy
>> # CONFIG_VF610_ADC is not set
>>
>> #
>> # Analog Front Ends
>> #
>> CONFIG_IIO_RESCALE=3Dy
>>
>> #
>> # Amplifiers
>> #
>>
>> #
>> # Chemical Sensors
>> #
>> # CONFIG_ATLAS_PH_SENSOR is not set
>> CONFIG_BME680=3Dm
>> CONFIG_BME680_I2C=3Dm
>> CONFIG_CCS811=3Dy
>> CONFIG_IAQCORE=3Dm
>> # CONFIG_VZ89X is not set
>> # CONFIG_IIO_CROS_EC_SENSORS_CORE is not set
>>
>> #
>> # Hid Sensor IIO Common
>> #
>> CONFIG_IIO_MS_SENSORS_I2C=3Dm
>>
>> #
>> # SSP Sensor Common
>> #
>> CONFIG_IIO_ST_SENSORS_I2C=3Dy
>> CONFIG_IIO_ST_SENSORS_CORE=3Dy
>>
>> #
>> # Counters
>> #
>>
>> #
>> # Digital to analog converters
>> #
>> # CONFIG_AD5064 is not set
>> CONFIG_AD5380=3Dy
>> CONFIG_AD5446=3Dy
>> CONFIG_AD5592R_BASE=3Dm
>> CONFIG_AD5593R=3Dm
>> CONFIG_AD5686=3Dy
>> CONFIG_AD5696_I2C=3Dy
>> CONFIG_DPOT_DAC=3Dm
>> CONFIG_DS4424=3Dm
>> CONFIG_M62332=3Dy
>> # CONFIG_MAX517 is not set
>> # CONFIG_MAX5821 is not set
>> # CONFIG_MCP4725 is not set
>> CONFIG_TI_DAC5571=3Dy
>> CONFIG_VF610_DAC=3Dy
>>
>> #
>> # IIO dummy driver
>> #
>> CONFIG_IIO_SIMPLE_DUMMY=3Dm
>> # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
>> # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
>>
>> #
>> # Frequency Synthesizers DDS/PLL
>> #
>>
>> #
>> # Clock Generator/Distribution
>> #
>>
>> #
>> # Phase-Locked Loop (PLL) frequency synthesizers
>> #
>>
>> #
>> # Digital gyroscope sensors
>> #
>> CONFIG_BMG160=3Dm
>> CONFIG_BMG160_I2C=3Dm
>> # CONFIG_MPU3050_I2C is not set
>> # CONFIG_IIO_ST_GYRO_3AXIS is not set
>> CONFIG_ITG3200=3Dm
>>
>> #
>> # Health Sensors
>> #
>>
>> #
>> # Heart Rate Monitors
>> #
>> CONFIG_AFE4404=3Dy
>> CONFIG_MAX30100=3Dm
>> CONFIG_MAX30102=3Dy
>>
>> #
>> # Humidity sensors
>> #
>> CONFIG_AM2315=3Dy
>> CONFIG_DHT11=3Dm
>> # CONFIG_HDC100X is not set
>> CONFIG_HTS221=3Dy
>> CONFIG_HTS221_I2C=3Dy
>> # CONFIG_HTU21 is not set
>> CONFIG_SI7005=3Dm
>> CONFIG_SI7020=3Dm
>>
>> #
>> # Inertial measurement units
>> #
>> # CONFIG_BMI160_I2C is not set
>> CONFIG_KMX61=3Dy
>> CONFIG_INV_MPU6050_IIO=3Dm
>> CONFIG_INV_MPU6050_I2C=3Dm
>> CONFIG_IIO_ST_LSM6DSX=3Dm
>> CONFIG_IIO_ST_LSM6DSX_I2C=3Dm
>>
>> #
>> # Light sensors
>> #
>> # CONFIG_ACPI_ALS is not set
>> # CONFIG_ADJD_S311 is not set
>> # CONFIG_AL3320A is not set
>> CONFIG_APDS9300=3Dm
>> CONFIG_APDS9960=3Dy
>> # CONFIG_BH1750 is not set
>> CONFIG_BH1780=3Dm
>> CONFIG_CM32181=3Dm
>> CONFIG_CM3232=3Dm
>> CONFIG_CM3323=3Dm
>> # CONFIG_CM3605 is not set
>> CONFIG_CM36651=3Dy
>> CONFIG_GP2AP020A00F=3Dy
>> CONFIG_SENSORS_ISL29018=3Dy
>> CONFIG_SENSORS_ISL29028=3Dm
>> CONFIG_ISL29125=3Dm
>> CONFIG_JSA1212=3Dy
>> CONFIG_RPR0521=3Dy
>> # CONFIG_LTR501 is not set
>> # CONFIG_LV0104CS is not set
>> CONFIG_MAX44000=3Dy
>> CONFIG_OPT3001=3Dy
>> CONFIG_PA12203001=3Dm
>> # CONFIG_SI1133 is not set
>> # CONFIG_SI1145 is not set
>> # CONFIG_STK3310 is not set
>> CONFIG_ST_UVIS25=3Dy
>> CONFIG_ST_UVIS25_I2C=3Dy
>> CONFIG_TCS3414=3Dy
>> CONFIG_TCS3472=3Dy
>> CONFIG_SENSORS_TSL2563=3Dm
>> CONFIG_TSL2583=3Dm
>> # CONFIG_TSL2772 is not set
>> # CONFIG_TSL4531 is not set
>> CONFIG_US5182D=3Dm
>> CONFIG_VCNL4000=3Dm
>> CONFIG_VCNL4035=3Dm
>> # CONFIG_VEML6070 is not set
>> CONFIG_VL6180=3Dy
>> CONFIG_ZOPT2201=3Dy
>>
>> #
>> # Magnetometer sensors
>> #
>> # CONFIG_AK8974 is not set
>> CONFIG_AK8975=3Dy
>> CONFIG_AK09911=3Dy
>> CONFIG_BMC150_MAGN=3Dy
>> CONFIG_BMC150_MAGN_I2C=3Dy
>> CONFIG_MAG3110=3Dm
>> CONFIG_MMC35240=3Dy
>> # CONFIG_IIO_ST_MAGN_3AXIS is not set
>> CONFIG_SENSORS_HMC5843=3Dm
>> CONFIG_SENSORS_HMC5843_I2C=3Dm
>> # CONFIG_SENSORS_RM3100_I2C is not set
>>
>> #
>> # Multiplexers
>> #
>> CONFIG_IIO_MUX=3Dm
>>
>> #
>> # Inclinometer sensors
>> #
>>
>> #
>> # Triggers - standalone
>> #
>> CONFIG_IIO_HRTIMER_TRIGGER=3Dm
>> CONFIG_IIO_INTERRUPT_TRIGGER=3Dm
>> CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dm
>> CONFIG_IIO_SYSFS_TRIGGER=3Dy
>>
>> #
>> # Digital potentiometers
>> #
>> CONFIG_AD5272=3Dy
>> # CONFIG_DS1803 is not set
>> # CONFIG_MCP4018 is not set
>> CONFIG_MCP4531=3Dm
>> CONFIG_TPL0102=3Dy
>>
>> #
>> # Digital potentiostats
>> #
>> CONFIG_LMP91000=3Dy
>>
>> #
>> # Pressure sensors
>> #
>> CONFIG_ABP060MG=3Dm
>> CONFIG_BMP280=3Dm
>> CONFIG_BMP280_I2C=3Dm
>> CONFIG_HP03=3Dm
>> CONFIG_MPL115=3Dm
>> CONFIG_MPL115_I2C=3Dm
>> CONFIG_MPL3115=3Dm
>> CONFIG_MS5611=3Dm
>> CONFIG_MS5611_I2C=3Dm
>> # CONFIG_MS5637 is not set
>> CONFIG_IIO_ST_PRESS=3Dy
>> CONFIG_IIO_ST_PRESS_I2C=3Dy
>> # CONFIG_T5403 is not set
>> # CONFIG_HP206C is not set
>> # CONFIG_ZPA2326 is not set
>>
>> #
>> # Lightning sensors
>> #
>>
>> #
>> # Proximity and distance sensors
>> #
>> CONFIG_ISL29501=3Dm
>> # CONFIG_LIDAR_LITE_V2 is not set
>> CONFIG_RFD77402=3Dm
>> CONFIG_SRF04=3Dm
>> CONFIG_SX9500=3Dy
>> # CONFIG_SRF08 is not set
>> CONFIG_VL53L0X_I2C=3Dm
>>
>> #
>> # Resolver to digital converters
>> #
>>
>> #
>> # Temperature sensors
>> #
>> CONFIG_MLX90614=3Dy
>> # CONFIG_MLX90632 is not set
>> CONFIG_TMP006=3Dm
>> CONFIG_TMP007=3Dy
>> CONFIG_TSYS01=3Dm
>> # CONFIG_TSYS02D is not set
>> CONFIG_NTB=3Dy
>> # CONFIG_NTB_AMD is not set
>> CONFIG_NTB_IDT=3Dm
>> CONFIG_NTB_INTEL=3Dy
>> CONFIG_NTB_SWITCHTEC=3Dy
>> # CONFIG_NTB_PINGPONG is not set
>> CONFIG_NTB_TOOL=3Dy
>> # CONFIG_NTB_PERF is not set
>> # CONFIG_NTB_TRANSPORT is not set
>> CONFIG_VME_BUS=3Dy
>>
>> #
>> # VME Bridge Drivers
>> #
>> CONFIG_VME_CA91CX42=3Dy
>> CONFIG_VME_TSI148=3Dm
>> # CONFIG_VME_FAKE is not set
>>
>> #
>> # VME Board Drivers
>> #
>> # CONFIG_VMIVME_7805 is not set
>>
>> #
>> # VME Device Drivers
>> #
>> # CONFIG_VME_USER is not set
>> CONFIG_PWM=3Dy
>> CONFIG_PWM_SYSFS=3Dy
>> # CONFIG_PWM_CROS_EC is not set
>> CONFIG_PWM_FSL_FTM=3Dy
>> CONFIG_PWM_LP3943=3Dm
>> CONFIG_PWM_LPSS=3Dy
>> CONFIG_PWM_LPSS_PCI=3Dy
>> # CONFIG_PWM_LPSS_PLATFORM is not set
>> # CONFIG_PWM_PCA9685 is not set
>>
>> #
>> # IRQ chip support
>> #
>> CONFIG_IRQCHIP=3Dy
>> CONFIG_ARM_GIC_MAX_NR=3D1
>> CONFIG_MADERA_IRQ=3Dy
>> CONFIG_IPACK_BUS=3Dm
>> # CONFIG_BOARD_TPCI200 is not set
>> # CONFIG_SERIAL_IPOCTAL is not set
>> CONFIG_RESET_CONTROLLER=3Dy
>> CONFIG_RESET_TI_SYSCON=3Dy
>> # CONFIG_FMC is not set
>>
>> #
>> # PHY Subsystem
>> #
>> CONFIG_GENERIC_PHY=3Dy
>> # CONFIG_BCM_KONA_USB2_PHY is not set
>> CONFIG_PHY_CADENCE_DP=3Dy
>> # CONFIG_PHY_CADENCE_SIERRA is not set
>> # CONFIG_PHY_FSL_IMX8MQ_USB is not set
>> CONFIG_PHY_PXA_28NM_HSIC=3Dy
>> # CONFIG_PHY_PXA_28NM_USB2 is not set
>> # CONFIG_PHY_CPCAP_USB is not set
>> # CONFIG_PHY_MAPPHONE_MDM6600 is not set
>> CONFIG_PHY_OCELOT_SERDES=3Dm
>> # CONFIG_POWERCAP is not set
>> CONFIG_MCB=3Dm
>> CONFIG_MCB_PCI=3Dm
>> CONFIG_MCB_LPC=3Dm
>>
>> #
>> # Performance monitor support
>> #
>> CONFIG_RAS=3Dy
>> CONFIG_THUNDERBOLT=3Dm
>>
>> #
>> # Android
>> #
>> CONFIG_ANDROID=3Dy
>> # CONFIG_ANDROID_BINDER_IPC is not set
>> # CONFIG_DAX is not set
>> CONFIG_NVMEM=3Dy
>>
>> #
>> # HW tracing support
>> #
>> CONFIG_STM=3Dy
>> # CONFIG_STM_PROTO_BASIC is not set
>> # CONFIG_STM_PROTO_SYS_T is not set
>> # CONFIG_STM_DUMMY is not set
>> # CONFIG_STM_SOURCE_CONSOLE is not set
>> CONFIG_STM_SOURCE_HEARTBEAT=3Dm
>> CONFIG_INTEL_TH=3Dy
>> # CONFIG_INTEL_TH_PCI is not set
>> # CONFIG_INTEL_TH_ACPI is not set
>> # CONFIG_INTEL_TH_GTH is not set
>> # CONFIG_INTEL_TH_STH is not set
>> # CONFIG_INTEL_TH_MSU is not set
>> # CONFIG_INTEL_TH_PTI is not set
>> CONFIG_INTEL_TH_DEBUG=3Dy
>> CONFIG_FPGA=3Dm
>> CONFIG_ALTERA_PR_IP_CORE=3Dm
>> # CONFIG_ALTERA_PR_IP_CORE_PLAT is not set
>> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
>> CONFIG_FPGA_BRIDGE=3Dm
>> # CONFIG_XILINX_PR_DECOUPLER is not set
>> CONFIG_FPGA_REGION=3Dm
>> # CONFIG_OF_FPGA_REGION is not set
>> CONFIG_FPGA_DFL=3Dm
>> CONFIG_FPGA_DFL_FME=3Dm
>> CONFIG_FPGA_DFL_FME_MGR=3Dm
>> CONFIG_FPGA_DFL_FME_BRIDGE=3Dm
>> # CONFIG_FPGA_DFL_FME_REGION is not set
>> CONFIG_FPGA_DFL_AFU=3Dm
>> CONFIG_FPGA_DFL_PCI=3Dm
>> CONFIG_FSI=3Dy
>> CONFIG_FSI_NEW_DEV_NODE=3Dy
>> CONFIG_FSI_MASTER_GPIO=3Dy
>> CONFIG_FSI_MASTER_HUB=3Dy
>> CONFIG_FSI_SCOM=3Dm
>> CONFIG_FSI_SBEFIFO=3Dm
>> CONFIG_FSI_OCC=3Dm
>> CONFIG_MULTIPLEXER=3Dm
>>
>> #
>> # Multiplexer drivers
>> #
>> CONFIG_MUX_ADG792A=3Dm
>> # CONFIG_MUX_GPIO is not set
>> # CONFIG_MUX_MMIO is not set
>> # CONFIG_UNISYS_VISORBUS is not set
>> CONFIG_SIOX=3Dy
>> CONFIG_SIOX_BUS_GPIO=3Dm
>> CONFIG_SLIMBUS=3Dm
>> # CONFIG_SLIM_QCOM_CTRL is not set
>>
>> #
>> # File systems
>> #
>> CONFIG_DCACHE_WORD_ACCESS=3Dy
>> CONFIG_FS_POSIX_ACL=3Dy
>> CONFIG_EXPORTFS=3Dy
>> # CONFIG_EXPORTFS_BLOCK_OPS is not set
>> CONFIG_FILE_LOCKING=3Dy
>> CONFIG_MANDATORY_FILE_LOCKING=3Dy
>> CONFIG_FS_ENCRYPTION=3Dy
>> CONFIG_FSNOTIFY=3Dy
>> CONFIG_DNOTIFY=3Dy
>> CONFIG_INOTIFY_USER=3Dy
>> # CONFIG_FANOTIFY is not set
>> CONFIG_QUOTA=3Dy
>> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
>> # CONFIG_PRINT_QUOTA_WARNING is not set
>> # CONFIG_QUOTA_DEBUG is not set
>> CONFIG_QUOTA_TREE=3Dm
>> CONFIG_QFMT_V1=3Dy
>> CONFIG_QFMT_V2=3Dm
>> CONFIG_QUOTACTL=3Dy
>> CONFIG_AUTOFS4_FS=3Dm
>> CONFIG_AUTOFS_FS=3Dm
>> # CONFIG_FUSE_FS is not set
>> CONFIG_OVERLAY_FS=3Dy
>> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
>> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
>> CONFIG_OVERLAY_FS_INDEX=3Dy
>> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
>> CONFIG_OVERLAY_FS_METACOPY=3Dy
>>
>> #
>> # Caches
>> #
>> # CONFIG_FSCACHE is not set
>>
>> #
>> # Pseudo filesystems
>> #
>> CONFIG_PROC_FS=3Dy
>> # CONFIG_PROC_KCORE is not set
>> # CONFIG_PROC_VMCORE is not set
>> CONFIG_PROC_SYSCTL=3Dy
>> # CONFIG_PROC_PAGE_MONITOR is not set
>> CONFIG_PROC_CHILDREN=3Dy
>> CONFIG_KERNFS=3Dy
>> CONFIG_SYSFS=3Dy
>> CONFIG_TMPFS=3Dy
>> CONFIG_TMPFS_POSIX_ACL=3Dy
>> CONFIG_TMPFS_XATTR=3Dy
>> CONFIG_HUGETLBFS=3Dy
>> CONFIG_HUGETLB_PAGE=3Dy
>> CONFIG_MEMFD_CREATE=3Dy
>> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
>> CONFIG_CONFIGFS_FS=3Dy
>> CONFIG_MISC_FILESYSTEMS=3Dy
>> CONFIG_ORANGEFS_FS=3Dy
>> # CONFIG_ECRYPT_FS is not set
>> CONFIG_JFFS2_FS=3Dm
>> CONFIG_JFFS2_FS_DEBUG=3D0
>> CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
>> # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
>> CONFIG_JFFS2_SUMMARY=3Dy
>> # CONFIG_JFFS2_FS_XATTR is not set
>> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
>> CONFIG_JFFS2_ZLIB=3Dy
>> # CONFIG_JFFS2_LZO is not set
>> CONFIG_JFFS2_RTIME=3Dy
>> # CONFIG_JFFS2_RUBIN is not set
>> # CONFIG_JFFS2_CMODE_NONE is not set
>> CONFIG_JFFS2_CMODE_PRIORITY=3Dy
>> # CONFIG_JFFS2_CMODE_SIZE is not set
>> # CONFIG_JFFS2_CMODE_FAVOURLZO is not set
>> # CONFIG_UBIFS_FS is not set
>> CONFIG_CRAMFS=3Dm
>> CONFIG_CRAMFS_MTD=3Dy
>> CONFIG_ROMFS_FS=3Dm
>> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
>> CONFIG_ROMFS_ON_MTD=3Dy
>> # CONFIG_PSTORE is not set
>> # CONFIG_NETWORK_FILESYSTEMS is not set
>> CONFIG_NLS=3Dy
>> CONFIG_NLS_DEFAULT=3D"iso8859-1"
>> CONFIG_NLS_CODEPAGE_437=3Dy
>> CONFIG_NLS_CODEPAGE_737=3Dy
>> CONFIG_NLS_CODEPAGE_775=3Dm
>> CONFIG_NLS_CODEPAGE_850=3Dy
>> # CONFIG_NLS_CODEPAGE_852 is not set
>> CONFIG_NLS_CODEPAGE_855=3Dy
>> CONFIG_NLS_CODEPAGE_857=3Dy
>> CONFIG_NLS_CODEPAGE_860=3Dm
>> CONFIG_NLS_CODEPAGE_861=3Dm
>> # CONFIG_NLS_CODEPAGE_862 is not set
>> # CONFIG_NLS_CODEPAGE_863 is not set
>> # CONFIG_NLS_CODEPAGE_864 is not set
>> CONFIG_NLS_CODEPAGE_865=3Dy
>> # CONFIG_NLS_CODEPAGE_866 is not set
>> CONFIG_NLS_CODEPAGE_869=3Dm
>> # CONFIG_NLS_CODEPAGE_936 is not set
>> CONFIG_NLS_CODEPAGE_950=3Dm
>> # CONFIG_NLS_CODEPAGE_932 is not set
>> # CONFIG_NLS_CODEPAGE_949 is not set
>> # CONFIG_NLS_CODEPAGE_874 is not set
>> CONFIG_NLS_ISO8859_8=3Dm
>> # CONFIG_NLS_CODEPAGE_1250 is not set
>> CONFIG_NLS_CODEPAGE_1251=3Dy
>> CONFIG_NLS_ASCII=3Dy
>> CONFIG_NLS_ISO8859_1=3Dm
>> CONFIG_NLS_ISO8859_2=3Dm
>> CONFIG_NLS_ISO8859_3=3Dy
>> CONFIG_NLS_ISO8859_4=3Dy
>> CONFIG_NLS_ISO8859_5=3Dm
>> # CONFIG_NLS_ISO8859_6 is not set
>> # CONFIG_NLS_ISO8859_7 is not set
>> # CONFIG_NLS_ISO8859_9 is not set
>> # CONFIG_NLS_ISO8859_13 is not set
>> CONFIG_NLS_ISO8859_14=3Dy
>> CONFIG_NLS_ISO8859_15=3Dm
>> CONFIG_NLS_KOI8_R=3Dm
>> CONFIG_NLS_KOI8_U=3Dy
>> CONFIG_NLS_MAC_ROMAN=3Dy
>> CONFIG_NLS_MAC_CELTIC=3Dm
>> CONFIG_NLS_MAC_CENTEURO=3Dy
>> CONFIG_NLS_MAC_CROATIAN=3Dy
>> CONFIG_NLS_MAC_CYRILLIC=3Dm
>> # CONFIG_NLS_MAC_GAELIC is not set
>> # CONFIG_NLS_MAC_GREEK is not set
>> CONFIG_NLS_MAC_ICELAND=3Dm
>> CONFIG_NLS_MAC_INUIT=3Dm
>> CONFIG_NLS_MAC_ROMANIAN=3Dm
>> CONFIG_NLS_MAC_TURKISH=3Dm
>> CONFIG_NLS_UTF8=3Dm
>> # CONFIG_DLM is not set
>>
>> #
>> # Security options
>> #
>> CONFIG_KEYS=3Dy
>> CONFIG_PERSISTENT_KEYRINGS=3Dy
>> CONFIG_BIG_KEYS=3Dy
>> # CONFIG_TRUSTED_KEYS is not set
>> CONFIG_ENCRYPTED_KEYS=3Dy
>> CONFIG_KEY_DH_OPERATIONS=3Dy
>> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
>> # CONFIG_SECURITY is not set
>> CONFIG_SECURITYFS=3Dy
>> CONFIG_PAGE_TABLE_ISOLATION=3Dy
>> # CONFIG_FORTIFY_SOURCE is not set
>> # CONFIG_STATIC_USERMODEHELPER is not set
>> CONFIG_DEFAULT_SECURITY_DAC=3Dy
>> CONFIG_DEFAULT_SECURITY=3D""
>> CONFIG_CRYPTO=3Dy
>>
>> #
>> # Crypto core or helper
>> #
>> CONFIG_CRYPTO_ALGAPI=3Dy
>> CONFIG_CRYPTO_ALGAPI2=3Dy
>> CONFIG_CRYPTO_AEAD=3Dy
>> CONFIG_CRYPTO_AEAD2=3Dy
>> CONFIG_CRYPTO_BLKCIPHER=3Dy
>> CONFIG_CRYPTO_BLKCIPHER2=3Dy
>> CONFIG_CRYPTO_HASH=3Dy
>> CONFIG_CRYPTO_HASH2=3Dy
>> CONFIG_CRYPTO_RNG=3Dy
>> CONFIG_CRYPTO_RNG2=3Dy
>> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
>> CONFIG_CRYPTO_AKCIPHER2=3Dy
>> CONFIG_CRYPTO_AKCIPHER=3Dm
>> CONFIG_CRYPTO_KPP2=3Dy
>> CONFIG_CRYPTO_KPP=3Dy
>> CONFIG_CRYPTO_ACOMP2=3Dy
>> # CONFIG_CRYPTO_RSA is not set
>> CONFIG_CRYPTO_DH=3Dy
>> CONFIG_CRYPTO_ECDH=3Dy
>> CONFIG_CRYPTO_MANAGER=3Dy
>> CONFIG_CRYPTO_MANAGER2=3Dy
>> # CONFIG_CRYPTO_USER is not set
>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>> CONFIG_CRYPTO_GF128MUL=3Dy
>> CONFIG_CRYPTO_NULL=3Dy
>> CONFIG_CRYPTO_NULL2=3Dy
>> CONFIG_CRYPTO_PCRYPT=3Dy
>> CONFIG_CRYPTO_WORKQUEUE=3Dy
>> CONFIG_CRYPTO_CRYPTD=3Dy
>> CONFIG_CRYPTO_AUTHENC=3Dy
>> CONFIG_CRYPTO_TEST=3Dm
>> CONFIG_CRYPTO_SIMD=3Dy
>> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
>>
>> #
>> # Authenticated Encryption with Associated Data
>> #
>> CONFIG_CRYPTO_CCM=3Dy
>> CONFIG_CRYPTO_GCM=3Dy
>> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
>> # CONFIG_CRYPTO_AEGIS128 is not set
>> CONFIG_CRYPTO_AEGIS128L=3Dy
>> # CONFIG_CRYPTO_AEGIS256 is not set
>> CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=3Dm
>> # CONFIG_CRYPTO_AEGIS128L_AESNI_SSE2 is not set
>> CONFIG_CRYPTO_AEGIS256_AESNI_SSE2=3Dm
>> # CONFIG_CRYPTO_MORUS640 is not set
>> # CONFIG_CRYPTO_MORUS640_SSE2 is not set
>> CONFIG_CRYPTO_MORUS1280=3Dm
>> CONFIG_CRYPTO_MORUS1280_GLUE=3Dm
>> # CONFIG_CRYPTO_MORUS1280_SSE2 is not set
>> CONFIG_CRYPTO_MORUS1280_AVX2=3Dm
>> CONFIG_CRYPTO_SEQIV=3Dy
>> # CONFIG_CRYPTO_ECHAINIV is not set
>>
>> #
>> # Block modes
>> #
>> CONFIG_CRYPTO_CBC=3Dy
>> # CONFIG_CRYPTO_CFB is not set
>> CONFIG_CRYPTO_CTR=3Dy
>> CONFIG_CRYPTO_CTS=3Dy
>> CONFIG_CRYPTO_ECB=3Dy
>> # CONFIG_CRYPTO_LRW is not set
>> # CONFIG_CRYPTO_OFB is not set
>> CONFIG_CRYPTO_PCBC=3Dm
>> CONFIG_CRYPTO_XTS=3Dy
>> CONFIG_CRYPTO_KEYWRAP=3Dy
>> CONFIG_CRYPTO_NHPOLY1305=3Dm
>> CONFIG_CRYPTO_NHPOLY1305_SSE2=3Dm
>> CONFIG_CRYPTO_NHPOLY1305_AVX2=3Dm
>> # CONFIG_CRYPTO_ADIANTUM is not set
>>
>> #
>> # Hash modes
>> #
>> CONFIG_CRYPTO_CMAC=3Dy
>> CONFIG_CRYPTO_HMAC=3Dy
>> CONFIG_CRYPTO_XCBC=3Dy
>> CONFIG_CRYPTO_VMAC=3Dy
>>
>> #
>> # Digest
>> #
>> CONFIG_CRYPTO_CRC32C=3Dm
>> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
>> CONFIG_CRYPTO_CRC32=3Dm
>> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
>> CONFIG_CRYPTO_CRCT10DIF=3Dy
>> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
>> CONFIG_CRYPTO_GHASH=3Dy
>> CONFIG_CRYPTO_POLY1305=3Dm
>> CONFIG_CRYPTO_POLY1305_X86_64=3Dm
>> CONFIG_CRYPTO_MD4=3Dy
>> # CONFIG_CRYPTO_MD5 is not set
>> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
>> # CONFIG_CRYPTO_RMD128 is not set
>> CONFIG_CRYPTO_RMD160=3Dy
>> CONFIG_CRYPTO_RMD256=3Dy
>> # CONFIG_CRYPTO_RMD320 is not set
>> CONFIG_CRYPTO_SHA1=3Dm
>> CONFIG_CRYPTO_SHA1_SSSE3=3Dm
>> CONFIG_CRYPTO_SHA256_SSSE3=3Dm
>> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
>> CONFIG_CRYPTO_SHA256=3Dy
>> CONFIG_CRYPTO_SHA512=3Dy
>> CONFIG_CRYPTO_SHA3=3Dm
>> CONFIG_CRYPTO_SM3=3Dm
>> # CONFIG_CRYPTO_STREEBOG is not set
>> # CONFIG_CRYPTO_TGR192 is not set
>> # CONFIG_CRYPTO_WP512 is not set
>> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
>>
>> #
>> # Ciphers
>> #
>> CONFIG_CRYPTO_AES=3Dy
>> # CONFIG_CRYPTO_AES_TI is not set
>> CONFIG_CRYPTO_AES_X86_64=3Dy
>> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
>> CONFIG_CRYPTO_ANUBIS=3Dm
>> CONFIG_CRYPTO_ARC4=3Dm
>> # CONFIG_CRYPTO_BLOWFISH is not set
>> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
>> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
>> # CONFIG_CRYPTO_CAMELLIA is not set
>> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
>> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
>> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
>> CONFIG_CRYPTO_CAST_COMMON=3Dy
>> CONFIG_CRYPTO_CAST5=3Dy
>> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
>> CONFIG_CRYPTO_CAST6=3Dy
>> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
>> CONFIG_CRYPTO_DES=3Dy
>> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
>> # CONFIG_CRYPTO_FCRYPT is not set
>> # CONFIG_CRYPTO_KHAZAD is not set
>> # CONFIG_CRYPTO_SALSA20 is not set
>> CONFIG_CRYPTO_CHACHA20=3Dm
>> # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
>> # CONFIG_CRYPTO_SEED is not set
>> CONFIG_CRYPTO_SERPENT=3Dy
>> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm
>> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
>> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
>> CONFIG_CRYPTO_SM4=3Dm
>> CONFIG_CRYPTO_TEA=3Dy
>> CONFIG_CRYPTO_TWOFISH=3Dm
>> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
>> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
>> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
>> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
>>
>> #
>> # Compression
>> #
>> # CONFIG_CRYPTO_DEFLATE is not set
>> CONFIG_CRYPTO_LZO=3Dm
>> CONFIG_CRYPTO_842=3Dm
>> # CONFIG_CRYPTO_LZ4 is not set
>> CONFIG_CRYPTO_LZ4HC=3Dm
>> CONFIG_CRYPTO_ZSTD=3Dy
>>
>> #
>> # Random Number Generation
>> #
>> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
>> CONFIG_CRYPTO_DRBG_MENU=3Dy
>> CONFIG_CRYPTO_DRBG_HMAC=3Dy
>> CONFIG_CRYPTO_DRBG_HASH=3Dy
>> # CONFIG_CRYPTO_DRBG_CTR is not set
>> CONFIG_CRYPTO_DRBG=3Dy
>> CONFIG_CRYPTO_JITTERENTROPY=3Dy
>> CONFIG_CRYPTO_USER_API=3Dy
>> CONFIG_CRYPTO_USER_API_HASH=3Dy
>> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
>> CONFIG_CRYPTO_USER_API_RNG=3Dy
>> # CONFIG_CRYPTO_USER_API_AEAD is not set
>> CONFIG_CRYPTO_HASH_INFO=3Dy
>> # CONFIG_CRYPTO_HW is not set
>> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
>> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dm
>> CONFIG_X509_CERTIFICATE_PARSER=3Dm
>> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dm
>> CONFIG_PKCS7_MESSAGE_PARSER=3Dm
>>
>> #
>> # Certificates for signature checking
>> #
>> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
>> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
>> CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
>> CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
>> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
>> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
>> CONFIG_BINARY_PRINTF=3Dy
>>
>> #
>> # Library routines
>> #
>> CONFIG_BITREVERSE=3Dy
>> CONFIG_RATIONAL=3Dy
>> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>> CONFIG_GENERIC_STRNLEN_USER=3Dy
>> CONFIG_GENERIC_NET_UTILS=3Dy
>> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>> CONFIG_GENERIC_PCI_IOMAP=3Dy
>> CONFIG_GENERIC_IOMAP=3Dy
>> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
>> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
>> CONFIG_CRC_CCITT=3Dy
>> CONFIG_CRC16=3Dy
>> CONFIG_CRC_T10DIF=3Dy
>> CONFIG_CRC_ITU_T=3Dm
>> CONFIG_CRC32=3Dy
>> CONFIG_CRC32_SELFTEST=3Dm
>> # CONFIG_CRC32_SLICEBY8 is not set
>> # CONFIG_CRC32_SLICEBY4 is not set
>> CONFIG_CRC32_SARWATE=3Dy
>> # CONFIG_CRC32_BIT is not set
>> CONFIG_CRC64=3Dy
>> CONFIG_CRC4=3Dy
>> CONFIG_CRC7=3Dm
>> CONFIG_LIBCRC32C=3Dm
>> CONFIG_CRC8=3Dy
>> CONFIG_XXHASH=3Dy
>> # CONFIG_RANDOM32_SELFTEST is not set
>> CONFIG_842_COMPRESS=3Dm
>> CONFIG_842_DECOMPRESS=3Dm
>> CONFIG_ZLIB_INFLATE=3Dy
>> CONFIG_ZLIB_DEFLATE=3Dm
>> CONFIG_LZO_COMPRESS=3Dm
>> CONFIG_LZO_DECOMPRESS=3Dm
>> CONFIG_LZ4HC_COMPRESS=3Dm
>> CONFIG_LZ4_DECOMPRESS=3Dm
>> CONFIG_ZSTD_COMPRESS=3Dy
>> CONFIG_ZSTD_DECOMPRESS=3Dy
>> CONFIG_XZ_DEC=3Dy
>> CONFIG_XZ_DEC_X86=3Dy
>> CONFIG_XZ_DEC_POWERPC=3Dy
>> # CONFIG_XZ_DEC_IA64 is not set
>> # CONFIG_XZ_DEC_ARM is not set
>> CONFIG_XZ_DEC_ARMTHUMB=3Dy
>> CONFIG_XZ_DEC_SPARC=3Dy
>> CONFIG_XZ_DEC_BCJ=3Dy
>> # CONFIG_XZ_DEC_TEST is not set
>> CONFIG_DECOMPRESS_GZIP=3Dy
>> CONFIG_DECOMPRESS_XZ=3Dy
>> CONFIG_GENERIC_ALLOCATOR=3Dy
>> CONFIG_BCH=3Dm
>> CONFIG_BCH_CONST_PARAMS=3Dy
>> CONFIG_TEXTSEARCH=3Dy
>> CONFIG_TEXTSEARCH_KMP=3Dy
>> CONFIG_TEXTSEARCH_BM=3Dy
>> CONFIG_TEXTSEARCH_FSM=3Dy
>> CONFIG_ASSOCIATIVE_ARRAY=3Dy
>> CONFIG_HAS_IOMEM=3Dy
>> CONFIG_HAS_IOPORT_MAP=3Dy
>> CONFIG_HAS_DMA=3Dy
>> CONFIG_NEED_SG_DMA_LENGTH=3Dy
>> CONFIG_NEED_DMA_MAP_STATE=3Dy
>> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
>> CONFIG_SWIOTLB=3Dy
>> CONFIG_SGL_ALLOC=3Dy
>> CONFIG_IOMMU_HELPER=3Dy
>> # CONFIG_CPUMASK_OFFSTACK is not set
>> CONFIG_CPU_RMAP=3Dy
>> CONFIG_DQL=3Dy
>> CONFIG_GLOB=3Dy
>> # CONFIG_GLOB_SELFTEST is not set
>> CONFIG_NLATTR=3Dy
>> CONFIG_CLZ_TAB=3Dy
>> # CONFIG_CORDIC is not set
>> # CONFIG_DDR is not set
>> # CONFIG_IRQ_POLL is not set
>> CONFIG_MPILIB=3Dy
>> CONFIG_LIBFDT=3Dy
>> CONFIG_OID_REGISTRY=3Dm
>> CONFIG_ARCH_HAS_PMEM_API=3Dy
>> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
>> CONFIG_STRING_SELFTEST=3Dy
>>
>> #
>> # Kernel hacking
>> #
>>
>> #
>> # printk and dmesg options
>> #
>> CONFIG_PRINTK_TIME=3Dy
>> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
>> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
>> # CONFIG_BOOT_PRINTK_DELAY is not set
>> # CONFIG_DYNAMIC_DEBUG is not set
>>
>> #
>> # Compile-time checks and compiler options
>> #
>> CONFIG_DEBUG_INFO=3Dy
>> CONFIG_DEBUG_INFO_REDUCED=3Dy
>> # CONFIG_DEBUG_INFO_SPLIT is not set
>> # CONFIG_DEBUG_INFO_DWARF4 is not set
>> # CONFIG_GDB_SCRIPTS is not set
>> # CONFIG_ENABLE_MUST_CHECK is not set
>> CONFIG_FRAME_WARN=3D2048
>> CONFIG_STRIP_ASM_SYMS=3Dy
>> # CONFIG_READABLE_ASM is not set
>> # CONFIG_UNUSED_SYMBOLS is not set
>> # CONFIG_PAGE_OWNER is not set
>> CONFIG_DEBUG_FS=3Dy
>> CONFIG_HEADERS_CHECK=3Dy
>> # CONFIG_DEBUG_SECTION_MISMATCH is not set
>> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> CONFIG_STACK_VALIDATION=3Dy
>> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
>> CONFIG_MAGIC_SYSRQ=3Dy
>> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
>> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
>> CONFIG_DEBUG_KERNEL=3Dy
>>
>> #
>> # Memory Debugging
>> #
>> CONFIG_PAGE_EXTENSION=3Dy
>> CONFIG_DEBUG_PAGEALLOC=3Dy
>> # CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
>> CONFIG_PAGE_POISONING=3Dy
>> CONFIG_PAGE_POISONING_NO_SANITY=3Dy
>> CONFIG_PAGE_POISONING_ZERO=3Dy
>> # CONFIG_DEBUG_PAGE_REF is not set
>> # CONFIG_DEBUG_RODATA_TEST is not set
>> # CONFIG_DEBUG_OBJECTS is not set
>> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>> # CONFIG_DEBUG_KMEMLEAK is not set
>> # CONFIG_DEBUG_STACK_USAGE is not set
>> CONFIG_DEBUG_VM=3Dy
>> # CONFIG_DEBUG_VM_VMACACHE is not set
>> CONFIG_DEBUG_VM_RB=3Dy
>> CONFIG_DEBUG_VM_PGFLAGS=3Dy
>> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
>> # CONFIG_DEBUG_VIRTUAL is not set
>> # CONFIG_DEBUG_MEMORY_INIT is not set
>> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
>> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
>> # CONFIG_DEBUG_STACKOVERFLOW is not set
>> CONFIG_HAVE_ARCH_KASAN=3Dy
>> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
>> CONFIG_ARCH_HAS_KCOV=3Dy
>> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
>> # CONFIG_KCOV is not set
>> # CONFIG_DEBUG_SHIRQ is not set
>>
>> #
>> # Debug Lockups and Hangs
>> #
>> CONFIG_LOCKUP_DETECTOR=3Dy
>> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
>> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
>> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
>> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
>> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
>> CONFIG_HARDLOCKUP_DETECTOR=3Dy
>> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
>> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
>> # CONFIG_DETECT_HUNG_TASK is not set
>> # CONFIG_WQ_WATCHDOG is not set
>> # CONFIG_PANIC_ON_OOPS is not set
>> CONFIG_PANIC_ON_OOPS_VALUE=3D0
>> CONFIG_PANIC_TIMEOUT=3D0
>> # CONFIG_SCHED_DEBUG is not set
>> CONFIG_SCHED_INFO=3Dy
>> CONFIG_SCHEDSTATS=3Dy
>> # CONFIG_SCHED_STACK_END_CHECK is not set
>> CONFIG_DEBUG_TIMEKEEPING=3Dy
>> CONFIG_DEBUG_PREEMPT=3Dy
>>
>> #
>> # Lock Debugging (spinlocks, mutexes, etc...)
>> #
>> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
>> CONFIG_PROVE_LOCKING=3Dy
>> # CONFIG_LOCK_STAT is not set
>> CONFIG_DEBUG_RT_MUTEXES=3Dy
>> CONFIG_DEBUG_SPINLOCK=3Dy
>> CONFIG_DEBUG_MUTEXES=3Dy
>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
>> CONFIG_DEBUG_RWSEMS=3Dy
>> CONFIG_DEBUG_LOCK_ALLOC=3Dy
>> CONFIG_LOCKDEP=3Dy
>> CONFIG_DEBUG_LOCKDEP=3Dy
>> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
>> CONFIG_LOCK_TORTURE_TEST=3Dm
>> CONFIG_WW_MUTEX_SELFTEST=3Dy
>> CONFIG_TRACE_IRQFLAGS=3Dy
>> CONFIG_STACKTRACE=3Dy
>> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
>> # CONFIG_DEBUG_KOBJECT is not set
>> CONFIG_DEBUG_BUGVERBOSE=3Dy
>> # CONFIG_DEBUG_LIST is not set
>> CONFIG_DEBUG_PI_LIST=3Dy
>> # CONFIG_DEBUG_SG is not set
>> # CONFIG_DEBUG_NOTIFIERS is not set
>> # CONFIG_DEBUG_CREDENTIALS is not set
>>
>> #
>> # RCU Debugging
>> #
>> CONFIG_PROVE_RCU=3Dy
>> CONFIG_TORTURE_TEST=3Dm
>> CONFIG_RCU_PERF_TEST=3Dm
>> CONFIG_RCU_TORTURE_TEST=3Dm
>> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
>> # CONFIG_RCU_TRACE is not set
>> # CONFIG_RCU_EQS_DEBUG is not set
>> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
>> CONFIG_CPU_HOTPLUG_STATE_CONTROL=3Dy
>> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
>> CONFIG_FAULT_INJECTION=3Dy
>> CONFIG_FAIL_PAGE_ALLOC=3Dy
>> # CONFIG_FAIL_FUTEX is not set
>> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
>> CONFIG_FAIL_MMC_REQUEST=3Dy
>> # CONFIG_LATENCYTOP is not set
>> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>> CONFIG_NOP_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>> CONFIG_HAVE_FENTRY=3Dy
>> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>> CONFIG_TRACE_CLOCK=3Dy
>> CONFIG_RING_BUFFER=3Dy
>> CONFIG_EVENT_TRACING=3Dy
>> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
>> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
>> CONFIG_TRACING=3Dy
>> CONFIG_TRACING_SUPPORT=3Dy
>> # CONFIG_FTRACE is not set
>> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
>> # CONFIG_DMA_API_DEBUG is not set
>> # CONFIG_RUNTIME_TESTING_MENU is not set
>> # CONFIG_MEMTEST is not set
>> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
>> # CONFIG_SAMPLES is not set
>> CONFIG_HAVE_ARCH_KGDB=3Dy
>> # CONFIG_KGDB is not set
>> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
>> CONFIG_UBSAN=3Dy
>> # CONFIG_UBSAN_SANITIZE_ALL is not set
>> # CONFIG_UBSAN_ALIGNMENT is not set
>> CONFIG_TEST_UBSAN=3Dm
>> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>> CONFIG_STRICT_DEVMEM=3Dy
>> CONFIG_IO_STRICT_DEVMEM=3Dy
>> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>> CONFIG_X86_VERBOSE_BOOTUP=3Dy
>> # CONFIG_EARLY_PRINTK is not set
>> # CONFIG_X86_PTDUMP is not set
>> # CONFIG_DEBUG_WX is not set
>> CONFIG_DOUBLEFAULT=3Dy
>> # CONFIG_DEBUG_TLBFLUSH is not set
>> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
>> CONFIG_IO_DELAY_TYPE_0X80=3D0
>> CONFIG_IO_DELAY_TYPE_0XED=3D1
>> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
>> CONFIG_IO_DELAY_TYPE_NONE=3D3
>> # CONFIG_IO_DELAY_0X80 is not set
>> # CONFIG_IO_DELAY_0XED is not set
>> # CONFIG_IO_DELAY_UDELAY is not set
>> CONFIG_IO_DELAY_NONE=3Dy
>> CONFIG_DEFAULT_IO_DELAY_TYPE=3D3
>> CONFIG_DEBUG_BOOT_PARAMS=3Dy
>> # CONFIG_CPA_DEBUG is not set
>> # CONFIG_OPTIMIZE_INLINING is not set
>> # CONFIG_DEBUG_ENTRY is not set
>> # CONFIG_DEBUG_NMI_SELFTEST is not set
>> CONFIG_X86_DEBUG_FPU=3Dy
>> CONFIG_PUNIT_ATOM_DEBUG=3Dm
>> CONFIG_UNWINDER_ORC=3Dy
>> # CONFIG_UNWINDER_FRAME_POINTER is not set
>> # CONFIG_UNWINDER_GUESS is not set
>

--===============3626484190826959427==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="5.0.0-rc4-00150-gb523ab11"

ZWFybHkgY29uc29sZSBpbiBzZXR1cCBjb2RlClByb2JpbmcgRUREIChlZGQ9b2ZmIHRvIGRpc2Fi
bGUpLi4uIG9rClsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS4wLjAtcmM0LTAwMTUwLWdi
NTIzYWIxIChrYnVpbGRAbGtwLWhzeDAzKSAoZ2NjIHZlcnNpb24gNi41LjAgMjAxODEwMjYgKERl
YmlhbiA2LjUuMC0yKSkgIzEgU01QIFBSRUVNUFQgTW9uIEZlYiAxOCAxNTo1Nzo1NSBDU1QgMjAx
OQpbICAgIDAuMDAwMDAwXSBDb21tYW5kIGxpbmU6IHJvb3Q9L2Rldi9yYW0wIGh1bmdfdGFza19w
YW5pYz0xIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1
X2NwdV9zdGFsbF90aW1lb3V0PTEwMCBuZXQuaWZuYW1lcz0wIHByaW50ay5kZXZrbXNnPW9uIHBh
bmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBs
b2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wIGRyYmQubWlub3JfY291bnQ9OCBzeXN0ZW1k
LmxvZ19sZXZlbD1lcnIgaWdub3JlX2xvZ2xldmVsIGNvbnNvbGU9dHR5MCBlYXJseXByaW50az10
dHlTMCwxMTUyMDAgY29uc29sZT10dHlTMCwxMTUyMDAgdmdhPW5vcm1hbCBydyBsaW5rPS9jZXBo
ZnMva2J1aWxkL3J1bi1xdWV1ZS9rdm0veDg2XzY0LXJhbmRjb25maWctczItMDIxNzIzMTgvbGlu
dXgtZGV2ZWw6Zml4dXAtZWZhZDRlNDc1YzMxMjQ1NmVkYjNjNzg5ZDA5OTZkMTJlZDc0NGMxMzpi
NTIzYWIxYjhjZTU5NTkyY2IzMmQ2MjI1MDMyMTcwNzdjZjA3ZTRkLy52bWxpbnV6LWI1MjNhYjFi
OGNlNTk1OTJjYjMyZDYyMjUwMzIxNzA3N2NmMDdlNGQtMjAxOTAyMTgxNjAwMTItMTA0OnF1YW50
YWwtdm0tcXVhbnRhbC02MDcgYnJhbmNoPWxpbnV4LWRldmVsL2ZpeHVwLWVmYWQ0ZTQ3NWMzMTI0
NTZlZGIzYzc4OWQwOTk2ZDEyZWQ3NDRjMTMgQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1y
YW5kY29uZmlnLXMyLTAyMTcyMzE4L2djYy02L2I1MjNhYjFiOGNlNTk1OTJjYjMyZDYyMjUwMzIx
NzA3N2NmMDdlNGQvdm1saW51ei01LjAuMC1yYzQtMDAxNTAtZ2I1MjNhYjEgZHJiZC5taW5vcl9j
b3VudD04IHJjdXBlcmYuc2h1dGRvd249MApbICAgIDAuMDAwMDAwXSBLRVJORUwgc3VwcG9ydGVk
IGNwdXM6ClsgICAgMC4wMDAwMDBdICAgSW50ZWwgR2VudWluZUludGVsClsgICAgMC4wMDAwMDBd
IHg4Ni9mcHU6IHg4NyBGUFUgd2lsbCB1c2UgRlhTQVZFClsgICAgMC4wMDAwMDBdIEJJT1MtcHJv
dmlkZWQgcGh5c2ljYWwgUkFNIG1hcDoKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4
MDAwMDAwMDAwMDAwMDAwMC0weDAwMDAwMDAwMDAwOWZiZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAw
XSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMDAwMDlmYzAwLTB4MDAwMDAwMDAwMDA5ZmZmZl0g
cmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAwMDBmMDAw
MC0weDAwMDAwMDAwMDAwZmZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDog
W21lbSAweDAwMDAwMDAwMDAxMDAwMDAtMHgwMDAwMDAwMDFmZmRmZmZmXSB1c2FibGUKWyAgICAw
LjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAxZmZlMDAwMC0weDAwMDAwMDAwMWZm
ZmZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAw
ZmVmZmMwMDAtMHgwMDAwMDAwMGZlZmZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9T
LWU4MjA6IFttZW0gMHgwMDAwMDAwMGZmZmMwMDAwLTB4MDAwMDAwMDBmZmZmZmZmZl0gcmVzZXJ2
ZWQKWyAgICAwLjAwMDAwMF0gcHJpbnRrOiBkZWJ1ZzogaWdub3JpbmcgbG9nbGV2ZWwgc2V0dGlu
Zy4KWyAgICAwLjAwMDAwMF0gTlggKEV4ZWN1dGUgRGlzYWJsZSkgcHJvdGVjdGlvbjogYWN0aXZl
ClsgICAgMC4wMDAwMDBdIFNNQklPUyAyLjggcHJlc2VudC4KWyAgICAwLjAwMDAwMF0gRE1JOiBR
RU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAxLjEwLjItMSAwNC8w
MS8yMDE0ClsgICAgMC4wMDAwMDBdIEh5cGVydmlzb3IgZGV0ZWN0ZWQ6IEtWTQpbICAgIDAuMDAw
MDAwXSBrdm0tY2xvY2s6IFVzaW5nIG1zcnMgNGI1NjRkMDEgYW5kIDRiNTY0ZDAwClsgICAgMC4w
MDAwMDBdIGt2bS1jbG9jazogY3B1IDAsIG1zciAyODg3MDAxLCBwcmltYXJ5IGNwdSBjbG9jawpb
ICAgIDAuMDAwMDAwXSBrdm0tY2xvY2s6IHVzaW5nIHNjaGVkIG9mZnNldCBvZiAxNjA1NjYwOTI5
IGN5Y2xlcwpbICAgIDAuMDAwMDA0XSBjbG9ja3NvdXJjZToga3ZtLWNsb2NrOiBtYXNrOiAweGZm
ZmZmZmZmZmZmZmZmZmYgbWF4X2N5Y2xlczogMHgxY2Q0MmU0ZGZmYiwgbWF4X2lkbGVfbnM6IDg4
MTU5MDU5MTQ4MyBucwpbICAgIDAuMDAwMDEwXSB0c2M6IERldGVjdGVkIDIyOTkuOTk2IE1IeiBw
cm9jZXNzb3IKWyAgICAwLjAwMTcyMF0gZTgyMDogdXBkYXRlIFttZW0gMHgwMDAwMDAwMC0weDAw
MDAwZmZmXSB1c2FibGUgPT0+IHJlc2VydmVkClsgICAgMC4wMDE3MjRdIGU4MjA6IHJlbW92ZSBb
bWVtIDB4MDAwYTAwMDAtMHgwMDBmZmZmZl0gdXNhYmxlClsgICAgMC4wMDE3MjldIGxhc3RfcGZu
ID0gMHgxZmZlMCBtYXhfYXJjaF9wZm4gPSAweDQwMDAwMDAwMApbICAgIDAuMDAxNzMzXSB4ODYv
UEFUOiBDb25maWd1cmF0aW9uIFswLTddOiBXQiAgV1QgIFVDLSBVQyAgV0IgIFdUICBVQy0gVUMg
IApbICAgIDAuMDAxNzM2XSBTY2FuIGZvciBTTVAgaW4gW21lbSAweDAwMDAwMDAwLTB4MDAwMDAz
ZmZdClsgICAgMC4wMDE3NTddIFNjYW4gZm9yIFNNUCBpbiBbbWVtIDB4MDAwOWZjMDAtMHgwMDA5
ZmZmZl0KWyAgICAwLjAwMTc3OV0gU2NhbiBmb3IgU01QIGluIFttZW0gMHgwMDBmMDAwMC0weDAw
MGZmZmZmXQpbICAgIDAuMDA2MTM1XSBmb3VuZCBTTVAgTVAtdGFibGUgYXQgW21lbSAweDAwMGY2
YTgwLTB4MDAwZjZhOGZdIG1hcHBlZCBhdCBbKF9fX19wdHJ2YWxfX19fKV0KWyAgICAwLjAwNjEz
OV0gICBtcGM6IGY2YTkwLWY2Yjc0ClsgICAgMC4wMDYxODJdIGNoZWNrOiBTY2FubmluZyAxIGFy
ZWFzIGZvciBsb3cgbWVtb3J5IGNvcnJ1cHRpb24KWyAgICAwLjAwNjE4Nl0gQmFzZSBtZW1vcnkg
dHJhbXBvbGluZSBhdCBbKF9fX19wdHJ2YWxfX19fKV0gOTkwMDAgc2l6ZSAyNDU3NgpbICAgIDAu
MDA2MjM3XSBCUksgWzB4MDM2MDEwMDAsIDB4MDM2MDFmZmZdIFBHVEFCTEUKWyAgICAwLjAwNjI0
MV0gQlJLIFsweDAzNjAyMDAwLCAweDAzNjAyZmZmXSBQR1RBQkxFClsgICAgMC4wMDYyNDNdIEJS
SyBbMHgwMzYwMzAwMCwgMHgwMzYwM2ZmZl0gUEdUQUJMRQpbICAgIDAuMDA2NDAzXSBCUksgWzB4
MDM2MDQwMDAsIDB4MDM2MDRmZmZdIFBHVEFCTEUKWyAgICAwLjAwNjQzMV0gUkFNRElTSzogW21l
bSAweDFlOGM2MDAwLTB4MWZmZGZmZmZdClsgICAgMC4wMDY0NDldIEFDUEk6IEVhcmx5IHRhYmxl
IGNoZWNrc3VtIHZlcmlmaWNhdGlvbiBkaXNhYmxlZApbICAgIDAuMDA2NDkyXSBBQ1BJOiBSU0RQ
IDB4MDAwMDAwMDAwMDBGNjg3MCAwMDAwMTQgKHYwMCBCT0NIUyApClsgICAgMC4wMDY0OTddIEFD
UEk6IFJTRFQgMHgwMDAwMDAwMDFGRkUxOTM2IDAwMDAzMCAodjAxIEJPQ0hTICBCWFBDUlNEVCAw
MDAwMDAwMSBCWFBDIDAwMDAwMDAxKQpbICAgIDAuMDA2NTAzXSBBQ1BJOiBGQUNQIDB4MDAwMDAw
MDAxRkZFMTgwQSAwMDAwNzQgKHYwMSBCT0NIUyAgQlhQQ0ZBQ1AgMDAwMDAwMDEgQlhQQyAwMDAw
MDAwMSkKWyAgICAwLjAwNjUwOV0gQUNQSTogRFNEVCAweDAwMDAwMDAwMUZGRTAwNDAgMDAxN0NB
ICh2MDEgQk9DSFMgIEJYUENEU0RUIDAwMDAwMDAxIEJYUEMgMDAwMDAwMDEpClsgICAgMC4wMDY1
MTNdIEFDUEk6IEZBQ1MgMHgwMDAwMDAwMDFGRkUwMDAwIDAwMDA0MApbICAgIDAuMDA2NTE3XSBB
Q1BJOiBBUElDIDB4MDAwMDAwMDAxRkZFMTg3RSAwMDAwODAgKHYwMSBCT0NIUyAgQlhQQ0FQSUMg
MDAwMDAwMDEgQlhQQyAwMDAwMDAwMSkKWyAgICAwLjAwNjUyMV0gQUNQSTogSFBFVCAweDAwMDAw
MDAwMUZGRTE4RkUgMDAwMDM4ICh2MDEgQk9DSFMgIEJYUENIUEVUIDAwMDAwMDAxIEJYUEMgMDAw
MDAwMDEpClsgICAgMC4wMDY1MjhdIEFDUEk6IExvY2FsIEFQSUMgYWRkcmVzcyAweGZlZTAwMDAw
ClsgICAgMC4wMDY1MzNdIG1hcHBlZCBBUElDIHRvIGZmZmZmZmZmZmY1ZmQwMDAgKCAgICAgICAg
ZmVlMDAwMDApClsgICAgMC4wMDY4NDVdIE5vIE5VTUEgY29uZmlndXJhdGlvbiBmb3VuZApbICAg
IDAuMDA2ODQ4XSBGYWtpbmcgYSBub2RlIGF0IFttZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAw
MDAwMDAxZmZkZmZmZl0KWyAgICAwLjAwNjg1M10gTk9ERV9EQVRBKDApIGFsbG9jYXRlZCBbbWVt
IDB4MWU4YzMwMDAtMHgxZThjNWZmZl0KWyAgICAwLjAwOTYyM10gWm9uZSByYW5nZXM6ClsgICAg
MC4wMDk2MjddICAgRE1BMzIgICAgW21lbSAweDAwMDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMDFm
ZmRmZmZmXQpbICAgIDAuMDA5NjI5XSAgIE5vcm1hbCAgIGVtcHR5ClsgICAgMC4wMDk2MzJdIE1v
dmFibGUgem9uZSBzdGFydCBmb3IgZWFjaCBub2RlClsgICAgMC4wMDk2MzRdIEVhcmx5IG1lbW9y
eSBub2RlIHJhbmdlcwpbICAgIDAuMDA5NjM2XSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDAw
MDAwMTAwMC0weDAwMDAwMDAwMDAwOWVmZmZdClsgICAgMC4wMDk2MzhdICAgbm9kZSAgIDA6IFtt
ZW0gMHgwMDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDAxZmZkZmZmZl0KWyAgICAwLjAwOTY0M10g
WmVyb2VkIHN0cnVjdCBwYWdlIGluIHVuYXZhaWxhYmxlIHJhbmdlczogOTggcGFnZXMKWyAgICAw
LjAwOTY0NF0gSW5pdG1lbSBzZXR1cCBub2RlIDAgW21lbSAweDAwMDAwMDAwMDAwMDEwMDAtMHgw
MDAwMDAwMDFmZmRmZmZmXQpbICAgIDAuMDA5NjQ3XSBPbiBub2RlIDAgdG90YWxwYWdlczogMTMw
OTQyClsgICAgMC4wMDk2NTBdICAgRE1BMzIgem9uZTogMTc5MiBwYWdlcyB1c2VkIGZvciBtZW1t
YXAKWyAgICAwLjAwOTY1Ml0gICBETUEzMiB6b25lOiAyMSBwYWdlcyByZXNlcnZlZApbICAgIDAu
MDA5NjU0XSAgIERNQTMyIHpvbmU6IDEzMDk0MiBwYWdlcywgTElGTyBiYXRjaDozMQpbICAgIDAu
MDEyNDI5XSBBQ1BJOiBQTS1UaW1lciBJTyBQb3J0OiAweDYwOApbICAgIDAuMDEyNDMzXSBBQ1BJ
OiBMb2NhbCBBUElDIGFkZHJlc3MgMHhmZWUwMDAwMApbICAgIDAuMDEyNDM5XSBBQ1BJOiBMQVBJ
Q19OTUkgKGFjcGlfaWRbMHhmZl0gZGZsIGRmbCBsaW50WzB4MV0pClsgICAgMC4wMTI0NzRdIElP
QVBJQ1swXTogYXBpY19pZCAwLCB2ZXJzaW9uIDE3LCBhZGRyZXNzIDB4ZmVjMDAwMDAsIEdTSSAw
LTIzClsgICAgMC4wMTI0ODJdIEFDUEk6IElOVF9TUkNfT1ZSIChidXMgMCBidXNfaXJxIDAgZ2xv
YmFsX2lycSAyIGRmbCBkZmwpClsgICAgMC4wMTI0ODZdIEludDogdHlwZSAwLCBwb2wgMCwgdHJp
ZyAwLCBidXMgMDAsIElSUSAwMCwgQVBJQyBJRCAwLCBBUElDIElOVCAwMgpbICAgIDAuMDEyNDg5
XSBBQ1BJOiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2lycSA1IGdsb2JhbF9pcnEgNSBoaWdoIGxl
dmVsKQpbICAgIDAuMDEyNDkxXSBJbnQ6IHR5cGUgMCwgcG9sIDEsIHRyaWcgMywgYnVzIDAwLCBJ
UlEgMDUsIEFQSUMgSUQgMCwgQVBJQyBJTlQgMDUKWyAgICAwLjAxMjQ5NF0gQUNQSTogSU5UX1NS
Q19PVlIgKGJ1cyAwIGJ1c19pcnEgOSBnbG9iYWxfaXJxIDkgaGlnaCBsZXZlbCkKWyAgICAwLjAx
MjQ5Nl0gSW50OiB0eXBlIDAsIHBvbCAxLCB0cmlnIDMsIGJ1cyAwMCwgSVJRIDA5LCBBUElDIElE
IDAsIEFQSUMgSU5UIDA5ClsgICAgMC4wMTI0OTldIEFDUEk6IElOVF9TUkNfT1ZSIChidXMgMCBi
dXNfaXJxIDEwIGdsb2JhbF9pcnEgMTAgaGlnaCBsZXZlbCkKWyAgICAwLjAxMjUwMl0gSW50OiB0
eXBlIDAsIHBvbCAxLCB0cmlnIDMsIGJ1cyAwMCwgSVJRIDBhLCBBUElDIElEIDAsIEFQSUMgSU5U
IDBhClsgICAgMC4wMTI1MDRdIEFDUEk6IElOVF9TUkNfT1ZSIChidXMgMCBidXNfaXJxIDExIGds
b2JhbF9pcnEgMTEgaGlnaCBsZXZlbCkKWyAgICAwLjAxMjUwN10gSW50OiB0eXBlIDAsIHBvbCAx
LCB0cmlnIDMsIGJ1cyAwMCwgSVJRIDBiLCBBUElDIElEIDAsIEFQSUMgSU5UIDBiClsgICAgMC4w
MTI1MDldIEFDUEk6IElSUTAgdXNlZCBieSBvdmVycmlkZS4KWyAgICAwLjAxMjUxMl0gSW50OiB0
eXBlIDAsIHBvbCAwLCB0cmlnIDAsIGJ1cyAwMCwgSVJRIDAxLCBBUElDIElEIDAsIEFQSUMgSU5U
IDAxClsgICAgMC4wMTI1MTRdIEludDogdHlwZSAwLCBwb2wgMCwgdHJpZyAwLCBidXMgMDAsIElS
USAwMywgQVBJQyBJRCAwLCBBUElDIElOVCAwMwpbICAgIDAuMDEyNTE3XSBJbnQ6IHR5cGUgMCwg
cG9sIDAsIHRyaWcgMCwgYnVzIDAwLCBJUlEgMDQsIEFQSUMgSUQgMCwgQVBJQyBJTlQgMDQKWyAg
ICAwLjAxMjUxOV0gQUNQSTogSVJRNSB1c2VkIGJ5IG92ZXJyaWRlLgpbICAgIDAuMDEyNTIyXSBJ
bnQ6IHR5cGUgMCwgcG9sIDAsIHRyaWcgMCwgYnVzIDAwLCBJUlEgMDYsIEFQSUMgSUQgMCwgQVBJ
QyBJTlQgMDYKWyAgICAwLjAxMjUyNF0gSW50OiB0eXBlIDAsIHBvbCAwLCB0cmlnIDAsIGJ1cyAw
MCwgSVJRIDA3LCBBUElDIElEIDAsIEFQSUMgSU5UIDA3ClsgICAgMC4wMTI1MjddIEludDogdHlw
ZSAwLCBwb2wgMCwgdHJpZyAwLCBidXMgMDAsIElSUSAwOCwgQVBJQyBJRCAwLCBBUElDIElOVCAw
OApbICAgIDAuMDEyNTI5XSBBQ1BJOiBJUlE5IHVzZWQgYnkgb3ZlcnJpZGUuClsgICAgMC4wMTI1
MzFdIEFDUEk6IElSUTEwIHVzZWQgYnkgb3ZlcnJpZGUuClsgICAgMC4wMTI1MzNdIEFDUEk6IElS
UTExIHVzZWQgYnkgb3ZlcnJpZGUuClsgICAgMC4wMTI1MzZdIEludDogdHlwZSAwLCBwb2wgMCwg
dHJpZyAwLCBidXMgMDAsIElSUSAwYywgQVBJQyBJRCAwLCBBUElDIElOVCAwYwpbICAgIDAuMDEy
NTM4XSBJbnQ6IHR5cGUgMCwgcG9sIDAsIHRyaWcgMCwgYnVzIDAwLCBJUlEgMGQsIEFQSUMgSUQg
MCwgQVBJQyBJTlQgMGQKWyAgICAwLjAxMjU0MV0gSW50OiB0eXBlIDAsIHBvbCAwLCB0cmlnIDAs
IGJ1cyAwMCwgSVJRIDBlLCBBUElDIElEIDAsIEFQSUMgSU5UIDBlClsgICAgMC4wMTI1NDRdIElu
dDogdHlwZSAwLCBwb2wgMCwgdHJpZyAwLCBidXMgMDAsIElSUSAwZiwgQVBJQyBJRCAwLCBBUElD
IElOVCAwZgpbICAgIDAuMDEyNTQ3XSBVc2luZyBBQ1BJIChNQURUKSBmb3IgU01QIGNvbmZpZ3Vy
YXRpb24gaW5mb3JtYXRpb24KWyAgICAwLjAxMjU1MF0gQUNQSTogSFBFVCBpZDogMHg4MDg2YTIw
MSBiYXNlOiAweGZlZDAwMDAwClsgICAgMC4wMTI1NTVdIHNtcGJvb3Q6IEFsbG93aW5nIDIgQ1BV
cywgMCBob3RwbHVnIENQVXMKWyAgICAwLjAxMjU1OF0gbWFwcGVkIElPQVBJQyB0byBmZmZmZmZm
ZmZmNWZjMDAwIChmZWMwMDAwMCkKWyAgICAwLjAxMjU4NV0gW21lbSAweDIwMDAwMDAwLTB4ZmVm
ZmJmZmZdIGF2YWlsYWJsZSBmb3IgUENJIGRldmljZXMKWyAgICAwLjAxMjU4N10gQm9vdGluZyBw
YXJhdmlydHVhbGl6ZWQga2VybmVsIG9uIEtWTQpbICAgIDAuMDEyNTkwXSBjbG9ja3NvdXJjZTog
cmVmaW5lZC1qaWZmaWVzOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZmZmYs
IG1heF9pZGxlX25zOiAxOTEwOTY5OTQwMzkxNDE5IG5zClsgICAgMC4xNjQ5ODJdIHNldHVwX3Bl
cmNwdTogTlJfQ1BVUzo2NCBucl9jcHVtYXNrX2JpdHM6NjQgbnJfY3B1X2lkczoyIG5yX25vZGVf
aWRzOjEKWyAgICAwLjE2NTU2OV0gcGVyY3B1OiBFbWJlZGRlZCA1OSBwYWdlcy9jcHUgQChfX19f
cHRydmFsX19fXykgczIwMTkyOCByODE5MiBkMzE1NDQgdTEwNDg1NzYKWyAgICAwLjE2NTU3NV0g
cGNwdS1hbGxvYzogczIwMTkyOCByODE5MiBkMzE1NDQgdTEwNDg1NzYgYWxsb2M9MSoyMDk3MTUy
ClsgICAgMC4xNjU1NzhdIHBjcHUtYWxsb2M6IFswXSAwIDEgClsgICAgMC4xNjU2MDddIEtWTSBz
ZXR1cCBhc3luYyBQRiBmb3IgY3B1IDAKWyAgICAwLjE2NTYxM10ga3ZtLXN0ZWFsdGltZTogY3B1
IDAsIG1zciAxZGMxNTBjMApbICAgIDAuMTY1NjIxXSBCdWlsdCAxIHpvbmVsaXN0cywgbW9iaWxp
dHkgZ3JvdXBpbmcgb24uICBUb3RhbCBwYWdlczogMTI5MTI5ClsgICAgMC4xNjU2MjNdIFBvbGlj
eSB6b25lOiBETUEzMgpbICAgIDAuMTY1NjI4XSBLZXJuZWwgY29tbWFuZCBsaW5lOiByb290PS9k
ZXYvcmFtMCBodW5nX3Rhc2tfcGFuaWM9MSBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19l
bmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAgbmV0LmlmbmFtZXM9MCBw
cmludGsuZGV2a21zZz1vbiBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9n
PXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MCBkcmJkLm1p
bm9yX2NvdW50PTggc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyIGlnbm9yZV9sb2dsZXZlbCBjb25zb2xl
PXR0eTAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5UzAsMTE1MjAwIHZnYT1u
b3JtYWwgcncgbGluaz0vY2VwaGZzL2tidWlsZC9ydW4tcXVldWUva3ZtL3g4Nl82NC1yYW5kY29u
ZmlnLXMyLTAyMTcyMzE4L2xpbnV4LWRldmVsOmZpeHVwLWVmYWQ0ZTQ3NWMzMTI0NTZlZGIzYzc4
OWQwOTk2ZDEyZWQ3NDRjMTM6YjUyM2FiMWI4Y2U1OTU5MmNiMzJkNjIyNTAzMjE3MDc3Y2YwN2U0
ZC8udm1saW51ei1iNTIzYWIxYjhjZTU5NTkyY2IzMmQ2MjI1MDMyMTcwNzdjZjA3ZTRkLTIwMTkw
MjE4MTYwMDEyLTEwNDpxdWFudGFsLXZtLXF1YW50YWwtNjA3IGJyYW5jaD1saW51eC1kZXZlbC9m
aXh1cC1lZmFkNGU0NzVjMzEyNDU2ZWRiM2M3ODlkMDk5NmQxMmVkNzQ0YzEzIEJPT1RfSU1BR0U9
L3BrZy9saW51eC94ODZfNjQtcmFuZGNvbmZpZy1zMi0wMjE3MjMxOC9nY2MtNi9iNTIzYWIxYjhj
ZTU5NTkyY2IzMmQ2MjI1MDMyMTcwNzdjZjA3ZTRkL3ZtbGludXotNS4wLjAtcmM0LTAwMTUwLWdi
NTIzYWIxIGRyYmQubWlub3JfY291bnQ9OCByY3VwZXJmLnNodXRkb3duPTAKWyAgICAwLjE2NTcw
OF0gc3lzcnE6IHN5c3JxIGFsd2F5cyBlbmFibGVkLgpbICAgIDAuMTY2MDE5XSBDYWxnYXJ5OiBk
ZXRlY3RpbmcgQ2FsZ2FyeSB2aWEgQklPUyBFQkRBIGFyZWEKWyAgICAwLjE2NjAyM10gQ2FsZ2Fy
eTogVW5hYmxlIHRvIGxvY2F0ZSBSaW8gR3JhbmRlIHRhYmxlIGluIEVCREEgLSBiYWlsaW5nIQpb
ICAgIDAuMTY3Mjc5XSBNZW1vcnk6IDQ1MjMyOEsvNTIzNzY4SyBhdmFpbGFibGUgKDEyMjkxSyBr
ZXJuZWwgY29kZSwgMTM0NksgcndkYXRhLCAzODcySyByb2RhdGEsIDExMDhLIGluaXQsIDEzODY4
SyBic3MsIDcxNDQwSyByZXNlcnZlZCwgMEsgY21hLXJlc2VydmVkKQpbICAgIDAuMTY3MzAzXSBL
ZXJuZWwvVXNlciBwYWdlIHRhYmxlcyBpc29sYXRpb246IGVuYWJsZWQKWyAgICAwLjE2NzQ5OV0g
UnVubmluZyBSQ1Ugc2VsZiB0ZXN0cwpbICAgIDAuMTY3NTAyXSByY3U6IFByZWVtcHRpYmxlIGhp
ZXJhcmNoaWNhbCBSQ1UgaW1wbGVtZW50YXRpb24uClsgICAgMC4xNjc1MDRdIHJjdTogCVJDVSBs
b2NrZGVwIGNoZWNraW5nIGlzIGVuYWJsZWQuClsgICAgMC4xNjc1MDddIHJjdTogCVJDVSByZXN0
cmljdGluZyBDUFVzIGZyb20gTlJfQ1BVUz02NCB0byBucl9jcHVfaWRzPTIuClsgICAgMC4xNjc1
MDldIAlSQ1UgQ1BVIHN0YWxsIHdhcm5pbmdzIHRpbWVvdXQgc2V0IHRvIDEwMCAocmN1X2NwdV9z
dGFsbF90aW1lb3V0KS4KWyAgICAwLjE2NzUxMV0gCVRhc2tzIFJDVSBlbmFibGVkLgpbICAgIDAu
MTY3NTE0XSByY3U6IFJDVSBjYWxjdWxhdGVkIHZhbHVlIG9mIHNjaGVkdWxlci1lbmxpc3RtZW50
IGRlbGF5IGlzIDEwMCBqaWZmaWVzLgpbICAgIDAuMTY3NTE2XSByY3U6IEFkanVzdGluZyBnZW9t
ZXRyeSBmb3IgcmN1X2Zhbm91dF9sZWFmPTE2LCBucl9jcHVfaWRzPTIKWyAgICAwLjE2Nzc5NF0g
TlJfSVJRUzogNDM1MiwgbnJfaXJxczogNDQwLCBwcmVhbGxvY2F0ZWQgaXJxczogMTYKWyAgICAw
LjE2Nzk4Nl0gcmN1OiAJT2ZmbG9hZCBSQ1UgY2FsbGJhY2tzIGZyb20gQ1BVczogKG5vbmUpLgpb
ICAgIDAuMjgzOTg1XSBwcmludGs6IGNvbnNvbGUgW3R0eVMwXSBlbmFibGVkClsgICAgMC4yODQ0
MjVdIExvY2sgZGVwZW5kZW5jeSB2YWxpZGF0b3I6IENvcHlyaWdodCAoYykgMjAwNiBSZWQgSGF0
LCBJbmMuLCBJbmdvIE1vbG5hcgpbICAgIDAuMjg1MjUyXSAuLi4gTUFYX0xPQ0tERVBfU1VCQ0xB
U1NFUzogIDgKWyAgICAwLjI4NTY2OF0gLi4uIE1BWF9MT0NLX0RFUFRIOiAgICAgICAgICA0OApb
ICAgIDAuMjg2MTExXSAuLi4gTUFYX0xPQ0tERVBfS0VZUzogICAgICAgIDgxOTEKWyAgICAwLjI4
NjU2OV0gLi4uIENMQVNTSEFTSF9TSVpFOiAgICAgICAgICA0MDk2ClsgICAgMC4yODcwMzRdIC4u
LiBNQVhfTE9DS0RFUF9FTlRSSUVTOiAgICAgMzI3NjgKWyAgICAwLjI4NzUwMF0gLi4uIE1BWF9M
T0NLREVQX0NIQUlOUzogICAgICA2NTUzNgpbICAgIDAuMjg3OTY2XSAuLi4gQ0hBSU5IQVNIX1NJ
WkU6ICAgICAgICAgIDMyNzY4ClsgICAgMC4yODg0MzZdICBtZW1vcnkgdXNlZCBieSBsb2NrIGRl
cGVuZGVuY3kgaW5mbzogNzI2MyBrQgpbICAgIDAuMjk3MDY0XSAgcGVyIHRhc2stc3RydWN0IG1l
bW9yeSBmb290cHJpbnQ6IDE5MjAgYnl0ZXMKWyAgICAwLjI5NzY2OV0gQUNQSTogQ29yZSByZXZp
c2lvbiAyMDE4MTIxMwpbICAgIDAuMjk4Mzg2XSBjbG9ja3NvdXJjZTogaHBldDogbWFzazogMHhm
ZmZmZmZmZiBtYXhfY3ljbGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczogMTkxMTI2MDQ0Njcg
bnMKWyAgICAwLjI5OTU1NF0gaHBldCBjbG9ja2V2ZW50IHJlZ2lzdGVyZWQKWyAgICAwLjMwMDA0
Ml0gQVBJQzogU3dpdGNoIHRvIHN5bW1ldHJpYyBJL08gbW9kZSBzZXR1cApbICAgIDAuMzAwNjI4
XSBlbmFibGVkIEV4dElOVCBvbiBDUFUjMApbICAgIDAuMzAxODE5XSBFTkFCTElORyBJTy1BUElD
IElSUXMKWyAgICAwLjMwMjE5MV0gaW5pdCBJT19BUElDIElSUXMKWyAgICAwLjMwMjU0Ml0gIGFw
aWMgMCBwaW4gMCBub3QgY29ubmVjdGVkClsgICAgMC4zMDI5NzZdIElPQVBJQ1swXTogU2V0IHJv
dXRpbmcgZW50cnkgKDAtMSAtPiAweGVmIC0+IElSUSAxIE1vZGU6MCBBY3RpdmU6MCBEZXN0OjEp
ClsgICAgMC4zMDM4NjZdIElPQVBJQ1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAtMiAtPiAweDMw
IC0+IElSUSAwIE1vZGU6MCBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4zMDQ3MjhdIElPQVBJQ1sw
XTogU2V0IHJvdXRpbmcgZW50cnkgKDAtMyAtPiAweGVmIC0+IElSUSAzIE1vZGU6MCBBY3RpdmU6
MCBEZXN0OjEpClsgICAgMC4zMDU1OThdIElPQVBJQ1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAt
NCAtPiAweGVmIC0+IElSUSA0IE1vZGU6MCBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4zMDY0Mjdd
IElPQVBJQ1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAtNSAtPiAweGVmIC0+IElSUSA1IE1vZGU6
MSBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4zMDcyNzldIElPQVBJQ1swXTogU2V0IHJvdXRpbmcg
ZW50cnkgKDAtNiAtPiAweGVmIC0+IElSUSA2IE1vZGU6MCBBY3RpdmU6MCBEZXN0OjEpClsgICAg
MC4zMDgxMjZdIElPQVBJQ1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAtNyAtPiAweGVmIC0+IElS
USA3IE1vZGU6MCBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4zMDkwMDJdIElPQVBJQ1swXTogU2V0
IHJvdXRpbmcgZW50cnkgKDAtOCAtPiAweGVmIC0+IElSUSA4IE1vZGU6MCBBY3RpdmU6MCBEZXN0
OjEpClsgICAgMC4zMDk4NDRdIElPQVBJQ1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAtOSAtPiAw
eGVmIC0+IElSUSA5IE1vZGU6MSBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4zMTA2OTFdIElPQVBJ
Q1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAtMTAgLT4gMHhlZiAtPiBJUlEgMTAgTW9kZToxIEFj
dGl2ZTowIERlc3Q6MSkKWyAgICAwLjMxMTU0OV0gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRy
eSAoMC0xMSAtPiAweGVmIC0+IElSUSAxMSBNb2RlOjEgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAu
MzEyMzkyXSBJT0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTEyIC0+IDB4ZWYgLT4gSVJR
IDEyIE1vZGU6MCBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4zMTMyNThdIElPQVBJQ1swXTogU2V0
IHJvdXRpbmcgZW50cnkgKDAtMTMgLT4gMHhlZiAtPiBJUlEgMTMgTW9kZTowIEFjdGl2ZTowIERl
c3Q6MSkKWyAgICAwLjMxNDExN10gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC0xNCAt
PiAweGVmIC0+IElSUSAxNCBNb2RlOjAgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMzE0OTcxXSBJ
T0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTE1IC0+IDB4ZWYgLT4gSVJRIDE1IE1vZGU6
MCBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4zMTU4MjRdICBhcGljIDAgcGluIDE2IG5vdCBjb25u
ZWN0ZWQKWyAgICAwLjMxNjI0Ml0gIGFwaWMgMCBwaW4gMTcgbm90IGNvbm5lY3RlZApbICAgIDAu
MzE2NjY5XSAgYXBpYyAwIHBpbiAxOCBub3QgY29ubmVjdGVkClsgICAgMC4zMTcxMjddICBhcGlj
IDAgcGluIDE5IG5vdCBjb25uZWN0ZWQKWyAgICAwLjMxNzU2MF0gIGFwaWMgMCBwaW4gMjAgbm90
IGNvbm5lY3RlZApbICAgIDAuMzE3OTcxXSAgYXBpYyAwIHBpbiAyMSBub3QgY29ubmVjdGVkClsg
ICAgMC4zMTgzOTBdICBhcGljIDAgcGluIDIyIG5vdCBjb25uZWN0ZWQKWyAgICAwLjMxODgxNl0g
IGFwaWMgMCBwaW4gMjMgbm90IGNvbm5lY3RlZApbICAgIDAuMzE5MzQ4XSAuLlRJTUVSOiB2ZWN0
b3I9MHgzMCBhcGljMT0wIHBpbjE9MiBhcGljMj0tMSBwaW4yPS0xClsgICAgMC4zMjAwMTFdIGNs
b2Nrc291cmNlOiB0c2MtZWFybHk6IG1hc2s6IDB4ZmZmZmZmZmZmZmZmZmZmZiBtYXhfY3ljbGVz
OiAweDIxMjczMWE1MzAxLCBtYXhfaWRsZV9uczogNDQwNzk1MzE3MTIzIG5zClsgICAgMC4zMjEx
NTBdIENhbGlicmF0aW5nIGRlbGF5IGxvb3AgKHNraXBwZWQpIHByZXNldCB2YWx1ZS4uIDQ1OTku
OTkgQm9nb01JUFMgKGxwaj0yMjk5OTk2KQpbICAgIDAuMzIyMTM0XSBwaWRfbWF4OiBkZWZhdWx0
OiA0MDk2IG1pbmltdW06IDMwMQpbICAgIDAuMzIzNDk5XSBEZW50cnkgY2FjaGUgaGFzaCB0YWJs
ZSBlbnRyaWVzOiA2NTUzNiAob3JkZXI6IDcsIDUyNDI4OCBieXRlcykKWyAgICAwLjMyNDI5OV0g
SW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAzMjc2OCAob3JkZXI6IDYsIDI2MjE0NCBi
eXRlcykKWyAgICAwLjMyNTE0OV0gTW91bnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMDI0
IChvcmRlcjogMSwgODE5MiBieXRlcykKWyAgICAwLjMyNTg0MV0gTW91bnRwb2ludC1jYWNoZSBo
YXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAxLCA4MTkyIGJ5dGVzKQpbICAgIDAuMzI3
MjE2XSBudW1hX2FkZF9jcHUgY3B1IDAgbm9kZSAwOiBtYXNrIG5vdyAwClsgICAgMC4zMjc3Mjdd
IExhc3QgbGV2ZWwgaVRMQiBlbnRyaWVzOiA0S0IgMCwgMk1CIDAsIDRNQiAwClsgICAgMC4zMjgx
MzRdIExhc3QgbGV2ZWwgZFRMQiBlbnRyaWVzOiA0S0IgMCwgMk1CIDAsIDRNQiAwLCAxR0IgMApb
ICAgIDAuMzI4NzU3XSBTcGVjdHJlIFYyIDogTWl0aWdhdGlvbjogRnVsbCBnZW5lcmljIHJldHBv
bGluZQpbICAgIDAuMzI5MTMzXSBTcGVjdHJlIFYyIDogU3BlY3RyZSB2MiAvIFNwZWN0cmVSU0Ig
bWl0aWdhdGlvbjogRmlsbGluZyBSU0Igb24gY29udGV4dCBzd2l0Y2gKWyAgICAwLjMzMDE0MF0g
U3BlY3VsYXRpdmUgU3RvcmUgQnlwYXNzOiBWdWxuZXJhYmxlClsgICAgMC4zMzA3MzddIEZyZWVp
bmcgU01QIGFsdGVybmF0aXZlcyBtZW1vcnk6IDIwSwpbICAgIDAuMzMxNDQ3XSBVc2luZyBsb2Nh
bCBBUElDIHRpbWVyIGludGVycnVwdHMuClsgICAgMC4zMzE0NDddIGNhbGlicmF0aW5nIEFQSUMg
dGltZXIgLi4uClsgICAgMC4zMzMxMjldIC4uLiBsYXBpYyBkZWx0YSA9IDc5OTk2NTQKWyAgICAw
LjMzMzEyOV0gLi4uIFBNLVRpbWVyIGRlbHRhID0gNDU4MTY2ClsgICAgMC4zMzMxMjldIEFQSUMg
Y2FsaWJyYXRpb24gbm90IGNvbnNpc3RlbnQgd2l0aCBQTS1UaW1lcjogMTI3bXMgaW5zdGVhZCBv
ZiAxMDBtcwpbICAgIDAuMzMzMTI5XSBBUElDIGRlbHRhIGFkanVzdGVkIHRvIFBNLVRpbWVyOiA2
MjQ5OTM1ICg3OTk5NjU0KQpbICAgIDAuMzMzMTI5XSBUU0MgZGVsdGEgYWRqdXN0ZWQgdG8gUE0t
VGltZXI6IDIyOTk5OTE3OSAoMjk0Mzg5MjM0KQpbICAgIDAuMzMzMTI5XSAuLi4uLiBkZWx0YSA2
MjQ5OTM1ClsgICAgMC4zMzMxMjldIC4uLi4uIG11bHQ6IDI2ODQzMjY2NApbICAgIDAuMzMzMTI5
XSAuLi4uLiBjYWxpYnJhdGlvbiByZXN1bHQ6IDk5OTk4OQpbICAgIDAuMzMzMTI5XSAuLi4uLiBD
UFUgY2xvY2sgc3BlZWQgaXMgMjI5OS4wOTkxIE1Iei4KWyAgICAwLjMzMzEyOV0gLi4uLi4gaG9z
dCBidXMgY2xvY2sgc3BlZWQgaXMgOTk5LjA5ODkgTUh6LgpbICAgIDAuMzMzMTc1XSBzbXBib290
OiBDUFUwOiBJbnRlbCBDb21tb24gS1ZNIHByb2Nlc3NvciAoZmFtaWx5OiAweGYsIG1vZGVsOiAw
eDYsIHN0ZXBwaW5nOiAweDEpClsgICAgMC4zNDAxNTddIFBlcmZvcm1hbmNlIEV2ZW50czogdW5z
dXBwb3J0ZWQgTmV0YnVyc3QgQ1BVIG1vZGVsIDYgbm8gUE1VIGRyaXZlciwgc29mdHdhcmUgZXZl
bnRzIG9ubHkuClsgICAgMC4zNDMxNDNdIHJjdTogSGllcmFyY2hpY2FsIFNSQ1UgaW1wbGVtZW50
YXRpb24uClsgICAgMC4zNDUyMzJdIE5NSSB3YXRjaGRvZzogUGVyZiBOTUkgd2F0Y2hkb2cgcGVy
bWFuZW50bHkgZGlzYWJsZWQKWyAgICAwLjM0ODE0Ml0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRh
cnkgQ1BVcyAuLi4KWyAgICAwLjM1NjIwNF0geDg2OiBCb290aW5nIFNNUCBjb25maWd1cmF0aW9u
OgpbICAgIDAuMzU2Njc3XSAuLi4uIG5vZGUgICMwLCBDUFVzOiAgICAgICMxClsgICAgMC4xNDgx
MzZdIGt2bS1jbG9jazogY3B1IDEsIG1zciAyODg3MDQxLCBzZWNvbmRhcnkgY3B1IGNsb2NrClsg
ICAgMC4xNDgxMzZdIG1hc2tlZCBFeHRJTlQgb24gQ1BVIzEKWyAgICAwLjE0ODEzNl0gbnVtYV9h
ZGRfY3B1IGNwdSAxIG5vZGUgMDogbWFzayBub3cgMC0xClsgICAgMC4zNzYyMDFdIEtWTSBzZXR1
cCBhc3luYyBQRiBmb3IgY3B1IDEKWyAgICAwLjM3NjYyNV0ga3ZtLXN0ZWFsdGltZTogY3B1IDEs
IG1zciAxZGQxNTBjMApbICAgIDAuMzc3MTQ4XSBzbXA6IEJyb3VnaHQgdXAgMSBub2RlLCAyIENQ
VXMKWyAgICAwLjM3ODE1NV0gc21wYm9vdDogTWF4IGxvZ2ljYWwgcGFja2FnZXM6IDIKWyAgICAw
LjM3ODYwMF0gc21wYm9vdDogVG90YWwgb2YgMiBwcm9jZXNzb3JzIGFjdGl2YXRlZCAoOTE5OS45
OCBCb2dvTUlQUykKWyAgICAwLjM3OTQ2N10gZGV2dG1wZnM6IGluaXRpYWxpemVkClsgICAgMC4z
ODAzNzBdIHg4Ni9tbTogTWVtb3J5IGJsb2NrIHNpemU6IDEyOE1CClsgICAgMC4zODIyMjddIHdv
cmtxdWV1ZTogcm91bmQtcm9iaW4gQ1BVIHNlbGVjdGlvbiBmb3JjZWQsIGV4cGVjdCBwZXJmb3Jt
YW5jZSBpbXBhY3QKWyAgICAwLjM4MzIxNV0gY2xvY2tzb3VyY2U6IGppZmZpZXM6IG1hc2s6IDB4
ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6IDE5MTEyNjA0NDYy
NzUwMDAgbnMKWyAgICAwLjM4NDE0NV0gZnV0ZXggaGFzaCB0YWJsZSBlbnRyaWVzOiAxNiAob3Jk
ZXI6IC0xLCAyMDQ4IGJ5dGVzKQpbICAgIDAuMzg1MjQ5XSBwaW5jdHJsIGNvcmU6IGluaXRpYWxp
emVkIHBpbmN0cmwgc3Vic3lzdGVtClsgICAgMC4zODY0NzVdIHJlZ3VsYXRvci1kdW1teTogbm8g
cGFyYW1ldGVycwpbICAgIDAuMzg3Mjg4XSByZWd1bGF0b3ItZHVtbXk6IG5vIHBhcmFtZXRlcnMK
WyAgICAwLjM4NzgwNV0gcmVndWxhdG9yLWR1bW15OiBGYWlsZWQgdG8gY3JlYXRlIGRlYnVnZnMg
ZGlyZWN0b3J5ClsgICAgMC4zODgyNTVdIFJUQyB0aW1lOiAxNjowMDoyMiwgZGF0ZTogMjAxOS0w
Mi0xOApbICAgIDAuMzg5MjgxXSByYW5kb206IGdldF9yYW5kb21fdTMyIGNhbGxlZCBmcm9tIGJ1
Y2tldF90YWJsZV9hbGxvYysweDgzLzB4MTUwIHdpdGggY3JuZ19pbml0PTAKWyAgICAwLjM5MDI3
OF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxNgpbICAgIDAuMzkyNDAwXSBhdWRp
dDogaW5pdGlhbGl6aW5nIG5ldGxpbmsgc3Vic3lzIChkaXNhYmxlZCkKWyAgICAwLjM5NDE1NV0g
YXVkaXQ6IHR5cGU9MjAwMCBhdWRpdCgxNTUwNDc2ODIyLjE5OToxKTogc3RhdGU9aW5pdGlhbGl6
ZWQgYXVkaXRfZW5hYmxlZD0wIHJlcz0xClsgICAgMC4zOTUxNjhdIGNwdWlkbGU6IHVzaW5nIGdv
dmVybm9yIGxhZGRlcgpbICAgIDAuMzk2MTcxXSBjcHVpZGxlOiB1c2luZyBnb3Zlcm5vciBtZW51
ClsgICAgMC4zOTcxMzVdIEFDUEk6IGJ1cyB0eXBlIFBDSSByZWdpc3RlcmVkClsgICAgMC4zOTc3
MTFdIGRjYSBzZXJ2aWNlIHN0YXJ0ZWQsIHZlcnNpb24gMS4xMi4xClsgICAgMC4zOTgyNDFdIFBD
STogVXNpbmcgY29uZmlndXJhdGlvbiB0eXBlIDEgZm9yIGJhc2UgYWNjZXNzClsgICAgMC40MTYy
MzZdIEh1Z2VUTEIgcmVnaXN0ZXJlZCAyLjAwIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQg
MCBwYWdlcwpbICAgIDAuNDE3MTY3XSBjcnlwdGQ6IG1heF9jcHVfcWxlbiBzZXQgdG8gMTAwMApb
ICAgIDAuNDE3NzY2XSBBQ1BJOiBBZGRlZCBfT1NJKE1vZHVsZSBEZXZpY2UpClsgICAgMC40MTgx
MzZdIEFDUEk6IEFkZGVkIF9PU0koUHJvY2Vzc29yIERldmljZSkKWyAgICAwLjQxODYwNF0gQUNQ
STogQWRkZWQgX09TSSgzLjAgX1NDUCBFeHRlbnNpb25zKQpbICAgIDAuNDE5MTM0XSBBQ1BJOiBB
ZGRlZCBfT1NJKFByb2Nlc3NvciBBZ2dyZWdhdG9yIERldmljZSkKWyAgICAwLjQyMDEzNF0gQUNQ
STogQWRkZWQgX09TSShMaW51eC1EZWxsLVZpZGVvKQpbICAgIDAuNDIwMTM3XSBBQ1BJOiBBZGRl
ZCBfT1NJKExpbnV4LUxlbm92by1OVi1IRE1JLUF1ZGlvKQpbICAgIDAuNDIwNjkxXSBBQ1BJOiBB
ZGRlZCBfT1NJKExpbnV4LUhQSS1IeWJyaWQtR3JhcGhpY3MpClsgICAgMC40MjQ3NTJdIEFDUEk6
IDEgQUNQSSBBTUwgdGFibGVzIHN1Y2Nlc3NmdWxseSBhY3F1aXJlZCBhbmQgbG9hZGVkClsgICAg
MC40MjgyNDBdIEFDUEk6IEludGVycHJldGVyIGVuYWJsZWQKWyAgICAwLjQyODY3NV0gQUNQSTog
KHN1cHBvcnRzIFMwIFMzIFM1KQpbICAgIDAuNDI5MDc5XSBBQ1BJOiBVc2luZyBJT0FQSUMgZm9y
IGludGVycnVwdCByb3V0aW5nClsgICAgMC40MzAxNzBdIFBDSTogVXNpbmcgaG9zdCBicmlkZ2Ug
d2luZG93cyBmcm9tIEFDUEk7IGlmIG5lY2Vzc2FyeSwgdXNlICJwY2k9bm9jcnMiIGFuZCByZXBv
cnQgYSBidWcKWyAgICAwLjQzMTQ3OV0gQUNQSTogRW5hYmxlZCAzIEdQRXMgaW4gYmxvY2sgMDAg
dG8gMEYKWyAgICAwLjQ1NDcyNF0gQUNQSTogUENJIFJvb3QgQnJpZGdlIFtQQ0kwXSAoZG9tYWlu
IDAwMDAgW2J1cyAwMC1mZl0pClsgICAgMC40NTUxNDNdIGFjcGkgUE5QMEEwMzowMDogX09TQzog
T1Mgc3VwcG9ydHMgW0FTUE0gQ2xvY2tQTSBTZWdtZW50cyBNU0ldClsgICAgMC40NTYyMjBdIGFj
cGkgUE5QMEEwMzowMDogZmFpbCB0byBhZGQgTU1DT05GSUcgaW5mb3JtYXRpb24sIGNhbid0IGFj
Y2VzcyBleHRlbmRlZCBQQ0kgY29uZmlndXJhdGlvbiBzcGFjZSB1bmRlciB0aGlzIGJyaWRnZS4K
WyAgICAwLjQ1ODMzNl0gUENJIGhvc3QgYnJpZGdlIHRvIGJ1cyAwMDAwOjAwClsgICAgMC40NTg3
ODRdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW2lvICAweDAwMDAtMHgwY2Y3
IHdpbmRvd10KWyAgICAwLjQ4MzE0OV0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJj
ZSBbaW8gIDB4MGQwMC0weGZmZmYgd2luZG93XQpbICAgIDAuNDg0MTM2XSBwY2lfYnVzIDAwMDA6
MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHgwMDBhMDAwMC0weDAwMGJmZmZmIHdpbmRvd10K
WyAgICAwLjQ4NDEzNl0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4
MjAwMDAwMDAtMHhmZWJmZmZmZiB3aW5kb3ddClsgICAgMC40ODQ4ODJdIHBjaV9idXMgMDAwMDow
MDogcm9vdCBidXMgcmVzb3VyY2UgW2J1cyAwMC1mZl0KWyAgICAwLjQ4NjIzNV0gcGNpIDAwMDA6
MDA6MDAuMDogWzgwODY6MTIzN10gdHlwZSAwMCBjbGFzcyAweDA2MDAwMApbICAgIDAuNDg3MjA1
XSBwY2kgMDAwMDowMDowMS4wOiBbODA4Njo3MDAwXSB0eXBlIDAwIGNsYXNzIDB4MDYwMTAwClsg
ICAgMC40ODg2MjNdIHBjaSAwMDAwOjAwOjAxLjE6IFs4MDg2OjcwMTBdIHR5cGUgMDAgY2xhc3Mg
MHgwMTAxODAKWyAgICAwLjUxOTE0MF0gcGNpIDAwMDA6MDA6MDEuMTogcmVnIDB4MjA6IFtpbyAg
MHhjMDQwLTB4YzA0Zl0KWyAgICAwLjUyNzE2MV0gcGNpIDAwMDA6MDA6MDEuMTogbGVnYWN5IElE
RSBxdWlyazogcmVnIDB4MTA6IFtpbyAgMHgwMWYwLTB4MDFmN10KWyAgICAwLjUyNzkwNV0gcGNp
IDAwMDA6MDA6MDEuMTogbGVnYWN5IElERSBxdWlyazogcmVnIDB4MTQ6IFtpbyAgMHgwM2Y2XQpb
ICAgIDAuNTI5MTM3XSBwY2kgMDAwMDowMDowMS4xOiBsZWdhY3kgSURFIHF1aXJrOiByZWcgMHgx
ODogW2lvICAweDAxNzAtMHgwMTc3XQpbICAgIDAuNTI5MTM3XSBwY2kgMDAwMDowMDowMS4xOiBs
ZWdhY3kgSURFIHF1aXJrOiByZWcgMHgxYzogW2lvICAweDAzNzZdClsgICAgMC41MzA1NzZdIHBj
aSAwMDAwOjAwOjAxLjM6IFs4MDg2OjcxMTNdIHR5cGUgMDAgY2xhc3MgMHgwNjgwMDAKWyAgICAw
LjUzMTU0M10gcGNpIDAwMDA6MDA6MDEuMzogcXVpcms6IFtpbyAgMHgwNjAwLTB4MDYzZl0gY2xh
aW1lZCBieSBQSUlYNCBBQ1BJClsgICAgMC41MzIxNDVdIHBjaSAwMDAwOjAwOjAxLjM6IHF1aXJr
OiBbaW8gIDB4MDcwMC0weDA3MGZdIGNsYWltZWQgYnkgUElJWDQgU01CClsgICAgMC41MzM1OTRd
IHBjaSAwMDAwOjAwOjAyLjA6IFsxMjM0OjExMTFdIHR5cGUgMDAgY2xhc3MgMHgwMzAwMDAKWyAg
ICAwLjU0MDE0MV0gcGNpIDAwMDA6MDA6MDIuMDogcmVnIDB4MTA6IFttZW0gMHhmZDAwMDAwMC0w
eGZkZmZmZmZmIHByZWZdClsgICAgMC41NDYxNDBdIHBjaSAwMDAwOjAwOjAyLjA6IHJlZyAweDE4
OiBbbWVtIDB4ZmViZjAwMDAtMHhmZWJmMGZmZl0KWyAgICAwLjU2NjE0NF0gcGNpIDAwMDA6MDA6
MDIuMDogcmVnIDB4MzA6IFttZW0gMHhmZWJlMDAwMC0weGZlYmVmZmZmIHByZWZdClsgICAgMC41
Njc1OTBdIHBjaSAwMDAwOjAwOjAzLjA6IFs4MDg2OjEwMGVdIHR5cGUgMDAgY2xhc3MgMHgwMjAw
MDAKWyAgICAwLjU3MDEzN10gcGNpIDAwMDA6MDA6MDMuMDogcmVnIDB4MTA6IFttZW0gMHhmZWJj
MDAwMC0weGZlYmRmZmZmXQpbICAgIDAuNTcyMTM2XSBwY2kgMDAwMDowMDowMy4wOiByZWcgMHgx
NDogW2lvICAweGMwMDAtMHhjMDNmXQpbICAgIDAuNTg3MTM3XSBwY2kgMDAwMDowMDowMy4wOiBy
ZWcgMHgzMDogW21lbSAweGZlYjgwMDAwLTB4ZmViYmZmZmYgcHJlZl0KWyAgICAwLjU4NzY2NF0g
cGNpIDAwMDA6MDA6MDQuMDogWzgwODY6MjVhYl0gdHlwZSAwMCBjbGFzcyAweDA4ODAwMApbICAg
IDAuNTg4NzI0XSBwY2kgMDAwMDowMDowNC4wOiByZWcgMHgxMDogW21lbSAweGZlYmYxMDAwLTB4
ZmViZjEwMGZdClsgICAgMC42MDYzMDhdIEFDUEk6IFBDSSBJbnRlcnJ1cHQgTGluayBbTE5LQV0g
KElSUXMgNSAqMTAgMTEpClsgICAgMC42MDcxNzZdIEFDUEk6IFBDSSBJbnRlcnJ1cHQgTGluayBb
TE5LQl0gKElSUXMgNSAqMTAgMTEpClsgICAgMC42MDc5ODNdIEFDUEk6IFBDSSBJbnRlcnJ1cHQg
TGluayBbTE5LQ10gKElSUXMgNSAxMCAqMTEpClsgICAgMC42MDkzODRdIEFDUEk6IFBDSSBJbnRl
cnJ1cHQgTGluayBbTE5LRF0gKElSUXMgNSAxMCAqMTEpClsgICAgMC42MDkzODRdIEFDUEk6IFBD
SSBJbnRlcnJ1cHQgTGluayBbTE5LU10gKElSUXMgKjkpClsgICAgMC42MTEyOTVdIHBjaSAwMDAw
OjAwOjAyLjA6IHZnYWFyYjogc2V0dGluZyBhcyBib290IFZHQSBkZXZpY2UKWyAgICAwLjYxMTkz
OV0gcGNpIDAwMDA6MDA6MDIuMDogdmdhYXJiOiBWR0EgZGV2aWNlIGFkZGVkOiBkZWNvZGVzPWlv
K21lbSxvd25zPWlvK21lbSxsb2Nrcz1ub25lClsgICAgMC42MTMxMzddIHBjaSAwMDAwOjAwOjAy
LjA6IHZnYWFyYjogYnJpZGdlIGNvbnRyb2wgcG9zc2libGUKWyAgICAwLjYxNDEzNV0gdmdhYXJi
OiBsb2FkZWQKWyAgICAwLjYxNDY4M10gdmlkZW9kZXY6IExpbnV4IHZpZGVvIGNhcHR1cmUgaW50
ZXJmYWNlOiB2Mi4wMApbICAgIDAuNjE2MjEyXSBwcHNfY29yZTogTGludXhQUFMgQVBJIHZlci4g
MSByZWdpc3RlcmVkClsgICAgMC42MTgxNTFdIHBwc19jb3JlOiBTb2Z0d2FyZSB2ZXIuIDUuMy42
IC0gQ29weXJpZ2h0IDIwMDUtMjAwNyBSb2RvbGZvIEdpb21ldHRpIDxnaW9tZXR0aUBsaW51eC5p
dD4KWyAgICAwLjYyMTE3MF0gUFRQIGNsb2NrIHN1cHBvcnQgcmVnaXN0ZXJlZApbICAgIDAuNjIy
NTc4XSBQQ0k6IFVzaW5nIEFDUEkgZm9yIElSUSByb3V0aW5nClsgICAgMC42MjQxNDldIFBDSTog
cGNpX2NhY2hlX2xpbmVfc2l6ZSBzZXQgdG8gNjQgYnl0ZXMKWyAgICAwLjYyNTQ0Ml0gZTgyMDog
cmVzZXJ2ZSBSQU0gYnVmZmVyIFttZW0gMHgwMDA5ZmMwMC0weDAwMDlmZmZmXQpbICAgIDAuNjI4
MTczXSBlODIwOiByZXNlcnZlIFJBTSBidWZmZXIgW21lbSAweDFmZmUwMDAwLTB4MWZmZmZmZmZd
ClsgICAgMC42MzExMzJdIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgOApbICAgIDAu
NjQ0MTM5XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDIwClsgICAgMC42NDU0NDhd
IEhQRVQ6IDMgdGltZXJzIGluIHRvdGFsLCAwIHRpbWVycyB3aWxsIGJlIHVzZWQgZm9yIHBlci1j
cHUgdGltZXIKWyAgICAwLjY0NzI1N10gY2xvY2tzb3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291
cmNlIGt2bS1jbG9jawpbICAgIDAuNjkyNTkzXSBWRlM6IERpc2sgcXVvdGFzIGRxdW90XzYuNi4w
ClsgICAgMC42OTMwNjVdIFZGUzogRHF1b3QtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA1MTIg
KG9yZGVyIDAsIDQwOTYgYnl0ZXMpClsgICAgMC42OTM5NDVdIHBucDogUG5QIEFDUEkgaW5pdApb
ICAgIDAuNjk0NDkwXSBwbnAgMDA6MDA6IFBsdWcgYW5kIFBsYXkgQUNQSSBkZXZpY2UsIElEcyBQ
TlAwYjAwIChhY3RpdmUpClsgICAgMC42OTUyNjldIHBucCAwMDowMTogUGx1ZyBhbmQgUGxheSBB
Q1BJIGRldmljZSwgSURzIFBOUDAzMDMgKGFjdGl2ZSkKWyAgICAwLjY5NjAxM10gcG5wIDAwOjAy
OiBQbHVnIGFuZCBQbGF5IEFDUEkgZGV2aWNlLCBJRHMgUE5QMGYxMyAoYWN0aXZlKQpbICAgIDAu
Njk2NzA1XSBwbnAgMDA6MDM6IFtkbWEgMl0KWyAgICAwLjY5NzA3NF0gcG5wIDAwOjAzOiBQbHVn
IGFuZCBQbGF5IEFDUEkgZGV2aWNlLCBJRHMgUE5QMDcwMCAoYWN0aXZlKQpbICAgIDAuNjk3ODg0
XSBwbnAgMDA6MDQ6IFBsdWcgYW5kIFBsYXkgQUNQSSBkZXZpY2UsIElEcyBQTlAwNDAwIChhY3Rp
dmUpClsgICAgMC42OTg2NzldIHBucCAwMDowNTogUGx1ZyBhbmQgUGxheSBBQ1BJIGRldmljZSwg
SURzIFBOUDA1MDEgKGFjdGl2ZSkKWyAgICAwLjY5OTQ3NF0gcG5wIDAwOjA2OiBQbHVnIGFuZCBQ
bGF5IEFDUEkgZGV2aWNlLCBJRHMgUE5QMDUwMSAoYWN0aXZlKQpbICAgIDAuNzAwNzk1XSBwbnA6
IFBuUCBBQ1BJOiBmb3VuZCA3IGRldmljZXMKWyAgICAwLjcxOTYxMV0gY2xvY2tzb3VyY2U6IGFj
cGlfcG06IG1hc2s6IDB4ZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZmLCBtYXhfaWRsZV9uczog
MjA4NTcwMTAyNCBucwpbICAgIDAuNzIwNjAzXSBwY2lfYnVzIDAwMDA6MDA6IHJlc291cmNlIDQg
W2lvICAweDAwMDAtMHgwY2Y3IHdpbmRvd10KWyAgICAwLjcyMTI2NF0gcGNpX2J1cyAwMDAwOjAw
OiByZXNvdXJjZSA1IFtpbyAgMHgwZDAwLTB4ZmZmZiB3aW5kb3ddClsgICAgMC43MjE5MDJdIHBj
aV9idXMgMDAwMDowMDogcmVzb3VyY2UgNiBbbWVtIDB4MDAwYTAwMDAtMHgwMDBiZmZmZiB3aW5k
b3ddClsgICAgMC43MjI2MTldIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgNyBbbWVtIDB4MjAw
MDAwMDAtMHhmZWJmZmZmZiB3aW5kb3ddClsgICAgMC43MjM1NDBdIE5FVDogUmVnaXN0ZXJlZCBw
cm90b2NvbCBmYW1pbHkgMgpbICAgIDAuNzI0NDEyXSB0Y3BfbGlzdGVuX3BvcnRhZGRyX2hhc2gg
aGFzaCB0YWJsZSBlbnRyaWVzOiAyNTYgKG9yZGVyOiAyLCAxODQzMiBieXRlcykKWyAgICAwLjcy
NTI4MF0gVENQIGVzdGFibGlzaGVkIGhhc2ggdGFibGUgZW50cmllczogNDA5NiAob3JkZXI6IDMs
IDMyNzY4IGJ5dGVzKQpbICAgIDAuNzI2MDYxXSBUQ1AgYmluZCBoYXNoIHRhYmxlIGVudHJpZXM6
IDQwOTYgKG9yZGVyOiA2LCAyNjIxNDQgYnl0ZXMpClsgICAgMC43MjY4OTZdIFRDUDogSGFzaCB0
YWJsZXMgY29uZmlndXJlZCAoZXN0YWJsaXNoZWQgNDA5NiBiaW5kIDQwOTYpClsgICAgMC43Mjgz
MzNdIFVEUCBoYXNoIHRhYmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDMsIDQwOTYwIGJ5dGVzKQpb
ICAgIDAuNzI4OTg1XSBVRFAtTGl0ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDMs
IDQwOTYwIGJ5dGVzKQpbICAgIDAuNzI5NzUwXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFt
aWx5IDEKWyAgICAwLjczMDM4OV0gcGNpIDAwMDA6MDA6MDEuMDogUElJWDM6IEVuYWJsaW5nIFBh
c3NpdmUgUmVsZWFzZQpbICAgIDAuNzMwOTk3XSBwY2kgMDAwMDowMDowMC4wOiBMaW1pdGluZyBk
aXJlY3QgUENJL1BDSSB0cmFuc2ZlcnMKWyAgICAwLjczMTY2NV0gcGNpIDAwMDA6MDA6MDEuMDog
QWN0aXZhdGluZyBJU0EgRE1BIGhhbmcgd29ya2Fyb3VuZHMKWyAgICAwLjczMjQxMl0gcGNpIDAw
MDA6MDA6MDIuMDogVmlkZW8gZGV2aWNlIHdpdGggc2hhZG93ZWQgUk9NIGF0IFttZW0gMHgwMDBj
MDAwMC0weDAwMGRmZmZmXQpbICAgIDAuNzMzMjg3XSBQQ0k6IENMUyAwIGJ5dGVzLCBkZWZhdWx0
IDY0ClsgICAgMC43MzM4NzddIFVucGFja2luZyBpbml0cmFtZnMuLi4KWyAgICAyLjIyMjgwN10g
RnJlZWluZyBpbml0cmQgbWVtb3J5OiAyMzY1NksKWyAgICAyLjIyMzYyM10gY2xvY2tzb3VyY2U6
IHRzYzogbWFzazogMHhmZmZmZmZmZmZmZmZmZmZmIG1heF9jeWNsZXM6IDB4MjEyNzMxYTUzMDEs
IG1heF9pZGxlX25zOiA0NDA3OTUzMTcxMjMgbnMKWyAgICAyLjIyNDgyNF0gY2hlY2s6IFNjYW5u
aW5nIGZvciBsb3cgbWVtb3J5IGNvcnJ1cHRpb24gZXZlcnkgNjAgc2Vjb25kcwpbICAgIDIuMjM1
OTQxXSBkZXMzX2VkZS14ODZfNjQ6IHBlcmZvcm1hbmNlIG9uIHRoaXMgQ1BVIHdvdWxkIGJlIHN1
Ym9wdGltYWw6IGRpc2FibGluZyBkZXMzX2VkZS14ODZfNjQuClsgICAgMi4yMzY4ODJdIGJsb3dm
aXNoLXg4Nl82NDogcGVyZm9ybWFuY2Ugb24gdGhpcyBDUFUgd291bGQgYmUgc3Vib3B0aW1hbDog
ZGlzYWJsaW5nIGJsb3dmaXNoLXg4Nl82NC4KWyAgICAyLjIzOTIzM10gdHdvZmlzaC14ODZfNjQt
M3dheTogcGVyZm9ybWFuY2Ugb24gdGhpcyBDUFUgd291bGQgYmUgc3Vib3B0aW1hbDogZGlzYWJs
aW5nIHR3b2Zpc2gteDg2XzY0LTN3YXkuClsgICAgMi4yNDAyNjNdIENQVSBmZWF0dXJlICdBVlgg
cmVnaXN0ZXJzJyBpcyBub3Qgc3VwcG9ydGVkLgpbICAgIDIuMjQwODA0XSBDUFUgZmVhdHVyZSAn
QVZYIHJlZ2lzdGVycycgaXMgbm90IHN1cHBvcnRlZC4KWyAgICAyLjI0MTM3Nl0gQ1BVIGZlYXR1
cmUgJ0FWWCByZWdpc3RlcnMnIGlzIG5vdCBzdXBwb3J0ZWQuClsgICAgOC44NTI4MDldIEluaXRp
YWxpc2Ugc3lzdGVtIHRydXN0ZWQga2V5cmluZ3MKWyAgICA4Ljg1NDcxNF0gd29ya2luZ3NldDog
dGltZXN0YW1wX2JpdHM9NTYgbWF4X29yZGVyPTE3IGJ1Y2tldF9vcmRlcj0wClsgICAgOC44NTcy
NTVdIG9yYW5nZWZzX2RlYnVnZnNfaW5pdDogY2FsbGVkIHdpdGggZGVidWcgbWFzazogOm5vbmU6
IDowOgpbICAgIDguODU4MzM3XSBvcmFuZ2Vmc19pbml0OiBtb2R1bGUgdmVyc2lvbiB1cHN0cmVh
bSBsb2FkZWQKWyAgICA4Ljg4MDc3N10gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAz
OApbICAgIDguODgxOTk0XSBLZXkgdHlwZSBhc3ltbWV0cmljIHJlZ2lzdGVyZWQKWyAgICA5LjAw
NjYyMl0gU3RyaW5nIHNlbGZ0ZXN0cyBzdWNjZWVkZWQKWyAgICA5LjAwNzQ3MF0gZ3Bpb19pdDg3
OiBubyBkZXZpY2UKWyAgICA5LjAwODA1N10gZ3Bpb193aW5ib25kOiBjaGlwIElEIGF0IDJlIGlz
IGZmZmYKWyAgICA5LjAwODUzM10gZ3Bpb193aW5ib25kOiBub3QgYW4gb3VyIGNoaXAKWyAgICA5
LjAwODk2MV0gZ3Bpb193aW5ib25kOiBjaGlwIElEIGF0IDRlIGlzIGZmZmYKWyAgICA5LjAwOTQ1
MV0gZ3Bpb193aW5ib25kOiBub3QgYW4gb3VyIGNoaXAKWyAgICA5LjAyMzIyOV0gc2hwY2hwOiBT
dGFuZGFyZCBIb3QgUGx1ZyBQQ0kgQ29udHJvbGxlciBEcml2ZXIgdmVyc2lvbjogMC40ClsgICAg
OS4wMjQwMjddIHN3aXRjaHRlYzogbG9hZGVkLgpbICAgIDkuMDI0NzA4XSBpbnB1dDogUG93ZXIg
QnV0dG9uIGFzIC9kZXZpY2VzL0xOWFNZU1RNOjAwL0xOWFBXUkJOOjAwL2lucHV0L2lucHV0MApb
ICAgIDkuMDMyMjMxXSBBQ1BJOiBQb3dlciBCdXR0b24gW1BXUkZdClsgICAgOS4wMzMwNThdIGlu
cHV0OiBQb3dlciBCdXR0b24gYXMgL2RldmljZXMvTE5YU1lTVE06MDAvTE5YUFdSQk46MDAvaW5w
dXQvaW5wdXQxClsgICAgOS4wMzM5MThdIEFDUEk6IFBvd2VyIEJ1dHRvbiBbUFdSRl0KWyAgICA5
LjAzNDQxNF0gV2FybmluZzogUHJvY2Vzc29yIFBsYXRmb3JtIExpbWl0IGV2ZW50IGRldGVjdGVk
LCBidXQgbm90IGhhbmRsZWQuClsgICAgOS4wMzUxNTNdIENvbnNpZGVyIGNvbXBpbGluZyBDUFVm
cmVxIHN1cHBvcnQgaW50byB5b3VyIGtlcm5lbC4KWyAgICA5LjA0OTY1MF0gaW9hdGRtYTogSW50
ZWwoUikgUXVpY2tEYXRhIFRlY2hub2xvZ3kgRHJpdmVyIDQuMDAKWyAgICA5LjA1MDgwNV0gU2Vy
aWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgNCBwb3J0cywgSVJRIHNoYXJpbmcgZGlzYWJsZWQKWyAg
ICA5LjA4NDUxNF0gMDA6MDU6IHR0eVMwIGF0IEkvTyAweDNmOCAoaXJxID0gNCwgYmFzZV9iYXVk
ID0gMTE1MjAwKSBpcyBhIDE2NTUwQQpbICAgIDkuMDg3OTM1XSBwcmludGs6IGNvbnNvbGUgW3R0
eVMwXSBkaXNhYmxlZApbICAgIDAuMDAwMDAwXSBMaW51eCB2ZXJzaW9uIDUuMC4wLXJjNC0wMDE1
MC1nYjUyM2FiMSAoa2J1aWxkQGxrcC1oc3gwMykgKGdjYyB2ZXJzaW9uIDYuNS4wIDIwMTgxMDI2
IChEZWJpYW4gNi41LjAtMikpICMxIFNNUCBQUkVFTVBUIE1vbiBGZWIgMTggMTU6NTc6NTUgQ1NU
IDIwMTkKWyAgICAwLjAwMDAwMF0gQ29tbWFuZCBsaW5lOiByb290PS9kZXYvcmFtMCBodW5nX3Rh
c2tfcGFuaWM9MSBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRl
LnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAgbmV0LmlmbmFtZXM9MCBwcmludGsuZGV2a21zZz1v
biBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFu
aWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MCBkcmJkLm1pbm9yX2NvdW50PTggc3lz
dGVtZC5sb2dfbGV2ZWw9ZXJyIGlnbm9yZV9sb2dsZXZlbCBjb25zb2xlPXR0eTAgZWFybHlwcmlu
dGs9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5UzAsMTE1MjAwIHZnYT1ub3JtYWwgcncgbGluaz0v
Y2VwaGZzL2tidWlsZC9ydW4tcXVldWUva3ZtL3g4Nl82NC1yYW5kY29uZmlnLXMyLTAyMTcyMzE4
L2xpbnV4LWRldmVsOmZpeHVwLWVmYWQ0ZTQ3NWMzMTI0NTZlZGIzYzc4OWQwOTk2ZDEyZWQ3NDRj
MTM6YjUyM2FiMWI4Y2U1OTU5MmNiMzJkNjIyNTAzMjE3MDc3Y2YwN2U0ZC8udm1saW51ei1iNTIz
YWIxYjhjZTU5NTkyY2IzMmQ2MjI1MDMyMTcwNzdjZjA3ZTRkLTIwMTkwMjE4MTYwMDEyLTEwNDpx
dWFudGFsLXZtLXF1YW50YWwtNjA3IGJyYW5jaD1saW51eC1kZXZlbC9maXh1cC1lZmFkNGU0NzVj
MzEyNDU2ZWRiM2M3ODlkMDk5NmQxMmVkNzQ0YzEzIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZf
NjQtcmFuZGNvbmZpZy1zMi0wMjE3MjMxOC9nY2MtNi9iNTIzYWIxYjhjZTU5NTkyY2IzMmQ2MjI1
MDMyMTcwNzdjZjA3ZTRkL3ZtbGludXotNS4wLjAtcmM0LTAwMTUwLWdiNTIzYWIxIGRyYmQubWlu
b3JfY291bnQ9OCByY3VwZXJmLnNodXRkb3duPTAKWyAgICAwLjAwMDAwMF0gS0VSTkVMIHN1cHBv
cnRlZCBjcHVzOgpbICAgIDAuMDAwMDAwXSAgIEludGVsIEdlbnVpbmVJbnRlbApbICAgIDAuMDAw
MDAwXSB4ODYvZnB1OiB4ODcgRlBVIHdpbGwgdXNlIEZYU0FWRQpbICAgIDAuMDAwMDAwXSBCSU9T
LXByb3ZpZGVkIHBoeXNpY2FsIFJBTSBtYXA6ClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21l
bSAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAwMDAwMDAwMDlmYmZmXSB1c2FibGUKWyAgICAwLjAw
MDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAwMDA5ZmMwMC0weDAwMDAwMDAwMDAwOWZm
ZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAw
ZjAwMDAtMHgwMDAwMDAwMDAwMGZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4
MjA6IFttZW0gMHgwMDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDAxZmZkZmZmZl0gdXNhYmxlClsg
ICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMWZmZTAwMDAtMHgwMDAwMDAw
MDFmZmZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAw
MDAwMGZlZmZjMDAwLTB4MDAwMDAwMDBmZWZmZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0g
QklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDBmZmZjMDAwMC0weDAwMDAwMDAwZmZmZmZmZmZdIHJl
c2VydmVkClsgICAgMC4wMDAwMDBdIHByaW50azogZGVidWc6IGlnbm9yaW5nIGxvZ2xldmVsIHNl
dHRpbmcuClsgICAgMC4wMDAwMDBdIE5YIChFeGVjdXRlIERpc2FibGUpIHByb3RlY3Rpb246IGFj
dGl2ZQpbICAgIDAuMDAwMDAwXSBTTUJJT1MgMi44IHByZXNlbnQuClsgICAgMC4wMDAwMDBdIERN
STogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgMS4xMC4yLTEg
MDQvMDEvMjAxNApbICAgIDAuMDAwMDAwXSBIeXBlcnZpc29yIGRldGVjdGVkOiBLVk0KWyAgICAw
LjAwMDAwMF0ga3ZtLWNsb2NrOiBVc2luZyBtc3JzIDRiNTY0ZDAxIGFuZCA0YjU2NGQwMApbICAg
IDAuMDAwMDAwXSBrdm0tY2xvY2s6IGNwdSAwLCBtc3IgMjg4NzAwMSwgcHJpbWFyeSBjcHUgY2xv
Y2sKWyAgICAwLjAwMDAwMF0ga3ZtLWNsb2NrOiB1c2luZyBzY2hlZCBvZmZzZXQgb2YgMTYwNTY2
MDkyOSBjeWNsZXMKWyAgICAwLjAwMDAwNF0gY2xvY2tzb3VyY2U6IGt2bS1jbG9jazogbWFzazog
MHhmZmZmZmZmZmZmZmZmZmZmIG1heF9jeWNsZXM6IDB4MWNkNDJlNGRmZmIsIG1heF9pZGxlX25z
OiA4ODE1OTA1OTE0ODMgbnMKWyAgICAwLjAwMDAxMF0gdHNjOiBEZXRlY3RlZCAyMjk5Ljk5NiBN
SHogcHJvY2Vzc29yClsgICAgMC4wMDE3MjBdIGU4MjA6IHVwZGF0ZSBbbWVtIDB4MDAwMDAwMDAt
MHgwMDAwMGZmZl0gdXNhYmxlID09PiByZXNlcnZlZApbICAgIDAuMDAxNzI0XSBlODIwOiByZW1v
dmUgW21lbSAweDAwMGEwMDAwLTB4MDAwZmZmZmZdIHVzYWJsZQpbICAgIDAuMDAxNzI5XSBsYXN0
X3BmbiA9IDB4MWZmZTAgbWF4X2FyY2hfcGZuID0gMHg0MDAwMDAwMDAKWyAgICAwLjAwMTczM10g
eDg2L1BBVDogQ29uZmlndXJhdGlvbiBbMC03XTogV0IgIFdUICBVQy0gVUMgIFdCICBXVCAgVUMt
IFVDICAKWyAgICAwLjAwMTczNl0gU2NhbiBmb3IgU01QIGluIFttZW0gMHgwMDAwMDAwMC0weDAw
MDAwM2ZmXQpbICAgIDAuMDAxNzU3XSBTY2FuIGZvciBTTVAgaW4gW21lbSAweDAwMDlmYzAwLTB4
MDAwOWZmZmZdClsgICAgMC4wMDE3NzldIFNjYW4gZm9yIFNNUCBpbiBbbWVtIDB4MDAwZjAwMDAt
MHgwMDBmZmZmZl0KWyAgICAwLjAwNjEzNV0gZm91bmQgU01QIE1QLXRhYmxlIGF0IFttZW0gMHgw
MDBmNmE4MC0weDAwMGY2YThmXSBtYXBwZWQgYXQgWyhfX19fcHRydmFsX19fXyldClsgICAgMC4w
MDYxMzldICAgbXBjOiBmNmE5MC1mNmI3NApbICAgIDAuMDA2MTgyXSBjaGVjazogU2Nhbm5pbmcg
MSBhcmVhcyBmb3IgbG93IG1lbW9yeSBjb3JydXB0aW9uClsgICAgMC4wMDYxODZdIEJhc2UgbWVt
b3J5IHRyYW1wb2xpbmUgYXQgWyhfX19fcHRydmFsX19fXyldIDk5MDAwIHNpemUgMjQ1NzYKWyAg
ICAwLjAwNjIzN10gQlJLIFsweDAzNjAxMDAwLCAweDAzNjAxZmZmXSBQR1RBQkxFClsgICAgMC4w
MDYyNDFdIEJSSyBbMHgwMzYwMjAwMCwgMHgwMzYwMmZmZl0gUEdUQUJMRQpbICAgIDAuMDA2MjQz
XSBCUksgWzB4MDM2MDMwMDAsIDB4MDM2MDNmZmZdIFBHVEFCTEUKWyAgICAwLjAwNjQwM10gQlJL
IFsweDAzNjA0MDAwLCAweDAzNjA0ZmZmXSBQR1RBQkxFClsgICAgMC4wMDY0MzFdIFJBTURJU0s6
IFttZW0gMHgxZThjNjAwMC0weDFmZmRmZmZmXQpbICAgIDAuMDA2NDQ5XSBBQ1BJOiBFYXJseSB0
YWJsZSBjaGVja3N1bSB2ZXJpZmljYXRpb24gZGlzYWJsZWQKWyAgICAwLjAwNjQ5Ml0gQUNQSTog
UlNEUCAweDAwMDAwMDAwMDAwRjY4NzAgMDAwMDE0ICh2MDAgQk9DSFMgKQpbICAgIDAuMDA2NDk3
XSBBQ1BJOiBSU0RUIDB4MDAwMDAwMDAxRkZFMTkzNiAwMDAwMzAgKHYwMSBCT0NIUyAgQlhQQ1JT
RFQgMDAwMDAwMDEgQlhQQyAwMDAwMDAwMSkKWyAgICAwLjAwNjUwM10gQUNQSTogRkFDUCAweDAw
MDAwMDAwMUZGRTE4MEEgMDAwMDc0ICh2MDEgQk9DSFMgIEJYUENGQUNQIDAwMDAwMDAxIEJYUEMg
MDAwMDAwMDEpClsgICAgMC4wMDY1MDldIEFDUEk6IERTRFQgMHgwMDAwMDAwMDFGRkUwMDQwIDAw
MTdDQSAodjAxIEJPQ0hTICBCWFBDRFNEVCAwMDAwMDAwMSBCWFBDIDAwMDAwMDAxKQpbICAgIDAu
MDA2NTEzXSBBQ1BJOiBGQUNTIDB4MDAwMDAwMDAxRkZFMDAwMCAwMDAwNDAKWyAgICAwLjAwNjUx
N10gQUNQSTogQVBJQyAweDAwMDAwMDAwMUZGRTE4N0UgMDAwMDgwICh2MDEgQk9DSFMgIEJYUENB
UElDIDAwMDAwMDAxIEJYUEMgMDAwMDAwMDEpClsgICAgMC4wMDY1MjFdIEFDUEk6IEhQRVQgMHgw
MDAwMDAwMDFGRkUxOEZFIDAwMDAzOCAodjAxIEJPQ0hTICBCWFBDSFBFVCAwMDAwMDAwMSBCWFBD
IDAwMDAwMDAxKQpbICAgIDAuMDA2NTI4XSBBQ1BJOiBMb2NhbCBBUElDIGFkZHJlc3MgMHhmZWUw
MDAwMApbICAgIDAuMDA2NTMzXSBtYXBwZWQgQVBJQyB0byBmZmZmZmZmZmZmNWZkMDAwICggICAg
ICAgIGZlZTAwMDAwKQpbICAgIDAuMDA2ODQ1XSBObyBOVU1BIGNvbmZpZ3VyYXRpb24gZm91bmQK
WyAgICAwLjAwNjg0OF0gRmFraW5nIGEgbm9kZSBhdCBbbWVtIDB4MDAwMDAwMDAwMDAwMDAwMC0w
eDAwMDAwMDAwMWZmZGZmZmZdClsgICAgMC4wMDY4NTNdIE5PREVfREFUQSgwKSBhbGxvY2F0ZWQg
W21lbSAweDFlOGMzMDAwLTB4MWU4YzVmZmZdClsgICAgMC4wMDk2MjNdIFpvbmUgcmFuZ2VzOgpb
ICAgIDAuMDA5NjI3XSAgIERNQTMyICAgIFttZW0gMHgwMDAwMDAwMDAwMDAxMDAwLTB4MDAwMDAw
MDAxZmZkZmZmZl0KWyAgICAwLjAwOTYyOV0gICBOb3JtYWwgICBlbXB0eQpbICAgIDAuMDA5NjMy
XSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpbICAgIDAuMDA5NjM0XSBFYXJseSBt
ZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAwOTYzNl0gICBub2RlICAgMDogW21lbSAweDAwMDAw
MDAwMDAwMDEwMDAtMHgwMDAwMDAwMDAwMDllZmZmXQpbICAgIDAuMDA5NjM4XSAgIG5vZGUgICAw
OiBbbWVtIDB4MDAwMDAwMDAwMDEwMDAwMC0weDAwMDAwMDAwMWZmZGZmZmZdClsgICAgMC4wMDk2
NDNdIFplcm9lZCBzdHJ1Y3QgcGFnZSBpbiB1bmF2YWlsYWJsZSByYW5nZXM6IDk4IHBhZ2VzClsg
ICAgMC4wMDk2NDRdIEluaXRtZW0gc2V0dXAgbm9kZSAwIFttZW0gMHgwMDAwMDAwMDAwMDAxMDAw
LTB4MDAwMDAwMDAxZmZkZmZmZl0KWyAgICAwLjAwOTY0N10gT24gbm9kZSAwIHRvdGFscGFnZXM6
IDEzMDk0MgpbICAgIDAuMDA5NjUwXSAgIERNQTMyIHpvbmU6IDE3OTIgcGFnZXMgdXNlZCBmb3Ig
bWVtbWFwClsgICAgMC4wMDk2NTJdICAgRE1BMzIgem9uZTogMjEgcGFnZXMgcmVzZXJ2ZWQKWyAg
ICAwLjAwOTY1NF0gICBETUEzMiB6b25lOiAxMzA5NDIgcGFnZXMsIExJRk8gYmF0Y2g6MzEKWyAg
ICAwLjAxMjQyOV0gQUNQSTogUE0tVGltZXIgSU8gUG9ydDogMHg2MDgKWyAgICAwLjAxMjQzM10g
QUNQSTogTG9jYWwgQVBJQyBhZGRyZXNzIDB4ZmVlMDAwMDAKWyAgICAwLjAxMjQzOV0gQUNQSTog
TEFQSUNfTk1JIChhY3BpX2lkWzB4ZmZdIGRmbCBkZmwgbGludFsweDFdKQpbICAgIDAuMDEyNDc0
XSBJT0FQSUNbMF06IGFwaWNfaWQgMCwgdmVyc2lvbiAxNywgYWRkcmVzcyAweGZlYzAwMDAwLCBH
U0kgMC0yMwpbICAgIDAuMDEyNDgyXSBBQ1BJOiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2lycSAw
IGdsb2JhbF9pcnEgMiBkZmwgZGZsKQpbICAgIDAuMDEyNDg2XSBJbnQ6IHR5cGUgMCwgcG9sIDAs
IHRyaWcgMCwgYnVzIDAwLCBJUlEgMDAsIEFQSUMgSUQgMCwgQVBJQyBJTlQgMDIKWyAgICAwLjAx
MjQ4OV0gQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgNSBnbG9iYWxfaXJxIDUgaGln
aCBsZXZlbCkKWyAgICAwLjAxMjQ5MV0gSW50OiB0eXBlIDAsIHBvbCAxLCB0cmlnIDMsIGJ1cyAw
MCwgSVJRIDA1LCBBUElDIElEIDAsIEFQSUMgSU5UIDA1ClsgICAgMC4wMTI0OTRdIEFDUEk6IElO
VF9TUkNfT1ZSIChidXMgMCBidXNfaXJxIDkgZ2xvYmFsX2lycSA5IGhpZ2ggbGV2ZWwpClsgICAg
MC4wMTI0OTZdIEludDogdHlwZSAwLCBwb2wgMSwgdHJpZyAzLCBidXMgMDAsIElSUSAwOSwgQVBJ
QyBJRCAwLCBBUElDIElOVCAwOQpbICAgIDAuMDEyNDk5XSBBQ1BJOiBJTlRfU1JDX09WUiAoYnVz
IDAgYnVzX2lycSAxMCBnbG9iYWxfaXJxIDEwIGhpZ2ggbGV2ZWwpClsgICAgMC4wMTI1MDJdIElu
dDogdHlwZSAwLCBwb2wgMSwgdHJpZyAzLCBidXMgMDAsIElSUSAwYSwgQVBJQyBJRCAwLCBBUElD
IElOVCAwYQpbICAgIDAuMDEyNTA0XSBBQ1BJOiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2lycSAx
MSBnbG9iYWxfaXJxIDExIGhpZ2ggbGV2ZWwpClsgICAgMC4wMTI1MDddIEludDogdHlwZSAwLCBw
b2wgMSwgdHJpZyAzLCBidXMgMDAsIElSUSAwYiwgQVBJQyBJRCAwLCBBUElDIElOVCAwYgpbICAg
IDAuMDEyNTA5XSBBQ1BJOiBJUlEwIHVzZWQgYnkgb3ZlcnJpZGUuClsgICAgMC4wMTI1MTJdIElu
dDogdHlwZSAwLCBwb2wgMCwgdHJpZyAwLCBidXMgMDAsIElSUSAwMSwgQVBJQyBJRCAwLCBBUElD
IElOVCAwMQpbICAgIDAuMDEyNTE0XSBJbnQ6IHR5cGUgMCwgcG9sIDAsIHRyaWcgMCwgYnVzIDAw
LCBJUlEgMDMsIEFQSUMgSUQgMCwgQVBJQyBJTlQgMDMKWyAgICAwLjAxMjUxN10gSW50OiB0eXBl
IDAsIHBvbCAwLCB0cmlnIDAsIGJ1cyAwMCwgSVJRIDA0LCBBUElDIElEIDAsIEFQSUMgSU5UIDA0
ClsgICAgMC4wMTI1MTldIEFDUEk6IElSUTUgdXNlZCBieSBvdmVycmlkZS4KWyAgICAwLjAxMjUy
Ml0gSW50OiB0eXBlIDAsIHBvbCAwLCB0cmlnIDAsIGJ1cyAwMCwgSVJRIDA2LCBBUElDIElEIDAs
IEFQSUMgSU5UIDA2ClsgICAgMC4wMTI1MjRdIEludDogdHlwZSAwLCBwb2wgMCwgdHJpZyAwLCBi
dXMgMDAsIElSUSAwNywgQVBJQyBJRCAwLCBBUElDIElOVCAwNwpbICAgIDAuMDEyNTI3XSBJbnQ6
IHR5cGUgMCwgcG9sIDAsIHRyaWcgMCwgYnVzIDAwLCBJUlEgMDgsIEFQSUMgSUQgMCwgQVBJQyBJ
TlQgMDgKWyAgICAwLjAxMjUyOV0gQUNQSTogSVJROSB1c2VkIGJ5IG92ZXJyaWRlLgpbICAgIDAu
MDEyNTMxXSBBQ1BJOiBJUlExMCB1c2VkIGJ5IG92ZXJyaWRlLgpbICAgIDAuMDEyNTMzXSBBQ1BJ
OiBJUlExMSB1c2VkIGJ5IG92ZXJyaWRlLgpbICAgIDAuMDEyNTM2XSBJbnQ6IHR5cGUgMCwgcG9s
IDAsIHRyaWcgMCwgYnVzIDAwLCBJUlEgMGMsIEFQSUMgSUQgMCwgQVBJQyBJTlQgMGMKWyAgICAw
LjAxMjUzOF0gSW50OiB0eXBlIDAsIHBvbCAwLCB0cmlnIDAsIGJ1cyAwMCwgSVJRIDBkLCBBUElD
IElEIDAsIEFQSUMgSU5UIDBkClsgICAgMC4wMTI1NDFdIEludDogdHlwZSAwLCBwb2wgMCwgdHJp
ZyAwLCBidXMgMDAsIElSUSAwZSwgQVBJQyBJRCAwLCBBUElDIElOVCAwZQpbICAgIDAuMDEyNTQ0
XSBJbnQ6IHR5cGUgMCwgcG9sIDAsIHRyaWcgMCwgYnVzIDAwLCBJUlEgMGYsIEFQSUMgSUQgMCwg
QVBJQyBJTlQgMGYKWyAgICAwLjAxMjU0N10gVXNpbmcgQUNQSSAoTUFEVCkgZm9yIFNNUCBjb25m
aWd1cmF0aW9uIGluZm9ybWF0aW9uClsgICAgMC4wMTI1NTBdIEFDUEk6IEhQRVQgaWQ6IDB4ODA4
NmEyMDEgYmFzZTogMHhmZWQwMDAwMApbICAgIDAuMDEyNTU1XSBzbXBib290OiBBbGxvd2luZyAy
IENQVXMsIDAgaG90cGx1ZyBDUFVzClsgICAgMC4wMTI1NThdIG1hcHBlZCBJT0FQSUMgdG8gZmZm
ZmZmZmZmZjVmYzAwMCAoZmVjMDAwMDApClsgICAgMC4wMTI1ODVdIFttZW0gMHgyMDAwMDAwMC0w
eGZlZmZiZmZmXSBhdmFpbGFibGUgZm9yIFBDSSBkZXZpY2VzClsgICAgMC4wMTI1ODddIEJvb3Rp
bmcgcGFyYXZpcnR1YWxpemVkIGtlcm5lbCBvbiBLVk0KWyAgICAwLjAxMjU5MF0gY2xvY2tzb3Vy
Y2U6IHJlZmluZWQtamlmZmllczogbWFzazogMHhmZmZmZmZmZiBtYXhfY3ljbGVzOiAweGZmZmZm
ZmZmLCBtYXhfaWRsZV9uczogMTkxMDk2OTk0MDM5MTQxOSBucwpbICAgIDAuMTY0OTgyXSBzZXR1
cF9wZXJjcHU6IE5SX0NQVVM6NjQgbnJfY3B1bWFza19iaXRzOjY0IG5yX2NwdV9pZHM6MiBucl9u
b2RlX2lkczoxClsgICAgMC4xNjU1NjldIHBlcmNwdTogRW1iZWRkZWQgNTkgcGFnZXMvY3B1IEAo
X19fX3B0cnZhbF9fX18pIHMyMDE5MjggcjgxOTIgZDMxNTQ0IHUxMDQ4NTc2ClsgICAgMC4xNjU1
NzVdIHBjcHUtYWxsb2M6IHMyMDE5MjggcjgxOTIgZDMxNTQ0IHUxMDQ4NTc2IGFsbG9jPTEqMjA5
NzE1MgpbICAgIDAuMTY1NTc4XSBwY3B1LWFsbG9jOiBbMF0gMCAxIApbICAgIDAuMTY1NjA3XSBL
Vk0gc2V0dXAgYXN5bmMgUEYgZm9yIGNwdSAwClsgICAgMC4xNjU2MTNdIGt2bS1zdGVhbHRpbWU6
IGNwdSAwLCBtc3IgMWRjMTUwYzAKWyAgICAwLjE2NTYyMV0gQnVpbHQgMSB6b25lbGlzdHMsIG1v
YmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6IDEyOTEyOQpbICAgIDAuMTY1NjIzXSBQ
b2xpY3kgem9uZTogRE1BMzIKWyAgICAwLjE2NTYyOF0gS2VybmVsIGNvbW1hbmQgbGluZTogcm9v
dD0vZGV2L3JhbTAgaHVuZ190YXNrX3BhbmljPTEgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdh
eXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwIG5ldC5pZm5hbWVz
PTAgcHJpbnRrLmRldmttc2c9b24gcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRj
aGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAgZHJi
ZC5taW5vcl9jb3VudD04IHN5c3RlbWQubG9nX2xldmVsPWVyciBpZ25vcmVfbG9nbGV2ZWwgY29u
c29sZT10dHkwIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eVMwLDExNTIwMCB2
Z2E9bm9ybWFsIHJ3IGxpbms9L2NlcGhmcy9rYnVpbGQvcnVuLXF1ZXVlL2t2bS94ODZfNjQtcmFu
ZGNvbmZpZy1zMi0wMjE3MjMxOC9saW51eC1kZXZlbDpmaXh1cC1lZmFkNGU0NzVjMzEyNDU2ZWRi
M2M3ODlkMDk5NmQxMmVkNzQ0YzEzOmI1MjNhYjFiOGNlNTk1OTJjYjMyZDYyMjUwMzIxNzA3N2Nm
MDdlNGQvLnZtbGludXotYjUyM2FiMWI4Y2U1OTU5MmNiMzJkNjIyNTAzMjE3MDc3Y2YwN2U0ZC0y
MDE5MDIxODE2MDAxMi0xMDQ6cXVhbnRhbC12bS1xdWFudGFsLTYwNyBicmFuY2g9bGludXgtZGV2
ZWwvZml4dXAtZWZhZDRlNDc1YzMxMjQ1NmVkYjNjNzg5ZDA5OTZkMTJlZDc0NGMxMyBCT09UX0lN
QUdFPS9wa2cvbGludXgveDg2XzY0LXJhbmRjb25maWctczItMDIxNzIzMTgvZ2NjLTYvYjUyM2Fi
MWI4Y2U1OTU5MmNiMzJkNjIyNTAzMjE3MDc3Y2YwN2U0ZC92bWxpbnV6LTUuMC4wLXJjNC0wMDE1
MC1nYjUyM2FiMSBkcmJkLm1pbm9yX2NvdW50PTggcmN1cGVyZi5zaHV0ZG93bj0wClsgICAgMC4x
NjU3MDhdIHN5c3JxOiBzeXNycSBhbHdheXMgZW5hYmxlZC4KWyAgICAwLjE2NjAxOV0gQ2FsZ2Fy
eTogZGV0ZWN0aW5nIENhbGdhcnkgdmlhIEJJT1MgRUJEQSBhcmVhClsgICAgMC4xNjYwMjNdIENh
bGdhcnk6IFVuYWJsZSB0byBsb2NhdGUgUmlvIEdyYW5kZSB0YWJsZSBpbiBFQkRBIC0gYmFpbGlu
ZyEKWyAgICAwLjE2NzI3OV0gTWVtb3J5OiA0NTIzMjhLLzUyMzc2OEsgYXZhaWxhYmxlICgxMjI5
MUsga2VybmVsIGNvZGUsIDEzNDZLIHJ3ZGF0YSwgMzg3Mksgcm9kYXRhLCAxMTA4SyBpbml0LCAx
Mzg2OEsgYnNzLCA3MTQ0MEsgcmVzZXJ2ZWQsIDBLIGNtYS1yZXNlcnZlZCkKWyAgICAwLjE2NzMw
M10gS2VybmVsL1VzZXIgcGFnZSB0YWJsZXMgaXNvbGF0aW9uOiBlbmFibGVkClsgICAgMC4xNjc0
OTldIFJ1bm5pbmcgUkNVIHNlbGYgdGVzdHMKWyAgICAwLjE2NzUwMl0gcmN1OiBQcmVlbXB0aWJs
ZSBoaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuMTY3NTA0XSByY3U6IAlS
Q1UgbG9ja2RlcCBjaGVja2luZyBpcyBlbmFibGVkLgpbICAgIDAuMTY3NTA3XSByY3U6IAlSQ1Ug
cmVzdHJpY3RpbmcgQ1BVcyBmcm9tIE5SX0NQVVM9NjQgdG8gbnJfY3B1X2lkcz0yLgpbICAgIDAu
MTY3NTA5XSAJUkNVIENQVSBzdGFsbCB3YXJuaW5ncyB0aW1lb3V0IHNldCB0byAxMDAgKHJjdV9j
cHVfc3RhbGxfdGltZW91dCkuClsgICAgMC4xNjc1MTFdIAlUYXNrcyBSQ1UgZW5hYmxlZC4KWyAg
ICAwLjE2NzUxNF0gcmN1OiBSQ1UgY2FsY3VsYXRlZCB2YWx1ZSBvZiBzY2hlZHVsZXItZW5saXN0
bWVudCBkZWxheSBpcyAxMDAgamlmZmllcy4KWyAgICAwLjE2NzUxNl0gcmN1OiBBZGp1c3Rpbmcg
Z2VvbWV0cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0xNiwgbnJfY3B1X2lkcz0yClsgICAgMC4xNjc3
OTRdIE5SX0lSUVM6IDQzNTIsIG5yX2lycXM6IDQ0MCwgcHJlYWxsb2NhdGVkIGlycXM6IDE2Clsg
ICAgMC4xNjc5ODZdIHJjdTogCU9mZmxvYWQgUkNVIGNhbGxiYWNrcyBmcm9tIENQVXM6IChub25l
KS4KWyAgICAwLjI4Mzk4NV0gcHJpbnRrOiBjb25zb2xlIFt0dHlTMF0gZW5hYmxlZApbICAgIDAu
Mjg0NDI1XSBMb2NrIGRlcGVuZGVuY3kgdmFsaWRhdG9yOiBDb3B5cmlnaHQgKGMpIDIwMDYgUmVk
IEhhdCwgSW5jLiwgSW5nbyBNb2xuYXIKWyAgICAwLjI4NTI1Ml0gLi4uIE1BWF9MT0NLREVQX1NV
QkNMQVNTRVM6ICA4ClsgICAgMC4yODU2NjhdIC4uLiBNQVhfTE9DS19ERVBUSDogICAgICAgICAg
NDgKWyAgICAwLjI4NjExMV0gLi4uIE1BWF9MT0NLREVQX0tFWVM6ICAgICAgICA4MTkxClsgICAg
MC4yODY1NjldIC4uLiBDTEFTU0hBU0hfU0laRTogICAgICAgICAgNDA5NgpbICAgIDAuMjg3MDM0
XSAuLi4gTUFYX0xPQ0tERVBfRU5UUklFUzogICAgIDMyNzY4ClsgICAgMC4yODc1MDBdIC4uLiBN
QVhfTE9DS0RFUF9DSEFJTlM6ICAgICAgNjU1MzYKWyAgICAwLjI4Nzk2Nl0gLi4uIENIQUlOSEFT
SF9TSVpFOiAgICAgICAgICAzMjc2OApbICAgIDAuMjg4NDM2XSAgbWVtb3J5IHVzZWQgYnkgbG9j
ayBkZXBlbmRlbmN5IGluZm86IDcyNjMga0IKWyAgICAwLjI5NzA2NF0gIHBlciB0YXNrLXN0cnVj
dCBtZW1vcnkgZm9vdHByaW50OiAxOTIwIGJ5dGVzClsgICAgMC4yOTc2NjldIEFDUEk6IENvcmUg
cmV2aXNpb24gMjAxODEyMTMKWyAgICAwLjI5ODM4Nl0gY2xvY2tzb3VyY2U6IGhwZXQ6IG1hc2s6
IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6IDE5MTEyNjA0
NDY3IG5zClsgICAgMC4yOTk1NTRdIGhwZXQgY2xvY2tldmVudCByZWdpc3RlcmVkClsgICAgMC4z
MDAwNDJdIEFQSUM6IFN3aXRjaCB0byBzeW1tZXRyaWMgSS9PIG1vZGUgc2V0dXAKWyAgICAwLjMw
MDYyOF0gZW5hYmxlZCBFeHRJTlQgb24gQ1BVIzAKWyAgICAwLjMwMTgxOV0gRU5BQkxJTkcgSU8t
QVBJQyBJUlFzClsgICAgMC4zMDIxOTFdIGluaXQgSU9fQVBJQyBJUlFzClsgICAgMC4zMDI1NDJd
ICBhcGljIDAgcGluIDAgbm90IGNvbm5lY3RlZApbICAgIDAuMzAyOTc2XSBJT0FQSUNbMF06IFNl
dCByb3V0aW5nIGVudHJ5ICgwLTEgLT4gMHhlZiAtPiBJUlEgMSBNb2RlOjAgQWN0aXZlOjAgRGVz
dDoxKQpbICAgIDAuMzAzODY2XSBJT0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTIgLT4g
MHgzMCAtPiBJUlEgMCBNb2RlOjAgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMzA0NzI4XSBJT0FQ
SUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTMgLT4gMHhlZiAtPiBJUlEgMyBNb2RlOjAgQWN0
aXZlOjAgRGVzdDoxKQpbICAgIDAuMzA1NTk4XSBJT0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5
ICgwLTQgLT4gMHhlZiAtPiBJUlEgNCBNb2RlOjAgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMzA2
NDI3XSBJT0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTUgLT4gMHhlZiAtPiBJUlEgNSBN
b2RlOjEgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMzA3Mjc5XSBJT0FQSUNbMF06IFNldCByb3V0
aW5nIGVudHJ5ICgwLTYgLT4gMHhlZiAtPiBJUlEgNiBNb2RlOjAgQWN0aXZlOjAgRGVzdDoxKQpb
ICAgIDAuMzA4MTI2XSBJT0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTcgLT4gMHhlZiAt
PiBJUlEgNyBNb2RlOjAgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMzA5MDAyXSBJT0FQSUNbMF06
IFNldCByb3V0aW5nIGVudHJ5ICgwLTggLT4gMHhlZiAtPiBJUlEgOCBNb2RlOjAgQWN0aXZlOjAg
RGVzdDoxKQpbICAgIDAuMzA5ODQ0XSBJT0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTkg
LT4gMHhlZiAtPiBJUlEgOSBNb2RlOjEgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMzEwNjkxXSBJ
T0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTEwIC0+IDB4ZWYgLT4gSVJRIDEwIE1vZGU6
MSBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4zMTE1NDldIElPQVBJQ1swXTogU2V0IHJvdXRpbmcg
ZW50cnkgKDAtMTEgLT4gMHhlZiAtPiBJUlEgMTEgTW9kZToxIEFjdGl2ZTowIERlc3Q6MSkKWyAg
ICAwLjMxMjM5Ml0gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC0xMiAtPiAweGVmIC0+
IElSUSAxMiBNb2RlOjAgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMzEzMjU4XSBJT0FQSUNbMF06
IFNldCByb3V0aW5nIGVudHJ5ICgwLTEzIC0+IDB4ZWYgLT4gSVJRIDEzIE1vZGU6MCBBY3RpdmU6
MCBEZXN0OjEpClsgICAgMC4zMTQxMTddIElPQVBJQ1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAt
MTQgLT4gMHhlZiAtPiBJUlEgMTQgTW9kZTowIEFjdGl2ZTowIERlc3Q6MSkKWyAgICAwLjMxNDk3
MV0gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC0xNSAtPiAweGVmIC0+IElSUSAxNSBN
b2RlOjAgQWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMzE1ODI0XSAgYXBpYyAwIHBpbiAxNiBub3Qg
Y29ubmVjdGVkClsgICAgMC4zMTYyNDJdICBhcGljIDAgcGluIDE3IG5vdCBjb25uZWN0ZWQKWyAg
ICAwLjMxNjY2OV0gIGFwaWMgMCBwaW4gMTggbm90IGNvbm5lY3RlZApbICAgIDAuMzE3MTI3XSAg
YXBpYyAwIHBpbiAxOSBub3QgY29ubmVjdGVkClsgICAgMC4zMTc1NjBdICBhcGljIDAgcGluIDIw
IG5vdCBjb25uZWN0ZWQKWyAgICAwLjMxNzk3MV0gIGFwaWMgMCBwaW4gMjEgbm90IGNvbm5lY3Rl
ZApbICAgIDAuMzE4MzkwXSAgYXBpYyAwIHBpbiAyMiBub3QgY29ubmVjdGVkClsgICAgMC4zMTg4
MTZdICBhcGljIDAgcGluIDIzIG5vdCBjb25uZWN0ZWQKWyAgICAwLjMxOTM0OF0gLi5USU1FUjog
dmVjdG9yPTB4MzAgYXBpYzE9MCBwaW4xPTIgYXBpYzI9LTEgcGluMj0tMQpbICAgIDAuMzIwMDEx
XSBjbG9ja3NvdXJjZTogdHNjLWVhcmx5OiBtYXNrOiAweGZmZmZmZmZmZmZmZmZmZmYgbWF4X2N5
Y2xlczogMHgyMTI3MzFhNTMwMSwgbWF4X2lkbGVfbnM6IDQ0MDc5NTMxNzEyMyBucwpbICAgIDAu
MzIxMTUwXSBDYWxpYnJhdGluZyBkZWxheSBsb29wIChza2lwcGVkKSBwcmVzZXQgdmFsdWUuLiA0
NTk5Ljk5IEJvZ29NSVBTIChscGo9MjI5OTk5NikKWyAgICAwLjMyMjEzNF0gcGlkX21heDogZGVm
YXVsdDogNDA5NiBtaW5pbXVtOiAzMDEKWyAgICAwLjMyMzQ5OV0gRGVudHJ5IGNhY2hlIGhhc2gg
dGFibGUgZW50cmllczogNjU1MzYgKG9yZGVyOiA3LCA1MjQyODggYnl0ZXMpClsgICAgMC4zMjQy
OTldIElub2RlLWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMzI3NjggKG9yZGVyOiA2LCAyNjIx
NDQgYnl0ZXMpClsgICAgMC4zMjUxNDldIE1vdW50LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczog
MTAyNCAob3JkZXI6IDEsIDgxOTIgYnl0ZXMpClsgICAgMC4zMjU4NDFdIE1vdW50cG9pbnQtY2Fj
aGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMDI0IChvcmRlcjogMSwgODE5MiBieXRlcykKWyAgICAw
LjMyNzIxNl0gbnVtYV9hZGRfY3B1IGNwdSAwIG5vZGUgMDogbWFzayBub3cgMApbICAgIDAuMzI3
NzI3XSBMYXN0IGxldmVsIGlUTEIgZW50cmllczogNEtCIDAsIDJNQiAwLCA0TUIgMApbICAgIDAu
MzI4MTM0XSBMYXN0IGxldmVsIGRUTEIgZW50cmllczogNEtCIDAsIDJNQiAwLCA0TUIgMCwgMUdC
IDAKWyAgICAwLjMyODc1N10gU3BlY3RyZSBWMiA6IE1pdGlnYXRpb246IEZ1bGwgZ2VuZXJpYyBy
ZXRwb2xpbmUKWyAgICAwLjMyOTEzM10gU3BlY3RyZSBWMiA6IFNwZWN0cmUgdjIgLyBTcGVjdHJl
UlNCIG1pdGlnYXRpb246IEZpbGxpbmcgUlNCIG9uIGNvbnRleHQgc3dpdGNoClsgICAgMC4zMzAx
NDBdIFNwZWN1bGF0aXZlIFN0b3JlIEJ5cGFzczogVnVsbmVyYWJsZQpbICAgIDAuMzMwNzM3XSBG
cmVlaW5nIFNNUCBhbHRlcm5hdGl2ZXMgbWVtb3J5OiAyMEsKWyAgICAwLjMzMTQ0N10gVXNpbmcg
bG9jYWwgQVBJQyB0aW1lciBpbnRlcnJ1cHRzLgpbICAgIDAuMzMxNDQ3XSBjYWxpYnJhdGluZyBB
UElDIHRpbWVyIC4uLgpbICAgIDAuMzMzMTI5XSAuLi4gbGFwaWMgZGVsdGEgPSA3OTk5NjU0Clsg
ICAgMC4zMzMxMjldIC4uLiBQTS1UaW1lciBkZWx0YSA9IDQ1ODE2NgpbICAgIDAuMzMzMTI5XSBB
UElDIGNhbGlicmF0aW9uIG5vdCBjb25zaXN0ZW50IHdpdGggUE0tVGltZXI6IDEyN21zIGluc3Rl
YWQgb2YgMTAwbXMKWyAgICAwLjMzMzEyOV0gQVBJQyBkZWx0YSBhZGp1c3RlZCB0byBQTS1UaW1l
cjogNjI0OTkzNSAoNzk5OTY1NCkKWyAgICAwLjMzMzEyOV0gVFNDIGRlbHRhIGFkanVzdGVkIHRv
IFBNLVRpbWVyOiAyMjk5OTkxNzkgKDI5NDM4OTIzNCkKWyAgICAwLjMzMzEyOV0gLi4uLi4gZGVs
dGEgNjI0OTkzNQpbICAgIDAuMzMzMTI5XSAuLi4uLiBtdWx0OiAyNjg0MzI2NjQKWyAgICAwLjMz
MzEyOV0gLi4uLi4gY2FsaWJyYXRpb24gcmVzdWx0OiA5OTk5ODkKWyAgICAwLjMzMzEyOV0gLi4u
Li4gQ1BVIGNsb2NrIHNwZWVkIGlzIDIyOTkuMDk5MSBNSHouClsgICAgMC4zMzMxMjldIC4uLi4u
IGhvc3QgYnVzIGNsb2NrIHNwZWVkIGlzIDk5OS4wOTg5IE1Iei4KWyAgICAwLjMzMzE3NV0gc21w
Ym9vdDogQ1BVMDogSW50ZWwgQ29tbW9uIEtWTSBwcm9jZXNzb3IgKGZhbWlseTogMHhmLCBtb2Rl
bDogMHg2LCBzdGVwcGluZzogMHgxKQpbICAgIDAuMzQwMTU3XSBQZXJmb3JtYW5jZSBFdmVudHM6
IHVuc3VwcG9ydGVkIE5ldGJ1cnN0IENQVSBtb2RlbCA2IG5vIFBNVSBkcml2ZXIsIHNvZnR3YXJl
IGV2ZW50cyBvbmx5LgpbICAgIDAuMzQzMTQzXSByY3U6IEhpZXJhcmNoaWNhbCBTUkNVIGltcGxl
bWVudGF0aW9uLgpbICAgIDAuMzQ1MjMyXSBOTUkgd2F0Y2hkb2c6IFBlcmYgTk1JIHdhdGNoZG9n
IHBlcm1hbmVudGx5IGRpc2FibGVkClsgICAgMC4zNDgxNDJdIHNtcDogQnJpbmdpbmcgdXAgc2Vj
b25kYXJ5IENQVXMgLi4uClsgICAgMC4zNTYyMDRdIHg4NjogQm9vdGluZyBTTVAgY29uZmlndXJh
dGlvbjoKWyAgICAwLjM1NjY3N10gLi4uLiBub2RlICAjMCwgQ1BVczogICAgICAjMQpbICAgIDAu
MTQ4MTM2XSBrdm0tY2xvY2s6IGNwdSAxLCBtc3IgMjg4NzA0MSwgc2Vjb25kYXJ5IGNwdSBjbG9j
awpbICAgIDAuMTQ4MTM2XSBtYXNrZWQgRXh0SU5UIG9uIENQVSMxClsgICAgMC4xNDgxMzZdIG51
bWFfYWRkX2NwdSBjcHUgMSBub2RlIDA6IG1hc2sgbm93IDAtMQpbICAgIDAuMzc2MjAxXSBLVk0g
c2V0dXAgYXN5bmMgUEYgZm9yIGNwdSAxClsgICAgMC4zNzY2MjVdIGt2bS1zdGVhbHRpbWU6IGNw
dSAxLCBtc3IgMWRkMTUwYzAKWyAgICAwLjM3NzE0OF0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwg
MiBDUFVzClsgICAgMC4zNzgxNTVdIHNtcGJvb3Q6IE1heCBsb2dpY2FsIHBhY2thZ2VzOiAyClsg
ICAgMC4zNzg2MDBdIHNtcGJvb3Q6IFRvdGFsIG9mIDIgcHJvY2Vzc29ycyBhY3RpdmF0ZWQgKDkx
OTkuOTggQm9nb01JUFMpClsgICAgMC4zNzk0NjddIGRldnRtcGZzOiBpbml0aWFsaXplZApbICAg
IDAuMzgwMzcwXSB4ODYvbW06IE1lbW9yeSBibG9jayBzaXplOiAxMjhNQgpbICAgIDAuMzgyMjI3
XSB3b3JrcXVldWU6IHJvdW5kLXJvYmluIENQVSBzZWxlY3Rpb24gZm9yY2VkLCBleHBlY3QgcGVy
Zm9ybWFuY2UgaW1wYWN0ClsgICAgMC4zODMyMTVdIGNsb2Nrc291cmNlOiBqaWZmaWVzOiBtYXNr
OiAweGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZmZmYsIG1heF9pZGxlX25zOiAxOTExMjYw
NDQ2Mjc1MDAwIG5zClsgICAgMC4zODQxNDVdIGZ1dGV4IGhhc2ggdGFibGUgZW50cmllczogMTYg
KG9yZGVyOiAtMSwgMjA0OCBieXRlcykKWyAgICAwLjM4NTI0OV0gcGluY3RybCBjb3JlOiBpbml0
aWFsaXplZCBwaW5jdHJsIHN1YnN5c3RlbQpbICAgIDAuMzg2NDc1XSByZWd1bGF0b3ItZHVtbXk6
IG5vIHBhcmFtZXRlcnMKWyAgICAwLjM4NzI4OF0gcmVndWxhdG9yLWR1bW15OiBubyBwYXJhbWV0
ZXJzClsgICAgMC4zODc4MDVdIHJlZ3VsYXRvci1kdW1teTogRmFpbGVkIHRvIGNyZWF0ZSBkZWJ1
Z2ZzIGRpcmVjdG9yeQpbICAgIDAuMzg4MjU1XSBSVEMgdGltZTogMTY6MDA6MjIsIGRhdGU6IDIw
MTktMDItMTgKWyAgICAwLjM4OTI4MV0gcmFuZG9tOiBnZXRfcmFuZG9tX3UzMiBjYWxsZWQgZnJv
bSBidWNrZXRfdGFibGVfYWxsb2MrMHg4My8weDE1MCB3aXRoIGNybmdfaW5pdD0wClsgICAgMC4z
OTAyNzhdIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMTYKWyAgICAwLjM5MjQwMF0g
YXVkaXQ6IGluaXRpYWxpemluZyBuZXRsaW5rIHN1YnN5cyAoZGlzYWJsZWQpClsgICAgMC4zOTQx
NTVdIGF1ZGl0OiB0eXBlPTIwMDAgYXVkaXQoMTU1MDQ3NjgyMi4xOTk6MSk6IHN0YXRlPWluaXRp
YWxpemVkIGF1ZGl0X2VuYWJsZWQ9MCByZXM9MQpbICAgIDAuMzk1MTY4XSBjcHVpZGxlOiB1c2lu
ZyBnb3Zlcm5vciBsYWRkZXIKWyAgICAwLjM5NjE3MV0gY3B1aWRsZTogdXNpbmcgZ292ZXJub3Ig
bWVudQpbICAgIDAuMzk3MTM1XSBBQ1BJOiBidXMgdHlwZSBQQ0kgcmVnaXN0ZXJlZApbICAgIDAu
Mzk3NzExXSBkY2Egc2VydmljZSBzdGFydGVkLCB2ZXJzaW9uIDEuMTIuMQpbICAgIDAuMzk4MjQx
XSBQQ0k6IFVzaW5nIGNvbmZpZ3VyYXRpb24gdHlwZSAxIGZvciBiYXNlIGFjY2VzcwpbICAgIDAu
NDE2MjM2XSBIdWdlVExCIHJlZ2lzdGVyZWQgMi4wMCBNaUIgcGFnZSBzaXplLCBwcmUtYWxsb2Nh
dGVkIDAgcGFnZXMKWyAgICAwLjQxNzE2N10gY3J5cHRkOiBtYXhfY3B1X3FsZW4gc2V0IHRvIDEw
MDAKWyAgICAwLjQxNzc2Nl0gQUNQSTogQWRkZWQgX09TSShNb2R1bGUgRGV2aWNlKQpbICAgIDAu
NDE4MTM2XSBBQ1BJOiBBZGRlZCBfT1NJKFByb2Nlc3NvciBEZXZpY2UpClsgICAgMC40MTg2MDRd
IEFDUEk6IEFkZGVkIF9PU0koMy4wIF9TQ1AgRXh0ZW5zaW9ucykKWyAgICAwLjQxOTEzNF0gQUNQ
STogQWRkZWQgX09TSShQcm9jZXNzb3IgQWdncmVnYXRvciBEZXZpY2UpClsgICAgMC40MjAxMzRd
IEFDUEk6IEFkZGVkIF9PU0koTGludXgtRGVsbC1WaWRlbykKWyAgICAwLjQyMDEzN10gQUNQSTog
QWRkZWQgX09TSShMaW51eC1MZW5vdm8tTlYtSERNSS1BdWRpbykKWyAgICAwLjQyMDY5MV0gQUNQ
STogQWRkZWQgX09TSShMaW51eC1IUEktSHlicmlkLUdyYXBoaWNzKQpbICAgIDAuNDI0NzUyXSBB
Q1BJOiAxIEFDUEkgQU1MIHRhYmxlcyBzdWNjZXNzZnVsbHkgYWNxdWlyZWQgYW5kIGxvYWRlZApb
ICAgIDAuNDI4MjQwXSBBQ1BJOiBJbnRlcnByZXRlciBlbmFibGVkClsgICAgMC40Mjg2NzVdIEFD
UEk6IChzdXBwb3J0cyBTMCBTMyBTNSkKWyAgICAwLjQyOTA3OV0gQUNQSTogVXNpbmcgSU9BUElD
IGZvciBpbnRlcnJ1cHQgcm91dGluZwpbICAgIDAuNDMwMTcwXSBQQ0k6IFVzaW5nIGhvc3QgYnJp
ZGdlIHdpbmRvd3MgZnJvbSBBQ1BJOyBpZiBuZWNlc3NhcnksIHVzZSAicGNpPW5vY3JzIiBhbmQg
cmVwb3J0IGEgYnVnClsgICAgMC40MzE0NzldIEFDUEk6IEVuYWJsZWQgMyBHUEVzIGluIGJsb2Nr
IDAwIHRvIDBGClsgICAgMC40NTQ3MjRdIEFDUEk6IFBDSSBSb290IEJyaWRnZSBbUENJMF0gKGRv
bWFpbiAwMDAwIFtidXMgMDAtZmZdKQpbICAgIDAuNDU1MTQzXSBhY3BpIFBOUDBBMDM6MDA6IF9P
U0M6IE9TIHN1cHBvcnRzIFtBU1BNIENsb2NrUE0gU2VnbWVudHMgTVNJXQpbICAgIDAuNDU2MjIw
XSBhY3BpIFBOUDBBMDM6MDA6IGZhaWwgdG8gYWRkIE1NQ09ORklHIGluZm9ybWF0aW9uLCBjYW4n
dCBhY2Nlc3MgZXh0ZW5kZWQgUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgdW5kZXIgdGhpcyBicmlk
Z2UuClsgICAgMC40NTgzMzZdIFBDSSBob3N0IGJyaWRnZSB0byBidXMgMDAwMDowMApbICAgIDAu
NDU4Nzg0XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtpbyAgMHgwMDAwLTB4
MGNmNyB3aW5kb3ddClsgICAgMC40ODMxNDldIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVz
b3VyY2UgW2lvICAweDBkMDAtMHhmZmZmIHdpbmRvd10KWyAgICAwLjQ4NDEzNl0gcGNpX2J1cyAw
MDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4MDAwYTAwMDAtMHgwMDBiZmZmZiB3aW5k
b3ddClsgICAgMC40ODQxMzZdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW21l
bSAweDIwMDAwMDAwLTB4ZmViZmZmZmYgd2luZG93XQpbICAgIDAuNDg0ODgyXSBwY2lfYnVzIDAw
MDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtidXMgMDAtZmZdClsgICAgMC40ODYyMzVdIHBjaSAw
MDAwOjAwOjAwLjA6IFs4MDg2OjEyMzddIHR5cGUgMDAgY2xhc3MgMHgwNjAwMDAKWyAgICAwLjQ4
NzIwNV0gcGNpIDAwMDA6MDA6MDEuMDogWzgwODY6NzAwMF0gdHlwZSAwMCBjbGFzcyAweDA2MDEw
MApbICAgIDAuNDg4NjIzXSBwY2kgMDAwMDowMDowMS4xOiBbODA4Njo3MDEwXSB0eXBlIDAwIGNs
YXNzIDB4MDEwMTgwClsgICAgMC41MTkxNDBdIHBjaSAwMDAwOjAwOjAxLjE6IHJlZyAweDIwOiBb
aW8gIDB4YzA0MC0weGMwNGZdClsgICAgMC41MjcxNjFdIHBjaSAwMDAwOjAwOjAxLjE6IGxlZ2Fj
eSBJREUgcXVpcms6IHJlZyAweDEwOiBbaW8gIDB4MDFmMC0weDAxZjddClsgICAgMC41Mjc5MDVd
IHBjaSAwMDAwOjAwOjAxLjE6IGxlZ2FjeSBJREUgcXVpcms6IHJlZyAweDE0OiBbaW8gIDB4MDNm
Nl0KWyAgICAwLjUyOTEzN10gcGNpIDAwMDA6MDA6MDEuMTogbGVnYWN5IElERSBxdWlyazogcmVn
IDB4MTg6IFtpbyAgMHgwMTcwLTB4MDE3N10KWyAgICAwLjUyOTEzN10gcGNpIDAwMDA6MDA6MDEu
MTogbGVnYWN5IElERSBxdWlyazogcmVnIDB4MWM6IFtpbyAgMHgwMzc2XQpbICAgIDAuNTMwNTc2
XSBwY2kgMDAwMDowMDowMS4zOiBbODA4Njo3MTEzXSB0eXBlIDAwIGNsYXNzIDB4MDY4MDAwClsg
ICAgMC41MzE1NDNdIHBjaSAwMDAwOjAwOjAxLjM6IHF1aXJrOiBbaW8gIDB4MDYwMC0weDA2M2Zd
IGNsYWltZWQgYnkgUElJWDQgQUNQSQpbICAgIDAuNTMyMTQ1XSBwY2kgMDAwMDowMDowMS4zOiBx
dWlyazogW2lvICAweDA3MDAtMHgwNzBmXSBjbGFpbWVkIGJ5IFBJSVg0IFNNQgpbICAgIDAuNTMz
NTk0XSBwY2kgMDAwMDowMDowMi4wOiBbMTIzNDoxMTExXSB0eXBlIDAwIGNsYXNzIDB4MDMwMDAw
ClsgICAgMC41NDAxNDFdIHBjaSAwMDAwOjAwOjAyLjA6IHJlZyAweDEwOiBbbWVtIDB4ZmQwMDAw
MDAtMHhmZGZmZmZmZiBwcmVmXQpbICAgIDAuNTQ2MTQwXSBwY2kgMDAwMDowMDowMi4wOiByZWcg
MHgxODogW21lbSAweGZlYmYwMDAwLTB4ZmViZjBmZmZdClsgICAgMC41NjYxNDRdIHBjaSAwMDAw
OjAwOjAyLjA6IHJlZyAweDMwOiBbbWVtIDB4ZmViZTAwMDAtMHhmZWJlZmZmZiBwcmVmXQpbICAg
IDAuNTY3NTkwXSBwY2kgMDAwMDowMDowMy4wOiBbODA4NjoxMDBlXSB0eXBlIDAwIGNsYXNzIDB4
MDIwMDAwClsgICAgMC41NzAxMzddIHBjaSAwMDAwOjAwOjAzLjA6IHJlZyAweDEwOiBbbWVtIDB4
ZmViYzAwMDAtMHhmZWJkZmZmZl0KWyAgICAwLjU3MjEzNl0gcGNpIDAwMDA6MDA6MDMuMDogcmVn
IDB4MTQ6IFtpbyAgMHhjMDAwLTB4YzAzZl0KWyAgICAwLjU4NzEzN10gcGNpIDAwMDA6MDA6MDMu
MDogcmVnIDB4MzA6IFttZW0gMHhmZWI4MDAwMC0weGZlYmJmZmZmIHByZWZdClsgICAgMC41ODc2
NjRdIHBjaSAwMDAwOjAwOjA0LjA6IFs4MDg2OjI1YWJdIHR5cGUgMDAgY2xhc3MgMHgwODgwMDAK
WyAgICAwLjU4ODcyNF0gcGNpIDAwMDA6MDA6MDQuMDogcmVnIDB4MTA6IFttZW0gMHhmZWJmMTAw
MC0weGZlYmYxMDBmXQpbICAgIDAuNjA2MzA4XSBBQ1BJOiBQQ0kgSW50ZXJydXB0IExpbmsgW0xO
S0FdIChJUlFzIDUgKjEwIDExKQpbICAgIDAuNjA3MTc2XSBBQ1BJOiBQQ0kgSW50ZXJydXB0IExp
bmsgW0xOS0JdIChJUlFzIDUgKjEwIDExKQpbICAgIDAuNjA3OTgzXSBBQ1BJOiBQQ0kgSW50ZXJy
dXB0IExpbmsgW0xOS0NdIChJUlFzIDUgMTAgKjExKQpbICAgIDAuNjA5Mzg0XSBBQ1BJOiBQQ0kg
SW50ZXJydXB0IExpbmsgW0xOS0RdIChJUlFzIDUgMTAgKjExKQpbICAgIDAuNjA5Mzg0XSBBQ1BJ
OiBQQ0kgSW50ZXJydXB0IExpbmsgW0xOS1NdIChJUlFzICo5KQpbICAgIDAuNjExMjk1XSBwY2kg
MDAwMDowMDowMi4wOiB2Z2FhcmI6IHNldHRpbmcgYXMgYm9vdCBWR0EgZGV2aWNlClsgICAgMC42
MTE5MzldIHBjaSAwMDAwOjAwOjAyLjA6IHZnYWFyYjogVkdBIGRldmljZSBhZGRlZDogZGVjb2Rl
cz1pbyttZW0sb3ducz1pbyttZW0sbG9ja3M9bm9uZQpbICAgIDAuNjEzMTM3XSBwY2kgMDAwMDow
MDowMi4wOiB2Z2FhcmI6IGJyaWRnZSBjb250cm9sIHBvc3NpYmxlClsgICAgMC42MTQxMzVdIHZn
YWFyYjogbG9hZGVkClsgICAgMC42MTQ2ODNdIHZpZGVvZGV2OiBMaW51eCB2aWRlbyBjYXB0dXJl
IGludGVyZmFjZTogdjIuMDAKWyAgICAwLjYxNjIxMl0gcHBzX2NvcmU6IExpbnV4UFBTIEFQSSB2
ZXIuIDEgcmVnaXN0ZXJlZApbICAgIDAuNjE4MTUxXSBwcHNfY29yZTogU29mdHdhcmUgdmVyLiA1
LjMuNiAtIENvcHlyaWdodCAyMDA1LTIwMDcgUm9kb2xmbyBHaW9tZXR0aSA8Z2lvbWV0dGlAbGlu
dXguaXQ+ClsgICAgMC42MjExNzBdIFBUUCBjbG9jayBzdXBwb3J0IHJlZ2lzdGVyZWQKWyAgICAw
LjYyMjU3OF0gUENJOiBVc2luZyBBQ1BJIGZvciBJUlEgcm91dGluZwpbICAgIDAuNjI0MTQ5XSBQ
Q0k6IHBjaV9jYWNoZV9saW5lX3NpemUgc2V0IHRvIDY0IGJ5dGVzClsgICAgMC42MjU0NDJdIGU4
MjA6IHJlc2VydmUgUkFNIGJ1ZmZlciBbbWVtIDB4MDAwOWZjMDAtMHgwMDA5ZmZmZl0KWyAgICAw
LjYyODE3M10gZTgyMDogcmVzZXJ2ZSBSQU0gYnVmZmVyIFttZW0gMHgxZmZlMDAwMC0weDFmZmZm
ZmZmXQpbICAgIDAuNjMxMTMyXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDgKWyAg
ICAwLjY0NDEzOV0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAyMApbICAgIDAuNjQ1
NDQ4XSBIUEVUOiAzIHRpbWVycyBpbiB0b3RhbCwgMCB0aW1lcnMgd2lsbCBiZSB1c2VkIGZvciBw
ZXItY3B1IHRpbWVyClsgICAgMC42NDcyNTddIGNsb2Nrc291cmNlOiBTd2l0Y2hlZCB0byBjbG9j
a3NvdXJjZSBrdm0tY2xvY2sKWyAgICAwLjY5MjU5M10gVkZTOiBEaXNrIHF1b3RhcyBkcXVvdF82
LjYuMApbICAgIDAuNjkzMDY1XSBWRlM6IERxdW90LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczog
NTEyIChvcmRlciAwLCA0MDk2IGJ5dGVzKQpbICAgIDAuNjkzOTQ1XSBwbnA6IFBuUCBBQ1BJIGlu
aXQKWyAgICAwLjY5NDQ5MF0gcG5wIDAwOjAwOiBQbHVnIGFuZCBQbGF5IEFDUEkgZGV2aWNlLCBJ
RHMgUE5QMGIwMCAoYWN0aXZlKQpbICAgIDAuNjk1MjY5XSBwbnAgMDA6MDE6IFBsdWcgYW5kIFBs
YXkgQUNQSSBkZXZpY2UsIElEcyBQTlAwMzAzIChhY3RpdmUpClsgICAgMC42OTYwMTNdIHBucCAw
MDowMjogUGx1ZyBhbmQgUGxheSBBQ1BJIGRldmljZSwgSURzIFBOUDBmMTMgKGFjdGl2ZSkKWyAg
ICAwLjY5NjcwNV0gcG5wIDAwOjAzOiBbZG1hIDJdClsgICAgMC42OTcwNzRdIHBucCAwMDowMzog
UGx1ZyBhbmQgUGxheSBBQ1BJIGRldmljZSwgSURzIFBOUDA3MDAgKGFjdGl2ZSkKWyAgICAwLjY5
Nzg4NF0gcG5wIDAwOjA0OiBQbHVnIGFuZCBQbGF5IEFDUEkgZGV2aWNlLCBJRHMgUE5QMDQwMCAo
YWN0aXZlKQpbICAgIDAuNjk4Njc5XSBwbnAgMDA6MDU6IFBsdWcgYW5kIFBsYXkgQUNQSSBkZXZp
Y2UsIElEcyBQTlAwNTAxIChhY3RpdmUpClsgICAgMC42OTk0NzRdIHBucCAwMDowNjogUGx1ZyBh
bmQgUGxheSBBQ1BJIGRldmljZSwgSURzIFBOUDA1MDEgKGFjdGl2ZSkKWyAgICAwLjcwMDc5NV0g
cG5wOiBQblAgQUNQSTogZm91bmQgNyBkZXZpY2VzClsgICAgMC43MTk2MTFdIGNsb2Nrc291cmNl
OiBhY3BpX3BtOiBtYXNrOiAweGZmZmZmZiBtYXhfY3ljbGVzOiAweGZmZmZmZiwgbWF4X2lkbGVf
bnM6IDIwODU3MDEwMjQgbnMKWyAgICAwLjcyMDYwM10gcGNpX2J1cyAwMDAwOjAwOiByZXNvdXJj
ZSA0IFtpbyAgMHgwMDAwLTB4MGNmNyB3aW5kb3ddClsgICAgMC43MjEyNjRdIHBjaV9idXMgMDAw
MDowMDogcmVzb3VyY2UgNSBbaW8gIDB4MGQwMC0weGZmZmYgd2luZG93XQpbICAgIDAuNzIxOTAy
XSBwY2lfYnVzIDAwMDA6MDA6IHJlc291cmNlIDYgW21lbSAweDAwMGEwMDAwLTB4MDAwYmZmZmYg
d2luZG93XQpbICAgIDAuNzIyNjE5XSBwY2lfYnVzIDAwMDA6MDA6IHJlc291cmNlIDcgW21lbSAw
eDIwMDAwMDAwLTB4ZmViZmZmZmYgd2luZG93XQpbICAgIDAuNzIzNTQwXSBORVQ6IFJlZ2lzdGVy
ZWQgcHJvdG9jb2wgZmFtaWx5IDIKWyAgICAwLjcyNDQxMl0gdGNwX2xpc3Rlbl9wb3J0YWRkcl9o
YXNoIGhhc2ggdGFibGUgZW50cmllczogMjU2IChvcmRlcjogMiwgMTg0MzIgYnl0ZXMpClsgICAg
MC43MjUyODBdIFRDUCBlc3RhYmxpc2hlZCBoYXNoIHRhYmxlIGVudHJpZXM6IDQwOTYgKG9yZGVy
OiAzLCAzMjc2OCBieXRlcykKWyAgICAwLjcyNjA2MV0gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRy
aWVzOiA0MDk2IChvcmRlcjogNiwgMjYyMTQ0IGJ5dGVzKQpbICAgIDAuNzI2ODk2XSBUQ1A6IEhh
c2ggdGFibGVzIGNvbmZpZ3VyZWQgKGVzdGFibGlzaGVkIDQwOTYgYmluZCA0MDk2KQpbICAgIDAu
NzI4MzMzXSBVRFAgaGFzaCB0YWJsZSBlbnRyaWVzOiAyNTYgKG9yZGVyOiAzLCA0MDk2MCBieXRl
cykKWyAgICAwLjcyODk4NV0gVURQLUxpdGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAyNTYgKG9yZGVy
OiAzLCA0MDk2MCBieXRlcykKWyAgICAwLjcyOTc1MF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29s
IGZhbWlseSAxClsgICAgMC43MzAzODldIHBjaSAwMDAwOjAwOjAxLjA6IFBJSVgzOiBFbmFibGlu
ZyBQYXNzaXZlIFJlbGVhc2UKWyAgICAwLjczMDk5N10gcGNpIDAwMDA6MDA6MDAuMDogTGltaXRp
bmcgZGlyZWN0IFBDSS9QQ0kgdHJhbnNmZXJzClsgICAgMC43MzE2NjVdIHBjaSAwMDAwOjAwOjAx
LjA6IEFjdGl2YXRpbmcgSVNBIERNQSBoYW5nIHdvcmthcm91bmRzClsgICAgMC43MzI0MTJdIHBj
aSAwMDAwOjAwOjAyLjA6IFZpZGVvIGRldmljZSB3aXRoIHNoYWRvd2VkIFJPTSBhdCBbbWVtIDB4
MDAwYzAwMDAtMHgwMDBkZmZmZl0KWyAgICAwLjczMzI4N10gUENJOiBDTFMgMCBieXRlcywgZGVm
YXVsdCA2NApbICAgIDAuNzMzODc3XSBVbnBhY2tpbmcgaW5pdHJhbWZzLi4uClsgICAgMi4yMjI4
MDddIEZyZWVpbmcgaW5pdHJkIG1lbW9yeTogMjM2NTZLClsgICAgMi4yMjM2MjNdIGNsb2Nrc291
cmNlOiB0c2M6IG1hc2s6IDB4ZmZmZmZmZmZmZmZmZmZmZiBtYXhfY3ljbGVzOiAweDIxMjczMWE1
MzAxLCBtYXhfaWRsZV9uczogNDQwNzk1MzE3MTIzIG5zClsgICAgMi4yMjQ4MjRdIGNoZWNrOiBT
Y2FubmluZyBmb3IgbG93IG1lbW9yeSBjb3JydXB0aW9uIGV2ZXJ5IDYwIHNlY29uZHMKWyAgICAy
LjIzNTk0MV0gZGVzM19lZGUteDg2XzY0OiBwZXJmb3JtYW5jZSBvbiB0aGlzIENQVSB3b3VsZCBi
ZSBzdWJvcHRpbWFsOiBkaXNhYmxpbmcgZGVzM19lZGUteDg2XzY0LgpbICAgIDIuMjM2ODgyXSBi
bG93ZmlzaC14ODZfNjQ6IHBlcmZvcm1hbmNlIG9uIHRoaXMgQ1BVIHdvdWxkIGJlIHN1Ym9wdGlt
YWw6IGRpc2FibGluZyBibG93ZmlzaC14ODZfNjQuClsgICAgMi4yMzkyMzNdIHR3b2Zpc2gteDg2
XzY0LTN3YXk6IHBlcmZvcm1hbmNlIG9uIHRoaXMgQ1BVIHdvdWxkIGJlIHN1Ym9wdGltYWw6IGRp
c2FibGluZyB0d29maXNoLXg4Nl82NC0zd2F5LgpbICAgIDIuMjQwMjYzXSBDUFUgZmVhdHVyZSAn
QVZYIHJlZ2lzdGVycycgaXMgbm90IHN1cHBvcnRlZC4KWyAgICAyLjI0MDgwNF0gQ1BVIGZlYXR1
cmUgJ0FWWCByZWdpc3RlcnMnIGlzIG5vdCBzdXBwb3J0ZWQuClsgICAgMi4yNDEzNzZdIENQVSBm
ZWF0dXJlICdBVlggcmVnaXN0ZXJzJyBpcyBub3Qgc3VwcG9ydGVkLgpbICAgIDguODUyODA5XSBJ
bml0aWFsaXNlIHN5c3RlbSB0cnVzdGVkIGtleXJpbmdzClsgICAgOC44NTQ3MTRdIHdvcmtpbmdz
ZXQ6IHRpbWVzdGFtcF9iaXRzPTU2IG1heF9vcmRlcj0xNyBidWNrZXRfb3JkZXI9MApbICAgIDgu
ODU3MjU1XSBvcmFuZ2Vmc19kZWJ1Z2ZzX2luaXQ6IGNhbGxlZCB3aXRoIGRlYnVnIG1hc2s6IDpu
b25lOiA6MDoKWyAgICA4Ljg1ODMzN10gb3JhbmdlZnNfaW5pdDogbW9kdWxlIHZlcnNpb24gdXBz
dHJlYW0gbG9hZGVkClsgICAgOC44ODA3NzddIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1p
bHkgMzgKWyAgICA4Ljg4MTk5NF0gS2V5IHR5cGUgYXN5bW1ldHJpYyByZWdpc3RlcmVkClsgICAg
OS4wMDY2MjJdIFN0cmluZyBzZWxmdGVzdHMgc3VjY2VlZGVkClsgICAgOS4wMDc0NzBdIGdwaW9f
aXQ4Nzogbm8gZGV2aWNlClsgICAgOS4wMDgwNTddIGdwaW9fd2luYm9uZDogY2hpcCBJRCBhdCAy
ZSBpcyBmZmZmClsgICAgOS4wMDg1MzNdIGdwaW9fd2luYm9uZDogbm90IGFuIG91ciBjaGlwClsg
ICAgOS4wMDg5NjFdIGdwaW9fd2luYm9uZDogY2hpcCBJRCBhdCA0ZSBpcyBmZmZmClsgICAgOS4w
MDk0NTFdIGdwaW9fd2luYm9uZDogbm90IGFuIG91ciBjaGlwClsgICAgOS4wMjMyMjldIHNocGNo
cDogU3RhbmRhcmQgSG90IFBsdWcgUENJIENvbnRyb2xsZXIgRHJpdmVyIHZlcnNpb246IDAuNApb
ICAgIDkuMDI0MDI3XSBzd2l0Y2h0ZWM6IGxvYWRlZC4KWyAgICA5LjAyNDcwOF0gaW5wdXQ6IFBv
d2VyIEJ1dHRvbiBhcyAvZGV2aWNlcy9MTlhTWVNUTTowMC9MTlhQV1JCTjowMC9pbnB1dC9pbnB1
dDAKWyAgICA5LjAzMjIzMV0gQUNQSTogUG93ZXIgQnV0dG9uIFtQV1JGXQpbICAgIDkuMDMzMDU4
XSBpbnB1dDogUG93ZXIgQnV0dG9uIGFzIC9kZXZpY2VzL0xOWFNZU1RNOjAwL0xOWFBXUkJOOjAw
L2lucHV0L2lucHV0MQpbICAgIDkuMDMzOTE4XSBBQ1BJOiBQb3dlciBCdXR0b24gW1BXUkZdClsg
ICAgOS4wMzQ0MTRdIFdhcm5pbmc6IFByb2Nlc3NvciBQbGF0Zm9ybSBMaW1pdCBldmVudCBkZXRl
Y3RlZCwgYnV0IG5vdCBoYW5kbGVkLgpbICAgIDkuMDM1MTUzXSBDb25zaWRlciBjb21waWxpbmcg
Q1BVZnJlcSBzdXBwb3J0IGludG8geW91ciBrZXJuZWwuClsgICAgOS4wNDk2NTBdIGlvYXRkbWE6
IEludGVsKFIpIFF1aWNrRGF0YSBUZWNobm9sb2d5IERyaXZlciA0LjAwClsgICAgOS4wNTA4MDVd
IFNlcmlhbDogODI1MC8xNjU1MCBkcml2ZXIsIDQgcG9ydHMsIElSUSBzaGFyaW5nIGRpc2FibGVk
ClsgICAgOS4wODQ1MTRdIDAwOjA1OiB0dHlTMCBhdCBJL08gMHgzZjggKGlycSA9IDQsIGJhc2Vf
YmF1ZCA9IDExNTIwMCkgaXMgYSAxNjU1MEEKWyAgICA5LjA4NzkzNV0gcHJpbnRrOiBjb25zb2xl
IFt0dHlTMF0gZGlzYWJsZWQKWyAgICA5LjExMjg3MV0gMDA6MDU6IHR0eVMwIGF0IEkvTyAweDNm
OCAoaXJxID0gNCwgYmFzZV9iYXVkID0gMTE1MjAwKSBpcyBhIDE2NTUwQQpbICAgIDkuNDc2MTYz
XSBwcmludGs6IGNvbnNvbGUgW3R0eVMwXSBlbmFibGVkClsgICAgOS41MDE1NTZdIDAwOjA2OiB0
dHlTMSBhdCBJL08gMHgyZjggKGlycSA9IDMsIGJhc2VfYmF1ZCA9IDExNTIwMCkgaXMgYSAxNjU1
MEEKWyAgICA5LjU0MDM2N10gMDA6MDY6IHR0eVMxIGF0IEkvTyAweDJmOCAoaXJxID0gMywgYmFz
ZV9iYXVkID0gMTE1MjAwKSBpcyBhIDE2NTUwQQpbICAgIDkuNTQzNDA4XSBJbml0aWFsaXppbmcg
Tm96b21pIGRyaXZlciAyLjFkClsgICAgOS41NDQwMjddIExpbnV4IGFncGdhcnQgaW50ZXJmYWNl
IHYwLjEwMwpbICAgIDkuNTQ1Mzc5XSBkdW1teS1pcnE6IG5vIElSUSBnaXZlbi4gIFVzZSBpcnE9
TgpbICAgIDkuNTQ1OTQxXSBQaGFudG9tIExpbnV4IERyaXZlciwgdmVyc2lvbiBuMC45LjgsIGlu
aXQgT0sKWyAgICA5LjU0NjYyN10gU2lsaWNvbiBMYWJzIEMyIHBvcnQgc3VwcG9ydCB2LiAwLjUx
LjAgLSAoQykgMjAwNyBSb2RvbGZvIEdpb21ldHRpClsgICAgOS41NDc2ODFdIEd1ZXN0IHBlcnNv
bmFsaXR5IGluaXRpYWxpemVkIGFuZCBpcyBpbmFjdGl2ZQpbICAgIDkuNTQ4Nzg0XSBWTUNJIGhv
c3QgZGV2aWNlIHJlZ2lzdGVyZWQgKG5hbWU9dm1jaSwgbWFqb3I9MTAsIG1pbm9yPTYxKQpbICAg
IDkuNTQ5NDk3XSBJbml0aWFsaXplZCBob3N0IHBlcnNvbmFsaXR5ClsgICAgOS41NTEzMDZdIGxp
YnBoeTogRml4ZWQgTURJTyBCdXM6IHByb2JlZApbICAgIDkuNTUyMzAxXSB2Y2FuOiBWaXJ0dWFs
IENBTiBpbnRlcmZhY2UgZHJpdmVyClsgICAgOS41NTI3NzddIHZ4Y2FuOiBWaXJ0dWFsIENBTiBU
dW5uZWwgZHJpdmVyClsgICAgOS41NTMyNDVdIHNsY2FuOiBzZXJpYWwgbGluZSBDQU4gaW50ZXJm
YWNlIGRyaXZlcgpbICAgIDkuNTUzNzU1XSBzbGNhbjogMTAgZHluYW1pYyBpbnRlcmZhY2UgY2hh
bm5lbHMuClsgICAgOS41NTQyNjJdIENBTiBkZXZpY2UgZHJpdmVyIGludGVyZmFjZQpbICAgIDku
NTU0Njg3XSBzamExMDAwIENBTiBuZXRkZXZpY2UgZHJpdmVyClsgICAgOS41NTUxODhdIHBjbmV0
MzI6IHBjbmV0MzIuYzp2MS4zNSAyMS5BcHIuMjAwOCB0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRl
ClsgICAgOS41NTYwNDhdIHRodW5kZXJfeGN2LCB2ZXIgMS4wClsgICAgOS41NTY1NTBdIHYxLjAx
LWUgKDIuNCBwb3J0KSBTZXAtMTEtMjAwNiAgRG9uYWxkIEJlY2tlciA8YmVja2VyQHNjeWxkLmNv
bT4KWyAgICA5LjU1NjU1MF0gICBodHRwOi8vd3d3LnNjeWxkLmNvbS9uZXR3b3JrL2RyaXZlcnMu
aHRtbApbICAgIDkuNTU3OTc1XSBlMTAwMDogSW50ZWwoUikgUFJPLzEwMDAgTmV0d29yayBEcml2
ZXIgLSB2ZXJzaW9uIDcuMy4yMS1rOC1OQVBJClsgICAgOS41NTg3MTddIGUxMDAwOiBDb3B5cmln
aHQgKGMpIDE5OTktMjAwNiBJbnRlbCBDb3Jwb3JhdGlvbi4KWyAgICA5Ljc1NTY0MV0gUENJIElu
dGVycnVwdCBMaW5rIFtMTktDXSBlbmFibGVkIGF0IElSUSAxMQpbICAgMTAuMjAwMDUyXSBlMTAw
MCAwMDAwOjAwOjAzLjAgZXRoMDogKFBDSTozM01IejozMi1iaXQpIDUyOjU0OjAwOjEyOjM0OjU2
ClsgICAxMC4yMDA4NjZdIGUxMDAwIDAwMDA6MDA6MDMuMCBldGgwOiBJbnRlbChSKSBQUk8vMTAw
MCBOZXR3b3JrIENvbm5lY3Rpb24KWyAgIDExLjAyMzM2NF0gZTEwMDAgMDAwMDowMDowMy4wIGV0
aDA6IChQQ0k6MzNNSHo6MzItYml0KSA1Mjo1NDowMDoxMjozNDo1NgpbICAgMTEuMDI0MTA0XSBl
MTAwMCAwMDAwOjAwOjAzLjAgZXRoMDogSW50ZWwoUikgUFJPLzEwMDAgTmV0d29yayBDb25uZWN0
aW9uClsgICAxMS4wMjUwNTBdIFFMb2dpYy9OZXRYZW4gTmV0d29yayBEcml2ZXIgdjQuMC44Mgpb
ICAgMTEuMDI1NzYwXSBQUFAgZ2VuZXJpYyBkcml2ZXIgdmVyc2lvbiAyLjQuMgpbICAgMTEuMDI2
NDM1XSBNYWRnZSBBVE0gQW1iYXNzYWRvciBkcml2ZXIgdmVyc2lvbiAxLjIuNApbICAgMTEuMDI3
MDA3XSBNYWRnZSBBVE0gSG9yaXpvbiBbVWx0cmFdIGRyaXZlciB2ZXJzaW9uIDEuMi4xClsgICAx
MS4wMjc2MTRdIGZvcmUyMDBlOiBGT1JFIFN5c3RlbXMgMjAwRS1zZXJpZXMgQVRNIGRyaXZlciAt
IHZlcnNpb24gMC4zZQpbICAgMTEuMDI4MzU3XSBhZHVtbXk6IHZlcnNpb24gMS4wClsgICAxMS4w
Mjg5OTRdIGk4MDQyOiBQTlA6IFBTLzIgQ29udHJvbGxlciBbUE5QMDMwMzpLQkQsUE5QMGYxMzpN
T1VdIGF0IDB4NjAsMHg2NCBpcnEgMSwxMgpbICAgMTEuMDU4OTU1XSBzZXJpbzogaTgwNDIgS0JE
IHBvcnQgYXQgMHg2MCwweDY0IGlycSAxClsgICAxMS4wNTk3NTRdIHNlcmlvOiBpODA0MiBBVVgg
cG9ydCBhdCAweDYwLDB4NjQgaXJxIDEyClsgICAxMS4wNjA4ODZdIHJ0Yy10ZXN0IHJ0Yy10ZXN0
LjA6IHJlZ2lzdGVyZWQgYXMgcnRjMApbICAgMTEuMDYxODYyXSBydGMtdGVzdCBydGMtdGVzdC4w
OiByZWdpc3RlcmVkIGFzIHJ0YzAKWyAgIDExLjA2Njk2MF0gcnRjIHJ0YzE6IGludmFsaWQgYWxh
cm0gdmFsdWU6IDE4NDQ2NzQ0MDczNzAzMjk1MDIwLTA2LTAzVDA1OjI4OjI1ClsgICAxMS4wNjc4
NThdIHJ0Yy10ZXN0IHJ0Yy10ZXN0LjE6IHJlZ2lzdGVyZWQgYXMgcnRjMQpbICAgMTEuMDcyNDE1
XSBpbnB1dDogQVQgVHJhbnNsYXRlZCBTZXQgMiBrZXlib2FyZCBhcyAvZGV2aWNlcy9wbGF0Zm9y
bS9pODA0Mi9zZXJpbzAvaW5wdXQvaW5wdXQzClsgICAxMS4wNzM5MTJdIHJ0YyBydGMxOiBpbnZh
bGlkIGFsYXJtIHZhbHVlOiAxODQ0Njc0NDA3MzcwMzI5NTAyMC0wNi0wM1QwNToyODoyNQpbICAg
MTEuMDc1ODMyXSBydGMtdGVzdCBydGMtdGVzdC4xOiByZWdpc3RlcmVkIGFzIHJ0YzEKWyAgIDEx
LjA3Njc4NV0gaW5wdXQ6IEFUIFRyYW5zbGF0ZWQgU2V0IDIga2V5Ym9hcmQgYXMgL2RldmljZXMv
cGxhdGZvcm0vaTgwNDIvc2VyaW8wL2lucHV0L2lucHV0NApbICAgMTEuMDgxMTk2XSBydGMgcnRj
MjogaW52YWxpZCBhbGFybSB2YWx1ZTogMTg0NDY3NDQwNzM3MDMyOTUwMjAtMDYtMDNUMDU6Mjg6
MjUKWyAgIDExLjA4MjA0Ml0gcnRjLXRlc3QgcnRjLXRlc3QuMjogcmVnaXN0ZXJlZCBhcyBydGMy
ClsgICAxMS4wODc1ODFdIHJ0YyBydGMyOiBpbnZhbGlkIGFsYXJtIHZhbHVlOiAxODQ0Njc0NDA3
MzcwMzI5NTAyMC0wNi0wM1QwNToyODoyNQpbICAgMTEuMDg4NTM1XSBydGMtdGVzdCBydGMtdGVz
dC4yOiByZWdpc3RlcmVkIGFzIHJ0YzIKWyAgIDExLjA4OTI3OV0gcGlpeDRfc21idXMgMDAwMDow
MDowMS4zOiBTTUJ1cyBIb3N0IENvbnRyb2xsZXIgYXQgMHg3MDAsIHJldmlzaW9uIDAKWyAgIDEx
LjEwNDQ3Nl0gcGlpeDRfc21idXMgMDAwMDowMDowMS4zOiBTTUJ1cyBIb3N0IENvbnRyb2xsZXIg
YXQgMHg3MDAsIHJldmlzaW9uIDAKWyAgIDExLjExODY5MV0gYjJjMi1mbGV4Y29wOiBCMkMyIEZs
ZXhjb3BJSS9JSShiKS9JSUkgZGlnaXRhbCBUViByZWNlaXZlciBjaGlwIGxvYWRlZCBzdWNjZXNz
ZnVsbHkKWyAgIDExLjExOTY2N10gbmdlbmU6IG5HZW5lIFBDSUUgYnJpZGdlIGRyaXZlciwgQ29w
eXJpZ2h0IChDKSAyMDA1LTIwMDcgTWljcm9uYXMKWyAgIDExLjEyMDQ1MF0gc2FhNzE0NjogcmVn
aXN0ZXIgZXh0ZW5zaW9uICdNdWx0aW1lZGlhIGVYdGVuc2lvbiBCb2FyZCcKWyAgIDExLjEyMTEy
N10gc2FhNzE0NjogcmVnaXN0ZXIgZXh0ZW5zaW9uICdoZXhpdW0gSFYtUENJNiBPcmlvbicKWyAg
IDExLjEyMTc3M10gY3gyNTgyMTogZHJpdmVyIGxvYWRlZApbICAgMTEuMTIyMzk1XSBwcHMgcHBz
MDogbmV3IFBQUyBzb3VyY2Uga3RpbWVyClsgICAxMS4xMjI4MzJdIHBwcyBwcHMwOiBrdGltZXIg
UFBTIHNvdXJjZSByZWdpc3RlcmVkClsgICAxMS4xMjM0ODhdIERyaXZlciBmb3IgMS13aXJlIERh
bGxhcyBuZXR3b3JrIHByb3RvY29sLgpbICAgMTEuMTI0MTY5XSB3MV9mMGRfaW5pdCgpClsgICAx
MS4xNDMyNjBdIGY3MTg4MmZnOiBOb3QgYSBGaW50ZWsgZGV2aWNlClsgICAxMS4xNDM3MDFdIGY3
MTg4MmZnOiBOb3QgYSBGaW50ZWsgZGV2aWNlClsgICAxMS4xOTcyNzBdIHBjODczNjA6IFBDODcz
Nnggbm90IGRldGVjdGVkLCBtb2R1bGUgbm90IGluc2VydGVkClsgICAxMS4xOTc5MjBdIHNjaDU2
eHhfY29tbW9uOiBVbnN1cHBvcnRlZCBkZXZpY2UgaWQ6IDB4ZmYKWyAgIDExLjE5ODQ4NV0gc2No
NTZ4eF9jb21tb246IFVuc3VwcG9ydGVkIGRldmljZSBpZDogMHhmZgpbICAgMTEuMjAzMzYzXSBh
ZHZhbnRlY2h3ZHQ6IFdEVCBkcml2ZXIgZm9yIEFkdmFudGVjaCBzaW5nbGUgYm9hcmQgY29tcHV0
ZXIgaW5pdGlhbGlzaW5nClsgICAxMS4yMDQ0NjhdIGFkdmFudGVjaHdkdDogaW5pdGlhbGl6ZWQu
IHRpbWVvdXQ9NjAgc2VjIChub3dheW91dD0wKQpbICAgMTEuMjA1MTIyXSBhbGltNzEwMV93ZHQ6
IFN0ZXZlIEhpbGwgPHN0ZXZlQG5hdmFoby5jby51az4KWyAgIDExLjIwNTcxMV0gYWxpbTcxMDFf
d2R0OiBBTGkgTTcxMDEgUE1VIG5vdCBwcmVzZW50IC0gV0RUIG5vdCBzZXQKWyAgIDExLjIwNjM2
NV0gaWI3MDB3ZHQ6IFdEVCBkcml2ZXIgZm9yIElCNzAwIHNpbmdsZSBib2FyZCBjb21wdXRlciBp
bml0aWFsaXNpbmcKWyAgIDExLjIwNzI1NF0gaWI3MDB3ZHQ6IFNUQVJUIG1ldGhvZCBJL08gNDQz
IGlzIG5vdCBhdmFpbGFibGUKWyAgIDExLjIwNzg0M10gaWI3MDB3ZHQ6IHByb2JlIG9mIGliNzAw
d2R0IGZhaWxlZCB3aXRoIGVycm9yIC01ClsgICAxMS4yMDg1NTldIHdhZmVyNTgyM3dkdDogV0RU
IGRyaXZlciBmb3IgV2FmZXIgNTgyMyBzaW5nbGUgYm9hcmQgY29tcHV0ZXIgaW5pdGlhbGlzaW5n
ClsgICAxMS4yMDkzOTddIHdhZmVyNTgyM3dkdDogSS9PIGFkZHJlc3MgMHgwNDQzIGFscmVhZHkg
aW4gdXNlClsgICAxMS4yMTYyMDddIHdhdGNoZG9nOiBpNjMwMEVTQiB0aW1lcjogY2Fubm90IHJl
Z2lzdGVyIG1pc2NkZXYgb24gbWlub3I9MTMwIChlcnI9LTE2KS4KWyAgIDExLjIxNzAwNF0gd2F0
Y2hkb2c6IGk2MzAwRVNCIHRpbWVyOiBhIGxlZ2FjeSB3YXRjaGRvZyBtb2R1bGUgaXMgcHJvYmFi
bHkgcHJlc2VudC4KWyAgIDExLjIxOTAzMV0gaTYzMDBFU0IgdGltZXIgMDAwMDowMDowNC4wOiBp
bml0aWFsaXplZCAoMHgoX19fX3B0cnZhbF9fX18pKS4gaGVhcnRiZWF0PTMwIHNlYyAobm93YXlv
dXQ9MCkKWyAgIDExLjIyMjU4Nl0gd2F0Y2hkb2c6IGk2MzAwRVNCIHRpbWVyOiBjYW5ub3QgcmVn
aXN0ZXIgbWlzY2RldiBvbiBtaW5vcj0xMzAgKGVycj0tMTYpLgpbICAgMTEuMjMwNDQ3XSB3YXRj
aGRvZzogaTYzMDBFU0IgdGltZXI6IGEgbGVnYWN5IHdhdGNoZG9nIG1vZHVsZSBpcyBwcm9iYWJs
eSBwcmVzZW50LgpbICAgMTEuMjMyMjY1XSBpNjMwMEVTQiB0aW1lciAwMDAwOjAwOjA0LjA6IGlu
aXRpYWxpemVkICgweChfX19fcHRydmFsX19fXykpLiBoZWFydGJlYXQ9MzAgc2VjIChub3dheW91
dD0wKQpbICAgMTEuMjM0MzMxXSBpVENPX3dkdDogSW50ZWwgVENPIFdhdGNoRG9nIFRpbWVyIERy
aXZlciB2MS4xMQpbICAgMTEuMjM1MDE1XSB3ODM4NzdmX3dkdDogSS9PIGFkZHJlc3MgMHgwNDQz
IGFscmVhZHkgaW4gdXNlClsgICAxMS4yMzc2MzZdIHc4Mzk3N2Zfd2R0OiBkcml2ZXIgdjEuMDAK
WyAgIDExLjIzODAyNl0gdzgzOTc3Zl93ZHQ6IGNhbm5vdCByZWdpc3RlciBtaXNjZGV2IG9uIG1p
bm9yPTEzMCAoZXJyPS0xNikKWyAgIDExLjIzOTkyOF0gbGVkc19zczQyMDA6IG5vIExFRCBkZXZp
Y2VzIGZvdW5kClsgICAxMS4yNDE4MThdIGFzaG1lbTogaW5pdGlhbGl6ZWQKWyAgIDExLjI0NDM3
Ml0gYXhpcy1maWZvIGRyaXZlciBsb2FkZWQgd2l0aCBwYXJhbWV0ZXJzIHJlYWRfdGltZW91dCA9
IDEwMDAsIHdyaXRlX3RpbWVvdXQgPSAxMDAwClsgICAxMS4yNDg2MDddIEludGVsKFIpIFBDSS1F
IE5vbi1UcmFuc3BhcmVudCBCcmlkZ2UgRHJpdmVyIDIuMApbICAgMTEuMjUwMDc3XSBnbnNzOiBH
TlNTIGRyaXZlciByZWdpc3RlcmVkIHdpdGggbWFqb3IgMjM3ClsgICAxMS4yNTA4NTNdIG5ldGVt
OiB2ZXJzaW9uIDEuMwpbICAgMTEuMjUxNDAwXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFt
aWx5IDEwClsgICAxMS4yNjM1ODZdIFNlZ21lbnQgUm91dGluZyB3aXRoIElQdjYKWyAgIDExLjI2
NDUyNV0gc2l0OiBJUHY2LCBJUHY0IGFuZCBNUExTIG92ZXIgSVB2NCB0dW5uZWxpbmcgZHJpdmVy
ClsgICAxMS4yNjU3NTddIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMTcKWyAgIDEx
LjI2NjM0MF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxNQpbICAgMTEuMjY2ODE4
XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDUKWyAgIDExLjI2NzQyOF0gTkVUOiBS
ZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSA5ClsgICAxMS4yNjc5MDddIFgyNTogTGludXggVmVy
c2lvbiAwLjIKWyAgIDExLjI2ODMxNV0gY2FuOiBjb250cm9sbGVyIGFyZWEgbmV0d29yayBjb3Jl
IChyZXYgMjAxNzA0MjUgYWJpIDkpClsgICAxMS4yNjg5NjJdIE5FVDogUmVnaXN0ZXJlZCBwcm90
b2NvbCBmYW1pbHkgMjkKWyAgIDExLjI2OTQ3MV0gY2FuOiBicm9hZGNhc3QgbWFuYWdlciBwcm90
b2NvbCAocmV2IDIwMTcwNDI1IHQpClsgICAxMS4yNzAwNzNdIGxlYzpsYW5lX21vZHVsZV9pbml0
OiBsZWMuYzogaW5pdGlhbGl6ZWQKWyAgIDExLjI4ODc5Ml0gTkVUOiBSZWdpc3RlcmVkIHByb3Rv
Y29sIGZhbWlseSAzNQpbICAgMTEuMjk0NDY1XSA5cG5ldDogSW5zdGFsbGluZyA5UDIwMDAgc3Vw
cG9ydApbICAgMTEuMjk1MDE3XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDM3Clsg
ICAxMS4yOTU1MTddIHN0YXJ0IHBsaXN0IHRlc3QKWyAgIDExLjI5NzYxMl0gZW5kIHBsaXN0IHRl
c3QKWyAgIDExLjI5ODE2MV0gLi4uIEFQSUMgSUQ6ICAgICAgMDAwMDAwMDAgKDApClsgICAxMS4y
OTg2MDddIC4uLiBBUElDIFZFUlNJT046IDAxMDUwMDE0ClsgICAxMS4yOTg5OTZdIDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAK
WyAgIDExLjI5OTE1MV0gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMApbICAgMTEuMzAxMTYwXSBudW1iZXIgb2YgTVAgSVJRIHNv
dXJjZXM6IDE1LgpbICAgMTEuMzAxNTk1XSBudW1iZXIgb2YgSU8tQVBJQyAjMCByZWdpc3RlcnM6
IDI0LgpbICAgMTEuMzAyMDQ5XSB0ZXN0aW5nIHRoZSBJTyBBUElDLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4KWyAgIDExLjMwMjU5NV0gSU8gQVBJQyAjMC4uLi4uLgpbICAgMTEuMzAyODk2XSAuLi4u
IHJlZ2lzdGVyICMwMDogMDAwMDAwMDAKWyAgIDExLjMwMzI5OF0gLi4uLi4uLiAgICA6IHBoeXNp
Y2FsIEFQSUMgaWQ6IDAwClsgICAxMS4zMDM3MzddIC4uLi4uLi4gICAgOiBEZWxpdmVyeSBUeXBl
OiAwClsgICAxMS4zMDQxNzJdIC4uLi4uLi4gICAgOiBMVFMgICAgICAgICAgOiAwClsgICAxMS4z
MDQ1OTFdIC4uLi4gcmVnaXN0ZXIgIzAxOiAwMDE3MDAxMQpbICAgMTEuMzA0OTkyXSAuLi4uLi4u
ICAgICA6IG1heCByZWRpcmVjdGlvbiBlbnRyaWVzOiAxNwpbICAgMTEuMzA1NTI3XSAuLi4uLi4u
ICAgICA6IFBSUSBpbXBsZW1lbnRlZDogMApbICAgMTEuMzA1OTczXSAuLi4uLi4uICAgICA6IElP
IEFQSUMgdmVyc2lvbjogMTEKWyAgIDExLjMwNjQ0MF0gLi4uLiByZWdpc3RlciAjMDI6IDAwMDAw
MDAwClsgICAxMS4zMDY4NDRdIC4uLi4uLi4gICAgIDogYXJiaXRyYXRpb246IDAwClsgICAxMS4z
MDcyNzhdIC4uLi4gSVJRIHJlZGlyZWN0aW9uIHRhYmxlOgpbICAgMTEuMzA3NjgwXSBJT0FQSUMg
MDoKWyAgIDExLjMwNzkzNl0gIHBpbjAwLCBkaXNhYmxlZCwgZWRnZSAsIGhpZ2gsIFYoMDApLCBJ
UlIoMCksIFMoMCksIHBoeXNpY2FsLCBEKDAwKSwgTSgwKQpbICAgMTEuMzA4NzYwXSAgcGluMDEs
IGVuYWJsZWQgLCBlZGdlICwgaGlnaCwgVigyMiksIElSUigwKSwgUygwKSwgbG9naWNhbCAsIEQo
MDIpLCBNKDApClsgICAxMS4zMDk1OTNdICBwaW4wMiwgZW5hYmxlZCAsIGVkZ2UgLCBoaWdoLCBW
KDMwKSwgSVJSKDApLCBTKDApLCBsb2dpY2FsICwgRCgwMSksIE0oMCkKWyAgIDExLjMxMDQ1NV0g
IHBpbjAzLCBkaXNhYmxlZCwgZWRnZSAsIGhpZ2gsIFYoMDApLCBJUlIoMCksIFMoMCksIHBoeXNp
Y2FsLCBEKDAwKSwgTSgwKQpbICAgMTEuMzExMjg0XSAgcGluMDQsIGRpc2FibGVkLCBlZGdlICwg
aGlnaCwgVigwMCksIElSUigwKSwgUygwKSwgcGh5c2ljYWwsIEQoMDApLCBNKDApClsgICAxMS4z
MTIwNjRdICBwaW4wNSwgZGlzYWJsZWQsIGVkZ2UgLCBoaWdoLCBWKDAwKSwgSVJSKDApLCBTKDAp
LCBwaHlzaWNhbCwgRCgwMCksIE0oMCkKWyAgIDExLjMxMjg1M10gIHBpbjA2LCBkaXNhYmxlZCwg
ZWRnZSAsIGhpZ2gsIFYoMDApLCBJUlIoMCksIFMoMCksIHBoeXNpY2FsLCBEKDAwKSwgTSgwKQpb
ICAgMTEuMzEzNjc3XSAgcGluMDcsIGRpc2FibGVkLCBlZGdlICwgaGlnaCwgVigwMCksIElSUigw
KSwgUygwKSwgcGh5c2ljYWwsIEQoMDApLCBNKDApClsgICAxMS4zMTQ1NDldICBwaW4wOCwgZGlz
YWJsZWQsIGVkZ2UgLCBoaWdoLCBWKDAwKSwgSVJSKDApLCBTKDApLCBwaHlzaWNhbCwgRCgwMCks
IE0oMCkKWyAgIDExLjMxNTM3N10gIHBpbjA5LCBlbmFibGVkICwgbGV2ZWwsIGhpZ2gsIFYoMjEp
LCBJUlIoMCksIFMoMCksIGxvZ2ljYWwgLCBEKDAyKSwgTSgwKQpbICAgMTEuMzE2MjA0XSAgcGlu
MGEsIGRpc2FibGVkLCBlZGdlICwgaGlnaCwgVigwMCksIElSUigwKSwgUygwKSwgcGh5c2ljYWws
IEQoMDApLCBNKDApClsgICAxMS4zMTcwMTVdICBwaW4wYiwgZGlzYWJsZWQsIGVkZ2UgLCBoaWdo
LCBWKDAwKSwgSVJSKDApLCBTKDApLCBwaHlzaWNhbCwgRCgwMCksIE0oMCkKWyAgIDExLjMxNzgz
OF0gIHBpbjBjLCBlbmFibGVkICwgZWRnZSAsIGhpZ2gsIFYoMjEpLCBJUlIoMCksIFMoMCksIGxv
Z2ljYWwgLCBEKDAxKSwgTSgwKQpbICAgMTEuMzE4Njk1XSAgcGluMGQsIGRpc2FibGVkLCBlZGdl
ICwgaGlnaCwgVigwMCksIElSUigwKSwgUygwKSwgcGh5c2ljYWwsIEQoMDApLCBNKDApClsgICAx
MS4zMTk1MTddICBwaW4wZSwgZGlzYWJsZWQsIGVkZ2UgLCBoaWdoLCBWKDAwKSwgSVJSKDApLCBT
KDApLCBwaHlzaWNhbCwgRCgwMCksIE0oMCkKWyAgIDExLjMyMDMxNl0gIHBpbjBmLCBkaXNhYmxl
ZCwgZWRnZSAsIGhpZ2gsIFYoMDApLCBJUlIoMCksIFMoMCksIHBoeXNpY2FsLCBEKDAwKSwgTSgw
KQpbICAgMTEuMzIxMTAyXSAgcGluMTAsIGRpc2FibGVkLCBlZGdlICwgaGlnaCwgVigwMCksIElS
UigwKSwgUygwKSwgcGh5c2ljYWwsIEQoMDApLCBNKDApClsgICAxMS4zMjE5MDhdICBwaW4xMSwg
ZGlzYWJsZWQsIGVkZ2UgLCBoaWdoLCBWKDAwKSwgSVJSKDApLCBTKDApLCBwaHlzaWNhbCwgRCgw
MCksIE0oMCkKWyAgIDExLjMzMTY3M10gIHBpbjEyLCBkaXNhYmxlZCwgZWRnZSAsIGhpZ2gsIFYo
MDApLCBJUlIoMCksIFMoMCksIHBoeXNpY2FsLCBEKDAwKSwgTSgwKQpbICAgMTEuMzMyNDc4XSAg
cGluMTMsIGRpc2FibGVkLCBlZGdlICwgaGlnaCwgVigwMCksIElSUigwKSwgUygwKSwgcGh5c2lj
YWwsIEQoMDApLCBNKDApClsgICAxMS4zMzMyODBdICBwaW4xNCwgZGlzYWJsZWQsIGVkZ2UgLCBo
aWdoLCBWKDAwKSwgSVJSKDApLCBTKDApLCBwaHlzaWNhbCwgRCgwMCksIE0oMCkKWyAgIDExLjMz
NDA5Ml0gIHBpbjE1LCBkaXNhYmxlZCwgZWRnZSAsIGhpZ2gsIFYoMDApLCBJUlIoMCksIFMoMCks
IHBoeXNpY2FsLCBEKDAwKSwgTSgwKQpbICAgMTEuMzM0OTE4XSAgcGluMTYsIGRpc2FibGVkLCBl
ZGdlICwgaGlnaCwgVigwMCksIElSUigwKSwgUygwKSwgcGh5c2ljYWwsIEQoMDApLCBNKDApClsg
ICAxMS4zMzU3MzNdICBwaW4xNywgZGlzYWJsZWQsIGVkZ2UgLCBoaWdoLCBWKDAwKSwgSVJSKDAp
LCBTKDApLCBwaHlzaWNhbCwgRCgwMCksIE0oMCkKWyAgIDExLjMzNjUxOV0gSVJRIHRvIHBpbiBt
YXBwaW5nczoKWyAgIDExLjMzNjg1MV0gSVJRMCAtPiAwOjIKWyAgIDExLjMzNzExMF0gSVJRMSAt
PiAwOjEKWyAgIDExLjMzNzM3Ml0gSVJRMyAtPiAwOjMKWyAgIDExLjMzNzYyN10gSVJRNCAtPiAw
OjQKWyAgIDExLjMzNzg4MF0gSVJRNSAtPiAwOjUKWyAgIDExLjMzODE1NF0gSVJRNiAtPiAwOjYK
WyAgIDExLjMzODQwOV0gSVJRNyAtPiAwOjcKWyAgIDExLjMzODY2MV0gSVJROCAtPiAwOjgKWyAg
IDExLjMzODkxM10gSVJROSAtPiAwOjkKWyAgIDExLjMzOTE4MV0gSVJRMTAgLT4gMDoxMApbICAg
MTEuMzM5NDUyXSBJUlExMSAtPiAwOjExClsgICAxMS4zMzk3MjJdIElSUTEyIC0+IDA6MTIKWyAg
IDExLjMzOTk5Ml0gSVJRMTMgLT4gMDoxMwpbICAgMTEuMzQwMjc0XSBJUlExNCAtPiAwOjE0Clsg
ICAxMS4zNDA1NDZdIElSUTE1IC0+IDA6MTUKWyAgIDExLjM0MDgxNV0gLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uIGRvbmUuClsgICAxMS4zNDE3MzBdIHNjaGVkX2Nsb2NrOiBN
YXJraW5nIHN0YWJsZSAoMTExOTQxOTc5MjEsIDE0NzEzNjg3NCktPigxMTU0MjIxOTM1NCwgLTIw
MDg4NDU1OSkKWyAgIDExLjM0MzY1N10gcmVnaXN0ZXJlZCB0YXNrc3RhdHMgdmVyc2lvbiAxClsg
ICAxMS4zNDQwODVdIExvYWRpbmcgY29tcGlsZWQtaW4gWC41MDkgY2VydGlmaWNhdGVzClsgICAx
MS4zNTk5NjNdIEtleSB0eXBlIGJpZ19rZXkgcmVnaXN0ZXJlZApbICAgMTEuMzYxNDYxXSBLZXkg
dHlwZSBlbmNyeXB0ZWQgcmVnaXN0ZXJlZApbICAgMTEuMzYyNDUyXSAgIE1hZ2ljIG51bWJlcjog
Nzo5ODQ6MzQKWyAgIDExLjM3NzI5Nl0gVW5yZWdpc3RlciBwdiBzaGFyZWQgbWVtb3J5IGZvciBj
cHUgMApbICAgMTEuMzc4MTU0XSBudW1hX3JlbW92ZV9jcHUgY3B1IDAgbm9kZSAwOiBtYXNrIG5v
dyAxClsgICAxMS4zODAyODBdIENQVSAwIGlzIG5vdyBvZmZsaW5lClsgICAxMS4zODE4MTRdIEZy
ZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSBtZW1vcnk6IDExMDhLClsgICAxMS4zODQyMThdIFdy
aXRlIHByb3RlY3RpbmcgdGhlIGtlcm5lbCByZWFkLW9ubHkgZGF0YTogMTg0MzJrClsgICAxMS4z
ODYwOTldIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSBtZW1vcnk6IDIwMzZLClsgICAxMS4z
ODY4MjVdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSBtZW1vcnk6IDIyNEsKWyAgIDExLjM4
NzM3N10gUnVuIC9pbml0IGFzIGluaXQgcHJvY2VzcwpbICAgMTEuNDEwNjY3XSByYW5kb206IGlu
aXQ6IHVuaW5pdGlhbGl6ZWQgdXJhbmRvbSByZWFkICgxMiBieXRlcyByZWFkKQpLZXJuZWwgdGVz
dHM6IEJvb3QgT0shClsgICAxMS40ODE3NTVdIGluaXQ6IHBseW1vdXRoIG1haW4gcHJvY2VzcyAo
MTY1KSBraWxsZWQgYnkgU0VHViBzaWduYWwKWyAgIDExLjQ5NjY4OF0gcmFuZG9tOiB0cmluaXR5
OiB1bmluaXRpYWxpemVkIHVyYW5kb20gcmVhZCAoNCBieXRlcyByZWFkKQpbICAgMTEuNTQxOTQx
XSBpbml0OiBtb3VudGVkLXByb2MgbWFpbiBwcm9jZXNzICgxNzkpIHRlcm1pbmF0ZWQgd2l0aCBz
dGF0dXMgMQptb3VudGFsbDogRXZlbnQgZmFpbGVkClsgICAxMS41NTQ5MDddIHJhbmRvbTogbW91
bnRhbGw6IHVuaW5pdGlhbGl6ZWQgdXJhbmRvbSByZWFkICgxMiBieXRlcyByZWFkKQpbICAgMTEu
NzE3MjUzXSBpbml0OiBwbHltb3V0aC1sb2cgbWFpbiBwcm9jZXNzICgyMjEpIHRlcm1pbmF0ZWQg
d2l0aCBzdGF0dXMgMQpbICAgMTEuNzM1MDA2XSB1ZGV2ZFsyMzBdOiBzdGFydGluZyB2ZXJzaW9u
IDE3NQp1ZGV2ZFsyMzddOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jp
bi9tb2Rwcm9iZSAtYnYgYWNwaTpMTlhTWVNUTTonOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
CnVkZXZkWzI0Nl06IGZhaWxlZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9zYmluL21v
ZHByb2JlIC1idiBwY2k6djAwMDA4MDg2ZDAwMDAxMjM3c3YwMDAwMUFGNHNkMDAwMDExMDBiYzA2
c2MwMGkwMCc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKdWRldmRbMjQ3XTogZmFpbGVkIHRv
IGV4ZWN1dGUgJy9zYmluL21vZHByb2JlJyAnL3NiaW4vbW9kcHJvYmUgLWJ2IHBjaTp2MDAwMDgw
ODZkMDAwMDcwMTBzdjAwMDAxQUY0c2QwMDAwMTEwMGJjMDFzYzAxaTgwJzogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQp1ZGV2ZFsyNDldOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJv
YmUnICcvc2Jpbi9tb2Rwcm9iZSAtYnYgYWNwaTpMTlhTWUJVUzonOiBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5CnVkZXZkWzI1MF06IGZhaWxlZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScg
Jy9zYmluL21vZHByb2JlIC1idiBhY3BpOkxOWFNZQlVTOic6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKdWRldmRbMjUxXTogZmFpbGVkIHRvIGV4ZWN1dGUgJy9zYmluL21vZHByb2JlJyAnL3Ni
aW4vbW9kcHJvYmUgLWJ2IHBjaTp2MDAwMDgwODZkMDAwMDcwMDBzdjAwMDAxQUY0c2QwMDAwMTEw
MGJjMDZzYzAxaTAwJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp1ZGV2ZFsyNTJdOiBmYWls
ZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9iZSAtYnYgaW5wdXQ6
YjAwMTl2MDAwMHAwMDAxZTAwMDAtZTAsMSxrNzQscmFtbHNmdyc6IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKdWRldmRbMjUzXTogZmFpbGVkIHRvIGV4ZWN1dGUgJy9zYmluL21vZHByb2JlJyAn
L3NiaW4vbW9kcHJvYmUgLWJ2IGFjcGk6UUVNVTAwMDI6JzogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeQp1ZGV2ZFsyNTRdOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jp
bi9tb2Rwcm9iZSAtYnYgcGNpOnYwMDAwMTIzNGQwMDAwMTExMXN2MDAwMDFBRjRzZDAwMDAxMTAw
YmMwM3NjMDBpMDAnOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CnVkZXZkWzI1N106IGZhaWxl
ZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9zYmluL21vZHByb2JlIC1idiBhY3BpOkFD
UEkwMDEwOlBOUDBBMDU6JzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp1ZGV2ZFsyNThdOiBm
YWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9iZSAtYnYgYWNw
aTpQTlAwMTAzOic6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKdWRldmRbMjU5XTogZmFpbGVk
IHRvIGV4ZWN1dGUgJy9zYmluL21vZHByb2JlJyAnL3NiaW4vbW9kcHJvYmUgLWJ2IGFjcGk6UE5Q
MEEwMzonOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CnVkZXZkWzI2MF06IGZhaWxlZCB0byBl
eGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9zYmluL21vZHByb2JlIC1idiBwbGF0Zm9ybTpGaXhl
ZCBNRElPIGJ1cyc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKdWRldmRbMjY5XTogZmFpbGVk
IHRvIGV4ZWN1dGUgJy9zYmluL21vZHByb2JlJyAnL3NiaW4vbW9kcHJvYmUgLWJ2IGFjcGk6UE5Q
MEEwNjonOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CnVkZXZkWzI2M106IGZhaWxlZCB0byBl
eGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9zYmluL21vZHByb2JlIC1idiBhY3BpOlBOUDBDMEY6
JzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp1ZGV2ZFsyNjRdOiBmYWlsZWQgdG8gZXhlY3V0
ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9iZSAtYnYgYWNwaTpQTlAwQzBGOic6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKdWRldmRbMjY2XTogZmFpbGVkIHRvIGV4ZWN1dGUgJy9z
YmluL21vZHByb2JlJyAnL3NiaW4vbW9kcHJvYmUgLWJ2IGFjcGk6TE5YQ1BVOic6IE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkKdWRldmRbMjY3XTogZmFpbGVkIHRvIGV4ZWN1dGUgJy9zYmluL21v
ZHByb2JlJyAnL3NiaW4vbW9kcHJvYmUgLWJ2IGFjcGk6TE5YQ1BVOic6IE5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkKdWRldmRbMjY4XTogZmFpbGVkIHRvIGV4ZWN1dGUgJy9zYmluL21vZHByb2Jl
JyAnL3NiaW4vbW9kcHJvYmUgLWJ2IGFjcGk6UE5QMEEwNjonOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5CnVkZXZkWzI3MF06IGZhaWxlZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9z
YmluL21vZHByb2JlIC1idiBhY3BpOlBOUDBBMDY6JzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQp1ZGV2ZFsyNzFdOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9t
b2Rwcm9iZSAtYnYgYWNwaTpRRU1VMDAwMjonOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CnVk
ZXZkWzI3NF06IGZhaWxlZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9zYmluL21vZHBy
b2JlIC1idiBhY3BpOlBOUDBDMEY6JzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp1ZGV2ZFsy
NzVdOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9iZSAt
YnYgYWNwaTpQTlAwQzBGOic6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKCnVkZXZkWzI3Nl06
IGZhaWxlZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9zYmluL21vZHByb2JlIC1idiBh
Y3BpOlBOUDAxMDM6JzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp1ZGV2ZFsyNzddOiBmYWls
ZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9iZSAtYnYgYWNwaTpQ
TlAwQzBGOic6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKdWRldmRbMzE3XTogZmFpbGVkIHRv
IGV4ZWN1dGUgJy9zYmluL21vZHByb2JlJyAnL3NiaW4vbW9kcHJvYmUgLWJ2IGFjcGk6UE5QMDUw
MTonOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CnVkZXZkWzMxOF06IGZhaWxlZCB0byBleGVj
dXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9zYmluL21vZHByb2JlIC1idiBhY3BpOlBOUDA3MDA6Jzog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp1ZGV2ZFszMTZdOiBmYWlsZWQgdG8gZXhlY3V0ZSAn
L3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9iZSAtYnYgYWNwaTpQTlAwNTAxOic6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkKdWRldmRbMzE5XTogZmFpbGVkIHRvIGV4ZWN1dGUgJy9zYmlu
L21vZHByb2JlJyAnL3NiaW4vbW9kcHJvYmUgLWJ2IGFjcGk6UE5QMEIwMDonOiBObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5CnVkZXZkWzMxNV06IGZhaWxlZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rw
cm9iZScgJy9zYmluL21vZHByb2JlIC1idiBhY3BpOlBOUDA0MDA6JzogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQp1ZGV2ZFszMjBdOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUn
ICcvc2Jpbi9tb2Rwcm9iZSAtYnYgYWNwaTpQTlAwRjEzOic6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKdWRldmRbMzE0XTogZmFpbGVkIHRvIGV4ZWN1dGUgJy9zYmluL21vZHByb2JlJyAnL3Ni
aW4vbW9kcHJvYmUgLWJ2IGFjcGk6UE5QMDMwMzonOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
CnVkZXZkWzMyMV06IGZhaWxlZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rwcm9iZScgJy9zYmluL21v
ZHByb2JlIC1idiBwbGF0Zm9ybTppNWtfYW1iJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp1
ZGV2ZFszMjJdOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rw
cm9iZSAtYnYgcGxhdGZvcm06cGNzcGtyJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp1ZGV2
ZFszMjRdOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9i
ZSAtYnYgcGxhdGZvcm06cGxhdGZvcm0tZnJhbWVidWZmZXInOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5ClsgICAxMi4yMjg2MjJdIHJhdzogZmZmZmZmZmZmZmZmZmZmZiBmZmZmZmZmZmZmZmZm
ZmZmIGZmZmZmZmZmZmZmZmZmZmYKWyAgIDEyLjIzMTQ3NF0gcGFnZSBkdW1wZWQgYmVjYXVzZTog
Vk1fQlVHX09OX1BBR0UoUGFnZVBvaXNvbmVkKHApKQpbICAgMTIuMjMyMTM1XSAtLS0tLS0tLS0t
LS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KWyAgIDEyLjIzMjY0OV0ga2VybmVsIEJVRyBhdCBp
bmNsdWRlL2xpbnV4L21tLmg6MTAyMCEKWyAgIDEyLjI1ODExNV0gaW52YWxpZCBvcGNvZGU6IDAw
MDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkKWyAgIDEyLjI1ODY2OF0gQ1BVOiAxIFBJRDogMjM2IENv
bW06IHVkZXZkIE5vdCB0YWludGVkIDUuMC4wLXJjNC0wMDE1MC1nYjUyM2FiMSAjMQpbICAgMTIu
MjU5NDAzXSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAx
OTk2KSwgQklPUyAxLjEwLjItMSAwNC8wMS8yMDE0ClsgICAxMi4yNjAyNDFdIFJJUDogMDAxMDpp
c19tZW1fc2VjdGlvbl9yZW1vdmFibGUrMHgyNGMvMHgyYzAKWyAgIDEyLjI2MDgwMF0gQ29kZTog
NzQgMzEgNDggODEgYzMgMDAgNzAgMDAgMDAgNDkgMzkgZGMgNzYgNGUgNDggOGIgMDMgNDggODMg
ZjggZmYgMGYgODUgYjYgZmUgZmYgZmYgNDggYzcgYzYgYzAgOTkgMGIgODIgNDggODkgZGYgZTgg
YTQgNTEgZmQgZmYgPDBmPiAwYiA1YiAzMSBjMCA1ZCA0MSA1YyBjMyA0OCA4YiA0YiAyOCA4ZCA0
MSBmNyA4MyBmOCAwMSA3NyBjMyBiOApbICAgMTIuMjYyNjQ4XSBSU1A6IDAwMTg6ZmZmZjg4ODAx
ZmExZmQxMCBFRkxBR1M6IDAwMDEwMjg2ClsgICAxMi4yNjMxNjddIFJBWDogMDAwMDAwMDAwMDAw
MDAzNCBSQlg6IGZmZmY4ODgwMWU1YzAwMDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAwClsgICAxMi4y
NjM4OTldIFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IGZmZmZmZmZmODIxNzBlNDYgUkRJOiAw
MDAwMDAwMDAwMDAwMDAxClsgICAxMi4yNjQ2MjVdIFJCUDogNmRiNmRiNmRiNmRiNmRiNyBSMDg6
IGZmZmY4ODgwMWZhMTg4ZTggUjA5OiAwMDAwMDAwMDkyZTZlYTUwClsgICAxMi4yNjUzNTZdIFIx
MDogZmZmZjg4ODAxZmExZmNmOCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiBmZmZmODg4MDFl
NjQwMDAwClsgICAxMi4yNjYwNTFdIFIxMzogMDAwMDAwMDAwMDAwMDAwMSBSMTQ6IGZmZmY4ODgw
MWYxMjMxMDggUjE1OiAwMDAwMDAwMDAwMDAwMDAxClsgICAxMi4yNjY3NTNdIEZTOiAgMDAwMDdm
MWM4OTVmMTdjMCgwMDAwKSBHUzpmZmZmODg4MDFkZDAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAw
MDAwMDAwMDAKWyAgIDEyLjI2NzU0N10gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDog
MDAwMDAwMDA4MDA1MDAzMwpbICAgMTIuMjY4MTI3XSBDUjI6IDAwMDA3ZjFjODk1ZjYwMDAgQ1Iz
OiAwMDAwMDAwMDFmYTNlMDAwIENSNDogMDAwMDAwMDAwMDAwMDZhMApbICAgMTIuMjY4ODUwXSBD
YWxsIFRyYWNlOgpbICAgMTIuMjY5MTU0XSAgcmVtb3ZhYmxlX3Nob3crMHg4Ny8weGEwClsgICAx
Mi4yNjk2MDVdICBkZXZfYXR0cl9zaG93KzB4MjUvMHg2MApbICAgMTIuMjY5OTY2XSAgc3lzZnNf
a2Zfc2VxX3Nob3crMHhiYS8weDExMApbICAgMTIuMjcwNDEwXSAgc2VxX3JlYWQrMHgxOTYvMHgz
ZjAKWyAgIDEyLjI3MDc0NV0gIF9fdmZzX3JlYWQrMHgzNC8weDE4MApbICAgMTIuMjcxMDg4XSAg
PyBsb2NrX2FjcXVpcmUrMHhiNi8weDFlMApbICAgMTIuMjcxNDkyXSAgdmZzX3JlYWQrMHhhMC8w
eDE1MApbICAgMTIuMjcxODMwXSAga3N5c19yZWFkKzB4NDQvMHhiMApbICAgMTIuMjcyMjE5XSAg
PyBkb19zeXNjYWxsXzY0KzB4MWYvMHg0YTAKWyAgIDEyLjI3MjYxN10gIGRvX3N5c2NhbGxfNjQr
MHg1ZS8weDRhMApbICAgMTIuMjcyOTk5XSAgPyB0cmFjZV9oYXJkaXJxc19vZmZfdGh1bmsrMHgx
YS8weDFjClsgICAxMi4yNzM1MjddICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0
OS8weGJlClsgICAxMi4yNzQwNDVdIFJJUDogMDAzMzoweDdmMWM4OGNkODBhMApbICAgMTIuMjc5
NDgwXSBDb2RlOiA3MyAwMSBjMyA0OCA4YiAwZCBhMCAwZCAyZCAwMCAzMSBkMiA0OCAyOSBjMiA2
NCA4OSAxMSA0OCA4MyBjOCBmZiBlYiBlYSA5MCA5MCA4MyAzZCAzZCA3MSAyZCAwMCAwMCA3NSAx
MCBiOCAwMCAwMCAwMCAwMCAwZiAwNSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDMxIGMzIDQ4IDgz
IGVjIDA4IGU4IDNlIGIxIDAxIDAwIDQ4IDg5IDA0IDI0ClsgICAxMi4yODEzNThdIFJTUDogMDAy
YjowMDAwN2ZmZGExMTk1YWI4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAw
MDAwMDAKWyAgIDEyLjI4MjEyN10gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDAwMDAw
MDAwMDAwNSBSQ1g6IDAwMDA3ZjFjODhjZDgwYTAKWyAgIDEyLjI4Mjg3M10gUkRYOiAwMDAwMDAw
MDAwMDAxMDAwIFJTSTogMDAwMDdmZmRhMTE5NWI1OCBSREk6IDAwMDAwMDAwMDAwMDAwMDUKWyAg
IDEyLjI4MzYxOF0gUkJQOiAwMDAwNTU3ODI4Yjg5YWMzIFIwODogNzM3OTczMmY3MzY1NjM2OSBS
MDk6IDZmNmQ2NTZkMmY2ZDY1NzQKWyAgIDEyLjI4NDM5M10gUjEwOiA3MjZmNmQ2NTZkMmY3OTcy
IFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAwMDAwMDAwMDAwMDAKWyAgIDEyLjI4NTA5
OV0gUjEzOiAwMDAwNTU3ODI4Yjg4MGYwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6IDAwMDA3
ZmZkYTExOWI5MDgKWyAgIDEyLjI4NTgyMl0gTW9kdWxlcyBsaW5rZWQgaW46Cgp1ZGV2ZFszMjNd
OiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4vbW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9iZSAtYnYg
aW5wdXQ6YjAwMTF2MDAwMXAwMDAxZUFCNDEtZTAsMSw0LDExLDE0LGs3MSw3Miw3Myw3NCw3NSw3
Niw3Nyw3OSw3QSw3Qiw3Qyw3RCw3RSw3Riw4MCw4Qyw4RSw4Riw5Qiw5Qyw5RCw5RSw5RixBMyxB
NCxBNSxBNixBQyxBRCxCNyxCOCxCOSxEOSxFMixyYW00LGwwLDEsMixzZncnOiBObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5CnVkZXZkWzMyNV06IGZhaWxlZCB0byBleGVjdXRlICcvc2Jpbi9tb2Rw
cm9iZScgJy9zYmluL21vZHByb2JlIC1idiBzZXJpbzp0eTAxcHIwMGlkMDBleDAwJzogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQp1ZGV2ZFszMjZdOiBmYWlsZWQgdG8gZXhlY3V0ZSAnL3NiaW4v
bW9kcHJvYmUnICcvc2Jpbi9tb2Rwcm9iZSAtYnYgZG1pOmJ2blNlYUJJT1M6YnZyMS4xMC4yLTE6
YmQwNC8wMS8yMDE0OnN2blFFTVU6cG5TdGFuZGFyZFBDKGk0NDBGWCtQSUlYLDE5OTYpOnB2cnBj
LWk0NDBmeC0yLjg6Y3ZuUUVNVTpjdDE6Y3ZycGMtaTQ0MGZ4LTIuODonOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5ClsgICAxMi4zNTk4NDldIC0tLVsgZW5kIHRyYWNlIDI3NDY5NzUxNjdmYzM1
OWEgXS0tLQpbICAgMTIuMzYyNzc1XSBSSVA6IDAwMTA6aXNfbWVtX3NlY3Rpb25fcmVtb3ZhYmxl
KzB4MjRjLzB4MmMwClsgICAxMi4zNjUxODJdIENvZGU6IDc0IDMxIDQ4IDgxIGMzIDAwIDcwIDAw
IDAwIDQ5IDM5IGRjIDc2IDRlIDQ4IDhiIDAzIDQ4IDgzIGY4IGZmIDBmIDg1IGI2IGZlIGZmIGZm
IDQ4IGM3IGM2IGMwIDk5IDBiIDgyIDQ4IDg5IGRmIGU4IGE0IDUxIGZkIGZmIDwwZj4gMGIgNWIg
MzEgYzAgNWQgNDEgNWMgYzMgNDggOGIgNGIgMjggOGQgNDEgZjcgODMgZjggMDEgNzcgYzMgYjgK
WyAgIDEyLjQyNjYzMl0gUlNQOiAwMDE4OmZmZmY4ODgwMWZhMWZkMTAgRUZMQUdTOiAwMDAxMDI4
NgpbICAgMTIuNDI3MjQ0XSBSQVg6IDAwMDAwMDAwMDAwMDAwMzQgUkJYOiBmZmZmODg4MDFlNWMw
MDAwIFJDWDogMDAwMDAwMDAwMDAwMDAwMApbICAgMTIuNDI3OTQ2XSBSRFg6IDAwMDAwMDAwMDAw
MDAwMDAgUlNJOiBmZmZmZmZmZjgyMTcwZTQ2IFJESTogMDAwMDAwMDAwMDAwMDAwMQpbICAgMTIu
NDI4OTI2XSBSQlA6IDZkYjZkYjZkYjZkYjZkYjcgUjA4OiBmZmZmODg4MDFmYTE4OGU4IFIwOTog
MDAwMDAwMDA5MmU2ZWE1MApbICAgMTIuNDM4MjcyXSBSMTA6IGZmZmY4ODgwMWZhMWZjZjggUjEx
OiAwMDAwMDAwMDAwMDAwMDAwIFIxMjogZmZmZjg4ODAxZTY0MDAwMApbICAgMTIuNDM5MDEzXSBS
MTM6IDAwMDAwMDAwMDAwMDAwMDEgUjE0OiBmZmZmODg4MDFmMTIzMTA4IFIxNTogMDAwMDAwMDAw
MDAwMDAwMQpbICAgMTIuNDM5Nzk4XSBGUzogIDAwMDA3ZjFjODk1ZjE3YzAoMDAwMCkgR1M6ZmZm
Zjg4ODAxZGQwMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsgICAxMi40NDA2NDBd
IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWyAgIDEy
LjQ0MTI0OF0gQ1IyOiAwMDAwN2ZjMWEzYmUzMjgwIENSMzogMDAwMDAwMDAxZmEzZTAwMCBDUjQ6
IDAwMDAwMDAwMDAwMDA2YTAKWyAgIDEyLjQ0MTk0N10gS2VybmVsIHBhbmljIC0gbm90IHN5bmNp
bmc6IEZhdGFsIGV4Y2VwdGlvbgpbICAgMTIuNDQyNTE4XSBLZXJuZWwgT2Zmc2V0OiBkaXNhYmxl
ZAoKRWxhcHNlZCB0aW1lOiAyMAoKa3ZtPSgKCXFlbXUtc3lzdGVtLXg4Nl82NAoJLWVuYWJsZS1r
dm0KCS1jcHUga3ZtNjQKCS1rZXJuZWwgJGtlcm5lbAoJLWluaXRyZCAvb3NpbWFnZS9xdWFudGFs
L3F1YW50YWwtdHJpbml0eS14ODZfNjQuY2d6CgktbSA1MTIKCS1zbXAgMgoJLWRldmljZSBlMTAw
MCxuZXRkZXY9bmV0MAoJLW5ldGRldiB1c2VyLGlkPW5ldDAKCS1ib290IG9yZGVyPW5jCgktbm8t
cmVib290Cgktd2F0Y2hkb2cgaTYzMDBlc2IKCS13YXRjaGRvZy1hY3Rpb24gZGVidWcKCS1ydGMg
YmFzZT1sb2NhbHRpbWUKCS1zZXJpYWwgc3RkaW8KCS1kaXNwbGF5IG5vbmUKCS1tb25pdG9yIG51
bGwKKQoKYXBwZW5kPSgKCXJvb3Q9L2Rldi9yYW0wCglodW5nX3Rhc2tfcGFuaWM9MQoJZGVidWcK
CWFwaWM9ZGVidWcKCXN5c3JxX2Fsd2F5c19lbmFibGVkCglyY3VwZGF0ZS5yY3VfY3B1X3N0YWxs
X3RpbWVvdXQ9MTAwCgluZXQuaWZuYW1lcz0wCglwcmludGsuZGV2a21zZz1vbgoJcGFuaWM9LTEK
CXNvZnRsb2NrdXBfcGFuaWM9MQoJbm1pX3dhdGNoZG9nPXBhbmljCglvb3BzPXBhbmljCglsb2Fk
X3JhbWRpc2s9MgoJcHJvbXB0X3JhbWRpc2s9MAoJZHJiZC5taW5vcl9jb3VudD04CglzeXN0ZW1k
LmxvZ19sZXZlbD1lcnIKCWlnbm9yZV9sb2dsZXZlbAoJY29uc29sZT10dHkwCgllYXJseXByaW50
az10dHlTMCwxMTUyMDAKCWNvbnNvbGU9dHR5UzAsMTE1MjAwCgl2Z2E9bm9ybWFsCglydwoJYnJh
bmNoPWxpbnV4LWRldmVsL2ZpeHVwLWVmYWQ0ZTQ3NWMzMTI0NTZlZGIzYzc4OWQwOTk2ZDEyZWQ3
NDRjMTMKCUJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmFuZGNvbmZpZy1zMi0wMjE3MjMx
OC9nY2MtNi9iNTIzYWIxYjhjZTU5NTkyY2IzMmQ2MjI1MDMyMTcwNzdjZjA3ZTRkL3ZtbGludXot
NS4wLjAtcmM0LTAwMTUwLWdiNTIzYWIxCglkcmJkLm1pbm9yX2NvdW50PTgKCXJjdXBlcmYuc2h1
dGRvd249MAopCgoiJHtrdm1bQF19IiAtYXBwZW5kICIke2FwcGVuZFsqXX0iCg==

--===============3626484190826959427==--

