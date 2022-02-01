Content-Type: multipart/mixed; boundary="===============1948762368507687480=="
MIME-Version: 1.0
From: Sean Young <sean@mess.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] selftests/ir: fix build with ancient kernel headers
Date: Tue, 01 Feb 2022 17:10:53 +0000
Message-ID: <YflpnYECZE2Kxh+V@gofer.mess.org>
In-Reply-To: <YflmyHrYg1xJlW0u@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1948762368507687480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 04:58:48PM +0000, Matthew Wilcox wrote:
> On Tue, Feb 01, 2022 at 04:53:11PM +0000, Sean Young wrote:
> > +/* Support ancient lirc.h which does not have these values */
> =

> Can we have a little more information here, such as "Can be removed once
> RHEL 8 is no longer a relevant testing platform"?  That will save people
> doing archaology to find out when it's safe to remove.

That totally makes sense.

Having said that, I have no idea what platforms are being used for testing,
so I don't know if RHEL 8 is the only one that needs this. Is there anyone
who could shed some light on what platforms should be supported?

Thanks,

Sean
--===============1948762368507687480==--

