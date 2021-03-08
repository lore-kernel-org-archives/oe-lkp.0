Content-Type: multipart/mixed; boundary="===============1891718844440790183=="
MIME-Version: 1.0
From: hch@lst.de
To: lkp@lists.01.org
Subject: Re: [block] 52f019d43c: ndctl.test-libndctl.fail
Date: Mon, 08 Mar 2021 08:09:15 +0100
Message-ID: <20210308070915.GA32695@lst.de>
In-Reply-To: <6f40b1f53c029788e20fe175618d8772e36d648c.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1891718844440790183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 06, 2021 at 08:33:04PM +0000, Williams, Dan J wrote:
> Yes, it looks like my unit test checks for exactly the behavior you
> changed. It was convenient to test that the device could be switched
> back to rw via BLKROSET, but I don't require that. The new behaviour of
> letting the disk->ro take precedence makes more sense to me, so I'll
> update the test for the new behaviour.
> =

> I.e. I don't think regressing a unit test counts as a userspace
> regression.

Ok, thanks for the confirmation.
--===============1891718844440790183==--

