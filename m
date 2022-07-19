Content-Type: multipart/mixed; boundary="===============7421645664716941809=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Mon, 18 Jul 2022 20:29:22 -0600
Message-ID: <74d1f308-de03-fd5e-b7f0-0e17980f988e@kernel.dk>
In-Reply-To: <81af5cdf-1a13-db2c-7b7b-cfd86f1271e6@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7421645664716941809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/18/22 8:16 PM, Yin Fengwei wrote:
> Hi Jens,
> =

> On 7/19/2022 12:27 AM, Jens Axboe wrote:
>> On 7/17/22 9:30 PM, Yin Fengwei wrote:
>>> Hi Jens,
>>>
>>> On 7/15/2022 11:58 PM, Jens Axboe wrote:
>>>> In terms of making this more obvious, does the below also fix it for
>>>> you?
>>>
>>> The regression is still there after applied the change you posted.
>>
>> Still don't see the regression here, using ext4. I get about 1020-1045
>> IOPS with or without the patch you sent.
>>
>> This is running it in a vm, and the storage device is nvme. What is
>> hosting your ext4 fs?
> Just did more test with vm. The regression can't be reproduced with latest
> code (I tried the tag v5.19-rc7) whatever the underneath storage is SATA
> or NVME.
> =

> But the regression and the debugging patch from me could be reproduced
> on both SATA and NVME if use commit 584b0180f0f4d6 as base commit
> (584b0180f0f4d6 vs 584b0180f0f4d6 with my debugging patch).
> =

> =

> Here is the test result I got:
> NVME as host storage:
>   5.19.0-rc7:
>     write: IOPS=3D933, BW=3D937MiB/s (982MB/s)(18.3GiB/20020msec); 0 zone=
 resets
>     write: IOPS=3D993, BW=3D996MiB/s (1045MB/s)(19.5GiB/20020msec); 0 zon=
e resets
>     write: IOPS=3D1005, BW=3D1009MiB/s (1058MB/s)(19.7GiB/20020msec); 0 z=
one resets
>     write: IOPS=3D985, BW=3D989MiB/s (1037MB/s)(19.3GiB/20020msec); 0 zon=
e resets
>     write: IOPS=3D1020, BW=3D1024MiB/s (1073MB/s)(20.0GiB/20020msec); 0 z=
one resets
> =

>   5.19.0-rc7 with my debugging patch:
>     write: IOPS=3D988, BW=3D992MiB/s (1040MB/s)(19.7GiB/20384msec); 0 zon=
e resets
>     write: IOPS=3D995, BW=3D998MiB/s (1047MB/s)(20.1GiB/20574msec); 0 zon=
e resets
>     write: IOPS=3D996, BW=3D1000MiB/s (1048MB/s)(19.5GiB/20020msec); 0 zo=
ne resets
>     write: IOPS=3D995, BW=3D998MiB/s (1047MB/s)(19.5GiB/20020msec); 0 zon=
e resets
>     write: IOPS=3D1006, BW=3D1009MiB/s (1058MB/s)(19.7GiB/20019msec); 0 z=
one resets

These two basically look identical, which may be why I get the same with
and without your patch. I don't think it makes a difference for this.
Curious how it came about?

>   584b0180f0:
>     write: IOPS=3D1004, BW=3D1008MiB/s (1057MB/s)(19.7GiB/20020msec); 0 z=
one resets
>     write: IOPS=3D968, BW=3D971MiB/s (1018MB/s)(19.4GiB/20468msec); 0 zon=
e resets
>     write: IOPS=3D982, BW=3D986MiB/s (1033MB/s)(19.3GiB/20020msec); 0 zon=
e resets
>     write: IOPS=3D1000, BW=3D1004MiB/s (1053MB/s)(20.1GiB/20461msec); 0 z=
one resets
>     write: IOPS=3D903, BW=3D906MiB/s (950MB/s)(18.1GiB/20419msec); 0 zone=
 resets
> =

>   584b0180f0 with my debugging the patch:
>     write: IOPS=3D1073, BW=3D1076MiB/s (1129MB/s)(21.1GiB/20036msec); 0 z=
one resets
>     write: IOPS=3D1131, BW=3D1135MiB/s (1190MB/s)(22.2GiB/20022msec); 0 z=
one resets
>     write: IOPS=3D1122, BW=3D1126MiB/s (1180MB/s)(22.1GiB/20071msec); 0 z=
one resets
>     write: IOPS=3D1071, BW=3D1075MiB/s (1127MB/s)(21.1GiB/20071msec); 0 z=
one resets
>     write: IOPS=3D1049, BW=3D1053MiB/s (1104MB/s)(21.1GiB/20482msec); 0 z=
one resets

Last one looks like it may be faster indeed. I do wonder if this is
something else, though. There's no reason why -rc7 with that same patch
applied should be any different than 584b0180f0 with it.


these resu
> =

> =

> SATA disk as host storage:
>   5.19.0-rc7:
>     write: IOPS=3D624, BW=3D627MiB/s (658MB/s)(12.3GiB/20023msec); 0 zone=
 resets
>     write: IOPS=3D655, BW=3D658MiB/s (690MB/s)(12.9GiB/20021msec); 0 zone=
 resets
>     write: IOPS=3D596, BW=3D600MiB/s (629MB/s)(12.1GiB/20586msec); 0 zone=
 resets
>     write: IOPS=3D647, BW=3D650MiB/s (682MB/s)(12.7GiB/20020msec); 0 zone=
 resets
>     write: IOPS=3D591, BW=3D594MiB/s (623MB/s)(12.1GiB/20787msec); 0 zone=
 resets
> =

>   5.19.0-rc7 with my debugging patch:
>     write: IOPS=3D633, BW=3D637MiB/s (668MB/s)(12.6GiB/20201msec); 0 zone=
 resets
>     write: IOPS=3D614, BW=3D617MiB/s (647MB/s)(13.1GiB/21667msec); 0 zone=
 resets
>     write: IOPS=3D653, BW=3D657MiB/s (689MB/s)(12.8GiB/20020msec); 0 zone=
 resets
>     write: IOPS=3D618, BW=3D622MiB/s (652MB/s)(12.2GiB/20033msec); 0 zone=
 resets
>     write: IOPS=3D604, BW=3D608MiB/s (638MB/s)(12.1GiB/20314msec); 0 zone=
 resets

These again are probably the same, within variance.

>   584b0180f0:
>     write: IOPS=3D635, BW=3D638MiB/s (669MB/s)(12.5GiB/20020msec); 0 zone=
 resets
>     write: IOPS=3D649, BW=3D652MiB/s (684MB/s)(12.8GiB/20066msec); 0 zone=
 resets
>     write: IOPS=3D639, BW=3D642MiB/s (674MB/s)(13.1GiB/20818msec); 0 zone=
 resets
> =

>   584b0180f0 with my debugging patch:
>     write: IOPS=3D850, BW=3D853MiB/s (895MB/s)(17.1GiB/20474msec); 0 zone=
 resets
>     write: IOPS=3D738, BW=3D742MiB/s (778MB/s)(15.1GiB/20787msec); 0 zone=
 resets
>     write: IOPS=3D751, BW=3D755MiB/s (792MB/s)(15.1GiB/20432msec); 0 zone=
 resets

But this one looks like a clear difference.

I'll poke at this tomorrow.

-- =

Jens Axboe

--===============7421645664716941809==--

