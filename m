Content-Type: multipart/mixed; boundary="===============7880650079182836785=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [io_uring] 6f70bae3cf: BUG:KASAN:use-after-free_in__lock_acquire
Date: Thu, 25 Feb 2021 07:50:02 -0700
Message-ID: <685010d2-1760-1adb-fa99-2a051827babf@kernel.dk>
In-Reply-To: <20210225053817.GA21663@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7880650079182836785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/24/21 10:38 PM, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 6f70bae3cffed4f3b1a4e9f94b8505e114a40223 ("io_uring: ensure io-wq=
 context is always destroyed for tasks")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

This one has been fixed.

-- =

Jens Axboe

--===============7880650079182836785==--

