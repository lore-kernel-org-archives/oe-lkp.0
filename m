Content-Type: multipart/mixed; boundary="===============1126351612180397881=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ftrace] fef5aeeee9e: -27.2% boot-slabinfo.num_objs
Date: Mon, 29 Dec 2014 10:28:15 +0800
Message-ID: <1419820095.26403.77.camel@intel.com>
In-Reply-To: <20141223083214.0b199465@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============1126351612180397881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-12-23 at 08:32 -0500, Steven Rostedt wrote:
> On Tue, 23 Dec 2014 11:10:17 +0800
> Huang Ying <ying.huang@intel.com> wrote:
> =

> > FYI, we noticed the below changes on
> > =

> > commit fef5aeeee9e3717e7aea991a7ae9ff6a7a2d4c85 ("ftrace: Replace tramp=
_hash with old_*_hash to save space")
> > =

> > =

> > testbox/testcase/testparams: vm-kbuild-4G/boot/1
> > =

> > e1effa0144a1ddf5  fef5aeeee9e3717e7aea991a7a  =

> > ----------------  --------------------------  =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >     437752 =C2=B1  0%     -27.2%     318545 =C2=B1  0%  boot-slabinfo.n=
um_objs
> > =

> > vm-kbuild-4G: qemu-system-x86_64 -enable-kvm
> > Memory: 4G
> =

> I have no idea what this test does. Is this good or bad? Is that -27.2%
> a performance regression, or memory regression?

IMO, it is good.  Memory usage is reduced.

Best Regards,
Huang, Ying

> -- Steve
> =

> =

> > =

> > =

> > =

> >                                boot-slabinfo.num_objs
> > =

> >   440000 *+*--*-*-*------*----*-*-*--*--------*-*--*-*-*--*------------=
-----+
> >          |           *.*   *.          *.*..*                          =
     |
> >   420000 ++                                                            =
     |
> >          |                                                             =
     |
> >   400000 ++                                                            =
     |
> >          |                                                             =
     |
> >   380000 ++                                                            =
     |
> >          |                                                             =
     |
> >   360000 ++                                                            =
     |
> >          |                                                             =
     |
> >   340000 ++                                                            =
     |
> >          |                                                             =
     |
> >   320000 O+O  O   O  O O O O  O O O  O O    O O O    O O  O O O O  O O =
O  O O
> >          |      O                        O         O                   =
     |
> >   300000 ++------------------------------------------------------------=
-----+
> > =

> > 	[*] bisect-good sample
> > 	[O] bisect-bad  sample
> > =

> > To reproduce:
> > =

> > 	apt-get install ruby ruby-oj
> > 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.=
git
> > 	cd lkp-tests
> > 	bin/setup-local job.yaml # the job file attached in this email
> > 	bin/run-local   job.yaml
> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Huang, Ying
> > =

> =




--===============1126351612180397881==--

