Content-Type: multipart/mixed; boundary="===============5433549305660009128=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: Please add git tree
Date: Fri, 11 Mar 2016 16:50:24 +0800
Message-ID: <20160311085024.GA11224@wfg-t540p.sh.intel.com>
In-Reply-To: <20160311080808.GA18000@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5433549305660009128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,

It looks the dax tree is not tested at all:

wfg(a)inn /kbuild-tests/build-complete% ll dax*
ls: cannot access dax*: No such file or directory

Thanks,
Fengguang

On Fri, Mar 11, 2016 at 04:08:08PM +0800, Philip Li wrote:
> On Thu, Mar 10, 2016 at 10:40:48AM -0500, Matthew Wilcox wrote:
> > On Mon, Mar 07, 2016 at 01:01:53PM +0800, Philip Li wrote:
> > > On Sun, Mar 06, 2016 at 10:06:42PM -0500, Matthew Wilcox wrote:
> > > > =

> > > > Please add
> > > > =

> > > > git://git.infradead.org/users/willy/linux-dax.git
> > > =

> > > sure, this is added, and build status will be notified.
> > =

> > I found some build errors in this tree.  Is it possible that 0day is
> > failing to test some x86-32 configs?
> do you mean you receive 0day report, and it shows failure?
> =

> > =

> > Combinations of Kconfig symbols that I want to see tested:
> > =

> > 64BIT
> > X86_PAE
> > HIGHMEM
> > HIGHMEM4G
> > HIGHMEM64G
> > NOHIGHMEM
> > TRANSPARENT_HUGEPAGE
> > DAX
> =

> currently 0day will do a lot randconfig besides some standard one like al=
lyes, allmodule.
> it will have possibility to cover the combination here.
> =

> > =

> > (some of these interact with each other in fun ways, so it's fewer than
> > 2^8 different configs)
> > =

> > Is there a way to see what configs were tested against a particular
> > branch?  I'd also like to know whether pSeries was tested.
> > =

> usually for a build notification mail, 0day will list all the configs tes=
ted again which commit/branch.
> and what is pSeries here?
> =

> thanks
> =

> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============5433549305660009128==--

