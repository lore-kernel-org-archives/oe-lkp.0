Content-Type: multipart/mixed; boundary="===============6060763616457305933=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [rcuperf] 4e88ec4a9e: UBSAN:division-overflow_in_arch/x86/include/asm/div64.h
Date: Tue, 01 Sep 2020 09:27:19 -0700
Message-ID: <20200901162719.GE29330@paulmck-ThinkPad-P72>
In-Reply-To: <649fd850-602f-7f0d-d286-73a8dd88ad6d@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6060763616457305933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 03:03:28PM +0800, Rong Chen wrote:
> =

> =

> On 8/31/20 11:50 PM, Paul E. McKenney wrote:
> > On Mon, Aug 31, 2020 at 08:01:22PM +0800, kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-9):
> > > =

> > > commit: 4e88ec4a9eb17527e640b063f79e5b875733eb53 ("rcuperf: Change rc=
uperf to rcuscale")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > > =

> > > =

> > > in testcase: trinity
> > > with following parameters:
> > > =

> > > 	runtime: 300s
> > > =

> > > test-description: Trinity is a linux system call fuzz tester.
> > > test-url: http://codemonkey.org.uk/projects/trinity/
> > > =

> > > =

> > > on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2=
 -m 8G
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > +---------------------------------------------------------+----------=
--+------------+
> > > |                                                         | 65bd77f55=
4 | 4e88ec4a9e |
> > > +---------------------------------------------------------+----------=
--+------------+
> > > | boot_successes                                          | 13       =
  | 0          |
> > > | boot_failures                                           | 0        =
  | 14         |
> > > | UBSAN:division-overflow_in_arch/x86/include/asm/div64.h | 0        =
  | 14         |
> > > | error:#[##]                                             | 0        =
  | 14         |
> > > | EIP:main_func.cold                                      | 0        =
  | 14         |
> > > | Kernel_panic-not_syncing:Fatal_exception                | 0        =
  | 14         |
> > > +---------------------------------------------------------+----------=
--+------------+
> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <lkp@intel.com>
> > Does the patch below fix this for you?
> =

> Yes, this patch can fix the issue, and nreaders was adjusted to 1:
> =

> [=C2=A0=C2=A0=C2=A0 5.953645] The force parameter has not been set to 1. =
The Iris poweroff
> handler will not be installed.
> [=C2=A0=C2=A0 12.546587] rcu-ref-scale: --- Start of test:=C2=A0 verbose=
=3D0 shutdown=3D1
> holdoff=3D10 loops=3D10000 nreaders=3D-1 nruns=3D30 readdelay=3D0
> [=C2=A0=C2=A0 12.561495] ------------[ cut here ]------------
> [=C2=A0=C2=A0 12.562016] ref_scale_init: nreaders =3D 0, adjusted to 1
> [=C2=A0=C2=A0 12.562601] WARNING: CPU: 0 PID: 1 at kernel/rcu/refscale.c:=
684
> ref_scale_init+0x653/0x80

Thank you!  May I add your Tested-by?

							Thanx, Paul

> Best Regards,
> Rong Chen
> =

> > =

> > 							Thanx, Paul
> > =

> > ------------------------------------------------------------------------
> > =

> > commit d301e320e952e2e604d83d9540e52510b0eb3d94
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Thu Aug 27 09:58:19 2020 -0700
> > =

> >      refscale: Bounds-check module parameters
> >      The default value for refscale.nreaders is -1, which results in th=
e code
> >      setting the value to three-quarters of the number of CPUs.  On sin=
gle-CPU
> >      systems, this results in three-quarters of the value one, which th=
e C
> >      language's integer arithmetic rounds to zero.  This in turn result=
s in
> >      a divide-by-zero error.
> >      This commit therefore adds bounds checking to the refscale module
> >      parameters, so that if they are less than one, they are set to the
> >      value one.
> >      Reported-by: kernel test robot <lkp@intel.com>
> >      Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > =

> > diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
> > index 952595c..fb5f20d 100644
> > --- a/kernel/rcu/refscale.c
> > +++ b/kernel/rcu/refscale.c
> > @@ -681,6 +681,12 @@ ref_scale_init(void)
> >   	// Reader tasks (default to ~75% of online CPUs).
> >   	if (nreaders < 0)
> >   		nreaders =3D (num_online_cpus() >> 1) + (num_online_cpus() >> 2);
> > +	if (WARN_ONCE(loops <=3D 0, "%s: loops =3D %ld, adjusted to 1\n", __f=
unc__, loops))
> > +		loops =3D 1;
> > +	if (WARN_ONCE(nreaders <=3D 0, "%s: nreaders =3D %d, adjusted to 1\n"=
, __func__, nreaders))
> > +		nreaders =3D 1;
> > +	if (WARN_ONCE(nruns <=3D 0, "%s: nruns =3D %d, adjusted to 1\n", __fu=
nc__, nruns))
> > +		nruns =3D 1;
> >   	reader_tasks =3D kcalloc(nreaders, sizeof(reader_tasks[0]),
> >   			       GFP_KERNEL);
> >   	if (!reader_tasks) {
> > _______________________________________________
> > LKP mailing list -- lkp(a)lists.01.org
> > To unsubscribe send an email to lkp-leave(a)lists.01.org
>=20
--===============6060763616457305933==--

