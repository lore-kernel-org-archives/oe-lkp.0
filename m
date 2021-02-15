Content-Type: multipart/mixed; boundary="===============3296403275626842868=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [btrfs] 3d6ef82805: WARNING:at_fs/btrfs/extent-tree.c:#btrfs_reserve_extent[btrfs]
Date: Mon, 15 Feb 2021 08:40:02 -0700
Message-ID: <8fec3d91-fd37-0159-7417-0661659e2e02@kernel.dk>
In-Reply-To: <20210215132734.GA15834@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3296403275626842868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/15/21 6:27 AM, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 3d6ef82805958611e8ffa0a901c014b6f066c3e6 ("btrfs: relax memory al=
ignment restriction for O_DIRECT")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git dio-me=
m-align

This patch has been dropped, we did identify last week that btrfs
needs more work to support sub bs memory alignment for dio.

-- =

Jens Axboe

--===============3296403275626842868==--

