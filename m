Content-Type: multipart/mixed; boundary="===============4329356242419159023=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Wed, 20 Jul 2022 11:24:14 -0600
Message-ID: <f5d20f6c-5363-231b-b208-b577a59b4ae9@kernel.dk>
In-Reply-To: <2ec953da-78fd-df01-44cf-6f33a5e40864@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4329356242419159023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/19/22 2:58 AM, Yin Fengwei wrote:
> Hi Jens,
> =

> On 7/19/2022 10:29 AM, Jens Axboe wrote:
>> I'll poke at this tomorrow.
> =

> Just FYI. Another finding (test is based on commit 584b0180f0):
> If the code block is put to different function, the fio performance resul=
t is
> different:

I think this turned out to be a little bit of a goose chase. What's
happening here is that later kernels defer the file assignment, which
means it isn't set if a request is queued with IOSQE_ASYNC. That in
turn, for writes, means that we don't hash it on io-wq insertion, and
then it doesn't get serialized with other writes to that file.

I'll come up with a patch for this that you can test.

-- =

Jens Axboe

--===============4329356242419159023==--

