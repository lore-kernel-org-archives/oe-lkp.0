Content-Type: multipart/mixed; boundary="===============6392546466352100127=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [tracing/selftests] cfece71411: kernel-selftests.ftrace.event_trigger_-_test_inter-event_histogram_trigger_onchange_action.fail
Date: Fri, 29 Oct 2021 21:00:56 +0900
Message-ID: <20211029210056.6cd7796aea59cec3e9c1d7da@kernel.org>
In-Reply-To: <20211029064818.GG737@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6392546466352100127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 29 Oct 2021 14:48:18 +0800
kernel test robot <oliver.sang@intel.com> wrote:

> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: cfece71411dbca5dc5e1fa2d9ce5a3f38e55d4fe ("[PATCH v4 7/8] tracing=
/selftests: Add tests for hist trigger expression parsing")
> url: https://github.com/0day-ci/linux/commits/Kalesh-Singh/tracing-Extend=
-histogram-triggers-expression-parsing/20211026-042529
> =

> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-c8c9111a-1_20210929
> with following parameters:
> =

> 	group: ftrace
> 	ucode: 0xe2
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt

Thanks! This issue has been found and will be fixed next version.

BTW, I have some questions about this bot;

> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 3=
2G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> =

> TAP version 13
> 1..1
> # selftests: ftrace: ftracetest
> # =3D=3D=3D Ftrace unit tests =3D=3D=3D
> # [1] Basic trace file check	[PASS]
> ...
> <<< [1] - [67] have same results as parent, i.e. both PASS or both FAIL >=
>>

At first, I guess the robot just checks the "[number]" instead
of the test description, but the ftracetest doesn't fix the "[number]"
for each test, Thus, it can be different when updated it.
So if you compare the result, please check the descriptions too.

> ...
> # [67] event trigger - test multiple actions on hist trigger	[PASS]
> =

> >>> [68] - [72] can PASS on parent
> # [68] event trigger - test inter-event histogram trigger onchange action=
	[FAIL]
> # [69] event trigger - test inter-event histogram trigger onmatch action	=
[FAIL]
> # [70] event trigger - test inter-event histogram trigger onmatch-onmax a=
ction	[FAIL]
> # [71] event trigger - test inter-event histogram trigger onmax action	[F=
AIL]
> # [72] event trigger - test inter-event histogram trigger snapshot action=
	[FAIL]
> =

> >>> [73] fail on parent, too
> # [73] event trigger - test inter-event histogram trigger eprobe on synth=
etic event	[FAIL]
> =

> >>> [74] - [92] can PASS on parent
> # [74] event trigger - test synthetic event create remove	[FAIL]
> # [75] event trigger - test inter-event histogram trigger trace action wi=
th dynamic string param	[FAIL]
> # [76] event trigger - test synthetic_events syntax parser	[FAIL]
> # [77] event trigger - test synthetic_events syntax parser errors	[FAIL]
> # [78] event trigger - test inter-event histogram trigger trace action	[F=
AIL]
> # [79] event trigger - test event enable/disable trigger	[FAIL]
> # [80] event trigger - test trigger filter	[FAIL]
> # [81] event trigger - test histogram expression parsing	[FAIL]
> # [82] event trigger - test histogram modifiers	[FAIL]
> # [83] event trigger - test histogram parser errors	[FAIL]
> # [84] event trigger - test histogram trigger	[FAIL]
> # [85] event trigger - test multiple histogram triggers	[FAIL]
> # [86] event trigger - test snapshot-trigger	[FAIL]
> # [87] event trigger - test stacktrace-trigger	[FAIL]
> # [88] trace_marker trigger - test histogram trigger	[FAIL]
> # [89] trace_marker trigger - test snapshot trigger	[FAIL]
> # [90] trace_marker trigger - test histogram with synthetic event against=
 kernel event	[FAIL]
> # [91] trace_marker trigger - test histogram with synthetic event	[FAIL]
> # [92] event trigger - test traceon/off trigger	[FAIL]
> # [93] (instance)  Basic test for tracers	[PASS]
> ...
> <<< [93] - [112] have same results as parent, all PASS >>>
> ...
> # [112] (instance)  trace_marker trigger - test histogram trigger	[PASS]
> =

> >>> parent has no [113]
> # [113] (instance)  trace_marker trigger - test snapshot trigger	[PASS]

And next, some patch series may *ADD* new testcases if the series add
a new feature, so if you find the difference which is not in the
parent commit but it is passed, please ignore that.

> # tac: failed to create temporary file in '/tmp/ftracetest-dir.o54lNh': N=
o such file or directory
> # tac: failed to create temporary file in '/tmp/ftracetest-dir.o54lNh': N=
o such file or directory
> # tac: failed to create temporary file in '/tmp/ftracetest-dir.o54lNh': N=
o such file or directory
> # tac: failed to create temporary file in '/tmp/ftracetest-dir.o54lNh': N=
o such file or directory

And if you find this kind of new error message like above, please report it.
This is more important for us.

> # =

> # =

> # # of passed:  85
> # # of failed:  26
> # # of unresolved:  1
> # # of untested:  0
> # # of unsupported:  0
> # # of xfailed:  1
> # # of undefined(test bug):  0
> not ok 1 selftests: ftrace: ftracetest # exit=3D1

Also, please configure your running environment correctly so that all
ftracetest passes. If you unsure how to do, please ask me.

Thank you,

> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
> =



-- =

Masami Hiramatsu <mhiramat@kernel.org>
--===============6392546466352100127==--

