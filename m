Content-Type: multipart/mixed; boundary="===============3494867734033271726=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: : [ INFO: possible circular locking dependency detected ]
Date: Wed, 09 Sep 2015 21:16:26 +0800
Message-ID: <20150909131626.GA14944@wfg-t540p.sh.intel.com>
In-Reply-To: <20150909231331.75332a26@canb.auug.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============3494867734033271726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Got it, sorry about the noises! I'll have a check.

Thanks,
Fengguang

On Wed, Sep 09, 2015 at 11:13:31PM +1000, Stephen Rothwell wrote:
> Hi,
> =

> On Wed, 09 Sep 2015 20:41:16 +0800 kernel test robot <fengguang.wu@inte=
l.com> wrote:
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > git://internal_merge_and_test_tree devel-hourly-2015090915
> > =

> > commit 72c9d8043fdc87832802de0b7a7129d6fc4c4c70
> > Author:     Stephen Rothwell <sfr@canb.auug.org.au>
> > AuthorDate: Wed Sep 9 13:23:18 2015 +1000
> > Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> > CommitDate: Wed Sep 9 13:23:18 2015 +1000
> > =

> >     Add linux-next specific files for 20150909
> >     =

> >     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> =

> I have had a few notifications lately claiming that the "first bad
> commit" is these top of tree commits.  This is basically not possible
> as those commits only commit files that are documentation of the
> linux-next process.  I suspect something has gone wrong with the
> bisections process ...
> =

> -- =

> Cheers,
> Stephen Rothwell                    sfr(a)canb.auug.org.au
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============3494867734033271726==--

