Content-Type: multipart/mixed; boundary="===============8943176732834668207=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: c35d555400: will-it-scale.per_process_ops -72.7% regression
Date: Tue, 18 Oct 2016 12:05:14 +0300
Message-ID: <20161018090514.xezvzeaev6oyksjy@black.fi.intel.com>
In-Reply-To: <87mvi21ksb.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8943176732834668207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 09:57:24AM +0800, Huang, Ying wrote:
> Hi, Kirill,
> =

> "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> writes:
> =

> > On Mon, Oct 17, 2016 at 10:17:26AM +0800, kernel test robot wrote:
> >> =

> >> FYI, we noticed a -72.7% regression of will-it-scale.per_process_ops d=
ue to commit:
> >> =

> >> commit c35d555400271b825e46d246cc4e199b2c95ce29 ("Force huge tmpfs")
> >> git://bee.sh.intel.com/git/yhuang/linux.git force_huge_tmpfs
> >> =

> >> in testcase: will-it-scale
> >> on test machine: 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz w=
ith 32G memory
> >> with following parameters:
> >> =

> >> 	test: pread3
> >> 	cpufreq_governor: performance
> >> =

> >> Will It Scale takes a testcase and runs it from 1 through to n paralle=
l copies to see if the testcase will scale. It builds both a process and th=
reads based test in order to see any differences between the two.
> >> =

> >> Disclaimer:
> >> Results have been estimated based on internal Intel analysis and are p=
rovided
> >> for informational purposes only. Any difference in system hardware or =
software
> >> design or configuration may affect actual performance.
> >> =

> >> Details are as below:
> >> ----------------------------------------------------------------------=
---------------------------->
> >> =

> >> =

> >> To reproduce:
> >> =

> >>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lk=
p-tests.git
> >>         cd lkp-tests
> >>         bin/lkp install job.yaml  # job file is attached in this email
> >>         bin/lkp run     job.yaml
> >> =

> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
> >>   gcc-6/performance/x86_64-kexec/debian-x86_64-2016-08-31.cgz/lkp-snb0=
1/pread3/will-it-scale
> >> =

> >> commit: =

> >>   v4.8
> >>   c35d555400 ("Force huge tmpfs")
> >> =

> >>             v4.8 c35d555400271b825e46d246cc =

> >> ---------------- -------------------------- =

> >>        fail:runs  %reproduction    fail:runs
> >>            |             |             |    =

> >>          %stddev     %change         %stddev
> >>              \          |                \  =

> >>    2627281 .  1%     -72.7%     716168 .  1%  will-it-scale.per_proces=
s_ops
> >>    2338531 .  3%     -73.1%     629985 .  4%  will-it-scale.per_thread=
_ops
> >
> > Okay. That makes sense: we try to create a lot of small files. Huge pag=
es
> > are not great fit for this. This patch should fix the issue:
> >
> > http://lkml.kernel.org/r/20161017123021.rlyz44dsf4l4xnve(a)black.fi.int=
el.com
> >
> > But it doesn't affect behaviour of 'force' policy, so we need other way=
 to
> > make huge page allocations default for performance evaluation.
> >
> > Here's the patch (on top of the patch by the link):
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index c15eee0eb885..6ba17ef75714 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -368,7 +368,7 @@ static bool shmem_confirm_swap(struct address_space=
 *mapping,
> >  #ifdef CONFIG_TRANSPARENT_HUGE_PAGECACHE
> >  /* ifdef here to avoid bloating shmem.o when not necessary */
> >  =

> > -int shmem_huge __read_mostly;
> > +int shmem_huge __read_mostly =3D SHMEM_HUGE_ALWAYS;
> >  unsigned long long shmem_huge_min_size __read_mostly =3D HPAGE_PMD_SIZ=
E;
> >  =

> >  static int shmem_parse_huge(const char *str)
> > @@ -3392,8 +3392,10 @@ static int shmem_remount_fs(struct super_block *=
sb, int *flags, char *data)
> >  	int error =3D -EINVAL;
> >  =

> >  	config.mpol =3D NULL;
> > -	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGE_PAGECACHE))
> > +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGE_PAGECACHE)) {
> > +		config.huge =3D SHMEM_HUGE_ALWAYS;
> >  		config.huge_min_size =3D HPAGE_PMD_SIZE;
> > +	}
> >  	if (shmem_parse_options(data, &config, true))
> >  		return error;
> >  =

> > @@ -3557,8 +3559,10 @@ int shmem_fill_super(struct super_block *sb, voi=
d *data, int silent)
> >  	sbinfo->mode =3D S_IRWXUGO | S_ISVTX;
> >  	sbinfo->uid =3D current_fsuid();
> >  	sbinfo->gid =3D current_fsgid();
> > -	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGE_PAGECACHE))
> > +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGE_PAGECACHE)) {
> > +		sbinfo->huge =3D SHMEM_HUGE_ALWAYS;
> >  		sbinfo->huge_min_size =3D HPAGE_PMD_SIZE;
> > +	}
> >  	sb->s_fs_info =3D sbinfo;
> >  =

> >  #ifdef CONFIG_TMPFS
> =

> Could you provide a branch for this?  So that your branch will be tested
> automatically.  I will help you to watch whether test is done for it and
> queue some test for it if necessary.

Pushed

git://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git hugetmpfs/testi=
ng

-- =

 Kirill A. Shutemov

--===============8943176732834668207==--

