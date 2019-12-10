Content-Type: multipart/mixed; boundary="===============7466452612877909733=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] ed93dfc6bc: stress-ng.icache.ops_per_sec -15.0% regression
Date: Tue, 10 Dec 2019 22:10:30 +0800
Message-ID: <20191210141030.GP32275@shao2-debian>
In-Reply-To: <20191210005708.GQ2889@paulmck-ThinkPad-P72>
List-Id: <oe-lkp.lists.linux.dev>

--===============7466452612877909733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 04:57:08PM -0800, Paul E. McKenney wrote:
> On Mon, Dec 09, 2019 at 05:10:11PM +0800, Rong Chen wrote:
> > =

> > =

> > On 12/9/19 2:13 AM, Paul E. McKenney wrote:
> > > On Sun, Dec 08, 2019 at 11:29:07PM +0800, kernel test robot wrote:
> > > > Greeting,
> > > > =

> > > > FYI, we noticed a -15.0% regression of stress-ng.icache.ops_per_sec=
 due to commit:
> > > > =

> > > > =

> > > > commit: ed93dfc6bc0084485ccad1ff6bd2ea81ab2c03cd ("rcu: Confine ->c=
ore_needs_qs accesses to the corresponding CPU")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
> > > > =

> > > > in testcase: stress-ng
> > > > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GH=
z with 192G memory
> > > > with following parameters:
> > > > =

> > > > 	nr_threads: 100%
> > > > 	disk: 1HDD
> > > > 	testtime: 1s
> > > > 	class: cpu-cache
> > > > 	cpufreq_governor: performance
> > > > 	ucode: 0x500002c
> > > > =

> > > > =

> > > > =

> > > > =

> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > > > =

> > > > =

> > > > Details are as below:
> > > > -------------------------------------------------------------------=
------------------------------->
> > > > =

> > > > =

> > > > To reproduce:
> > > > =

> > > >          git clone https://github.com/intel/lkp-tests.git
> > > >          cd lkp-tests
> > > >          bin/lkp install job.yaml  # job file is attached in this e=
mail
> > > >          bin/lkp run     job.yaml
> > > > =

> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox=
_group/testcase/testtime/ucode:
> > > >    cpu-cache/gcc-7/performance/1HDD/x86_64-rhel-7.6/100%/debian-x86=
_64-2019-11-14.cgz/lkp-csl-2sp5/stress-ng/1s/0x500002c
> > > > =

> > > > commit:
> > > >    516e5ae0c9 ("rcu: Reset CPU hints when reporting a quiescent sta=
te")
> > > >    ed93dfc6bc ("rcu: Confine ->core_needs_qs accesses to the corres=
ponding CPU")
> > > > =

> > > > 516e5ae0c9401629 ed93dfc6bc0084485ccad1ff6bd
> > > > ---------------- ---------------------------
> > > >           %stddev     %change         %stddev
> > > >               \          |                \
> > > >       39049           -15.0%      33189 =C2=B1 14%  stress-ng.icach=
e.ops_per_sec
> > > I have to ask...
> > > =

> > > Given a 14% standard deviation, is this 15% change statistically
> > > significant?
> > > =

> > > On the other hand, if this is due to lengthened grace periods, which
> > > are a known side-effect of this commit, there are speedups for that
> > > coming down the pike.
> > =

> > Hi Paul,
> > =

> > We run the test more times and stress-ng.icache.ops_per_sec is unstable:
> > =

> > 516e5ae0c9401629=C2=A0 ed93dfc6bc0084485ccad1ff6b
> > ----------------=C2=A0 -------------------------- ---------------------=
------
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %std=
dev
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0 37409 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35958 =C2=B1 11%
> > stress-ng/cpu-cache-performance-1HDD-100%-1s-ucode=3D0x500002c/lkp-csl-=
2sp5
> > =

> > =

> > > 							Thanx, Paul
> > > =

> > > >        7784           -36.6%       4939 =C2=B1  9%  stress-ng.memba=
rrier.ops
> > > >        7648           -37.3%       4793 =C2=B1  9%  stress-ng.memba=
rrier.ops_per_sec
> > =

> > there is still a regression of stress-ng.membarrier.ops_per_sec:
> > =

> > =

> > 516e5ae0c9401629=C2=A0 ed93dfc6bc0084485ccad1ff6b
> > ----------------=C2=A0 -------------------------- ---------------------=
------
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %std=
dev
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7522=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 -37%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 4744 =C2=B1=C2=A0 9%
> > stress-ng/cpu-cache-performance-1HDD-100%-1s-ucode=3D0x500002c/lkp-csl-=
2sp5
> =

> OK, and it is much harder for me to argue that this one is statistically
> insignificant.  From the softirq stats below, I got too aggressive about
> removing instances of "rdp->core_needs_qs =3D false".  Does the (lightly
> tested) commit below help?
> =

> 							Thanx, Paul

Hi Paul,

The patch can fix the regression of stress-ng.membarrier.ops_per_sec:

commit:
  516e5ae0c9 ("rcu: Reset CPU hints when reporting a quiescent state")
  ed93dfc6bc ("rcu: Confine ->core_needs_qs accesses to the corresponding C=
PU")
  8b3a369c70 ("rcu: Clear ->core_needs_qs at GP end or self-reported QS")

516e5ae0c9401629  ed93dfc6bc0084485ccad1ff6b  8b3a369c70986933c24efdf674  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
         %stddev      change         %stddev      change         %stddev
             \          |                \          |                \  =

      7522             -37%       4744 =C2=B1  9%                  7392 =C2=
=B1  3%  stress-ng/cpu-cache-performance-1HDD-100%-1s-ucode=3D0x500002c/lkp=
-csl-2sp5
      7522             -37%       4744                        7392        G=
EO-MEAN stress-ng.membarrier.ops_per_sec

Best Regards,
Rong Chen

> =

> ------------------------------------------------------------------------
> =

> commit 57412364506cf5262a7fdffa4718bf39b8891940
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Mon Dec 9 15:19:45 2019 -0800
> =

>     rcu: Clear ->core_needs_qs at GP end or self-reported QS
>     =

>     The rcu_data structure's ->core_needs_qs field does not necessarily g=
et
>     cleared in a timely fashion after the corresponding CPUs' quiescent s=
tate
>     has been reported.  From a functional viewpoint, no harm done, but th=
is
>     can result in excessive invocation of RCU core processing, as witness=
ed
>     by the kernel test robot, which saw greatly increased softirq overhea=
d.
>     =

>     This commit therefore restores the rcu_report_qs_rdp() function's
>     clearing of this field, but only when running on the corresponding CP=
U.
>     Cases where some other CPU reports the quiescent state (for example, =
on
>     behalf of an idle CPU) are handled by setting this field appropriately
>     within the __note_gp_changes() function's end-of-grace-period checks.
>     This handling is carried out regardless of whether the end of a grace
>     period actually happened, thus handling the case where a CPU goes non=
-idle
>     after a quiescent state is reported on its behalf, but before the gra=
ce
>     period ends.  This fix also avoids cross-CPU updates to ->core_needs_=
qs,
>     =

>     While in the area, this commit changes the __note_gp_changes() need_gp
>     variable's name to need_qs because it is a quiescent state that is ne=
eded
>     from the CPU in question.
>     =

>     Fixes: ed93dfc6bc00 ("rcu: Confine ->core_needs_qs accesses to the co=
rresponding CPU")
>     Reported-by: kernel test robot <rong.a.chen@intel.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> =

> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index f555ea9..1d0935e 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -1393,7 +1393,7 @@ static void __maybe_unused rcu_advance_cbs_nowake(s=
truct rcu_node *rnp,
>  static bool __note_gp_changes(struct rcu_node *rnp, struct rcu_data *rdp)
>  {
>  	bool ret =3D false;
> -	bool need_gp;
> +	bool need_qs;
>  	const bool offloaded =3D IS_ENABLED(CONFIG_RCU_NOCB_CPU) &&
>  			       rcu_segcblist_is_offloaded(&rdp->cblist);
>  =

> @@ -1407,10 +1407,13 @@ static bool __note_gp_changes(struct rcu_node *rn=
p, struct rcu_data *rdp)
>  	    unlikely(READ_ONCE(rdp->gpwrap))) {
>  		if (!offloaded)
>  			ret =3D rcu_advance_cbs(rnp, rdp); /* Advance CBs. */
> +		rdp->core_needs_qs =3D false;
>  		trace_rcu_grace_period(rcu_state.name, rdp->gp_seq, TPS("cpuend"));
>  	} else {
>  		if (!offloaded)
>  			ret =3D rcu_accelerate_cbs(rnp, rdp); /* Recent CBs. */
> +		if (rdp->core_needs_qs)
> +			rdp->core_needs_qs =3D !!(rnp->qsmask & rdp->grpmask);
>  	}
>  =

>  	/* Now handle the beginnings of any new-to-this-CPU grace periods. */
> @@ -1422,9 +1425,9 @@ static bool __note_gp_changes(struct rcu_node *rnp,=
 struct rcu_data *rdp)
>  		 * go looking for one.
>  		 */
>  		trace_rcu_grace_period(rcu_state.name, rnp->gp_seq, TPS("cpustart"));
> -		need_gp =3D !!(rnp->qsmask & rdp->grpmask);
> -		rdp->cpu_no_qs.b.norm =3D need_gp;
> -		rdp->core_needs_qs =3D need_gp;
> +		need_qs =3D !!(rnp->qsmask & rdp->grpmask);
> +		rdp->cpu_no_qs.b.norm =3D need_qs;
> +		rdp->core_needs_qs =3D need_qs;
>  		zero_cpu_stall_ticks(rdp);
>  	}
>  	rdp->gp_seq =3D rnp->gp_seq;  /* Remember new grace-period state. */
> @@ -2000,6 +2003,8 @@ rcu_report_qs_rdp(int cpu, struct rcu_data *rdp)
>  		return;
>  	}
>  	mask =3D rdp->grpmask;
> +	if (rdp->cpu =3D=3D smp_processor_id())
> +		rdp->core_needs_qs =3D false;
>  	if ((rnp->qsmask & mask) =3D=3D 0) {
>  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  	} else {
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============7466452612877909733==--

