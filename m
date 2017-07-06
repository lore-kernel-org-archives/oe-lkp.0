Content-Type: multipart/mixed; boundary="===============1102502221137464500=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/time] 03fa63cc96: ACPI_Error:Table[DMAR]is_not_invalidated_during_early_boot_stage(#/tbxface -#)
Date: Thu, 06 Jul 2017 23:03:06 +0200
Message-ID: <alpine.DEB.2.20.1707062258320.3239@nanos>
In-Reply-To: <20170706145412.GA30520@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1102502221137464500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Jul 2017, kernel test robot wrote:

> commit: 03fa63cc96ab35592e0a7d522b8edbc1e6b02d22 ("x86/time: Initialize i=
nterrupt mode behind timer init")

> +----------------+------------+------------+
> |                | 43436935b7 | 03fa63cc96 |
> +----------------+------------+------------+
> | boot_successes | 0          | 4          |
> +----------------+------------+------------+

So 03fa63cc96 makes the box boot again. I'm confused as usual by the
output of this tool.
 =

> kern  :info  : [    0.005000] tsc: Fast TSC calibration using PIT
> kern  :info  : [    0.006000] tsc: Detected 2195.020 MHz processor
> kern  :info  : [    0.007000] Calibrating delay loop (skipped), value cal=
culated using timer frequency.. 4390.04 BogoMIPS (lpj=3D2195020)
> kern  :info  : [    0.008001] pid_max: default: 90112 minimum: 704
> kern  :info  : [    0.009037] ACPI: Core revision 20170303
> kern  :err   : [    0.010002] ACPI Error: Table [DMAR] is not invalidated=
 during early boot stage (20170303/tbxface-193)

Sure we have a error message here, but compared to what? Compared to
something which does not boot at all?

Thanks,

	tglx


--===============1102502221137464500==--

