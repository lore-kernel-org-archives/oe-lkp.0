Content-Type: multipart/mixed; boundary="===============6597927836350377467=="
MIME-Version: 1.0
From: Jens Axboe <axboe@fb.com>
To: lkp@lists.01.org
Subject: Re: [blk] a4d907b6a3: BUG:scheduling_while_atomic
Date: Sat, 01 Apr 2017 08:41:44 -0600
Message-ID: <fb665ecf-ead9-f61c-3a68-1460843b8fab@fb.com>
In-Reply-To: <20170401005045.GA34918@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6597927836350377467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/31/2017 06:50 PM, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: a4d907b6a33ba22adbbfc443e22eb3c1aa2c73f6 ("blk-mq: streamline blk=
_mq_make_request")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-ne=
xt

This was fixed a few days ago by:

http://git.kernel.dk/cgit/linux-block/commit/?h=3Dfor-4.12/block&id=3Dbf490=
7c05e615f6a1811d61c58d56da52f7e9954

which is also in the tested branch.

-- =

Jens Axboe


--===============6597927836350377467==--

