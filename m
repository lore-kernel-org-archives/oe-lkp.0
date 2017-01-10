Content-Type: multipart/mixed; boundary="===============2574445468914075709=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [block] 7647d99c22: BUG: KASAN: global-out-of-bounds in ide_cd_queue_pc at addr ffffffff853d51e0
Date: Tue, 10 Jan 2017 09:46:55 +0100
Message-ID: <20170110084655.GB18886@lst.de>
In-Reply-To: <586e75c7.acqfRyKwmbSENK2K%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2574445468914075709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> [   82.521845] BUG: KASAN: global-out-of-bounds in ide_cd_queue_pc+0xcd/0=
x2fb at addr ffffffff853d51e0

Just curious:  how hard would be to resolve these function-relative address=
es
to a source line (ala gdb, l *(ide_cd_queue_pc+0xcd)) automaticaly as
part of the lkp run?

--===============2574445468914075709==--

