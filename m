Content-Type: multipart/mixed; boundary="===============4822508897217967573=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/clock] 9881b024b7: WARNING:at_kernel/sched/clock.c:#set_sched_clock_stable
Date: Thu, 26 Jan 2017 11:06:19 +0100
Message-ID: <20170126100619.GV6515@twins.programming.kicks-ass.net>
In-Reply-To: <20170125211406.GA123384@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4822508897217967573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 05:14:06AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 9881b024b7d7671f6a014091bc96506b89081802 ("sched/clock: Delay swi=
tching sched_clock to stable")
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =


> [ 1457.700884] =

> [ 1457.701518] masked ExtINT on CPU#1
> [ 1457.701523] ------------[ cut here ]------------
> [ 1457.701527] WARNING: CPU: 1 PID: 0 at kernel/sched/clock.c:114 set_sch=
ed_clock_stable+0x66/0x70
> [ 1457.701527] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_r=
esolver netconsole sr_mod cdrom sg intel_powerclamp coretemp kvm_intel kvm =
irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel snd_hda_codec_realtek =
ghash_clmulni_intel ppdev mxm_wmi pcbc snd_hda_codec_generic aesni_intel cr=
ypto_simd glue_helper cryptd pcspkr ahci libahci firewire_ohci libata snd_h=
da_intel firewire_core crc_itu_t snd_hda_codec snd_hda_core snd_hwdep snd_p=
cm snd_timer snd soundcore i7core_edac edac_core shpchp winbond_cir rc_core=
 floppy parport_pc parport wmi acpi_cpufreq ip_tables
> [ 1457.701544] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W I     4.=
10.0-rc3-00259-g9881b02 #1
> [ 1457.701544] Hardware name:                  /DX58SO, BIOS SOX5810J.86A=
.4934.2010.0129.1220 01/29/2010
> [ 1457.701545] Call Trace:
> [ 1457.701549]  dump_stack+0x63/0x8a
> [ 1457.701550]  __warn+0xcb/0xf0
> [ 1457.701551]  warn_slowpath_null+0x1d/0x20
> =


Please do _NOT_ truncate WARNs, they have nice start and end markers for
a purpose.

In any case, this should be fixed by commit: acb04058de49 ("sched/clock: Fi=
x hotplug crash")

--===============4822508897217967573==--

