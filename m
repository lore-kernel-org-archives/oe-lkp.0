Content-Type: multipart/mixed; boundary="===============1911722700911941790=="
MIME-Version: 1.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 995d11c4c0 ("drm: rework delayed connector cleanup in .."): WARNING: possible circular locking dependency detected
Date: Mon, 18 Dec 2017 18:35:11 +0100
Message-ID: <b511976e-100e-7038-3c4c-b32d4448af88@linux.intel.com>
In-Reply-To: <CAKMK7uHPSRUEUiQo2KU+COA-+d-csbOSQ7Qg3o2OWrz-onZF7Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1911722700911941790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Op 18-12-17 om 08:08 schreef Daniel Vetter:
> Hm, the bisect looks funny. Only way I can explain that is that my
> patch fixed a pre-existing lockdep splat, and uncovered the issue in
> the ww-mutex self tests. That one is uncovered by the new
> cross-release lockdep checks in 4.15.
>
> Anyway I think this is an issue with the ww-mutex tests, not my patch
> (none of the code I touched is anywhere in the backtraces), adding
> relevant people.
> -Daniel
>
>
> On Sat, Dec 16, 2017 at 11:42 AM, kernel test robot
> <fengguang.wu@intel.com> wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://github.com/0day-ci/linux/commits/Daniel-Vetter/drm-rework-delaye=
d-connector-cleanup-in-connector_iter/20171216-120456
>>
>> commit 995d11c4c0f1aa99d0f97fb747a4e0d04121cde2
>> Author:     Daniel Vetter <daniel.vetter@ffwll.ch>
>> AuthorDate: Wed Dec 13 11:45:53 2017 +0100
>> Commit:     0day robot <fengguang.wu@intel.com>
>> CommitDate: Sat Dec 16 12:04:58 2017 +0800
>>
>>     drm: rework delayed connector cleanup in connector_iter
>>
>>     PROBE_DEFER also uses system_wq to reprobe drivers, which means when
>>     that again fails, and we try to flush the overall system_wq (to get
>>     all the delayed connectore cleanup work_struct completed), we
>>     deadlock.
>>
>>     Fix this by using just a single cleanup work, so that we can only
>>     flush that one and don't block on anything else. That means a free
>>     list plus locking, a standard pattern.
>>
>>     Fixes: a703c55004e1 ("drm: safely free connectors from connector_ite=
r")
>>     Fixes: 613051dac40d ("drm: locking&new iterators for connector_list")
>>     Cc: Ben Widawsky <ben@bwidawsk.net>
>>     Cc: Dave Airlie <airlied@gmail.com>
>>     Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>     Cc: Sean Paul <seanpaul@chromium.org>
>>     Cc: <stable@vger.kernel.org> # v4.11+: 613051dac40d ("drm: locking=
&new iterators for connector_list"
>>     Cc: <stable@vger.kernel.org> # v4.11+
>>     Cc: Daniel Vetter <daniel.vetter@intel.com>
>>     Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>     Cc: Gustavo Padovan <gustavo@padovan.org>
>>     Cc: David Airlie <airlied@linux.ie>
>>     Cc: Javier Martinez Canillas <javier@dowhile0.org>
>>     Cc: Shuah Khan <shuahkh@osg.samsung.com>
>>     Cc: Guillaume Tucker <guillaume.tucker@collabora.com>
>>     Cc: Mark Brown <broonie@kernel.org>
>>     Cc: Kevin Hilman <khilman@baylibre.com>
>>     Cc: Matt Hart <matthew.hart@linaro.org>
>>     Cc: Thierry Escande <thierry.escande@collabora.co.uk>
>>     Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>     Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>     Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>
>> 50c4c4e268  Linux 4.15-rc3
>> 995d11c4c0  drm: rework delayed connector cleanup in connector_iter
>> +-------------------------------------------------------+-----------+---=
---------+
>> |                                                       | v4.15-rc3 | 99=
5d11c4c0 |
>> +-------------------------------------------------------+-----------+---=
---------+
>> | boot_successes                                        | 1         | 0 =
         |
>> | boot_failures                                         | 82        | 15=
         |
>> | WARNING:possible_circular_locking_dependency_detected | 82        | 15=
         |
>> | kernel_BUG_at_lib/list_debug.c                        | 0         | 15=
         |
>> | invalid_opcode:#[##]                                  | 0         | 15=
         |
>> | RIP:__list_add_valid                                  | 0         | 15=
         |
>> | Kernel_panic-not_syncing:Fatal_exception              | 0         | 15=
         |
>> +-------------------------------------------------------+-----------+---=
---------+
>>
>> [    3.252870] CPU feature 'AVX registers' is not supported.
>> [    3.261404] AVX2 or AES-NI instructions are not detected.
>> [    3.262708] AVX2 instructions are not detected.
>> [    3.770347]
>> [    3.773471] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    3.773471] WARNING: possible circular locking dependency detected
>> [    3.773471] 4.15.0-rc3-00001-g995d11c #1 Not tainted
>> [    3.773471] ------------------------------------------------------
>> [    3.773471] swapper/0/1 is trying to acquire lock:
>> [    3.773471]  (ww_class_mutex){+.+.}, at: [<00000000134bc923>] test_ab=
ba+0x120/0x21e
>> [    3.773471]
>> [    3.773471] but now in release context of a crosslock acquired at the=
 following:
>> [    3.773471]  ((completion)&abba.a_ready){+.+.}, at: [<00000000ea3fc8c=
8>] test_abba_work+0x43/0xab
>> [    3.773471]
>> [    3.773471] which lock already depends on the new lock.
>> [    3.773471]
>> [    3.773471] the existing dependency chain (in reverse order) is:
>> [    3.773471]
>> [    3.773471] -> #1 ((completion)&abba.a_ready){+.+.}:
>> [    3.773471]        __wait_for_common+0x55/0x1fe
>> [    3.773471]        test_abba_work+0x43/0xab
>> [    3.773471]        process_one_work+0x1d4/0x310
>> [    3.773471]        worker_thread+0x1aa/0x25d
>> [    3.773471]        kthread+0x120/0x128
>> [    3.773471]        ret_from_fork+0x24/0x30
>> [    3.773471]
>> [    3.773471] -> #0 (ww_class_mutex){+.+.}:
>> [    3.773471]        test_abba+0x120/0x21e
>> [    3.773471]        test_ww_mutex_init+0x88/0x2fd
>> [    3.773471]        do_one_initcall+0x94/0x149
>> [    3.773471]        kernel_init_freeable+0x12a/0x1a6
>> [    3.773471]        kernel_init+0x5/0xe1
>> [    3.773471]
>> [    3.773471] other info that might help us debug this:
>> [    3.773471]
>> [    3.773471]  Possible unsafe locking scenario by crosslock:
>> [    3.773471]
>> [    3.773471]        CPU0                    CPU1
>> [    3.773471]        ----                    ----
>> [    3.773471]   lock(ww_class_mutex);
>> [    3.773471]   lock((completion)&abba.a_ready);
>> [    3.773471]                                lock(ww_class_mutex);
>> [    3.773471]                                unlock((completion)&abba.a=
_ready);
>> [    3.773471]
>> [    3.773471]  *** DEADLOCK ***
>> [    3.773471]
>> [    3.773471] 3 locks held by swapper/0/1:
>> [    3.773471]  #0:  (ww_class_acquire){+.+.}, at: [<00000000f90b2f9f>] =
test_abba+0x115/0x21e
>> [    3.773471]  #1:  (ww_class_mutex){+.+.}, at: [<00000000134bc923>] te=
st_abba+0x120/0x21e
>> [    3.773471]  #2:  (&x->wait#7){....}, at: [<0000000092c10ea9>] comple=
te+0x13/0x4b
>> [    3.773471]
>> [    3.773471] stack backtrace:
>> [    3.773471] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.15.0-rc3-0000=
1-g995d11c #1
>> [    3.773471] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.10.2-1 04/01/2014
>> [    3.773471] Call Trace:
>> [    3.773471]  dump_stack+0x79/0xab
>> [    3.773471]  print_circular_bug+0x2a1/0x2af
>> [    3.773471]  check_prev_add+0x88/0x229
>> [    3.773471]  ? __lockdep_init_map+0x1aa/0x1aa
>> [    3.773471]  ? __lock_acquire+0xd7c/0xe2c
>> [    3.773471]  ? _raw_spin_unlock_irq+0x29/0x32
>> [    3.773471]  ? lock_commit_crosslock+0x32e/0x3af
>> [    3.773471]  lock_commit_crosslock+0x32e/0x3af
>> [    3.773471]  complete+0x1f/0x4b
>> [    3.773471]  test_abba+0x128/0x21e
>> [    3.773471]  ? test_cycle_work+0xa1/0xa1
>> [    3.773471]  ? test_abba_work+0x43/0xab
>> [    3.773471]  ? set_debug_rodata+0xc/0xc
>> [    3.773471]  test_ww_mutex_init+0x88/0x2fd
>> [    3.773471]  ? set_debug_rodata+0xc/0xc
>> [    3.773471]  ? lockdep_proc_init+0x51/0x51
>> [    3.773471]  ? set_debug_rodata+0xc/0xc
>> [    3.773471]  do_one_initcall+0x94/0x149
>> [    3.773471]  ? set_debug_rodata+0xc/0xc
>> [    3.773471]  kernel_init_freeable+0x12a/0x1a6
>> [    3.773471]  ? rest_init+0xba/0xba
>> [    3.773471]  kernel_init+0x5/0xe1
>> [    3.773471]  ret_from_fork+0x24/0x30
>> [    4.213498] tsc: Refined TSC clocksource calibration: 2593.993 MHz
>> [    4.214153] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x=
256411d258c, max_idle_ns: 440795337342 ns
>> [    9.875268] rcu-torture:--- Start of test: nreaders=3D1 nfakewriters=
=3D4 stat_interval=3D60 verbose=3D1 test_no_idle_hz=3D1 shuffle_interval=3D=
3 stutter=3D5 irqreader=3D1 fqs_duration=3D0 fqs_holdoff=3D0 fqs_stutter=3D=
3 test_boost=3D1/0 test_boost_interval=3D7 test_boost_duration=3D4 shutdown=
_secs=3D0 stall_cpu=3D0 stall_cpu_holdoff=3D10 stall_cpu_irqsoff=3D0 n_barr=
ier_cbs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
>> [    9.878594] rcu-torture: Creating rcu_torture_writer task
>> [    9.886729] rcu-torture: Creating rcu_torture_fakewriter task
Looks like a selftest that should throw a warn, but not sure why it returns=
 a kernel warning instead of a simple PASS..
>>                                                           # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start 8174afd657ed57f8ea96940235a2f5a5fec10847 50c4c4e268a2d7=
a3e58ebb698ac74da0de40ae36 --
>> git bisect  bad 26cfe9440f51706d7a9639c79f59372b948637e6  # 15:20  B    =
  0     3   16   0  Merge 'mvebu/for-next' into devel-spot-201712161301
>> git bisect  bad 0e185f01383d4fdc5827ccd4d894b754234c5e31  # 15:54  B    =
  0     4   17   0  Merge 'linux-review/Nicolin-Chen/ASoC-fsl_ssi-Clean-up-=
coding-style-level/20171216-032026' into devel-spot-201712161301
>> git bisect  bad c00658c095dd5d0a48ebdedd68de9c8c49ab0633  # 16:19  B    =
  0     5   18   0  Merge 'linux-review/Christian-K-nig/MAINTAINERS-add-sep=
arate-entry-for-DRM-TTM/20171216-090756' into devel-spot-201712161301
>> git bisect  bad 27c51a58b3376c4b5ea0481ed35a3f8f112e5294  # 16:38  B    =
  0     1   14   0  Merge 'snitzer/dm-4.16-nvme_bio' into devel-spot-201712=
161301
>> git bisect  bad 57a3119eb5ea6842e970be28ee659b7d2aa9d432  # 16:54  B    =
  0     8   21   0  Merge 'linux-review/Daniel-Vetter/drm-rework-delayed-co=
nnector-cleanup-in-connector_iter/20171216-120456' into devel-spot-20171216=
1301
>> git bisect good de03d6e01cc2c1cb142daf6cb5ee9f72314c4c8b  # 17:15  G    =
 11     0   11  11  0day base guard for 'devel-spot-201712161301'
>> git bisect  bad 995d11c4c0f1aa99d0f97fb747a4e0d04121cde2  # 17:27  B    =
  0     4   17   0  drm: rework delayed connector cleanup in connector_iter
>> # first bad commit: [995d11c4c0f1aa99d0f97fb747a4e0d04121cde2] drm: rewo=
rk delayed connector cleanup in connector_iter
>> git bisect good 50c4c4e268a2d7a3e58ebb698ac74da0de40ae36  # 17:36  G    =
 33     0   32  80  Linux 4.15-rc3
>> # extra tests with debug options
>> git bisect  bad 995d11c4c0f1aa99d0f97fb747a4e0d04121cde2  # 17:47  B    =
  0     3   16   0  drm: rework delayed connector cleanup in connector_iter
>> # extra tests on HEAD of linux-devel/devel-spot-201712161301
>> git bisect  bad 8174afd657ed57f8ea96940235a2f5a5fec10847  # 17:52  B    =
  0    37   53   0  0day head guard for 'devel-spot-201712161301'
>> # extra tests on tree/branch linux-review/Daniel-Vetter/drm-rework-delay=
ed-connector-cleanup-in-connector_iter/20171216-120456
>> git bisect  bad 995d11c4c0f1aa99d0f97fb747a4e0d04121cde2  # 18:09  B    =
  0    15   28   0  drm: rework delayed connector cleanup in connector_iter
>> # extra tests with first bad commit reverted
>> git bisect good 14abeded1e578b748e38967e176ec5c97563c45a  # 18:41  G    =
 11     0   11  11  Revert "drm: rework delayed connector cleanup in connec=
tor_iter"
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology C=
enter
>> https://lists.01.org/pipermail/lkp                          Intel Corpor=
ation
>
>


--===============1911722700911941790==--

