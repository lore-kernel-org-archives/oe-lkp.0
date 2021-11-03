Content-Type: multipart/mixed; boundary="===============4704578616861228304=="
MIME-Version: 1.0
From: Keith Busch <kbusch@kernel.org>
To: lkp@lists.01.org
Subject: Re: [nvme] f9c499bbbf: nvme nvme0: Identify Controller failed (16641)
Date: Wed, 03 Nov 2021 14:38:53 -0700
Message-ID: <20211103213853.GA2654246@dhcp-10-100-145-180.wdc.com>
In-Reply-To: <e6f09b9b-386a-8a26-7c4b-c528791f7c9a@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4704578616861228304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 03, 2021 at 01:51:18PM -0600, Jens Axboe wrote:
> On 11/3/21 8:14 AM, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: f9c499bbbf603389abad60d1931c16b2f96dee06 ("[PATCH 1/2] nvme: mo=
ve command clear into the various setup helpers")
> > url: https://github.com/0day-ci/linux/commits/Jens-Axboe/nvme-move-comm=
and-clear-into-the-various-setup-helpers/20211018-214956
> > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 5=
19d81956ee277b4419c723adfb154603c2565ba
> > patch link: https://lore.kernel.org/linux-block/20211018124934.235658-2=
-axboe(a)kernel.dk
> > =

> > in testcase: will-it-scale
> > version: will-it-scale-x86_64-a34a85c-1_20211029
> > with following parameters:
> > =

> > 	nr_task: 50%
> > 	mode: process
> > 	test: readseek1
> > 	cpufreq_governor: performance
> > 	ucode: 0x700001e
> > =

> > test-description: Will It Scale takes a testcase and runs it from 1 thr=
ough to n parallel copies to see if the testcase will scale. It builds both=
 a process and threads based test in order to see any differences between t=
he two.
> > test-url: https://github.com/antonblanchard/will-it-scale
> > =

> > =

> > on test machine: 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CPU =
@ 2.50GHz with 128G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > [   38.907274][  T868] nvme nvme0: pci function 0000:24:00.0
> > [   38.924627][ T1103] scsi host0: ahci
> > 0m.
> > [   38.948010][  T773] nvme nvme0: Identify Controller failed (16641)
> > [   38.951220][ T1103] scsi host1: ahci
> > [   38.954193][  T773] nvme nvme0: Removing after probe failure status:=
 -5
> =

> This is odd, looks like it's saying invalid opcode. Looking at the probe
> path, it's pretty standard and the command passed in is cleared already.
> So not quite sure why the patch would make a difference here. I'll
> poke at it.

It's actually an Invalid Queue Identifier error (0x4101). That error
makes no sense for an Identify command, so it sounds like the controller
observed a different opcode than the driver intended to send, which
seems odd; I didn't observe any problems and I'm pretty sure I'm running
the same code. I'll take a second look as well.
--===============4704578616861228304==--

