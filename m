Content-Type: multipart/mixed; boundary="===============5745911977290576005=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Sun, 17 Jul 2022 19:14:47 -0600
Message-ID: <2769e603-613e-0d61-0942-511bfb97760d@kernel.dk>
In-Reply-To: <6d70460d-0a85-4104-9abc-dd100af99e6f@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5745911977290576005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/17/22 6:58 PM, Yin Fengwei wrote:
> =

> =

> On 7/15/2022 11:58 PM, Jens Axboe wrote:
>> I can't really explain that either, at least not immediately. I tried
>> running with and without that patch, and don't see any difference here.
>> In terms of making this more obvious, does the below also fix it for
>> you?
> I will try the fix and let you know the result.
> =

>>
>> And what filesystem is this being run on?
> I am using ext4 and LKP are also using ext4. Thanks.

Thanks, I'll try ext4 as well (was on XFS).

-- =

Jens Axboe

--===============5745911977290576005==--

