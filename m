Content-Type: multipart/mixed; boundary="===============0060679420802747451=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [nvme] f9c499bbbf: nvme nvme0: Identify Controller failed (16641)
Date: Wed, 03 Nov 2021 17:28:25 -0600
Message-ID: <cf4c8341-591c-8207-98af-82bdfb2c1054@kernel.dk>
In-Reply-To: <20211103214748.GA2654474@dhcp-10-100-145-180.wdc.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0060679420802747451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/3/21 3:47 PM, Keith Busch wrote:
> On Wed, Nov 03, 2021 at 02:38:53PM -0700, Keith Busch wrote:
>> On Wed, Nov 03, 2021 at 01:51:18PM -0600, Jens Axboe wrote:
>>> On 11/3/21 8:14 AM, kernel test robot wrote:
>>>>
>>>>
>>>> Greeting,
>>>>
>>>> FYI, we noticed the following commit (built with gcc-9):
>>>>
>>>> commit: f9c499bbbf603389abad60d1931c16b2f96dee06 ("[PATCH 1/2] nvme: m=
ove command clear into the various setup helpers")
>>>> url: https://github.com/0day-ci/linux/commits/Jens-Axboe/nvme-move-com=
mand-clear-into-the-various-setup-helpers/20211018-214956
>>>> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git =
519d81956ee277b4419c723adfb154603c2565ba
>>>> patch link: https://lore.kernel.org/linux-block/20211018124934.235658-=
2-axboe(a)kernel.dk
>>>>
>>>> in testcase: will-it-scale
>>>> version: will-it-scale-x86_64-a34a85c-1_20211029
>>>> with following parameters:
>>>>
>>>> 	nr_task: 50%
>>>> 	mode: process
>>>> 	test: readseek1
>>>> 	cpufreq_governor: performance
>>>> 	ucode: 0x700001e
>>>>
>>>> test-description: Will It Scale takes a testcase and runs it from 1 th=
rough to n parallel copies to see if the testcase will scale. It builds bot=
h a process and threads based test in order to see any differences between =
the two.
>>>> test-url: https://github.com/antonblanchard/will-it-scale
>>>>
>>>>
>>>> on test machine: 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CPU=
 @ 2.50GHz with 128G memory
>>>>
>>>> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
>>>>
>>>>
>>>>
>>>>
>>>> If you fix the issue, kindly add following tag
>>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>>
>>>>
>>>> [   38.907274][  T868] nvme nvme0: pci function 0000:24:00.0
>>>> [   38.924627][ T1103] scsi host0: ahci
>>>> 0m.
>>>> [   38.948010][  T773] nvme nvme0: Identify Controller failed (16641)
>>>> [   38.951220][ T1103] scsi host1: ahci
>>>> [   38.954193][  T773] nvme nvme0: Removing after probe failure status=
: -5
>>>
>>> This is odd, looks like it's saying invalid opcode. Looking at the probe
>>> path, it's pretty standard and the command passed in is cleared already.
>>> So not quite sure why the patch would make a difference here. I'll
>>> poke at it.
>>
>> It's actually an Invalid Queue Identifier error (0x4101). That error
>> makes no sense for an Identify command, so it sounds like the controller
>> observed a different opcode than the driver intended to send, which
>> seems odd; I didn't observe any problems and I'm pretty sure I'm running
>> the same code. I'll take a second look as well.
> =

> The git url that was used in this test points to commit:
> =

>   https://github.com/0day-ci/linux/commit/f9c499bbbf603389abad60d1931c16b=
2f96dee06
> =

> And that commit has an extra memset in the REQ_OP_DRV_IN/OUT case, and
> it doesn't belong there. I don't see that memset in the upstream commit,
> Did the bot pick up the wrong patch?

Ah good catch, it's picking up a previous broken version. Good question on
why that might be, that's counter productive...

In any case, we can ignore it.

-- =

Jens Axboe

--===============0060679420802747451==--

