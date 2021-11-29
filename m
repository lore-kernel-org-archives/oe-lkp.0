Content-Type: multipart/mixed; boundary="===============4647826598490367380=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [PATCH] loop: Use pr_warn_once() for loop_control_remove() warning
Date: Mon, 29 Nov 2021 06:45:00 -0700
Message-ID: <a467548f-28e3-fbe1-73f0-91eed4677935@kernel.dk>
In-Reply-To: <61075324-0eb4-3547-1106-92320fabf616@i-love.sakura.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============4647826598490367380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/29/21 3:00 AM, Tetsuo Handa wrote:
> kernel test robot reported that RCU stall via printk() flooding is
> possible [1] when stress testing.

Applied, thanks.

-- =

Jens Axboe

--===============4647826598490367380==--

