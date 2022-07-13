Content-Type: multipart/mixed; boundary="===============0508983483566497457=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [EXTERNAL] [swiotlb] 44d89f2248: Kernel_panic-not_syncing:swiotlb_init_remap:nslabs=#too_small
Date: Wed, 13 Jul 2022 08:02:46 +0200
Message-ID: <20220713060246.GA13497@lst.de>
In-Reply-To: <c8edfbd4-afad-c018-daf6-aa2ac1f7b2fe@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0508983483566497457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 01:58:38PM +0800, Tianyu Lan wrote:
> Thanks for report. The issue is caused by auto merging between
> commit44d89f("swiotlb: split up the global swiotlb lock") and commit =

> 0bf28fc40(swiotlb: panic if nslabs is too small). nslab is checked before =

> initialization.
>
> Christoph, do you prefer to update patch "swiotlb: split up the global =

> swiotlb lock" or append a fix patch on current brand?

Please just send a patch againt the current tree.  I'll see if squashing
it in makes any sense.
--===============0508983483566497457==--

