Content-Type: multipart/mixed; boundary="===============4199148420541560167=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 26 Sep 2016 16:55:12 +0200
Message-ID: <20160926145512.GA16612@lst.de>
In-Reply-To: <87k2dzi3eg.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4199148420541560167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ying,

> Any update to this regression?

Not really.  We've optimized everything we could in XFS without
dropping the architecture that we really want to move to.  Now we're
waiting for some MM behavior to be fixed that this unconvered.  But
in the end will probabkly stuck with a slight regression in this
artificial workload.

--===============4199148420541560167==--

