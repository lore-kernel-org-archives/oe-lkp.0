Content-Type: multipart/mixed; boundary="===============6401694316284653177=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [timer] d41e0719d5: UBSAN:shift-out-of-bounds_in_lib/flex_proportions.c
Date: Fri, 25 Mar 2022 20:14:27 +0100
Message-ID: <87k0chhmjw.ffs@tglx>
In-Reply-To: <20220325073827.GB8478@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6401694316284653177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25 2022 at 15:38, kernel test robot wrote:
> [   42.401895][    C0] UBSAN: shift-out-of-bounds in lib/flex_proportions=
.c:80:20
> [   42.410963][    C0] shift exponent -1007885658 is negative

Cute.

> [   42.416462][    C0] CPU: 0 PID: 330 Comm: sed Tainted: G          I   =
    5.17.0-rc6-00027-gd41e0719d576 #1
> [   42.426240][    C0] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIO=
S 1.1.1 10/07/2015
> [   42.434363][    C0] Call Trace:
> [   42.437516][    C0]  <TASK>
> [ 42.440319][ C0] dump_stack_lvl (lib/dump_stack.c:107) =

> [ 42.444699][ C0] ubsan_epilogue (lib/ubsan.c:152) =

> [ 42.448985][ C0] __ubsan_handle_shift_out_of_bounds.cold (lib/ubsan.c:33=
0) =

> [ 42.455618][ C0] ? cpumask_next (lib/cpumask.c:23) =

> [ 42.459996][ C0] ? __percpu_counter_sum (lib/percpu_counter.c:138) =

> [ 42.465248][ C0] fprop_new_period.cold (lib/flex_proportions.c:80 (discr=
iminator 1)) =

> [ 42.470224][ C0] writeout_period (mm/page-writeback.c:623) =


So it seems a timer fired early. Which then makes writeout_period() go sout=
h:

	int miss_periods =3D (jiffies - dom->period_time) / VM_COMPLETIONS_PERIOD_=
LEN;

If jiffies < dom->period_time the result is a very large negative
number.

This happens because of:

> @@ -67,7 +67,8 @@ struct timer_list {
>  #define TIMER_DEFERRABLE	0x00080000
>  #define TIMER_PINNED		0x00100000
>  #define TIMER_IRQSAFE		0x00200000
> -#define TIMER_INIT_FLAGS	(TIMER_DEFERRABLE | TIMER_PINNED | TIMER_IRQSAF=
E)
> +#define TIMER_UPPER_BOUND	0x00400000
> +#define TIMER_INIT_FLAGS	(TIMER_DEFERRABLE | TIMER_PINNED | TIMER_IRQSAF=
E | TIMER_UPPER_BOUND)
> #define TIMER_ARRAYSHIFT	22
> #define TIMER_ARRAYMASK		0xFFC00000

TIMER_UPPER_BOUND steals a bit from the ARRAYMASK. So if the timer is
armed and the stored arraymask happens to have bit 22 set, then on the
next arming of the timer it will be treated as upper bound timer,
expires early and all hell breaks lose. The same can happen the other
way round. So I really have to ask how this ever "worked".

Thanks,

        tglx
--===============6401694316284653177==--

