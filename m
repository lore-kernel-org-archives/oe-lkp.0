Content-Type: multipart/mixed; boundary="===============0648136798889114177=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Tue, 19 Jul 2022 08:27:45 +0800
Message-ID: <a6567482-0fcf-4bff-87e7-81a41a77e928@intel.com>
In-Reply-To: <7146c853-0ff8-3c92-c872-ce6615baab40@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0648136798889114177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 7/19/2022 12:27 AM, Jens Axboe wrote:
> On 7/17/22 9:30 PM, Yin Fengwei wrote:
>> Hi Jens,
>>
>> On 7/15/2022 11:58 PM, Jens Axboe wrote:
>>> In terms of making this more obvious, does the below also fix it for
>>> you?
>>
>> The regression is still there after applied the change you posted.
> =

> Still don't see the regression here, using ext4. I get about 1020-1045
> IOPS with or without the patch you sent.
> =

> This is running it in a vm, and the storage device is nvme. What is
> hosting your ext4 fs?
> =

My local testing system is also a vm with SATA disk. LKP test platform
is a native one with SATA disk.

I could reproduce the regression on both environment. I will try to use
nvme to host my local vm disk and check whether we could see something
different.


Regards
Yin, Fengwei
--===============0648136798889114177==--

