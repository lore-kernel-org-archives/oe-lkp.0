Content-Type: multipart/mixed; boundary="===============5979164434120037808=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Mon, 18 Jul 2022 10:27:04 -0600
Message-ID: <7146c853-0ff8-3c92-c872-ce6615baab40@kernel.dk>
In-Reply-To: <9df150bb-f4fd-7857-aea8-b2c7a06a8791@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5979164434120037808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/17/22 9:30 PM, Yin Fengwei wrote:
> Hi Jens,
> =

> On 7/15/2022 11:58 PM, Jens Axboe wrote:
>> In terms of making this more obvious, does the below also fix it for
>> you?
> =

> The regression is still there after applied the change you posted.

Still don't see the regression here, using ext4. I get about 1020-1045
IOPS with or without the patch you sent.

This is running it in a vm, and the storage device is nvme. What is
hosting your ext4 fs?

-- =

Jens Axboe

--===============5979164434120037808==--

