Content-Type: multipart/mixed; boundary="===============4979610341416999831=="
MIME-Version: 1.0
From: Jens Axboe <axboe@fb.com>
To: lkp@lists.01.org
Subject: Re: [block] 3d63546519: kernel BUG at block/bio.c:163!
Date: Wed, 02 Mar 2016 20:14:33 -0700
Message-ID: <56D7AC19.5000307@fb.com>
In-Reply-To: <87d1rcpda3.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4979610341416999831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/02/2016 06:21 PM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io-=
streamid
> commit 3d63546519428f2ed1b79e93e4321cf37c5a0d83 ("block: add support for =
carrying a stream ID in a bio")
>
>
> udevd[279]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv of:Ni2=
c-test-busT<NULL>Cunittest-i2c-bus': No such file or directory
> [    3.768664] ------------[ cut here ]------------
> [    3.768664] ------------[ cut here ]------------
> [    3.769406] kernel BUG at block/bio.c:163!
> [    3.769406] kernel BUG at block/bio.c:163!

It's a known bug, it's fixed in the current branch.

-- =

Jens Axboe


--===============4979610341416999831==--

