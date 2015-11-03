Content-Type: multipart/mixed; boundary="===============5494919115223826433=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/setup] f5f3497cad: BUG: kernel boot crashed
Date: Tue, 03 Nov 2015 09:07:34 +0100
Message-ID: <20151103080734.GA20008@gmail.com>
In-Reply-To: <20151102162551.GB2331@codeblueprint.co.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5494919115223826433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Matt Fleming <matt@codeblueprint.co.uk> wrote:

> On Wed, 28 Oct, at 01:41:51PM, kernel test robot wrote:
> > FYI, we noticed the below changes on
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > commit f5f3497cad8c8416a74b9aaceb127908755d020a ("x86/setup: Extend low=
 identity map to cover whole kernel range")
> > =

> > =

> > +------------------------------------------------+------------+--------=
----+
> > |                                                | 8a53554e12 | f5f3497=
cad |
> > +------------------------------------------------+------------+--------=
----+
> > | boot_successes                                 | 19         | 10     =
    |
> > | boot_failures                                  | 2          | 9      =
    |
> > | IP-Config:Auto-configuration_of_network_failed | 2          | 2      =
    |
> > | BUG:kernel_boot_crashed                        | 0          | 7      =
    |
> > +------------------------------------------------+------------+--------=
----+
> > =

> > =

> > [    0.053410] smpboot: CPU0: GenuineIntel GenuineIntel QEMU Virtual CP=
U version 2.4.0QEMU Virtual CPU version 2.4.0 (family: 0x6, model: 0x6 (fam=
ily: 0x6, model: 0x6, stepping: 0x3)
> > , stepping: 0x3)
> > [    0.056666] Performance Events: =

> > [    0.056666] Performance Events: no PMU driver, software events only.
> > no PMU driver, software events only.
> > [    0.060520] CPU 1 irqstacks, hard=3D8a832000 soft=3D8a834000
> > [    0.060520] CPU 1 irqstacks, hard=3D8a832000 soft=3D8a834000
> > [    0.061605] x86: Booting SMP configuration:
> > [    0.061605] x86: Booting SMP configuration:
> > [    0.062445] .... node  #0, CPUs:  =

> > [    0.062445] .... node  #0, CPUs:         #1 #1
> > Elapsed time: 10
> > BUG: kernel boot crashed
> =

> Yikes! Yeah, I can reproduce this. It appears the STARTUP IPI code is
> triggering this crash in wakeup_secondary_cpu_via_init().
> =

> I'll take a look unless anyone else has any bright ideas?

Unfortunately this commit is now part of the v4.3 kernel, so we need a quic=
k =

solution or a quick revert.

Thanks,

	Ingo

--===============5494919115223826433==--

