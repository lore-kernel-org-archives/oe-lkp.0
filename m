Content-Type: multipart/mixed; boundary="===============4622648339732513078=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [tracing] ecadccb31b: kernel_selftests.ftrace.ftracetest.fail
Date: Sun, 22 Jul 2018 12:17:34 +0900
Message-ID: <20180722121734.9fc08975427d9d4ff31ba0ce@kernel.org>
In-Reply-To: <20180721184032.01b1b6d70e0dd3b0f32aac95@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4622648339732513078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Jul 2018 18:40:32 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Hi,
> =

> OK, I'll handle this.
> The reason why this error is that kprobe event tests probe ftrace itself =
for test.

So one possible fix is below patch.

Another possible way to fix is to allow instrumentation on trace_kprobe.c as
same as trace_selftest_dynamic.c .

Thank you,

-----
selftests/ftrace: Fix kprobe string testcase to not probe notrace function

From: Masami Hiramatsu <mhiramat@kernel.org>

Fix kprobe string argument testcase to not probe notrace
function. Instead, it probes tracefs function which must
be available with ftrace.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 .../ftrace/test.d/kprobe/kprobe_args_string.tc     |   30 ++++++++--------=
----
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_strin=
g.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
index a000256..1ad70cd 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
@@ -9,28 +9,22 @@ echo > kprobe_events
 =

 case `uname -m` in
 x86_64)
-  ARG2=3D%si
-  OFFS=3D8
+  ARG1=3D%di
 ;;
 i[3456]86)
-  ARG2=3D%cx
-  OFFS=3D4
+  ARG1=3D%ax
 ;;
 aarch64)
-  ARG2=3D%x1
-  OFFS=3D8
+  ARG1=3D%x0
 ;;
 arm*)
-  ARG2=3D%r1
-  OFFS=3D4
+  ARG1=3D%r0
 ;;
 ppc64*)
-  ARG2=3D%r4
-  OFFS=3D8
+  ARG1=3D%r3
 ;;
 ppc*)
-  ARG2=3D%r4
-  OFFS=3D4
+  ARG1=3D%r3
 ;;
 *)
   echo "Please implement other architecture here"
@@ -38,17 +32,17 @@ ppc*)
 esac
 =

 : "Test get argument (1)"
-echo "p:testprobe create_trace_kprobe arg1=3D+0(+0(${ARG2})):string" > kpr=
obe_events
+echo "p:testprobe tracefs_create_dir arg1=3D+0(${ARG1}):string" > kprobe_e=
vents
 echo 1 > events/kprobes/testprobe/enable
-! echo test >> kprobe_events
-tail -n 1 trace | grep -qe "testprobe.* arg1=3D\"test\""
+echo "p:test _do_fork" >> kprobe_events
+grep -qe "testprobe.* arg1=3D\"test\"" trace
 =

 echo 0 > events/kprobes/testprobe/enable
 : "Test get argument (2)"
-echo "p:testprobe create_trace_kprobe arg1=3D+0(+0(${ARG2})):string arg2=
=3D+0(+${OFFS}(${ARG2})):string" > kprobe_events
+echo "p:testprobe tracefs_create_dir arg1=3D+0(${ARG1}):string arg2=3D+0($=
{ARG1}):string" > kprobe_events
 echo 1 > events/kprobes/testprobe/enable
-! echo test1 test2 >> kprobe_events
-tail -n 1 trace | grep -qe "testprobe.* arg1=3D\"test1\" arg2=3D\"test2\""
+echo "p:test _do_fork" >> kprobe_events
+grep -qe "testprobe.* arg1=3D\"test\" arg2=3D\"test\"" trace
 =

 echo 0 > events/enable
 echo > kprobe_events

--===============4622648339732513078==--

