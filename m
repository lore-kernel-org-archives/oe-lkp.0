Content-Type: multipart/mixed; boundary="===============7723125501143641835=="
MIME-Version: 1.0
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [nvme] f9c499bbbf: nvme nvme0: Identify Controller failed (16641)
Date: Wed, 03 Nov 2021 20:52:06 +0000
Message-ID: <6a0cce97-2755-3df7-3be4-f66dbf786fe8@nvidia.com>
In-Reply-To: <e6f09b9b-386a-8a26-7c4b-c528791f7c9a@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7723125501143641835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/3/21 12:51, Jens Axboe wrote:
> External email: Use caution opening links or attachments
> =

> =

> On 11/3/21 8:14 AM, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: f9c499bbbf603389abad60d1931c16b2f96dee06 ("[PATCH 1/2] nvme: mov=
e command clear into the various setup helpers")
>> url: https://github.com/0day-ci/linux/commits/Jens-Axboe/nvme-move-comma=
nd-clear-into-the-various-setup-helpers/20211018-214956
>> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 51=
9d81956ee277b4419c723adfb154603c2565ba
>> patch link: https://lore.kernel.org/linux-block/20211018124934.235658-2-=
axboe(a)kernel.dk
>>
>> in testcase: will-it-scale
>> version: will-it-scale-x86_64-a34a85c-1_20211029
>> with following parameters:
>>
>>        nr_task: 50%
>>        mode: process
>>        test: readseek1
>>        cpufreq_governor: performance
>>        ucode: 0x700001e
>>
>> test-description: Will It Scale takes a testcase and runs it from 1 thro=
ugh to n parallel copies to see if the testcase will scale. It builds both =
a process and threads based test in order to see any differences between th=
e two.
>> test-url: https://github.com/antonblanchard/will-it-scale
>>
>>
>> on test machine: 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CPU @=
 2.50GHz with 128G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> [   38.907274][  T868] nvme nvme0: pci function 0000:24:00.0
>> [   38.924627][ T1103] scsi host0: ahci
>> 0m.
>> [   38.948010][  T773] nvme nvme0: Identify Controller failed (16641)
>> [   38.951220][ T1103] scsi host1: ahci
>> [   38.954193][  T773] nvme nvme0: Removing after probe failure status: =
-5
> =


For PCIe controller, I don't see any reason to fail the identify
controller command except this might be a controller issue.

Can you please provide what type of controller you are using ?

Also, can this be reproduced on the different controllers ?



--===============7723125501143641835==--

