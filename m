Content-Type: multipart/mixed; boundary="===============8801259317397518500=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] df387eae80: blogbench.write_score -59% regression
Date: Fri, 03 Feb 2017 09:41:20 +0100
Message-ID: <20170203084120.GA27206@lst.de>
In-Reply-To: <20170203014400.GN17561@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8801259317397518500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 09:44:00AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -59% regression of blogbench.write_score due to commit:
> =

> =

> commit: df387eae801490e939f31eab47f47d87ab85b582 ("enable discard by defa=
ult")
> git://git.infradead.org/users/hch/vfs xfs-async-discard.5

Hi Xiaolong,

do you also have numbers for the whole branch?  Or should I reorder
the branch to move the enable last to get those in another run?

--===============8801259317397518500==--

