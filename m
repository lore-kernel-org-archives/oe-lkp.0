Content-Type: multipart/mixed; boundary="===============8903662955275358270=="
MIME-Version: 1.0
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] crypto: x86/glue_helper make bool
Date: Thu, 21 Jul 2016 19:13:44 -0400
Message-ID: <20160721231344.GJ21225@windriver.com>
In-Reply-To: <20160721230607.GA5537@wotan.suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8903662955275358270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[Re: [PATCH] crypto: x86/glue_helper make bool] On 22/07/2016 (Fri 01:06) L=
uis R. Rodriguez wrote:

> On Thu, Jul 21, 2016 at 07:01:11PM -0400, Paul Gortmaker wrote:
> > [[PATCH] crypto: x86/glue_helper make bool] On 21/07/2016 (Thu 15:13) L=
uis R. Rodriguez wrote:
> > =

> > > Paul's changes to remove MODULE_LICENSE() out of the x86 glue_helper
> > > causes a kernel with CONFIG_CRYPTO_GLUE_HELPER_X86=3Dm to taint since
> > > it now detects the license is missing if you try to build the driver
> > > as a module, log below.
> > =

> > Reported and fixed two days ago ; the fix went out in yesterday's
> > linux-next via the tip tree.
> > =

> > https://lkml.kernel.org/r/20160719144243.GK21225(a)windriver.com
> > =

> > I fixed it by restoring the license, since making it bool might break
> > existing use cases,
> =

> How so?

In the now deleted text, you wrote:

      Fix this by removing the module option for it via Kconfig as it
      cannot be a module.

      glue_helper: module license 'unspecified' taints kernel.

The 2nd line of output clearly contradicts your 1st line stating it
cannot be a module.   It clearly was a module, and loaded, and tainted
the kernel because it had no license.

As for use cases, there can be many that could break. Someone with a
kernel that just fit in flash, now ends up with glue_helper builtin, and
their kernel won't fit anymore.

Or someone has a script that manually ran "modprobe glue_helper" at
startup along with other specifically chosen modules.  Now that step
will fail.

As I said, I don't want to be introducing runtime changes in an audit
for unnecessary module.h instances.

Paul.
--
> =

>   Luis

--===============8903662955275358270==--

