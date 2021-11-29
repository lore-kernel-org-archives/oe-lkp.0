Content-Type: multipart/mixed; boundary="===============4965592279053859043=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] loop: Use pr_warn_once() for loop_control_remove() warning
Date: Mon, 29 Nov 2021 11:15:41 +0100
Message-ID: <20211129101541.GA1360@lst.de>
In-Reply-To: <61075324-0eb4-3547-1106-92320fabf616@i-love.sakura.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============4965592279053859043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 07:00:43PM +0900, Tetsuo Handa wrote:
> kernel test robot reported that RCU stall via printk() flooding is
> possible [1] when stress testing.
> =

> Link: https://lkml.kernel.org/r/20211129073709.GA18483(a)xsang-OptiPlex-9=
020 [1]
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Btw, what does this test try to do?
--===============4965592279053859043==--

