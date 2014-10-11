Content-Type: multipart/mixed; boundary="===============5551454966832861652=="
MIME-Version: 1.0
From: Chuck Ebbert <cebbert.lkml@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched] BUG: unable to handle kernel NULL pointer dereference at 0000000000000040
Date: Sat, 11 Oct 2014 01:00:48 -0500
Message-ID: <20141011010048.7b9bfd54@as>
In-Reply-To: <20141011051530.GA21803@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5551454966832861652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Oct 2014 13:15:30 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> FYI, we noticed the below changes on commit
> =

> 445d95d7c384741d133251a9adac935866591c92 ("sched: Remove update_rq_runnab=
le_avg")
> =

> [   67.303839] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000040
> [   67.304014] IP: [<ffffffff810b1d52>] print_cfs_rq+0x4a3/0xa96

Well that one's pretty obvious:


--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -68,14 +68,6 @@ static void print_cfs_group_stats(struct seq_file *m, in=
t cpu, struct task_group
 #define PN(F) \
 	SEQ_printf(m, "  .%-30s: %lld.%06ld\n", #F, SPLIT_NS((long long)F))
 =

-	if (!se) {
-		struct sched_avg *avg =3D &cpu_rq(cpu)->avg;
-		P(avg->runnable_avg_sum);
-		P(avg->runnable_avg_period);
-		return;
-	}
-
-
 	PN(se->exec_start);
 	PN(se->vruntime);
 	PN(se->sum_exec_runtime);


You can remove the P() calls from that if statement, but you can't
remove the whole thing because you will try to dereference a NULL se
immediately afterward if you do.

--===============5551454966832861652==--

