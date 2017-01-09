Content-Type: multipart/mixed; boundary="===============0871270591211446425=="
MIME-Version: 1.0
From: Matthew Wilcox <mawilcox@microsoft.com>
To: lkp@lists.01.org
Subject: Re: [idr] 956f224033: BUG:unable_to_handle_kernel
Date: Mon, 09 Jan 2017 20:02:12 +0000
Message-ID: <BY2PR21MB003642919389EAF203E0CC9CCB640@BY2PR21MB0036.namprd21.prod.outlook.com>
In-Reply-To: <20170109155724.GA61857@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0871270591211446425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you!  Bug diagnosed, test-case written, test-case reproduces bug, bug=
 fixed, test-case now passes, new branch available: idr-2017-01-09

> -----Original Message-----
> From: kernel test robot [mailto:xiaolong.ye(a)intel.com]
> Sent: Monday, January 9, 2017 10:57 AM
> To: Matthew Wilcox <mawilcox@microsoft.com>
> Cc: lkp(a)01.orgTh
> Subject: [idr] 956f224033: BUG:unable_to_handle_kernel
> =

> =

> FYI, we noticed the following commit:
> =

> commit: 956f224033ece0ca81949580e2c95fc132025229 ("idr: Return the
> deleted entry from idr_remove")
> git://git.infradead.org/users/willy/linux-dax.git idr-2017-01-03
> =

> in testcase: hwsim
> with following parameters:
> =

> 	group: hwsim-00
> =

> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-2600K CPU @ 3.40GHz with =
8G
> memory
> =

> caused below changes:
> =

> =

> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | 4b91753c5c | 95=
6f224033 |
> +-------------------------------------------------------+------------+---=
---------+
> | boot_successes                                        | 12         | 2 =
         |
> | boot_failures                                         | 0          | 8 =
         |
> | BUG:unable_to_handle_kernel                           | 0          | 8 =
         |
> | Oops                                                  | 0          | 8 =
         |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 8 =
         |
> +-------------------------------------------------------+------------+---=
---------+
> =

> =

> =

> [  151.800365] ieee80211 phy0:   ERP_SLOT: 1
> [  151.800371] ieee80211 phy0: mac80211_hwsim_config (freq=3D2412(2412 -
> 0)/ht20 idle=3D0 ps=3D0 smps=3Doff)
> [  151.800380] wlan0: associated
> [  151.813580] BUG: unable to handle kernel paging request at ffffffff8bf=
aedf1
> [  151.813590] IP: node_tag_get+0xc/0x30
> [  151.813591] PGD 21ee0c067
> [  151.813592] PUD 21ee0d063
> [  151.813593] PMD 0
> [  151.813594]
> [  151.813596] Oops: 0000 [#1] SMP
> [  151.813598] Modules linked in: ghash_generic gf128mul gcm ccm arc4
> mac80211_hwsim mac80211 cfg80211 rfkill rpcsec_gss_krb5 auth_rpcgss nfsv4
> dns_resolver netconsole sd_mod sg snd_hda_codec_hdmi intel_rapl
> x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_codec_realtek
> ppdev snd_hda_codec_generic kvm_intel kvm irqbypass crct10dif_pclmul
> crc32_pclmul crc32c_intel ghash_clmulni_intel pcbc firewire_ohci ahci
> firewire_core crc_itu_t snd_hda_intel snd_hda_codec i915 snd_hda_core
> snd_hwdep snd_pcm video libahci snd_timer aesni_intel drm_kms_helper
> crypto_simd syscopyarea glue_helper snd sysfillrect sysimgblt cryptd seri=
o_raw
> pcspkr fb_sys_fops libata shpchp soundcore parport_pc parport drm
> nuvoton_cir rc_core ip_tables
> [  151.813644] CPU: 5 PID: 581 Comm: hostapd Not tainted 4.10.0-rc2-00032-
> g956f224 #1
> [  151.813645] Hardware name:                  /DH67GD, BIOS
> BLH6710H.86A.0132.2011.1007.1505 10/07/2011
> [  151.813647] task: ffff88021b954b80 task.stack: ffffc9000174c000
> [  151.813651] RIP: 0010:node_tag_get+0xc/0x30
> [  151.813652] RSP: 0018:ffff88021fb43e10 EFLAGS: 00010082
> [  151.813654] RAX: ffffffff81822389 RBX: 0000000000000000 RCX:
> ffff88021fb43e28
> [  151.813656] RDX: 0000000053c64359 RSI: ffffffff81822361 RDI:
> ffff88021b26d4f8
> [  151.813657] RBP: ffff88021fb43e10 R08: ffff880210105696 R09:
> ffff88021fb43e28
> [  151.813659] R10: 0000000000000040 R11: ffff88021b26c740 R12:
> ffff88021b26d4f8
> [  151.813661] R13: 0000000000000000 R14: ffff8801c0369c00 R15:
> 0000000000000000
> [  151.813663] FS:  00007f9f348b2b40(0000) GS:ffff88021fb40000(0000)
> knlGS:0000000000000000
> [  151.813665] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  151.813666] CR2: ffffffff8bfaedf1 CR3: 000000021c1e4000 CR4:
> 00000000000406e0
> [  151.813668] Call Trace:
> [  151.813670]  <IRQ>
> [  151.813674]  radix_tree_delete_item+0x75/0x90
> [  151.813679]  ? skb_free_head+0x21/0x30
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Kernel Test Robot

--===============0871270591211446425==--

