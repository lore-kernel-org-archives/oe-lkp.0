Content-Type: multipart/mixed; boundary="===============2962843257038017350=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] crypto: x86/glue_helper make bool
Date: Fri, 22 Jul 2016 01:06:07 +0200
Message-ID: <20160721230607.GA5537@wotan.suse.de>
In-Reply-To: <20160721230111.GI21225@windriver.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2962843257038017350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 07:01:11PM -0400, Paul Gortmaker wrote:
> [[PATCH] crypto: x86/glue_helper make bool] On 21/07/2016 (Thu 15:13) Lui=
s R. Rodriguez wrote:
> =

> > Paul's changes to remove MODULE_LICENSE() out of the x86 glue_helper
> > causes a kernel with CONFIG_CRYPTO_GLUE_HELPER_X86=3Dm to taint since
> > it now detects the license is missing if you try to build the driver
> > as a module, log below.
> =

> Reported and fixed two days ago ; the fix went out in yesterday's
> linux-next via the tip tree.
> =

> https://lkml.kernel.org/r/20160719144243.GK21225(a)windriver.com
> =

> I fixed it by restoring the license, since making it bool might break
> existing use cases,

How so?

  Luis

--===============2962843257038017350==--

