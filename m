Content-Type: multipart/mixed; boundary="===============6659256777532684868=="
MIME-Version: 1.0
From: Jens Axboe <axboe@fb.com>
To: lkp@lists.01.org
Subject: Re: [blk] 1131f64d74: BUG: unable to handle kernel NULL pointer dereference at 0000000000000008
Date: Fri, 01 Apr 2016 08:08:06 -0600
Message-ID: <56FE80C6.3090206@fb.com>
In-Reply-To: <874mblhgcb.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6659256777532684868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/01/2016 02:40 AM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git wb-=
buf-throttle
> commit 1131f64d74958d495d8a6d5f9b981e86ed3beb7a ("blk-mq: don't throttle =
for virtual devices")
>
>
> +------------------------------------------+------------+------------+
> |                                          | f21fb0e42c | 1131f64d74 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 6          | 0          |
> | boot_failures                            | 0          | 6          |
> | BUG:unable_to_handle_kernel              | 0          | 6          |
> | Oops                                     | 0          | 6          |
> | RIP:blk_wb_wait                          | 0          | 6          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 6          |
> | backtrace:init                           | 0          | 6          |
> | backtrace:kernel_init_freeable           | 0          | 6          |
> +------------------------------------------+------------+------------+
>
>
>
> [    8.897469] FDC 0 is a S82078B
> [    8.984074] brd: module loaded
> [    9.030737] loop: module loaded
> [    9.045718] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000008
> [    9.048069] IP: [<ffffffff815336b0>] blk_wb_wait+0x5/0x174

Fixed:

http://git.kernel.dk/cgit/linux-block/commit/?h=3Dwb-buf-throttle&id=3D811e=
a72827a70139a0520ec07b39d6a4baa62de1

it was introduced by this commit:

http://git.kernel.dk/cgit/linux-block/commit/?h=3Dwb-buf-throttle&id=3D1131=
f64d74958d495d8a6d5f9b981e86ed3beb7a

and both will be folded for the next release.

-- =

Jens Axboe


--===============6659256777532684868==--

