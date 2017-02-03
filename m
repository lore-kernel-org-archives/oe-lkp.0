Content-Type: multipart/mixed; boundary="===============0125042589626456507=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] df387eae80: blogbench.write_score -59% regression
Date: Fri, 03 Feb 2017 09:59:04 +0100
Message-ID: <20170203085904.GA27528@lst.de>
In-Reply-To: <20170203085140.GA5957@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0125042589626456507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 04:51:40PM +0800, Ye Xiaolong wrote:
> >do you also have numbers for the whole branch?  Or should I reorder
> =

> Do you mean test data for 7f7bfe47 (xfs: wait for discards before retryin=
g an allocation due to busy extents) ?
> I'll need to check whether 0day bot has launched test for it or not.

Actually the interesting number would be for
57c621ce ("xfs: don't block the log commit handler for discards")
compared to both the baseline and df387eae80 which was tested here.

--===============0125042589626456507==--

