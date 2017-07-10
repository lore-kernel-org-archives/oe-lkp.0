Content-Type: multipart/mixed; boundary="===============1904955501198236079=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC] 5729ee3edf: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Mon, 10 Jul 2017 05:40:00 +0200
Message-ID: <20170710034000.GA22329@nazgul.tnic>
In-Reply-To: <20170710024217.GC26389@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1904955501198236079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 10:42:17AM +0800, kernel test robot wrote:
> commit: 5729ee3edf50e4627ab216a170a4748a2d62dd12 ("EDAC: Remove EDAC_MM_E=
DAC")
> https://git.kernel.org/cgit/linux/kernel/git/bp/bp.git edac-for-4.12-stub

So this is an old branch, lemme kill it.

> in testcase: unixbench
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 1
> 	test: pipe
> 	cpufreq_governor: performance
> =

> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
> =

> =

> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> kern  :err   : [   32.919091] EDAC sbridge: Couldn't find mci handler
> kern  :err   : [   32.919092] EDAC sbridge: Couldn't find mci handler
> kern  :err   : [   32.919095] EDAC sbridge: Failed to register device wit=
h error -22.

AFAIR, we talked about this already. You need to disable CONFIG_EDAC_GHES
temporarily as it registers before the sbridge module.

kern  :info  : [   26.382523] ghes_edac: This EDAC driver relies on BIOS to=
 enumerate memory and get error reports.
kern  :info  : [   26.392439] ghes_edac: Unfortunately, not all BIOSes refl=
ect the memory layout correctly.
kern  :info  : [   26.401574] ghes_edac: So, the end result of using this d=
river varies from vendor to vendor.
kern  :info  : [   26.411001] ghes_edac: If you find incorrect reports, ple=
ase contact your hardware vendor
kern  :info  : [   26.420137] ghes_edac: to correct its BIOS.
kern  :info  : [   26.424812] ghes_edac: This system has 8 DIMM sockets.
kern  :info  : [   26.430737] EDAC MC0: Giving out device to module ghes_ed=
ac.c controller ghes_edac: DEV ghes (INTERRUPT)
kern  :info  : [   26.441401] EDAC MC1: Giving out device to module ghes_ed=
ac.c controller ghes_edac: DEV ghes (INTERRUPT)
kern  :info  : [   26.452619] GHES: APEI firmware first mode is enabled by =
APEI bit and WHEA _OSC.

We're working on fixing this properly but the fix is not ready yet.

Thanks.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============1904955501198236079==--

