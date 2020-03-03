Content-Type: multipart/mixed; boundary="===============4059580937991478625=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: acf49bb928 ("mm/mlock: split ClearPageLRU from page isolation .."): [ 36.045721] BUG: sleeping function called from invalid context at mm/rmap.c:1861
Date: Tue, 03 Mar 2020 08:14:45 +0800
Message-ID: <bf7ea919-23fe-d67a-411e-b80b1226acb8@intel.com>
In-Reply-To: <88b11058-e433-2a90-94f4-aa5bf71fefcf@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4059580937991478625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alex,

You can reproduce with the script =

"reproduce-yocto-vm-yocto-61:20200301143758:x86_64-randconfig-a002-20200228=
:5.6.0-rc3-00009-gacf49bb928471:1":

 =C2=A0=C2=A0=C2=A0 ./reproduce-... $kernel

Best Regards,
Rong Chen

On 3/2/20 2:31 PM, Alex Shi wrote:
> Thanks for the report!
>
> Do you know how to reproduce this bug?
>
>
> Thanks!
>
> =E5=9C=A8 2020/3/1 =E4=B8=8B=E5=8D=888:35, kernel test robot =E5=86=99=E9=
=81=93:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://github.com/alexshi/linux.git lrunext
>>
>> commit acf49bb9284710c28524098098bda22eb1602275
>> Author:     Alex Shi <alex.shi@linux.alibaba.com>
>> AuthorDate: Thu Feb 27 12:24:11 2020 +0800
>> Commit:     Alex Shi <alex.shi@linux.alibaba.com>
>> CommitDate: Thu Feb 27 19:45:28 2020 +0800
>>
>>      mm/mlock: split ClearPageLRU from page isolation and remain Mlocked=
 guard
>>      =

>>      This is one of effort to split the PageLRU clear from old page
>>      isolation.
>>      =

>>      This patch move the lru_lock after get PageLRU, which takes holding
>>      PageLRU as precondition for page isolation, as a preparation for la=
ter
>>      lru_lock replacment. So we have to unfold __munlock_isolate_lru_pag=
e.
>>      =

>>      __split_huge_page_refcount doesn't exist, but we still have to guard
>>      PageMlocked in __split_huge_page_tail. that make code ugly and bear
>>      few unrelated code in lock. anyway still removed few goto's to dres=
s up
>>      current code.
>>      =

>>      Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
>>      Cc: Kirill A. Shutemov <kirill@shutemov.name>
>>      Cc: Andrew Morton <akpm@linux-foundation.org>
>>      Cc: Johannes Weiner <hannes@cmpxchg.org>
>>      Cc: Matthew Wilcox <willy@infradead.org>
>>      Cc: Hugh Dickins <hughd@google.com>
>>      Cc: linux-mm(a)kvack.org
>>      Cc: linux-kernel(a)vger.kernel.org
>>
>> e46563ef83  mm/lru: add page isolation precondition in __isolate_lru_page
>> acf49bb928  mm/mlock: split ClearPageLRU from page isolation and remain =
Mlocked guard
>> 4eddfb57a6  mm/memcg: add debug checking in lock_page_memcg
>> +----------------------------------------------------------------+------=
------+------------+------------+
>> |                                                                | e4656=
3ef83 | acf49bb928 | 4eddfb57a6 |
>> +----------------------------------------------------------------+------=
------+------------+------------+
>> | boot_successes                                                 | 32   =
      | 1          | 0          |
>> | boot_failures                                                  | 3    =
      | 10         | 2          |
>> | WARNING:at_mm/usercopy.c:#usercopy_warn                        | 1    =
      |            |            |
>> | RIP:usercopy_warn                                              | 1    =
      |            |            |
>> | INFO:rcu_sched_self-detected_stall_on_CPU                      | 1    =
      |            |            |
>> | RIP:clear_page_erms                                            | 1    =
      | 2          |            |
>> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks                   | 1    =
      | 3          |            |
>> | BUG:kernel_hang_in_boot_stage                                  | 1    =
      | 2          |            |
>> | BUG:kernel_timeout_in_boot_stage                               | 0    =
      | 1          |            |
>> | BUG:sleeping_function_called_from_invalid_context_at_mm/rmap.c | 0    =
      | 6          | 2          |
>> | BUG:kernel_hang_in_early-boot_stage                            | 0    =
      | 1          |            |
>> | RIP:copy_user_enhanced_fast_string                             | 0    =
      | 0          | 1          |
>> +----------------------------------------------------------------+------=
------+------------+------------+
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> [child5:606] nfsservctl (180) returned ENOSYS, marking as inactive.
>> [child5:606] clock_getres (266:[32BIT]) returned ENOSYS, marking as inac=
tive.
>> [child3:603] mq_getsetattr (245) returned ENOSYS, marking as inactive.
>> [child3:616] mq_timedreceive (243) returned ENOSYS, marking as inactive.
>> [child3:616] kexec_load (246) returned ENOSYS, marking as inactive.
>> [   36.045721] BUG: sleeping function called from invalid context at mm/=
rmap.c:1861
>> [   36.047309] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 60=
6, name: trinity-c5
>> [   36.048622] CPU: 0 PID: 606 Comm: trinity-c5 Not tainted 5.6.0-rc3-00=
009-gacf49bb928471 #1
>> [   36.049991] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.12.0-1 04/01/2014
>> [   36.051424] Call Trace:
>> [   36.051773]  dump_stack+0x7c/0xa5
>> [   36.052198]  ___might_sleep+0x161/0x180
>> [   36.052682]  rmap_walk_anon+0x135/0x320
>> [   36.053597]  rmap_walk+0x51/0x60
>> [   36.053999]  try_to_munlock+0x86/0xb0
>> [   36.054464]  ? page_mkclean+0x140/0x140
>> [   36.055335]  ? page_remove_rmap+0x4a0/0x4a0
>> [   36.055862]  ? anon_vma_ctor+0x70/0x70
>> [   36.056343]  ? page_get_anon_vma+0x180/0x180
>> [   36.057299]  __munlock_isolated_page+0x46/0xd0
>> [   36.057954]  munlock_vma_page+0x3be/0x4f0
>> [   36.058446]  wp_page_copy+0xaba/0xaf0
>> [   36.059313]  ? follow_pfn+0x160/0x160
>> [   36.059780]  ? __kasan_check_read+0x11/0x20
>> [   36.060294]  ? try_to_wake_up+0x183/0xbd0
>> [   36.061211]  do_wp_page+0x292/0x9b0
>> [   36.061643]  ? finish_mkwrite_fault+0x210/0x210
>> [   36.062199]  ? _raw_read_lock_irq+0x40/0x40
>> [   36.063149]  __handle_mm_fault+0x96a/0x18b0
>> [   36.063659]  ? apply_to_existing_page_range+0x10/0x10
>> [   36.064280]  ? _raw_spin_lock+0x75/0xc0
>> [   36.065163]  ? _raw_read_lock_irq+0x40/0x40
>> [   36.065693]  ? update_rq_clock+0x126/0x1f0
>> [   36.066646]  ? __kasan_check_read+0x11/0x20
>> [   36.067170]  ? __count_memcg_events+0x54/0x120
>> [   36.068041]  handle_mm_fault+0x1d2/0x2f0
>> [   36.068953]  __get_user_pages+0x2b8/0xa50
>> [   36.069466]  ? follow_page_mask+0xa00/0xa00
>> [   36.069993]  ? down_read+0xeb/0x1c0
>> [   36.070873]  ? down_read_killable+0x1d0/0x1d0
>> [   36.071409]  populate_vma_page_range+0x96/0xb0
>> [   36.071955]  __mm_populate+0x128/0x1f0
>> [   36.072850]  ? populate_vma_page_range+0xb0/0xb0
>> [   36.073424]  __x64_sys_mlockall+0x215/0x270
>> [   36.073960]  do_syscall_64+0xb7/0x390
>> [   36.074435]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [   36.075056] RIP: 0033:0x457729
>> [   36.075445] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 =
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 =
<48> 3d 01 f0 ff ff 0f 83 2b 84 00 00 c3 66 2e 0f 1f 84 00 00 00 00
>> [   36.077682] RSP: 002b:00007ffedac862c8 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000097
>> [   36.078591] RAX: ffffffffffffffda RBX: 0000000000000097 RCX: 00000000=
00457729
>> [   36.079434] RDX: 000000000000fffd RSI: 000000000d0d0d0d RDI: 00000000=
00000001
>> [   36.080278] RBP: 00007ffedac86370 R08: 0000c8dc6a7819c3 R09: 947ab93a=
fb7ffb80
>> [   36.081154] R10: 0000000000000038 R11: 0000000000000246 R12: 00000000=
00000002
>> [   36.082009] R13: 00007f4b65400058 R14: 0000000001057830 R15: 00007f4b=
65400000
>> [child3:616] Dumped trace to /boot/trace.txt
>> *** Error in `/bin/trinity': free(): invalid pointer: 0x00000000004b77e0=
 ***
>> =3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>                                                            # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start 0eb7fc20ae4de315c2379e589ce9f184ff635fce f8788d86ab28f6=
1f7b46eb6be375f8a726783636 --
>> git bisect  bad 7a9a8c69941e1374e2686376b8137dd20b28cdc8  # 22:25  B    =
  0     3   19   0  Merge 'linux-review/Gustavo-A-R-Silva/s390-Replace-zero=
-length-array-with-flexible-array-member/20200223-025126' into devel-hourly=
-2020022819
>> git bisect good 6d7ab7e685c4a4f5f3d3199b184f5499f4b02c85  # 23:19  G    =
 11     0    4   4  Merge 'linux-review/Isaac-J-Manjarres/of-of_reserved_me=
m-Increase-limit-on-number-of-reserved-regions/20200225-033755' into devel-=
hourly-2020022819
>> git bisect good 66084a0a5eabcfd704f0bbab048cd9126e7c24ab  # 23:53  G    =
 11     0    2   2  Merge 'linux-review/Zhangfei-Gao/MAINTAINERS-add-mainta=
iners-for-uacce/20200226-093543' into devel-hourly-2020022819
>> git bisect good 2c0ff33777d53be39ccd428650598a52b7080a2d  # 01:13  G    =
 11     0    3   3  Merge 'linux-review/Suman-Anna/Drop-PRUSS-and-OMAP4-IPU=
-DSP-hwmod-data/20200225-072420' into devel-hourly-2020022819
>> git bisect  bad a346803f887ad079c21179d1fd69586cc2f5147c  # 01:36  B    =
  0     3   19   0  Merge 'linux-review/Prarit-Bhargava/x86-tsc-Add-kernel-=
options-to-disable-CPUID-and-MSR-calibrations/20200227-034607' into devel-h=
ourly-2020022819
>> git bisect  bad 360d08b6abbf3adae740222d62ca8032996019e8  # 02:41  B    =
  0     1   17   0  Merge 'linux-review/jack-yu-realtek-com/ASoC-rt1015-mod=
ify-some-structure-to-be-static/20200227-101356' into devel-hourly-20200228=
19
>> git bisect good 86faac9834b0e94a3901cc1db4272ae41b11a48e  # 07:51  G    =
 10     0    5   5  Merge 'linux-review/Anson-Huang/arm64-dts-imx8mn-Adjust=
-1-2GHz-OPP-voltage-to-OD-mode/20200224-101803' into devel-hourly-2020022819
>> git bisect  bad 1776718bda27b7f353dc434e8384fbd7a9b3980d  # 08:48  B    =
  0     2   18   0  Merge 'linux-review/Qian-Cai/tick-sched-fix-data-races-=
at-tick_do_timer_cpu/20200225-111352' into devel-hourly-2020022819
>> git bisect  bad 0abbb41ee5a632a0cfaa8a0ee59b4e46c9e8544f  # 10:00  B    =
  0     2   18   0  Merge 'alexshi/lrunext' into devel-hourly-2020022819
>> git bisect  bad b8e71301886b2ad0b0754fbc6884b6a24ac1931b  # 10:52  B    =
  0     1   17   0  mm/lru: take PageLRU first in moving page between lru l=
ists
>> git bisect good 602a257cff49bd0349d0dadc1aa4f0393c77457c  # 13:15  G    =
 10     0    2   2  mm/thp: clean up lru_add_page_tail
>> git bisect good 2282ec703a69b8c626c8c36fd6a73f3ac95c4206  # 13:55  G    =
 10     0    5   5  mm/lru: introduce TestClearPageLRU
>> git bisect  bad acf49bb9284710c28524098098bda22eb1602275  # 14:37  B    =
  0     1   17   0  mm/mlock: split ClearPageLRU from page isolation and re=
main Mlocked guard
>> git bisect good e46563ef83b1583c2f2d54e412222cae5b48bc1d  # 15:59  G    =
 10     0    2   2  mm/lru: add page isolation precondition in __isolate_lr=
u_page
>> # first bad commit: [acf49bb9284710c28524098098bda22eb1602275] mm/mlock:=
 split ClearPageLRU from page isolation and remain Mlocked guard
>> git bisect good e46563ef83b1583c2f2d54e412222cae5b48bc1d  # 16:05  G    =
 30     0    1   3  mm/lru: add page isolation precondition in __isolate_lr=
u_page
>> # extra tests with debug options
>> git bisect good acf49bb9284710c28524098098bda22eb1602275  # 16:50  G    =
 10     0   10  10  mm/mlock: split ClearPageLRU from page isolation and re=
main Mlocked guard
>> # extra tests on head commit of alexshi/lrunext
>> git bisect  bad 4eddfb57a6f7eb0e614389fec3be79bc7b7da65b  # 18:32  B    =
  0     1   17   0  mm/memcg: add debug checking in lock_page_memcg
>> # bad: [4eddfb57a6f7eb0e614389fec3be79bc7b7da65b] mm/memcg: add debug ch=
ecking in lock_page_memcg
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
>>

--===============4059580937991478625==--

