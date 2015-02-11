Content-Type: multipart/mixed; boundary="===============4559681460671821498=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] BUG: non-zero nr_pmds on freeing mm: 1
Date: Wed, 11 Feb 2015 15:56:03 +0200
Message-ID: <20150211135603.9871B5CF@black.fi.intel.com>
In-Reply-To: <1423642630.5968.106.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4559681460671821498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit b9be2e58a872e5e35fda4420412bfd91f318d61f ("mm: fix false-positive =
warning on exit due mm_nr_pmds(mm)")
> =

> =

> <3>[   16.254878] netconsole: cleaning up
> <6>[   76.466676] ipmi message handler version 39.2
> <6>[   76.468701] IPMI Watchdog: driver initialized
> <1>[  105.591430] BUG: non-zero nr_pmds on freeing mm: 1
> <1>[  135.594498] BUG: non-zero nr_pmds on freeing mm: 1BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  205.604998] BUG: non-zero nr_pmds on freeing mm: 3BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  245.609425] BUG: non-zero nr_pmds on freeing mm: 2BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  445.635558] BUG: non-zero nr_pmds on freeing mm: 2BUG: non-zero nr_=
pmds on freeing mm: 2
> <1>[  605.658279] BUG: non-zero nr_pmds on freeing mm: 1BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  745.680260] BUG: non-zero nr_pmds on freeing mm: 1BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  795.684046] BUG: non-zero nr_pmds on freeing mm: 3BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  845.691826] BUG: non-zero nr_pmds on freeing mm: 1BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  925.703683] BUG: non-zero nr_pmds on freeing mm: 2BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  945.706399] BUG: non-zero nr_pmds on freeing mm: 1BUG: non-zero nr_=
pmds on freeing mm: 1
> <1>[  985.712821] BUG: non-zero nr_pmds on freeing mm: 1
> =

> =

> It appears that there is similar WARNING for the parent commit as in atta=
ched parent-dmesg.
> =

> <4>[  109.080761] ------------[ cut here ]------------
> <4>[  109.080990] WARNING: CPU: 2 PID: 1917 at mm/mmap.c:2858 exit_mmap+0=
x18e/0x190()
> <4>[  109.081402] Modules linked in: ipmi_watchdog ipmi_msghandler sg sr_=
mod sd_mod cdrom ata_generic pata_acpi snd_hda_codec_realtek snd_hda_codec_=
generic snd_hda_codec_hdmi snd_hda_intel snd_hda_controller snd_hda_codec s=
nd_hwdep snd_pcm pata_marvell coretemp kvm_intel ppdev mxm_wmi kvm ahci lib=
ahci firewire_ohci firewire_core pcspkr serio_raw snd_timer crc32c_intel wi=
nbond_cir libata snd i7core_edac i2c_i801 crc_itu_t microcode soundcore eda=
c_core shpchp rc_core parport_pc parport wmi acpi_cpufreq
> <4>[  109.084601] CPU: 2 PID: 1917 Comm: ebizzy Tainted: G          I    =
3.19.0-rc7-00176-g2137340 #1
> <4>[  109.084989] Hardware name:                  /DX58SO, BIOS SOX5810J.=
86A.4196.2009.0715.1958 07/15/2009
> <4>[  109.085404]  ffffffff81b88580 ffff8800bb353d98 ffffffff818a392a fff=
f8800bf2500f8
> <4>[  109.085871]  0000000000000000 ffff8800bb353dd8 ffffffff8107261a 000=
0000000000297
> <4>[  109.086343]  000000000000256b ffff8800babf0000 00007fcf77d13c60 fff=
f8800babf0000
> <4>[  109.086808] Call Trace:
> <4>[  109.086954]  [<ffffffff818a392a>] dump_stack+0x4c/0x65
> <4>[  109.087194]  [<ffffffff8107261a>] warn_slowpath_common+0x8a/0xc0
> <4>[  109.087469]  [<ffffffff8107270a>] warn_slowpath_null+0x1a/0x20
> <4>[  109.087733]  [<ffffffff811a3b4e>] exit_mmap+0x18e/0x190
> <4>[  109.087975]  [<ffffffff8106f6ab>] mmput+0x7b/0x110
> <4>[  109.088201]  [<ffffffff810750d0>] do_exit+0x2c0/0xae0
> <4>[  109.088443]  [<ffffffff811e5c0c>] ? vfs_write+0x15c/0x1f0
> <4>[  109.088692]  [<ffffffff81075987>] do_group_exit+0x47/0xc0
> <4>[  109.088938]  [<ffffffff81075a14>] SyS_exit_group+0x14/0x20
> <4>[  109.089189]  [<ffffffff818ac069>] system_call_fastpath+0x12/0x17
> <4>[  109.089464] ---[ end trace 3ad78d7b0f8692e0 ]---

It's already fixed in -mm tree.
See http://article.gmane.org/gmane.linux.kernel.mm/128443

--===============4559681460671821498==--

