Content-Type: multipart/mixed; boundary="===============2042673963291842149=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/dma] fec777c385: kmsg.parport_pc_parport_pc.#:Unable_to_set_coherent_dma_mask:disabli ng_DMA
Date: Tue, 24 Apr 2018 09:30:56 +0200
Message-ID: <20180424073056.GA18945@lst.de>
In-Reply-To: <20180423060453.GA28534@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2042673963291842149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think this should be fixed by:

"swiotlb: Use dma_direct_supported() for swiotlb_ops"

--===============2042673963291842149==--

