Content-Type: multipart/mixed; boundary="===============3260144869040248209=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [scsi] ebc76736f2: fio.write_bw_MBps -4% regression
Date: Mon, 19 Jun 2017 11:39:13 +0200
Message-ID: <20170619093913.GA15040@lst.de>
In-Reply-To: <20170619085236.GB20152@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3260144869040248209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2017 at 04:52:36PM +0800, Ye Xiaolong wrote:
> >I've not seen a compile-time option for the MQ I/O scheduler (unlike
> >the legacy one), so the way to change it would be to echo the name to
> >/sys/block/<device>/queue/scheduler =

> =

> echo mq-deadline > /sys/block/<device>/queue/scheduler ?
> =

> I'll try and post the results once I get it.

Thanks!

--===============3260144869040248209==--

