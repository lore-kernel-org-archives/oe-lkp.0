Content-Type: multipart/mixed; boundary="===============5025162274828652202=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [tracing] ecadccb31b: kernel_selftests.ftrace.ftracetest.fail
Date: Sat, 21 Jul 2018 18:40:32 +0900
Message-ID: <20180721184032.01b1b6d70e0dd3b0f32aac95@kernel.org>
In-Reply-To: <20180721024113.GI12513@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5025162274828652202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

OK, I'll handle this.
The reason why this error is that kprobe event tests probe ftrace itself fo=
r test.


On Sat, 21 Jul 2018 10:41:13 +0800
kernel test robot <rong.a.chen@intel.com> wrote:

> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: ecadccb31b8f1516dd045cc64fc7bc7a2d72947f ("[PATCH 1/2] tracing: k=
probes: Prohibit probing on notrace functions")
> url: https://github.com/0day-ci/linux/commits/Francis-Deslauriers/tracing=
-kprobes-Prohibit-probing-on-notrace-functions/20180714-072854
> =

> =

> in testcase: kernel_selftests
> with following parameters:
> =

> 	group: kselftests-01
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-2600K CPU @ 3.40GHz with =
8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel=
-7.2-ecadccb31b8f1516dd045cc64fc7bc7a2d72947f
> 2018-07-18 22:17:02 ln -sf /usr/bin/clang-7 /usr/bin/clang
> 2018-07-18 22:17:02 ln -sf /usr/bin/llc-7 /usr/bin/llc
> =

> 2018-07-18 22:17:47 make run_tests -C ftrace
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-ecadccb=
31b8f1516dd045cc64fc7bc7a2d72947f/tools/testing/selftests/ftrace'
> TAP version 13
> selftests: ftrace: ftracetest
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D Ftrace unit tests =3D=3D=3D
> [1] Basic trace file check	[PASS]
> [2] Basic test for tracers	[PASS]
> [3] Basic trace clock test	[PASS]
> [4] Basic event tracing check	[PASS]
> [5] event tracing - enable/disable with event level files	[PASS]
> [6] event tracing - restricts events based on pid	[PASS]
> [7] event tracing - enable/disable with subsystem level files	[PASS]
> [8] event tracing - enable/disable with top level files	[PASS]
> [9] ftrace - function graph filters with stack tracer	[PASS]
> [10] ftrace - function graph filters	[PASS]
> [11] ftrace - function glob filters	[PASS]
> [12] ftrace - function pid filters	[PASS]
> [13] ftrace - test for function event triggers	[PASS]
> [14] ftrace - function profiler with function tracing	[PASS]
> [15] ftrace - test reading of set_ftrace_filter	[PASS]
> [16] ftrace - test for function traceon/off triggers	[PASS]
> [17] Test creation and deletion of trace instances while setting an event=
	[PASS]
> [18] Test creation and deletion of trace instances	[PASS]
> [19] Kprobe dynamic event - adding and removing	[PASS]
> [20] Kprobe dynamic event - busy event check	[PASS]
> [21] Kprobe dynamic event with arguments	[PASS]
> [22] Kprobe event string type argument	[FAIL]
> [23] Kprobe event argument syntax	[PASS]
> [24] Kprobes event arguments with types	[PASS]
> [25] Kprobe event auto/manual naming	[PASS]
> [26] Kprobe dynamic event with function tracer	[PASS]
> [27] Kprobe dynamic event - probing module	[FAIL]
> [28] Kretprobe dynamic event with arguments	[PASS]
> [29] Kretprobe dynamic event with maxactive	[PASS]
> [30] Register/unregister many kprobe events	[PASS]
> [31] Kprobe events - probe points	[FAIL]
> [32] event trigger - test extended error support	[PASS]
> [33] event trigger - test field variable support	[PASS]
> [34] event trigger - test inter-event combined histogram trigger	[PASS]
> [35] event trigger - test multiple actions on hist trigger	[PASS]
> [36] event trigger - test inter-event histogram trigger onmatch action	[P=
ASS]
> [37] event trigger - test inter-event histogram trigger onmatch-onmax act=
ion	[PASS]
> [38] event trigger - test inter-event histogram trigger onmax action	[PAS=
S]
> [39] event trigger - test synthetic event create remove	[PASS]
> [40] event trigger - test event enable/disable trigger	[PASS]
> [41] event trigger - test trigger filter	[PASS]
> [42] event trigger - test histogram modifiers	[PASS]
> [43] event trigger - test histogram trigger	[PASS]
> [44] event trigger - test multiple histogram triggers	[PASS]
> [45] event trigger - test snapshot-trigger	[PASS]
> [46] event trigger - test stacktrace-trigger	[PASS]
> [47] trace_marker trigger - test histogram trigger	[PASS]
> [48] trace_marker trigger - test snapshot trigger	[PASS]
> [49] trace_marker trigger - test histogram with synthetic event against k=
ernel event	[PASS]
> [50] trace_marker trigger - test histogram with synthetic event	[PASS]
> [51] event trigger - test traceon/off trigger	[PASS]
> [52] (instance)  Basic test for tracers	[PASS]
> [53] (instance)  Basic trace clock test	[PASS]
> [54] (instance)  event tracing - enable/disable with event level files	[P=
ASS]
> [55] (instance)  event tracing - restricts events based on pid	[PASS]
> [56] (instance)  event tracing - enable/disable with subsystem level file=
s	[PASS]
> [57] (instance)  ftrace - test for function event triggers	[PASS]
> [58] (instance)  ftrace - test for function traceon/off triggers	[PASS]
> [59] (instance)  event trigger - test event enable/disable trigger	[PASS]
> [60] (instance)  event trigger - test trigger filter	[PASS]
> [61] (instance)  event trigger - test histogram modifiers	[PASS]
> [62] (instance)  event trigger - test histogram trigger	[PASS]
> [63] (instance)  event trigger - test multiple histogram triggers	[PASS]
> [64] (instance)  trace_marker trigger - test histogram trigger	[PASS]
> [65] (instance)  trace_marker trigger - test snapshot trigger	[PASS]
> =

> # of passed:  62
> # of failed:  3
> # of unresolved:  0
> # of untested:  0
> # of unsupported:  0
> # of xfailed:  0
> # of undefined(test bug):  0
> not ok 1..1 selftests: ftrace: ftracetest [FAIL]
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-ecadccb3=
1b8f1516dd045cc64fc7bc7a2d72947f/tools/testing/selftests/ftrace'
> =

> =

> to reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> thanks,
> rong, chen


-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============5025162274828652202==--

