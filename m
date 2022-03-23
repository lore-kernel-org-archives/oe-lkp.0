Content-Type: multipart/mixed; boundary="===============2528873827481644177=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [scsi] 6aded12b10: kernel_BUG_at_mm/usercopy.c
Date: Wed, 23 Mar 2022 08:14:10 +0100
Message-ID: <20220323071409.GA25480@lst.de>
In-Reply-To: <20220320143453.GD6208@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2528873827481644177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The actual warning is;

[   34.496096][  T331] usercopy: Kernel memory overwrite attempt detected t=
o spans multiple pages (off set 0, size 6)!

This is for the cmnd field in struct scsi_cmnd, which is allocated by
the block layer as part of the request allocator.  So with a specific
packing it can legitimately span pages.

Kees: how can we annotate that this is ok?
--===============2528873827481644177==--

