Content-Type: multipart/mixed; boundary="===============3787600236065234152=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 4879b7ae05 ("Merge tag 'dmaengine-4.12-rc1' of .."): WARNING: kernel stack regs at bd92bc2e in 01-cpu-hotplug:3811 has bad 'bp' value 000001be
Date: Tue, 03 Oct 2017 11:45:38 +0800
Message-ID: <20171003034538.ntvuwtm2uha6wt6h@wfg-t540p.sh.intel.com>
In-Reply-To: <20171002213109.5n3skzy76edhwkvf@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============3787600236065234152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Mon, Oct 02, 2017 at 04:31:09PM -0500, Josh Poimboeuf wrote:
>On Mon, Oct 02, 2017 at 04:26:54PM -0500, Josh Poimboeuf wrote:
>> Fengguang, assuming it's reliably recreatable, any chance you could
>> recreate with the following patch?

Sure, I'll try your patch on v4.14-rc3 since it looks the most
reproducible kernel. For the bisected 4879b7ae05, the warning only
shows up once out of 909 boots according to the below stats. So I'm
not sure whether it's the _first_ bad commit. To double confirm, I
just queued 5000 more boot tests for each of its parent commits.

> ecc721a72c  Merge tag 'pwm/for-4.12-rc1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/thierry.reding/linux-pwm
> be13ec668d  Merge branch 'topic/pl330' into for-linus
> 4879b7ae05  Merge tag 'dmaengine-4.12-rc1' of git://git.infradead.org/use=
rs/vkoul/slave-dma
> 9e66317d3c  Linux 4.14-rc3
> 1418b85217  Add linux-next specific files for 20170929
> +-------------------------------------------------------+------------+---=
---------+------------+-----------+---------------+
> |                                                       | ecc721a72c | be=
13ec668d | 4879b7ae05 | v4.14-rc3 | next-20170929 |
> +-------------------------------------------------------+------------+---=
---------+------------+-----------+---------------+
> | boot_successes                                        | 1009       | 10=
09       | 909        | 5         | 510           |
> | boot_failures                                         | 0          | 0 =
         | 1          | 4         | 153           |
> | WARNING:kernel_stack                                  | 0          | 0 =
         | 1          | 3         | 111           |
> | BUG:unable_to_handle_kernel                           | 0          | 0 =
         | 0          | 3         | 48            |
> | Oops:#[##]                                            | 0          | 0 =
         | 0          | 3         | 48            |
> | EIP:update_stack_state                                | 0          | 0 =
         | 0          | 3         | 48            |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 0 =
         | 0          | 3         | 48            |
> | invoked_oom-killer:gfp_mask=3D0x                        | 0          | =
0          | 0          | 1         | 16            |
> | Mem-Info                                              | 0          | 0 =
         | 0          | 1         | 16            |
> | EIP:clear_user                                        | 0          | 0 =
         | 0          | 0         | 2             |
> | EIP:copy_page_to_iter                                 | 0          | 0 =
         | 0          | 0         | 1             |
> +-------------------------------------------------------+------------+---=
---------+------------+-----------+---------------+

>Sorry, here's a version which actually compiles.

OK.

Thanks,
Fengguang

>diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame=
.c
>index d145a0b1f529..00234fa5a33a 100644
>--- a/arch/x86/kernel/unwind_frame.c
>+++ b/arch/x86/kernel/unwind_frame.c
>@@ -44,7 +44,8 @@ static void unwind_dump(struct unwind_state *state)
> 			state->stack_info.type, state->stack_info.next_sp,
> 			state->stack_mask, state->graph_idx);
>
>-	for (sp =3D state->orig_sp; sp; sp =3D PTR_ALIGN(stack_info.next_sp, siz=
eof(long))) {
>+	for (sp =3D PTR_ALIGN(state->orig_sp, sizeof(long)); sp;
>+	     sp =3D PTR_ALIGN(stack_info.next_sp, sizeof(long))) {
> 		if (get_stack_info(sp, state->task, &stack_info, &visit_mask))
> 			break;
>

--===============3787600236065234152==--

