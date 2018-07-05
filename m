Content-Type: multipart/mixed; boundary="===============4382563625172544171=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] fbd5188493: WARNING:inconsistent_lock_state
Date: Thu, 05 Jul 2018 11:52:21 +0200
Message-ID: <7c3d20fa-4997-e6ed-3750-e054ce1bd610@arm.com>
In-Reply-To: <0ac4845e-cf6b-c5e3-a16c-f2fc457c5ef5@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4382563625172544171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/05/2018 10:58 AM, Dietmar Eggemann wrote:
> Hi,
> =

> On 07/05/2018 10:02 AM, kernel test robot wrote:
>>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: fbd51884933192c9cada60628892024495942482 ("[PATCH] sched/fair: A=
void divide by zero when rebalancing domains")
>> url: https://github.com/0day-ci/linux/commits/Matt-Fleming/sched-fair-Av=
oid-divide-by-zero-when-rebalancing-domains/20180705-024633
>>
>>
>> in testcase: trinity
>> with following parameters:
>>
>> 	runtime: 300s
>>
>> test-description: Trinity is a linux system call fuzz tester.
>> test-url: http://codemonkey.org.uk/projects/trinity/
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
> =

> [...]
> =

>> [    0.335612] WARNING: inconsistent lock state
> =

> I get the same on arm64 (juno r0) during boot consistently:

Moving the code from _nohz_idle_balance to nohz_idle_balance let it disappe=
ar:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 02be51c9dcc1..070924f07c68 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9596,16 +9596,6 @@ static bool _nohz_idle_balance(struct rq *this_rq, u=
nsigned int flags,
         */
        smp_mb();
 =

-       /*
-        * Ensure this_rq's clock and load are up-to-date before we
-        * rebalance since it's possible that they haven't been
-        * updated for multiple schedule periods, i.e. many seconds.
-        */
-       raw_spin_lock_irq(&this_rq->lock);
-       update_rq_clock(this_rq);
-       cpu_load_update_idle(this_rq);
-       raw_spin_unlock_irq(&this_rq->lock);
-
        for_each_cpu(balance_cpu, nohz.idle_cpus_mask) {
                if (balance_cpu =3D=3D this_cpu || !idle_cpu(balance_cpu))
                        continue;
@@ -9701,6 +9691,16 @@ static bool nohz_idle_balance(struct rq *this_rq, en=
um cpu_idle_type idle)
        if (!(flags & NOHZ_KICK_MASK))
                return false;
 =

+       /*
+        * Ensure this_rq's clock and load are up-to-date before we
+        * rebalance since it's possible that they haven't been
+        * updated for multiple schedule periods, i.e. many seconds.
+        */
+       raw_spin_lock_irq(&this_rq->lock);
+       update_rq_clock(this_rq);
+       cpu_load_update_idle(this_rq);
+       raw_spin_unlock_irq(&this_rq->lock);
+
        _nohz_idle_balance(this_rq, flags, idle);
 =

        return true;


--===============4382563625172544171==--

