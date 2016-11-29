Content-Type: multipart/mixed; boundary="===============3489033725880146516=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] e7c1db75fe: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Wed, 30 Nov 2016 02:26:26 +0800
Message-ID: <20161129182626.GA16489@yexl-desktop>
In-Reply-To: <20161129191448.GD3924@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3489033725880146516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/29, Paul E. McKenney wrote:
>On Tue, Nov 29, 2016 at 05:21:19PM +0000, Sudeep Holla wrote:
>> On Sun, Nov 27, 2016 at 6:16 PM, kernel test robot
>> <xiaolong.ye@intel.com> wrote:
>> >
>> > FYI, we noticed the following commit:
>> >
>> > commit e7c1db75fed821a961ce1ca2b602b08e75de0cd8 ("mm: Prevent __alloc_=
pages_nodemask() RCU CPU stall warnings")
>> > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git =
rcu/next
>> >
>> > in testcase: boot
>> >
>> > on test machine: qemu-system-x86_64 -enable-kvm -cpu Nehalem -smp 2 -m=
 1G
>> >
>> > caused below changes:
>> >
>> [...]
>> =

>> > [    8.953192] BUG: sleeping function called from invalid context at m=
m/page_alloc.c:3746
>> > [    8.956353] in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swapp=
er/0
>> =

>> I am observing similar BUG/backtrace even on ARM64 platform.
>
>Does the (untested) patch below help?

I've queued test jobs for this patch, will let you know once I get the
result.

Thanks,
Xiaolong
>
>							Thanx, Paul
>
>------------------------------------------------------------------------
>
>commit ccc0666e2049e5818c236e647cf20c552a7b053b
>Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>Date:   Tue Nov 29 11:06:05 2016 -0800
>
>    rcu: Allow boot-time use of cond_resched_rcu_qs()
>    =

>    The cond_resched_rcu_qs() macro is used to force RCU quiescent states =
into
>    long-running in-kernel loops.  However, some of these loops can execute
>    during early boot when interrupts are disabled, and during which time
>    it is therefore illegal to enter the scheduler.  This commit therefore
>    makes cond_resched_rcu_qs() be a no-op during early boot.
>    =

>    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
>diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
>index 525ca34603b7..8b4b1be8095b 100644
>--- a/include/linux/rcupdate.h
>+++ b/include/linux/rcupdate.h
>@@ -423,7 +423,7 @@ extern struct srcu_struct tasks_rcu_exit_srcu;
>  */
> #define cond_resched_rcu_qs() \
> do { \
>-	if (!cond_resched()) \
>+	if (rcu_scheduler_active && !cond_resched()) \
> 		rcu_note_voluntary_context_switch(current); \
> } while (0)
> =

>

--===============3489033725880146516==--

