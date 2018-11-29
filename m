Content-Type: multipart/mixed; boundary="===============7178771879271563232=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [block] 9d037ad707: BUG:unable_to_handle_kernel
Date: Thu, 29 Nov 2018 18:05:35 +0100
Message-ID: <20181129170535.GA28147@lst.de>
In-Reply-To: <20181129092031.GF21676@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7178771879271563232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 05:20:31PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 9d037ad707ed6069fbea4e38e6ee37e027b13f1d ("block: remove req->tim=
eout_list")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git mq-perf

This looks very odd.  How could we introduce a new BUG with the removal
of an unused structure member?

--===============7178771879271563232==--

