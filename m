Content-Type: multipart/mixed; boundary="===============6023287541763278056=="
MIME-Version: 1.0
From: Sean Paul <seanpaul@chromium.org>
To: lkp@lists.01.org
Subject: Re: [drm] 2ab8c5f8c0 WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_mode_config.c:424 drm_mode_config_cleanup
Date: Thu, 23 Feb 2017 14:24:04 -0500
Message-ID: <CAOw6vbLj1TMWssRDe9GZ-HfSnrAs_67YW=J+kXDRTDHwQ2h2eQ@mail.gmail.com>
In-Reply-To: <20170222010611.k2r2jel5zfsdprzd@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6023287541763278056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 8:06 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> commit 2ab8c5f8c0358010a19e82656fa4826a6a51d1e0
> Author:     Daniel Vetter <daniel.vetter@ffwll.ch>
> AuthorDate: Wed Dec 14 00:08:08 2016 +0100
> Commit:     Daniel Vetter <daniel.vetter@ffwll.ch>
> CommitDate: Sun Dec 18 14:33:51 2016 +0100
>
>      drm: Clean up connectors by unreferencing them
>
>      Only static connectors should be left at this point, and we should be
>      able to clean them out by simply dropping that last reference still
>      around from drm_connector_init.
>
>      If that leaves anything behind then we have a driver bug.
>
>      Doing the final cleanup this way also allows us to use
>      drm_connector_iter, removing the very last place where we walk
>      connector_list explicitly in drm core&helpers.
>
>      Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>      Reviewed-by: Sean Paul <seanpaul@chromium.org>
>      Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>      Link: http://patchwork.freedesktop.org/patch/msgid/20161213230814.19=
598-8-daniel.vetter(a)ffwll.ch
>
> c36a3254f7  drm: Convert all helpers to drm_connector_list_iter
> 2ab8c5f8c0  drm: Clean up connectors by unreferencing them
> +-----------------------------------------------------------------------+=
------------+------------+
> |                                                                       |=
 c36a3254f7 | 2ab8c5f8c0 |
> +-----------------------------------------------------------------------+=
------------+------------+
> | boot_successes                                                        |=
 92         | 0          |
> | boot_failures                                                         |=
 0          | 48         |
> | WARNING:at_drivers/gpu/drm/drm_mode_config.c:#drm_mode_config_cleanup |=
 0          | 48         |
> | calltrace:bochs_init                                                  |=
 0          | 48         |
> +-----------------------------------------------------------------------+=
------------+------------+
>
> [   21.723856] Console: switching to colour frame buffer device 128x48
> [   21.729355] bochs-drm 0000:00:02.0: fb0: bochsdrmfb frame buffer device
> [   21.755257] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.=
0 on minor 0
> [   21.761762] Console: switching to colour VGA+ 80x25
> [   21.795640] ------------[ cut here ]------------
> [   21.797398] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_mode_config.=
c:424 drm_mode_config_cleanup+0x99/0x20c


>From the commit msg: "If that leaves anything behind then we have a driver=
 bug"

I did a quick inspection of the bochs driver, and it doesn't look like
the leak results from improper fbdev cleanup or error path handling.

The only dangling reference I can pick out is the one acquired in
drm_crtc_helper_set_config(). Where are those references supposed to
be cleaned up on unload?

Sean



> [   21.801086] CPU: 0 PID: 1 Comm: swapper Not tainted 4.9.0-rc8-01683-g2=
ab8c5f #1
> [   21.803731] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   21.807009]  ffff88001e4ebbf8 ffffffff813762d0 ffff88001e4ebc38 ffffff=
ff810a2a88
> [   21.810375]  000001a81e4ebbf8 ffff88001fb18008 ffff88001fb189e8 ffff88=
001fb189f0
> [   21.813719]  0000000000000001 0000000000000000 ffff88001e4ebc48 ffffff=
ff810a2b50
> [   21.817119] Call Trace:
> [   21.818349]  [<ffffffff813762d0>] dump_stack+0x19/0x1b
> [   21.820153]  [<ffffffff810a2a88>] __warn+0xb1/0xcc
> [   21.821905]  [<ffffffff810a2b50>] warn_slowpath_null+0x18/0x1a
> [   21.823954]  [<ffffffff81566950>] drm_mode_config_cleanup+0x99/0x20c
> [   21.826109]  [<ffffffff817bbd45>] bochs_kms_fini+0x1a/0x24
> [   21.828035]  [<ffffffff817bae26>] bochs_unload+0x1e/0x46
> [   21.829948]  [<ffffffff81551f28>] drm_dev_unregister+0x38/0xb0
> [   21.831959]  [<ffffffff81551fe4>] drm_put_dev+0x44/0x4f
> [   21.833853]  [<ffffffff817bad2c>] bochs_pci_remove+0x10/0x12
> [   21.835878]  [<ffffffff813e0344>] pci_device_remove+0x46/0x8f
> [   21.837866]  [<ffffffff817d937a>] driver_probe_device+0x202/0x439
> [   21.839999]  [<ffffffff817d966c>] __driver_attach+0xbb/0xde
> [   21.841813]  [<ffffffff817d95b1>] ? driver_probe_device+0x439/0x439
> [   21.843808]  [<ffffffff817d774a>] bus_for_each_dev+0x5a/0x82
> [   21.845669]  [<ffffffff817d98cc>] driver_attach+0x19/0x1b
> [   21.847412]  [<ffffffff817d7fee>] bus_add_driver+0x134/0x218
> [   21.849191]  [<ffffffff817d9f0f>] driver_register+0x83/0xba
> [   21.850859]  [<ffffffff813e0219>] __pci_register_driver+0x5b/0x5e
> [   21.852653]  [<ffffffff82805845>] ? nouveau_drm_init+0x1e2/0x1e2
> [   21.854457]  [<ffffffff81553840>] drm_pci_init+0x47/0xc8
> [   21.856087]  [<ffffffff82805845>] ? nouveau_drm_init+0x1e2/0x1e2
> [   21.857817]  [<ffffffff827cb73a>] ? do_early_param+0x8f/0x8f
> [   21.859494]  [<ffffffff8280585c>] bochs_init+0x17/0x19
> [   21.861231]  [<ffffffff827cc0dc>] do_one_initcall+0x94/0x152
> [   21.864299]  [<ffffffff810b9700>] ? parse_args+0x1e4/0x373
> [   21.866212]  [<ffffffff827cb73a>] ? do_early_param+0x8f/0x8f
> [   21.867927]  [<ffffffff827cc298>] kernel_init_freeable+0xfe/0x197
> [   21.869732]  [<ffffffff81b999a1>] ? rest_init+0xb8/0xb8
> [   21.871334]  [<ffffffff81b999aa>] kernel_init+0x9/0xeb
> [   21.872948]  [<ffffffff81ba5535>] ret_from_fork+0x25/0x30
> [   21.874584] ---[ end trace c0673e7b7c7b335f ]---
> [   21.877475] [TTM] Finalizing pool allocator
>
> git bisect start 546a214099cfdce7851266b0a288e45c11ebfc52 v4.9 --
> git bisect good fb1d8e0e2c50f374cfc244564decfc3f0a336cb4  # 00:40     22+=
      0  Merge tag 'upstream-4.10-rc5' of git://git.infradead.org/linux-ubi=
fs
> git bisect good 77c43e3363fe4f05f4ee32b0ad89e69a46e8f410  # 00:54     22+=
      0  Merge remote-tracking branch 'asm-generic/master'
> git bisect  bad cd73d1675614a817ff3ea3fbf32e9d8251d7828b  # 01:07      0-=
     12  Merge remote-tracking branch 'kspp/for-next/kspp'
> git bisect good 956c6cd9555cc6bc3d841a558c75ff779da07ca7  # 01:18     22+=
      0  Merge remote-tracking branch 'f2fs/dev'
> git bisect good 6c3c3b71c0e14fe1ef08f9d5a56b9b17cbffe9ab  # 01:43     22+=
      0  Merge remote-tracking branch 'pm/linux-next'
> git bisect good 142c3794a59d179437534628bf5ae2b8bc43d857  # 02:03     22+=
      0  Merge remote-tracking branch 'bluetooth/master'
> git bisect  bad def0451540b29e2cac571d23f21339c1a3914625  # 02:16      0-=
      9  Merge remote-tracking branch 'drm/drm-next'
> git bisect good 8eb5a9b6f81c9c96475123a5eeebf2627326700e  # 02:28     22+=
      0  Merge remote-tracking branch 'rdma/for-next'
> git bisect good d7e5960db95570fdb5d4c7053e8c6c4a8a09f285  # 05:09     22+=
      0  Merge remote-tracking branch 'mtd/master'
> git bisect good ad7b78d2e5105e46c577ab24aa7d565bfdaaa611  # 05:20     22+=
      0  Merge remote-tracking branch 'crypto/master'
> git bisect  bad 8bab1193c193fa1a695aa9bb881bb4cb0ea2ba85  # 08:08      0-=
     48  drm/i915: Convert i915_ggtt_view to use an anonymous union
> git bisect good a402eae64d0ad12b1c4a411f250d6c161e67f623  # 08:35     22+=
      0  Merge tag 'v4.10-rc2' into drm-intel-next-queued
> git bisect  bad b5c3714fe8789745521d8351d75049b9c6a0d26b  # 11:23      0-=
     27  drm/mm: Convert to drm_printer
> git bisect good 2407d1dc04789bfb2f39d248644981d2233feb0e  # 14:15     20+=
      0  drm: Fix compilation warning caused by static inline forward decla=
ration
> git bisect  bad 06df8ac682e6a00e6e32d105208953ca5323cc82  # 14:26      0-=
     31  drm: kselftest for drm_mm_debug()
> git bisect  bad 4e98c378a137def586b3ffc8ac5a5852da2e0538  # 17:13      0-=
     48  drm/ttm: use designated initializers
> git bisect  bad 188f78825de7b43593ae26cb86fecdf9ce5a4ac8  # 20:34      0-=
     48  drm: Fix spelling of clock in drm_connector.h
> git bisect good 15092c7a3cddb495649363a403f242edd2aaa6a5  # 23:16     22+=
      0  drm: Drop locking cargo-cult from drm_mode_config_init
> git bisect  bad 2ab8c5f8c0358010a19e82656fa4826a6a51d1e0  # 01:58      0-=
     37  drm: Clean up connectors by unreferencing them
> git bisect good c36a3254f7857f1ad9badbe3578ccc92be541a8e  # 02:40     21+=
      0  drm: Convert all helpers to drm_connector_list_iter
> # first bad commit: [2ab8c5f8c0358010a19e82656fa4826a6a51d1e0] drm: Clean=
 up connectors by unreferencing them
> git bisect good c36a3254f7857f1ad9badbe3578ccc92be541a8e  # 02:44     66+=
      0  drm: Convert all helpers to drm_connector_list_iter
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> # extra tests on HEAD of linux-devel/devel-catchup-201702200357
> git bisect  bad 546a214099cfdce7851266b0a288e45c11ebfc52  # 02:49      0-=
     35  0day head guard for 'devel-catchup-201702200357'
> # extra tests on tree/branch linux-next/master
> git bisect  bad b349d1bbdc9ea7df856ab3af395c03b858e29d48  # 05:39      0-=
    150  Add linux-next specific files for 20170220
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



-- =

Sean Paul, Software Engineer, Google / Chromium OS

--===============6023287541763278056==--

