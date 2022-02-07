Content-Type: multipart/mixed; boundary="===============2846775882214250690=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [PATCH] io_uring: unregister eventfd while holding lock when freeing ring ctx
Date: Mon, 07 Feb 2022 06:46:46 -0700
Message-ID: <696e49fe-3d2e-da6c-2fc6-5d69bc7a60f9@kernel.dk>
In-Reply-To: <20220207105040.2662467-1-usama.arif@bytedance.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2846775882214250690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/7/22 3:50 AM, Usama Arif wrote:
> This is because ctx->io_ev_fd is rcu_dereference_protected using
> ctx->uring_lock in io_eventfd_unregister. Not locking the function
> resulted in suspicious RCU usage reported by kernel test robot.

I'll fold this in with the change, thanks.

-- =

Jens Axboe

--===============2846775882214250690==--

