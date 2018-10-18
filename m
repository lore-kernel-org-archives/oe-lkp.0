Content-Type: multipart/mixed; boundary="===============7445264191392495879=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 8cb682da6b ("rcu: Affinity forward-progress test to avoid .."): BUG: unable to handle kernel NULL pointer dereference at 00000000
Date: Thu, 18 Oct 2018 17:31:16 +0800
Message-ID: <20181018093116.GF16117@shao2-debian>
In-Reply-To: <20181016123531.GK2674@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7445264191392495879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 05:35:31AM -0700, Paul E. McKenney wrote:
> On Tue, Oct 16, 2018 at 08:36:57AM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git d=
ev.2018.10.09a
> > =

> > commit 8cb682da6b49f65c3acf4255d045430cec116c52
> > Author:     Paul E. McKenney <paulmck@linux.ibm.com>
> > AuthorDate: Fri Sep 21 18:08:09 2018 -0700
> > Commit:     Paul E. McKenney <paulmck@linux.ibm.com>
> > CommitDate: Wed Oct 3 17:36:12 2018 -0700
> > =

> >     rcu: Affinity forward-progress test to avoid housekeeping CPUs
> >     =

> >     This commit affinities the forward-progress tests to avoid hogging a
> >     housekeeping CPU on the theory that the offloaded callbacks will be
> >     running on those housekeeping CPUs.
> >     =

> >     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> > =

> > 61fe6c84c4  MAINTAINERS: Update from @linux.vnet.ibm.com to @linux.ibm.=
com
> > 8cb682da6b  rcu: Affinity forward-progress test to avoid housekeeping C=
PUs
> > +------------------------------------------+------------+------------+
> > |                                          | 61fe6c84c4 | 8cb682da6b |
> > +------------------------------------------+------------+------------+
> > | boot_successes                           | 37         | 0          |
> > | boot_failures                            | 0          | 13         |
> > | BUG:unable_to_handle_kernel              | 0          | 13         |
> > | Oops:#[##]                               | 0          | 13         |
> > | EIP:__bitmap_weight                      | 0          | 13         |
> > | Kernel_panic-not_syncing:Fatal_exception | 0          | 13         |
> > +------------------------------------------+------------+------------+
> > =

> > [    1.414107] rcu-torture: torture_stutter task started
> > [    1.415593] Kprobe smoke test: started
> > [    1.487589] Kprobe smoke test: passed successfully
> > [    1.488532] Key type blacklist registered
> > [    1.492230] rcu-torture: rcu_torture_fwd_progress task started
> > [    1.493190] BUG: unable to handle kernel NULL pointer dereference at=
 00000000
> > [    1.494373] *pde =3D 00000000 =

> > [    1.494857] Oops: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
> > [    1.495277] CPU: 0 PID: 47 Comm: rcu_torture_fwd Tainted: G         =
       T 4.19.0-rc1-00167-g8cb682d #2
> > [    1.495277] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-1 04/01/2014
> > [    1.495277] EIP: __bitmap_weight+0x44/0x61
> > [    1.495277] Code: 90 01 c3 83 c1 01 39 f1 75 ef f6 c2 1f 0f 95 c0 0f=
 b6 c8 83 04 8d 7c 57 13 48 01 84 c0 74 15 f7 da 89 d1 b8 ff ff ff ff d3 e8=
 <23> 04 b7 f3 0f b8 c0 90 01 c3 89 d8 5b 5e 5f 5d c3 85 d2 0f 95 c0
> > [    1.495277] EAX: 00000001 EBX: 00000000 ECX: ffffffff EDX: ffffffff
> > [    1.495277] ESI: 00000000 EDI: 00000000 EBP: 4df25ef0 ESP: 4df25ee4
> > [    1.495277] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 002=
10a03
> > [    1.495277] CR0: 80050033 CR2: 00000000 CR3: 0853e000 CR4: 000406d0
> > [    1.495277] Call Trace:
> > [    1.495277]  ? rcu_busted_torture_deferred_free+0xf/0xf
> =

> If you are using the "busted" torture type, you should expect failures.
> But I must confess that I would not have expected this one.
> =

> > [    1.495277]  ? rcu_bind_current_to_nocb+0x1d/0xaa
> > [    1.495277]  ? rcu_busted_torture_deferred_free+0xf/0xf
> > [    1.495277]  ? rcu_torture_fwd_prog+0x3a/0x7d5
> =

> Ouch.  It looks like I should disable forward-progress testing when
> someone is using the "busted" torture type.
> =

> First, how about the patch below?

the patch still has the same error.

> =

> Second, I really do need destructive tests whose whole purpose is to
> demonstrate that rcutorture can force failures to happen.  So how should
> I communicate to you guys which Kconfig options and boot parameters
> are expected to result in failures?  An RCU_DESTRUCTIVE_TEST Kconfig or
> some such?
an kconfig is fine, or we could ignore the errors if they are changeless,
we will only check the result(SUCCESS/FAIL) if the test is destructive.

Best Regards,
Rong Chen

> =

> 							Thanx, Paul
> =

> ------------------------------------------------------------------------
> =

> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index a4c4a24bdcaa..f6e85faa4ff4 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -1900,7 +1900,8 @@ static int __init rcu_torture_fwd_prog_init(void)
>  {
>  	if (!fwd_progress)
>  		return 0; /* Not requested, so don't do it. */
> -	if (!cur_ops->stall_dur || cur_ops->stall_dur() <=3D 0) {
> +	if (!cur_ops->stall_dur || cur_ops->stall_dur() <=3D 0 ||
> +	    cur_ops =3D=3D &rcu_busted_ops) {
>  		VERBOSE_TOROUT_STRING("rcu_torture_fwd_prog_init: Disabled, unsupporte=
d by RCU flavor under test");
>  		return 0;
>  	}
>=20

--===============7445264191392495879==--

