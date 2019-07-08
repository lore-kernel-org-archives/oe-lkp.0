Content-Type: multipart/mixed; boundary="===============6281554252989718687=="
MIME-Version: 1.0
From: Du, Fan <fan.du@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] d9c2d4fb34: kernel_BUG_at_mm/page_alloc.c
Date: Mon, 08 Jul 2019 07:29:06 +0000
Message-ID: <5A90DA2E42F8AE43BC4A093BF0678848257FFF11@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <20190703070724.GO7221@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6281554252989718687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: lkp
>Sent: Wednesday, July 3, 2019 3:07 PM
>To: Du, Fan <fan.du@intel.com>
>Cc: lkp(a)01.org
>Subject: [mm] d9c2d4fb34: kernel_BUG_at_mm/page_alloc.c
>
>FYI, we noticed the following commit (built with gcc-7):
>
>commit: d9c2d4fb343f1d18bab1dcdf4ab6f92c474256dd ("mm: Introduce
>pagecache page access counter")
>https://kernel.googlesource.com/pub/scm/linux/kernel/git/wfg/linux.git
>fan-mapcount
>
>in testcase: xfstests
>with following parameters:
>
>	disk: 4HDD
>	fs: ext4
>	test: generic-group9
>
>test-description: xfstests is a regression test suite for xfs and other fi=
les
>ystems.
>test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>
>
>on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2
>-m 2G
>
>caused below changes (please refer to attached dmesg/kmsg for entire
>log/backtrace):
>
>
>+-------------------------------------------------------------------------=
-----------------+------------+-
>-----------+
>|
>| 249155c20f | d9c2d4fb34 |
>+-------------------------------------------------------------------------=
-----------------+------------+-
>-----------+
>| boot_successes
>| 110        | 22         |
>| boot_failures
>| 2083       | 83         |
>| BUG:kernel_reboot-without-warning_in_test_stage
>| 2061       | 27         |
>| invoked_oom-killer:gfp_mask=3D0x
>| 2          |            |
>| Mem-Info
>| 2          |            |
>|
>WARNING:at_drivers/net/wireless/mac80211_hwsim.c:#mac80211_hwsim_tx[
>mac80211_hwsim]      | 10         |            |
>| RIP:mac80211_hwsim_tx[mac80211_hwsim]
>| 10         |            |
>|
>WARNING:at_drivers/net/wireless/mac80211_hwsim.c:#mac80211_hwsim_ro
>c[mac80211_hwsim]     | 3          |            |
>| RIP:mac80211_hwsim_roc[mac80211_hwsim]
>| 3          |            |
>| BUG:kernel_NULL_pointer_dereference,address
>| 1          |            |
>| Oops:#[##]
>| 1          |            |
>| RIP:ieee80211_subif_start_xmit[mac80211]
>| 1          |            |
>| Kernel_panic-not_syncing:Fatal_exception_in_interrupt
>| 1          |            |
>| WARNING:at_kernel/time/hrtimer.c:#hrtimer_forward
>| 1          |            |
>| RIP:hrtimer_forward
>| 1          |            |
>|
>WARNING:at_drivers/net/wireless/mac80211_hwsim.c:#mac80211_hwsim_h
>w_scan[mac80211_hwsim] | 1          |            |
>| RIP:mac80211_hwsim_hw_scan[mac80211_hwsim]
>| 1          |            |
>|
>WARNING:at_net/mac80211/tx.c:#__ieee80211_csa_update_counter[mac802
>11]                   | 4          |            |
>| RIP:__ieee80211_csa_update_counter[mac80211]
>| 4          |            |
>| RIP:__fsnotify_parent
>| 1          |            |
>| RIP:console_unlock
>| 2          |            |
>| RIP:native_safe_halt
>| 1          |            |
>| BUG:kernel_hang_in_test_stage
>| 0          | 1          |
>| kernel_BUG_at_mm/page_alloc.c
>| 0          | 47         |
>| invalid_opcode:#[##]
>| 0          | 47         |
>| RIP:__isolate_free_page
>| 0          | 47         |
>| Kernel_panic-not_syncing:Fatal_exception
>| 0          | 47         |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d
>| 0          | 4          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d9
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fe
>| 0          | 3          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#af6e
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a592
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d49
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e7b0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fa9
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#da73
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f9ef
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#de0b
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ac
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn
>| 0          | 7          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c63f
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b
>| 0          | 5          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e8d
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bb67
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c4
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ffc0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b3
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ddd
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c565
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d5ab
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#afae
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d23
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c
>| 0          | 3          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#cd80
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b41c
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b7cc
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#af89
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a730
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d3a2
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c8
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#df73
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#aa6
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b321
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d51
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bbdf
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d0fe
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bb6f
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c5
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a581
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b227
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ae2
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a0d8
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b545
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f064
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b867
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e2db
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f7fb
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f0c6
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c3a0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f1c3
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f8
>| 0          | 3          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fb23
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#dade
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d8
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:b5e6e
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a19
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:b6e4c
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a2
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fd
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:b6524
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ddbd
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e01d
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e0e6
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fe75
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f6
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#da
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#df
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e1
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a014
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a0bf
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a10d
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a1b1
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d52c
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a20
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f2e8
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f2f4
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f324
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f329
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f354
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b200
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b8b4
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b64
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c7
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f136
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a929
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bf
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d41
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c3d9
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d6e
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#abca
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a35f
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f
>| 0          | 3          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c758
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a257
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a9dc
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d3e
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d406
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#be2
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a28a
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#da2
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e2b3
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e3ec
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c89
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f08
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fdb7
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a
>| 0          | 3          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d2b1
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a6
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e12a
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c2
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d6cc
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d6d2
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#db88
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d6
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c1
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b1cb
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#be74
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f81
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e4e
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d25f
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c372
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a9a
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e7ba
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c80f
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c308
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bb4b
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b73f
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#abac
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b2
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b2b1
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d574
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b1a
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a52
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e6
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d78c
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e5cc
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f1b4
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f36f
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bc4d
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bd4c
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b78
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c104
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ee1
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a6dc
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b1f0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b46e
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e538
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f8c
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e021
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a67
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f812
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#aa7
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e47
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ad9
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#df5
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ff
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b16
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b18
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b53
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#be
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c80
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e21
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#f7a
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fdd
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b87
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#aa
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:bbe13
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:bbe5f
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fc
>| 0          | 2          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#eb
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c9
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a49
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e8db
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#eb05
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#eb58
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a837
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ba
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c7d
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a8
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c6a
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ec0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ed5
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a4
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ef
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bcd
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#dc3b
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#dc44
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ae7
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c8d
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#e14
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d315
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ed92
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d31
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a198
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ad0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ad4c
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#ae28
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a31
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c547
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c75b
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#bd21
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a3c5
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#faa6
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fb79
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a36
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:be226
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b03b
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:bdcc1
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c35
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#b0
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d61
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#d817
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#fa8
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#a745
>| 0          | 1          |
>| BUG:Bad_page_cache_in_process_holetest_pfn:#c78e
>| 0          | 1          |
>| BUG:kernel_hang_in_boot-around-mounting-root_stage
>| 0          | 1          |
>+-------------------------------------------------------------------------=
-----------------+------------+-
>-----------+
>
>
>If you fix the issue, kindly add following tag
>Reported-by: kernel test robot <lkp@intel.com>
>
>
>[  418.216231] kernel BUG at mm/page_alloc.c:3070!
>[  418.219970] invalid opcode: 0000 [#1] SMP PTI
>[  418.222889] CPU: 0 PID: 26 Comm: kcompactd0 Not tainted
>5.2.0-rc6-00016-gd9c2d4f #1
>[  418.226988] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>BIOS 1.10.2-1 04/01/2014
>[  418.231272] RIP: 0010:__isolate_free_page+0x1b5/0x1d0
>[  418.234448] Code: ff ff 83 e8 03 83 f8 02 76 0d be 01 00 00 00 4c 89 ff=
 e8 fe
>ea ff ff 49 81 c7 00 80 00 00 4c 39 fb 77 bf 89 ea e9 04 ff ff ff <0f> 0b =
48 8b 54
>24 08 be 0c 00 00 00 4c 89 e7 e8 87 85 fc ff e9 1e
>[  418.243988] RSP: 0018:ffffb6d480403ba0 EFLAGS: 00010007
>[  418.247172] RAX: 0000000000000000 RBX: 0000000000000680 RCX:
>ffffdb45003b7808
>[  418.251445] RDX: 0000000000000003 RSI: 0000000000000005 RDI:
>ffffdb4501c37000
>[  418.255192] RBP: 0000000000000065 R08: ffffb6d480403de0 R09:
>0000000000000065
>[  418.259108] R10: ffffdb4501c37000 R11: ffff8d99eb4b7958 R12:
>0000000000000005
>[  418.262710] R13: 0000000000000100 R14: ffff8d99eb4b7000 R15:
>0000000000000000
>[  418.266560] FS:  0000000000000000(0000) GS:ffff8d99e9000000(0000)
>knlGS:0000000000000000
>[  418.270717] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[  418.274221] CR2: 00000000004216d0 CR3: 000000007a57a000 CR4:
>00000000000006f0
>[  418.278369] Call Trace:
>[  418.280918]  compaction_alloc+0x3a3/0x9a0
>[  418.283842]  ? pageblock_skip_persistent+0x40/0x40
>[  418.287032]  migrate_pages+0x239/0xbd0
>[  418.290108]  ? isolate_freepages_block+0x390/0x390
>[  418.293289]  compact_zone+0x5cd/0xdd0
>[  418.295873]  kcompactd_do_work+0x139/0x300
>[  418.298900]  ? __switch_to_asm+0x34/0x70
>[  418.301831]  ? __switch_to_asm+0x40/0x70
>[  418.304602]  ? prepare_to_wait_event+0x99/0x190
>[  418.307524]  ? kcompactd_do_work+0x300/0x300
>[  418.310371]  ? kcompactd+0x8c/0x200
>[  418.313020]  kcompactd+0x8c/0x200
>[  418.315455]  ? finish_wait+0x80/0x80
>[  418.318035]  kthread+0x11e/0x140
>[  418.320407]  ? kthread_park+0x90/0x90
>[  418.323205]  ret_from_fork+0x35/0x40
>[  418.325736] Modules linked in: ext4 mbcache jbd2 dm_mod
>crct10dif_pclmul crc32_pclmul bochs_drm crc32c_intel ttm
>ghash_clmulni_intel drm_kms_helper sr_mod cdrom sg snd_pcm syscopyarea
>sysfillrect sysimgblt ppdev fb_sys_fops snd_timer snd drm aesni_intel
>crypto_simd soundcore cryptd glue_helper ata_generic joydev pata_acpi
>pcspkr serio_raw parport_pc floppy ata_piix parport libata i2c_piix4
>ip_tables
>[  418.343484] ---[ end trace dd63ae8e91bad72d ]---

Fengguang

Thanks for reporting this bug, I spent some time to look into it.
The v2 patch just sent to you is mean to fix this call trace.

>
>To reproduce:
>
>        # build kernel
>	cd linux
>	cp config-5.2.0-rc6-00016-gd9c2d4f .config
>	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig
>	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 prepare
>	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 modules_prepare
>	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 SHELL=3D/bin/bash
>	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 bzImage
>
>
>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>	bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is
>attached in this email
>
>
>
>
>Thanks,
>lkp


--===============6281554252989718687==--

