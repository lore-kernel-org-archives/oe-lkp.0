Content-Type: multipart/mixed; boundary="===============6130258089169751613=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [xfs] 8bbb6aa20a: xfstests.xfs.004.fail
Date: Wed, 18 Jan 2017 09:24:21 +0100
Message-ID: <20170118082421.GA23370@lst.de>
In-Reply-To: <20170118012827.GA15063@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6130258089169751613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi bot,

this is somewhat expected as the reserved block count changes.

I've send a fix to xfstests to take this into account.  Next time you
update xfstests this should be fine again.

--===============6130258089169751613==--

