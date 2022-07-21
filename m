Content-Type: multipart/mixed; boundary="===============8790657287064265700=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Thu, 21 Jul 2022 11:08:14 +0800
Message-ID: <c5b81a15-275a-900a-b7d3-afd65f301ea3@intel.com>
In-Reply-To: <f5d20f6c-5363-231b-b208-b577a59b4ae9@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============8790657287064265700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On 7/21/2022 1:24 AM, Jens Axboe wrote:
> I think this turned out to be a little bit of a goose chase. What's
> happening here is that later kernels defer the file assignment, which
> means it isn't set if a request is queued with IOSQE_ASYNC. That in
> turn, for writes, means that we don't hash it on io-wq insertion, and
> then it doesn't get serialized with other writes to that file.
Thanks a lot for the detail behavior explanation.


Regards
Yin, Fengwei
--===============8790657287064265700==--

