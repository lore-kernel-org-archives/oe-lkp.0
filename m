Content-Type: multipart/mixed; boundary="===============8684837663246187044=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [nvme] f9c499bbbf: nvme nvme0: Identify Controller failed (16641)
Date: Wed, 03 Nov 2021 13:51:18 -0600
Message-ID: <e6f09b9b-386a-8a26-7c4b-c528791f7c9a@kernel.dk>
In-Reply-To: <20211103141454.GA30634@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8684837663246187044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/3/21 8:14 AM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: f9c499bbbf603389abad60d1931c16b2f96dee06 ("[PATCH 1/2] nvme: move=
 command clear into the various setup helpers")
> url: https://github.com/0day-ci/linux/commits/Jens-Axboe/nvme-move-comman=
d-clear-into-the-various-setup-helpers/20211018-214956
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 519=
d81956ee277b4419c723adfb154603c2565ba
> patch link: https://lore.kernel.org/linux-block/20211018124934.235658-2-a=
xboe(a)kernel.dk
> =

> in testcase: will-it-scale
> version: will-it-scale-x86_64-a34a85c-1_20211029
> with following parameters:
> =

> 	nr_task: 50%
> 	mode: process
> 	test: readseek1
> 	cpufreq_governor: performance
> 	ucode: 0x700001e
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> =

> on test machine: 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CPU @ =
2.50GHz with 128G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   38.907274][  T868] nvme nvme0: pci function 0000:24:00.0
> [   38.924627][ T1103] scsi host0: ahci
> 0m.
> [   38.948010][  T773] nvme nvme0: Identify Controller failed (16641)
> [   38.951220][ T1103] scsi host1: ahci
> [   38.954193][  T773] nvme nvme0: Removing after probe failure status: -5

This is odd, looks like it's saying invalid opcode. Looking at the probe
path, it's pretty standard and the command passed in is cleared already.
So not quite sure why the patch would make a difference here. I'll
poke at it.

-- =

Jens Axboe

--===============8684837663246187044==--

