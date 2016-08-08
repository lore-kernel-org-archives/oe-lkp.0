Content-Type: multipart/mixed; boundary="===============5931596240817067759=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] 4bc0303aff: BUG: stack guard page was hit at ffffc900001bbff8
Date: Mon, 08 Aug 2016 10:56:49 -0400
Message-ID: <20160808105649.1456e972@gandalf.local.home>
In-Reply-To: <20160807134302.dllh76anaotll5lt@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============5931596240817067759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 7 Aug 2016 08:43:02 -0500
Josh Poimboeuf <jpoimboe@redhat.com> wrote:


> Note that shortly before the recursive fault started, another ftrace
> error occurred:
> =

>   [   59.235185] ftrace: Failed on adding breakpoints (124910):
>   [   59.848448] ------------[ cut here ]------------
>   [   59.853011] WARNING: CPU: 0 PID: 1625 at kernel/trace/ftrace.c:2006 =
ftrace_bug+0x102/0x24a
>   [   59.898634] Modules linked in:
>   [   59.902617] CPU: 0 PID: 1625 Comm: trinity-main Not tainted 4.7.0-06=
443-g4bc0303 #82
>   [   59.909984] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS Debian-1.8.2-1 04/01/2014
>   [   59.926316]  0000000000000000 ffffc90004f9fbe0 ffffffff81780126 0000=
000000000000
>   [   59.946998]  0000000000000000 ffffc90004f9fc20 ffffffff810e4fd9 0000=
07d600000000
>   [   59.955226]  ffff880031ebfee0 ffffffff8324c9a0 ffffffff85652b30 0000=
000000000001
>   [   59.976130] Call Trace:
>   [   59.979819]  [<ffffffff81780126>] dump_stack+0x82/0xb8
>   [   59.997638]  [<ffffffff810e4fd9>] __warn+0xc2/0xdd
>   [   60.001832]  [<ffffffff810e50b0>] warn_slowpath_null+0x1d/0x1f
>   [   60.006141]  [<ffffffff81187920>] ftrace_bug+0x102/0x24a
>   [   60.023201]  [<ffffffff810979c6>] ftrace_replace_code+0x227/0x350
>   [   60.027709]  [<ffffffff81188065>] ftrace_modify_all_code+0x41/0xc9
>   [   60.032357]  [<ffffffff81097aff>] arch_ftrace_update_code+0x10/0x19
>   [   60.049494]  [<ffffffff81186b6a>] ftrace_run_update_code+0x1e/0x3f
>   [   60.054082]  [<ffffffff81186bbd>] ftrace_startup_enable+0x32/0x34
>   [   60.070761]  [<ffffffff81186d54>] ftrace_startup+0x195/0x1a7
>   [   60.075193]  [<ffffffff81186d8c>] register_ftrace_function+0x26/0x3c
>   [   60.079704]  [<ffffffff811a1163>] perf_ftrace_event_register+0x42/0x=
e7
>   [   60.114514]  [<ffffffff811a0fd6>] perf_trace_init+0x29d/0x2dc
>   [   60.119309]  [<ffffffff811ad345>] perf_tp_event_init+0x29/0x3b
>   [   60.124026]  [<ffffffff811ade86>] perf_try_init_event+0x46/0x76
>   [   60.147114]  [<ffffffff811b0034>] perf_event_alloc+0x3c4/0x6ad
>   [   60.169443]  [<ffffffff811b2e47>] SYSC_perf_event_open+0x490/0xb2c
>   [   60.174482]  [<ffffffff811b6b7b>] SyS_perf_event_open+0x9/0xb
>   [   60.197378]  [<ffffffff81003c42>] do_int80_syscall_32+0x65/0x74
>   [   60.202211]  [<ffffffff82ee2598>] entry_INT80_compat+0x38/0x50
>   [   60.221358] ---[ end trace e31eb279467a53f4 ]---
>   [   60.604454] ftrace faulted on writing [<ffffffff8324c9a0>] lkdtm_rod=
ata_do_nothing+0x0/0x10
>   [   60.612963] Setting ftrace call site to call ftrace function
>   [   60.653362] ftrace record flags: 10000001
>   [   60.658136]  (1)
>    expected tramp: ffffffff82ee25d0
> =

> This seems to be an expected error caused by the test case (tracing an
> rodata function).  But maybe there's something in the ftrace error path
> which corrupts ftrace_ops_list somehow?  Or triggers a use-after-free?
> =


Yeah, looking at the error path, if registering an ops cause a
ftrace_bug, then ftrace is completely (well, mostly) which means that
if the user unregistered the ops, nothing would happen. It which case,
if it freed the ops after it failed, then we can have this case.

Does the below patch fix things?

-- Steve

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 900dbb1efff2..cd194c1cf0fb 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2685,6 +2685,12 @@ static int ftrace_startup(struct ftrace_ops *ops, in=
t command)
 =

 	ftrace_startup_enable(command);
 =

+	/* If something went wrong, remove this ops */
+	if (unlikely(ftrace_disabled)) {
+		remove_ftrace_ops(&ftrace_ops_list, ops);
+		return -1;
+	}
+
 	ops->flags &=3D ~FTRACE_OPS_FL_ADDING;
 =

 	return 0;
@@ -2694,8 +2700,11 @@ static int ftrace_shutdown(struct ftrace_ops *ops, i=
nt command)
 {
 	int ret;
 =

-	if (unlikely(ftrace_disabled))
+	if (unlikely(ftrace_disabled)) {
+		/* Still try to remove the ops */
+		remove_ftrace_ops(&ftrace_ops_list, ops);
 		return -ENODEV;
+	}
 =

 	ret =3D __unregister_ftrace_function(ops);
 	if (ret)

--===============5931596240817067759==--

