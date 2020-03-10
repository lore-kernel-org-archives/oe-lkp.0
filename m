Content-Type: multipart/mixed; boundary="===============4598616619279067195=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v3 1/2] modpost: rework and consolidate logging interface
Date: Tue, 10 Mar 2020 15:57:29 +0000
Message-ID: <20200310155516.GC22995@intel.com>
In-Reply-To: <20200310113158.GA4865@linux-8ccs.fritz.box>
List-Id: <oe-lkp.lists.linux.dev>

--===============4598616619279067195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 12:32:00PM +0100, Jessica Yu wrote:
> +++ Masahiro Yamada [09/03/20 20:03 +0900]:
> > On Mon, Mar 9, 2020 at 7:58 PM Jessica Yu <jeyu@kernel.org> wrote:
> > > =

> > > +++ Masahiro Yamada [09/03/20 19:49 +0900]:
> > > >On Mon, Mar 9, 2020 at 7:39 PM Jessica Yu <jeyu@kernel.org> wrote:
> > > >>
> > > >> Ah, sorry, I mean the kbuild 0-day bot errors. I am just realizing
> > > >> the 0-day bot emails are not CC'd to lkml. Here is the error I got
> > > >> from the bot:
> > > >>
> > > >> ---
> > > >>
> > > >> I love your patch! Yet something to improve:
> > > >>
> > > >> [auto build test ERROR on linus/master]
> > > >> [also build test ERROR on v5.6-rc4 next-20200306]
> > > >> [if your patch is applied to the wrong git tree, please drop us a =
note to help
> > > >> improve the system. BTW, we also suggest to use '--base' option to=
 specify the
> > > >> base tree in git format-patch, please see https://stackoverflow.co=
m/a/37406982]
> > > >>
> > > >> url:    https://github.com/0day-ci/linux/commits/Jessica-Yu/modpos=
t-rework-and-consolidate-logging-interface/20200307-052346
> > > >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git 30fe0d07fd7b27d41d9b31a224052cc4e910947a
> > > >> config: sh-randconfig-a001-20200306 (attached as .config)
> > > >> compiler: sh4-linux-gcc (GCC) 7.5.0
> > > >> reproduce:
> > > >>         wget https://raw.githubusercontent.com/intel/lkp-tests/mas=
ter/sbin/make.cross -O ~/bin/make.cross
> > > >>         chmod +x ~/bin/make.cross
> > > >>         # save the attached .config to linux build tree
> > > >>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsh
> > > >>
> > > >> If you fix the issue, kindly add following tag
> > > >> Reported-by: kbuild test robot <lkp@intel.com>
> > > >>
> > > >> All errors (new ones prefixed by >>):
> > > >>
> > > >> >> ERROR: modpost: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_a=
pm.ko] undefined!
> > > >
> > > >
> > > >Indeed, this one is odd.
> > > >I have no idea...
> > > =

> > > I've pushed the patches to a branch to let the kbuild bot run through=
 its
> > > build tests again, and if I have extra time today I will try to
> > > reproduce this and let you know the results.
> > > =

> > > Thanks,
> > > =

> > > Jessica
> > =

> > =

> > Ah, Now I see.
> > =

> > =

> > Because you added "modpost:" prefix.
> > =

> > =

> > =

> > The previous error message:
> > =

> > ERROR: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] undefined!
> > =

> > =

> > The new error message:
> > =

> > ERROR: modpost: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] u=
ndefined!
> > =

> > =

> > =

> > So, the bot assumed it was a new error.
> =

> Nice catch! Hm, I suppose we need to let the LKP folks know about the
> change in error message. CC'd LKP mailing list.
Thanks for the info, we will look into this to handle the
changed error.

> =

> Jessica
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============4598616619279067195==--

