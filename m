Content-Type: multipart/mixed; boundary="===============4001819237883750514=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [block] 4e366a7962: blktests.nvme.005.fail
Date: Thu, 28 Mar 2019 18:48:46 +0100
Message-ID: <20190328174846.GA22610@lst.de>
In-Reply-To: <bb98759a-2b51-9785-d903-282ca1ed91cb@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4001819237883750514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 05:31:29PM +0100, Johannes Thumshirn wrote:
> In all cases I could reproduce it I had nsegs =3D=3D 2 and
> rq->nr_phys_segments =3D=3D 1 (rq->bio->bi_phys_segments =3D=3D 1).

And all cases are pass through as well?

Can you check if this still shows up with the series from Ming which
switches the passthrough requests to use multi-page biovecs aswell
and gets rid of the hairy code you quote below.

--===============4001819237883750514==--

