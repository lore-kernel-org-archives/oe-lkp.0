Content-Type: multipart/mixed; boundary="===============0305110087093909844=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] bbc5a740c4: xfstests.generic.095.fail
Date: Wed, 27 Jul 2016 14:36:47 +0200
Message-ID: <20160727123647.GA14249@lst.de>
In-Reply-To: <20160727020043.GM21454@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0305110087093909844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The WARN_ON whitelist in generic/095 needs an updated for the new function
names.  I did this change locally but never sent it out so far, sorry.

I'll send a patch to the fstests lists ASAP, but until you've updated your
xfstests repo you will continue to see this warning.


--===============0305110087093909844==--

