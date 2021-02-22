Content-Type: multipart/mixed; boundary="===============3010559234271577119=="
MIME-Version: 1.0
From: Jason Gunthorpe <jgg@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [RDMA/rxe] 899aba891c: WARNING:at_drivers/infiniband/sw/rxe/rxe_comp.c:#rxe_completer[rdma_rxe]
Date: Mon, 22 Feb 2021 09:26:24 -0400
Message-ID: <20210222132624.GH4247@nvidia.com>
In-Reply-To: <20210216125413.GD24557@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3010559234271577119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 08:54:13PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 899aba891cab1555c9ca16a558769efb177baf44 ("RDMA/rxe: Fix FIXME in=
 rxe_udp_encap_recv()")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> =

> in testcase: blktests
> version: blktests-x86_64-a210761-1_20210124
> with following parameters:
> =

> 	test: srp-group-00
> 	ucode: 0xe2

Bob?

Jason
--===============3010559234271577119==--

