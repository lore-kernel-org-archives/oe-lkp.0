Content-Type: multipart/mixed; boundary="===============0625109584152347655=="
MIME-Version: 1.0
From: Jason Gunthorpe <jgg@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [IB/srpt] c804af2c1d: last_state.test.blktests.exit_code.143
Date: Mon, 24 Aug 2020 10:30:19 -0300
Message-ID: <20200824133019.GH1152540@nvidia.com>
In-Reply-To: <128192ad-05ff-fa8e-14fc-479a115311e0@acm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0625109584152347655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2020 at 02:18:41PM -0700, Bart Van Assche wrote:
 =

> The patch below is sufficient to unbreak blktests. I think that the
> deadlock while unloading rdma_rxe happens because the RDMA core waits for
> all ib_dev references to be dropped before dealloc_driver is called.

Which is required, yes

> The rdma_rxe dealloc_driver implementation drops an ib_dev
> reference. =


Where does it do that? I didn't notice it?

Jason
--===============0625109584152347655==--

