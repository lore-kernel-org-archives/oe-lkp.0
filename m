Content-Type: multipart/mixed; boundary="===============3859716632971364802=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/platform, acpi] 7486341a98f: genirq: Flags mismatch irq 8. 00000080 (mmc0) vs. 00000000 (rtc0)
Date: Mon, 23 Mar 2015 14:18:28 +0800
Message-ID: <550FB034.8030403@linux.intel.com>
In-Reply-To: <1426840693.5570.55.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3859716632971364802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2015/3/20 16:38, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 7486341a98f26857f383aec88ffa10950087c3a1 ("x86/platform, acpi: Byp=
ass legacy PIC and PIT in ACPI hardware reduced mode")
> =

> =

> +-----------------+------------+------------+
> |                 | 394838c960 | 7486341a98 |
> +-----------------+------------+------------+
> | boot_successes  | 10         | 10         |
> | early-boot-hang | 1          | 1          |
> +-----------------+------------+------------+
> =

> =

> [   28.682462] microcode: CPU3 sig=3D0x30673, pf=3D0x2, revision=3D0x31e
> [   28.692739] microcode: Microcode Update Driver: v2.00 <tigran@aivazi=
an.fsnet.co.uk>, Peter Oruba
> [   28.739947] mmc0: Reset 0x1 never completed.
> [   28.745155] genirq: Flags mismatch irq 8. 00000080 (mmc0) vs. 00000000=
 (rtc0)

mmc driver requests IRQ 8?
>From surface it looks like either a firmware issue or ACPI get the wrong
IRQ resource.
I failed to replicate this issue with the attached config file on my
side, which platform is the test running?

Thanks,
-Aubrey
> [   28.753151] CPU: 1 PID: 138 Comm: systemd-udevd Not tainted 4.0.0-rc4-=
wl-03426-gdba586f #1
> [   28.753156]  ffff880076683480 ffff8800764ffa78 ffffffff818b2eb3 000000=
0000000007
> [   28.753159]  ffff88006d006800 ffff8800764ffad8 ffffffff810d37af ffff88=
00764ffad8
> [   28.753162]  0000000000000246 ffffffff810d394a ffff880053bdc400 000000=
0000000000
> [   28.753163] Call Trace:
> [   28.753174]  [<ffffffff818b2eb3>] dump_stack+0x4c/0x65
> [   28.753180]  [<ffffffff810d37af>] __setup_irq+0x57f/0x5d0
> [   28.753183]  [<ffffffff810d394a>] ? request_threaded_irq+0xaa/0x1b0
> [   28.753191]  [<ffffffffa006ddc0>] ? sdhci_request+0x200/0x200 [sdhci]
> [   28.753194]  [<ffffffff810d3994>] request_threaded_irq+0xf4/0x1b0
> [   28.753199]  [<ffffffffa006b790>] sdhci_add_host+0x800/0xf90 [sdhci]
> [   28.753205]  [<ffffffffa00295a8>] sdhci_acpi_probe+0x348/0x440 [sdhci_=
acpi]
> [   28.753210]  [<ffffffff81558ab4>] platform_drv_probe+0x34/0xa0
> [   28.753215]  [<ffffffff815567f0>] driver_probe_device+0x90/0x3e0
> [   28.753218]  [<ffffffff81556c1b>] __driver_attach+0x9b/0xa0
> [   28.753221]  [<ffffffff81556b80>] ? __device_attach+0x40/0x40
> [   28.753231]  [<ffffffff815545cb>] bus_for_each_dev+0x6b/0xb0
> [   28.753234]  [<ffffffff8155626e>] driver_attach+0x1e/0x20
> [   28.753237]  [<ffffffff81555e30>] bus_add_driver+0x180/0x250
> [   28.753240]  [<ffffffffa002e000>] ? 0xffffffffa002e000
> [   28.753243]  [<ffffffff81557424>] driver_register+0x64/0xf0
> [   28.753246]  [<ffffffff815589fa>] __platform_driver_register+0x4a/0x50
> [   28.753250]  [<ffffffffa002e017>] sdhci_acpi_driver_init+0x17/0x1000 [=
sdhci_acpi]
> [   28.753254]  [<ffffffff81002130>] do_one_initcall+0xc0/0x1f0
> [   28.753259]  [<ffffffff811cb86c>] ? kmem_cache_alloc_trace+0x1cc/0x240
> [   28.753262]  [<ffffffff818afb3c>] ? do_init_module+0x28/0x1dd
> [   28.753266]  [<ffffffff818afb75>] do_init_module+0x61/0x1dd
> [   28.753270]  [<ffffffff810fe9af>] load_module+0x189f/0x1be0
> [   28.753274]  [<ffffffff810f9e50>] ? store_uevent+0x40/0x40
> [   28.753279]  [<ffffffff810fee96>] SyS_finit_module+0x86/0xb0
> [   28.753283]  [<ffffffff818bb109>] system_call_fastpath+0x12/0x17
> [   28.753700] mmc0: Failed to request IRQ 8: -16
> [   28.975382] IOAPIC[0]: Set routing entry (8-16 -> 0x32 -> IRQ 13 Mode:=
1 Active:1 Dest:15)
> [   28.975934] sdhci-acpi: probe of INT33BB:00 failed with error -16
> =

> =

> Thanks,
> Ying Huang
> =

> =

> =

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =



--===============3859716632971364802==--

