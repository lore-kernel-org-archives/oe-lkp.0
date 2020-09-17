Content-Type: multipart/mixed; boundary="===============2258919762793141759=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: ace5381a21 ("KASAN: Port KASAN Tests to KUnit"): BUG: KASAN: slab-out-of-bounds in kmalloc_oob_right
Date: Thu, 17 Sep 2020 11:10:51 +0800
Message-ID: <60912329-ad85-9d40-8743-55ef7a57b63c@intel.com>
In-Reply-To: <CAAeHK+xN+GGT8oWcF4zAx6Lwp+59Feb0uySwnQTzg6E7S3-Q4A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2258919762793141759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 9/14/20 8:28 PM, Andrey Konovalov wrote:
> On Mon, Sep 14, 2020 at 11:09 AM kernel test robot <lkp@intel.com> wrot=
e:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://github.com/0day-ci/linux/commits/David-Gow/KASAN-KUnit-Integrati=
on/20200910-150520
> This is expected. With this commit KASAN tests can now be built into
> the kernel, so CONFIG_KASAN_KUNIT_TEST needs to be disabled on the
> kernel test robot.

Hi Andrey,

Thanks for the feedback, we have disabled CONFIG_KASAN_KUNIT_TEST.

Best Regards,
Rong Chen

>
>> commit ace5381a2170d229fc3b98d54513b723d1b3890e
>> Author:     Patricia Alfonso <trishalfonso@google.com>
>> AuthorDate: Thu Sep 10 00:03:28 2020 -0700
>> Commit:     0day robot <lkp@intel.com>
>> CommitDate: Thu Sep 10 15:05:28 2020 +0800
>>
>>      KASAN: Port KASAN Tests to KUnit
>>
>>      Transfer all previous tests for KASAN to KUnit so they can be run
>>      more easily. Using kunit_tool, developers can run these tests with =
their
>>      other KUnit tests and see "pass" or "fail" with the appropriate KAS=
AN
>>      report instead of needing to parse each KASAN report to test KASAN
>>      functionalities. All KASAN reports are still printed to dmesg.
>>
>>      Stack tests do not work properly when KASAN_STACK is enabled so
>>      those tests use a check for "if IS_ENABLED(CONFIG_KASAN_STACK)" so =
they
>>      only run if stack instrumentation is enabled. If KASAN_STACK is not
>>      enabled, KUnit will print a statement to let the user know this test
>>      was not run with KASAN_STACK enabled.
>>
>>      copy_user_test and kasan_rcu_uaf cannot be run in KUnit so there is=
 a
>>      separate test file for those tests, which can be run as before as a
>>      module.
>>
>>      Signed-off-by: Patricia Alfonso <trishalfonso@google.com>
>>      Signed-off-by: David Gow <davidgow@google.com>
>>      Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>>      Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
>>      Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>>      Tested-by: Andrey Konovalov <andreyknvl@google.com>
>>
>> ff43939c99  KUnit: KASAN Integration
>> ace5381a21  KASAN: Port KASAN Tests to KUnit
>> 988b9e3d2e  mm: kasan: Do not panic if both panic_on_warn and kasan_mult=
ishot set
>> +-----------------------------------------------------------------------=
----+------------+------------+------------+
>> |                                                                       =
    | ff43939c99 | ace5381a21 | 988b9e3d2e |
>> +-----------------------------------------------------------------------=
----+------------+------------+------------+
>> | boot_successes                                                        =
    | 36         | 0          | 0          |
>> | boot_failures                                                         =
    | 2          | 17         | 18         |
>> | BUG:kernel_hang_in_test_stage                                         =
    | 2          |            |            |
>> | INFO:rcu_sched_self-detected_stall_on_CPU                             =
    | 1          |            |            |
>> | RIP:iov_iter_copy_from_user_atomic                                    =
    | 1          |            |            |
>> | BUG:KASAN:slab-out-of-bounds_in_k                                     =
    | 0          | 17         | 18         |
>> | BUG:KASAN:use-after-free_in_k                                         =
    | 0          | 17         | 18         |
>> | BUG:KASAN:double-free_or_invalid-free_in_k                            =
    | 0          | 17         | 18         |
>> | BUG:KASAN:out-of-bounds_in_k                                          =
    | 0          | 17         | 18         |
>> | BUG:KASAN:global-out-of-bounds_in_k                                   =
    | 0          | 17         | 18         |
>> | BUG:KASAN:stack-out-of-bounds_in_k                                    =
    | 0          | 17         | 18         |
>> | BUG:KASAN:alloca-out-of-bounds_in_k                                   =
    | 0          | 17         | 18         |
>> | BUG_kmalloc-#k(Tainted:G_B):Redzone_overwritten                       =
    | 0          | 16         | 18         |
>> | INFO:0x(____ptrval____)-0x(____ptrval____)@offset=3D#.First_byte#inste=
ad_of | 0          | 16         | 18         |
>> | INFO:Allocated_in_kmalloc_node_oob_right_age=3D#cpu=3D#pid=3D         =
          | 0          | 16         | 18         |
>> | INFO:Slab0x(____ptrval____)objects=3D#used=3D#fp=3D0x(#)flags=3D      =
            | 0          | 16         | 18         |
>> | INFO:Object0x(____ptrval____)@offset=3D#fp=3D0x(____ptrval____)       =
        | 0          | 16         | 18         |
>> | BUG_kmalloc-#(Tainted:G_B):Redzone_overwritten                        =
    | 0          | 16         | 18         |
>> | INFO:Allocated_in_ksize_unpoisons_memory_age=3D#cpu=3D#pid=3D         =
          | 0          | 16         | 18         |
>> | INFO:Object0x(____ptrval____)@offset=3D#fp=3D                         =
        | 0          | 6          | 1          |
>> +-----------------------------------------------------------------------=
----+------------+------------+------------+
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> [    6.322464] Btrfs loaded, crc32c=3Dcrc32c-generic, debug=3Don, assert=
=3Don
>> [    6.326467] Key type encrypted registered
>> [    6.327095]     # Subtest: kasan
>> [    6.327096]     1..36
>> [    6.327588] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    6.331263] BUG: KASAN: slab-out-of-bounds in kmalloc_oob_right+0x24f=
/0x270
>> [    6.333536] Write of size 1 at addr ffff8881ddb7b4fb by task kunit_tr=
y_catch/168
>> [    6.336242]
>> [    6.337069] CPU: 0 PID: 168 Comm: kunit_try_catch Not tainted 5.9.0-r=
c1-00126-gace5381a2170d #1
>> [    6.339888] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.12.0-1 04/01/2014
>> [    6.341713] Call Trace:
>> [    6.342400]  dump_stack+0x7d/0xb0
>> [    6.343213]  print_address_description+0x3e/0x60
>> [    6.344414]  ? kmsg_dump_rewind_nolock+0xd4/0xd4
>> [    6.345450]  ? _raw_spin_lock_irqsave+0x72/0xb0
>> [    6.346472]  ? _raw_write_lock_irqsave+0xb0/0xb0
>> [    6.347497]  ? kmalloc_oob_right+0x24f/0x270
>> [    6.348479]  kasan_report.cold+0x1f/0x37
>> [    6.349364]  ? kmalloc_oob_right+0x24f/0x270
>> [    6.350035]  kmalloc_oob_right+0x24f/0x270
>> [    6.350692]  ? kmalloc_oob_left+0x2b0/0x2b0
>> [    6.351341]  ? __switch_to_asm+0x36/0x70
>> [    6.351972]  ? kunit_binary_str_assert_format+0x200/0x200
>> [    6.352755]  ? try_to_wake_up+0x69d/0xb90
>> [    6.353403]  ? _raw_spin_lock_irqsave+0x72/0xb0
>> [    6.354109]  ? _raw_write_lock_irqsave+0xb0/0xb0
>> [    6.354821]  kunit_try_run_case+0x106/0x190
>> [    6.355471]  ? kunit_catch_run_case+0xf0/0xf0
>> [    6.356153]  kunit_generic_run_threadfn_adapter+0x48/0x90
>> [    6.356940]  ? kunit_try_catch_throw+0x70/0x70
>> [    6.357630]  kthread+0x36b/0x440
>> [    6.358174]  ? kthread_create_worker_on_cpu+0xa0/0xa0
>> [    6.358950]  ret_from_fork+0x22/0x30
>> [    6.359548]
>> [    6.359821] Allocated by task 168:
>> [    6.360228]  kasan_save_stack+0x1b/0x40
>> [    6.360657]  __kasan_kmalloc+0xc2/0xd0
>> [    6.361170]  kmalloc_oob_right+0x98/0x270
>> [    6.361616]  kunit_try_run_case+0x106/0x190
>> [    6.362088]  kunit_generic_run_threadfn_adapter+0x48/0x90
>> [    6.362671]  kthread+0x36b/0x440
>> [    6.363054]  ret_from_fork+0x22/0x30
>> [    6.363467]
>> [    6.363724] The buggy address belongs to the object at ffff8881ddb7b4=
80
>> [    6.363724]  which belongs to the cache kmalloc-128 of size 128
>> [    6.364927] The buggy address is located 123 bytes inside of
>> [    6.364927]  128-byte region [ffff8881ddb7b480, ffff8881ddb7b500)
>>
>>                                                            # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start 8b5f091672e8590e9aeb2eada4b9147c271b7f58 f4d51dffc6c01a=
9e94650d95ce0104964f8ae822 --
>> git bisect good 504b8412f15a2c73f6a4217900549be812bc2d62  # 03:23  G    =
 11     0    0   0  Merge 'linux-review/Vladimir-Oltean/net-dsa-link-interf=
aces-with-the-DSA-master-to-get-rid-of-lockdep-warnings/20200908-075010' in=
to devel-hourly-2020091104
>> git bisect good 48cd398cd5bf6d0c04561df96904a6a683e55d9a  # 03:23  G    =
 11     0    0   0  Merge 'iwamatsu-linux-visconti/for-5.10/soc' into devel=
-hourly-2020091104
>> git bisect  bad dad3da46d2e750b344c244fe3f24b1f5db721f89  # 03:23  B    =
  0    15   24   0  Merge 'lpieralisi-pci/pci/rcar' into devel-hourly-20200=
91104
>> git bisect  bad 71af513ef2aa54ccd786dffc9187f76079b3ece7  # 03:23  B    =
  0    17   26   0  Merge 'printk/printk-rework' into devel-hourly-20200911=
04
>> git bisect  bad ad80d7c8a5502fc61d697e68c38fa23453533040  # 03:23  B    =
  0    17   26   0  Merge 'linux-review/Po-Hsu-Lin/selftests-rtnetlink-load=
-fou-module-for-kci_test_encap_fou-test/20200907-115049' into devel-hourly-=
2020091104
>> git bisect  bad d736d19e6269c20cba28feab559d6b2d7f1c4b45  # 03:23  B    =
  0    15   24   0  Merge 'linux-review/Luke-Jones/ALSA-hda-fixup-headset-f=
or-ASUS-GX502-laptop/20200907-112643' into devel-hourly-2020091104
>> git bisect  bad e6d82b0d525e47c5830cf7d0b12a9c0d2c556107  # 03:23  B    =
  0    15   24   0  Merge 'linux-review/Bartosz-Golaszewski/gpiolib-switch-=
to-simpler-IDA-interface/20200909-115515' into devel-hourly-2020091104
>> git bisect  bad a1cdea681581478d00002bb11c89972ed9233258  # 03:24  B    =
  0    13   22   0  Merge 'linux-review/David-Gow/KASAN-KUnit-Integration/2=
0200910-150520' into devel-hourly-2020091104
>> git bisect good 3551e954f5d95faf3dbc340d422da7624658c230  # 03:24  G    =
 11     0    0   1  sched/topology: Mark SD_OVERLAP as SDF_NEEDS_GROUPS
>> git bisect good 4fc472f1214ef75e5450f207e23ff13af6eecad4  # 03:24  G    =
 10     0    0   1  sched/topology: Move SD_DEGENERATE_GROUPS_MASK out of l=
inux/sched/topology.h
>> git bisect good ff43939c990559f97f98d7fd1cb1dead25059f27  # 03:24  G    =
 10     0    0   1  KUnit: KASAN Integration
>> git bisect  bad 24ae469c21f3b40b48bb4e7d1299c41f716dcdc0  # 03:24  B    =
  0    17   26   0  KASAN: Testing Documentation
>> git bisect  bad ace5381a2170d229fc3b98d54513b723d1b3890e  # 03:24  B    =
  0    17   26   0  KASAN: Port KASAN Tests to KUnit
>> # first bad commit: [ace5381a2170d229fc3b98d54513b723d1b3890e] KASAN: Po=
rt KASAN Tests to KUnit
>> git bisect good ff43939c990559f97f98d7fd1cb1dead25059f27  # 03:31  G    =
 31     0    1   2  KUnit: KASAN Integration
>> # extra tests with debug options
>> git bisect  bad ace5381a2170d229fc3b98d54513b723d1b3890e  # 10:21  B    =
  0    11   20   0  KASAN: Port KASAN Tests to KUnit
>> # extra tests on head commit of linux-review/David-Gow/KASAN-KUnit-Integ=
ration/20200910-150520
>> git bisect  bad 988b9e3d2e666cf22fd73a6e0fac5a916fbceb9e  # 10:24  B    =
  0    18   27   0  mm: kasan: Do not panic if both panic_on_warn and kasan=
_multishot set
>> # bad: [988b9e3d2e666cf22fd73a6e0fac5a916fbceb9e] mm: kasan: Do not pani=
c if both panic_on_warn and kasan_multishot set
>> # extra tests on revert first bad commit
>> git bisect good 06fb08fc0dbeadd23a0bc8f745d6c8d855f590ff  # 17:08  G    =
 10     0    1   1  Revert "KASAN: Port KASAN Tests to KUnit"
>> # good: [06fb08fc0dbeadd23a0bc8f745d6c8d855f590ff] Revert "KASAN: Port K=
ASAN Tests to KUnit"
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============2258919762793141759==--

