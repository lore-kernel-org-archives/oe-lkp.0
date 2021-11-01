Content-Type: multipart/mixed; boundary="===============2748612571187078105=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [tracing/selftests] cfece71411: kernel-selftests.ftrace.event_trigger_-_test_inter-event_histogram_trigger_onchange_action.fail
Date: Mon, 01 Nov 2021 11:43:58 +0800
Message-ID: <4194a7d6-db5c-5efe-debc-3c3121d1ebff@intel.com>
In-Reply-To: <20211029210056.6cd7796aea59cec3e9c1d7da@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2748612571187078105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 29/10/2021 20:00, Masami Hiramatsu wrote:
>
>>
>> TAP version 13
>> 1..1
>> # selftests: ftrace: ftracetest
>> # =3D=3D=3D Ftrace unit tests =3D=3D=3D
>> # [1] Basic trace file check	[PASS]
>> ...
>> <<< [1] - [67] have same results as parent, i.e. both PASS or both FAIL =
>>>
> At first, I guess the robot just checks the "[number]" instead
> of the test description, but the ftracetest doesn't fix the "[number]"
> for each test, Thus, it can be different when updated it.

Hi Masami

Good catch, thanks for these information, we will improve the robot.

Thanks
Zhjian


> So if you compare the result, please check the descriptions too.
>
>> ...
>> # [67] event trigger - test multiple actions on hist trigger	[PASS]
>>
>>>>> [68] - [72] can PASS on parent
>> # [68] event trigger - test inter-event histogram trigger onchange actio=
n	[FAIL]
>> # [69] event trigger - test inter-event histogram trigger onmatch action=
	[FAIL]
>> # [70] event trigger - test inter-event histogram trigger onmatch-onmax =
action	[FAIL]
>> # [71] event trigger - test inter-event histogram trigger onmax action	[=
FAIL]
>> # [72] event trigger - test inter-event histogram trigger snapshot actio=
n	[FAIL]
>>
>>>>> [73] fail on parent, too
>> # [73] event trigger - test inter-event histogram trigger eprobe on synt=
hetic event	[FAIL]
>>
>>>>> [74] - [92] can PASS on parent
>> # [74] event trigger - test synthetic event create remove	[FAIL]
>> # [75] event trigger - test inter-event histogram trigger trace action w=
ith dynamic string param	[FAIL]
>> # [76] event trigger - test synthetic_events syntax parser	[FAIL]
>> # [77] event trigger - test synthetic_events syntax parser errors	[FAIL]
>> # [78] event trigger - test inter-event histogram trigger trace action	[=
FAIL]
>> # [79] event trigger - test event enable/disable trigger	[FAIL]
>> # [80] event trigger - test trigger filter	[FAIL]
>> # [81] event trigger - test histogram expression parsing	[FAIL]
>> # [82] event trigger - test histogram modifiers	[FAIL]
>> # [83] event trigger - test histogram parser errors	[FAIL]
>> # [84] event trigger - test histogram trigger	[FAIL]
>> # [85] event trigger - test multiple histogram triggers	[FAIL]
>> # [86] event trigger - test snapshot-trigger	[FAIL]
>> # [87] event trigger - test stacktrace-trigger	[FAIL]
>> # [88] trace_marker trigger - test histogram trigger	[FAIL]
>> # [89] trace_marker trigger - test snapshot trigger	[FAIL]
>> # [90] trace_marker trigger - test histogram with synthetic event agains=
t kernel event	[FAIL]
>> # [91] trace_marker trigger - test histogram with synthetic event	[FAIL]
>> # [92] event trigger - test traceon/off trigger	[FAIL]
>> # [93] (instance)  Basic test for tracers	[PASS]
>> ...
>> <<< [93] - [112] have same results as parent, all PASS >>>
>> ...
>> # [112] (instance)  trace_marker trigger - test histogram trigger	[PASS]
>>
>>>>> parent has no [113]
>> # [113] (instance)  trace_marker trigger - test snapshot trigger	[PASS]
> And next, some patch series may *ADD* new testcases if the series add
> a new feature, so if you find the difference which is not in the
> parent commit but it is passed, please ignore that.
>
>> # tac: failed to create temporary file in '/tmp/ftracetest-dir.o54lNh': =
No such file or directory
>> # tac: failed to create temporary file in '/tmp/ftracetest-dir.o54lNh': =
No such file or directory
>> # tac: failed to create temporary file in '/tmp/ftracetest-dir.o54lNh': =
No such file or directory
>> # tac: failed to create temporary file in '/tmp/ftracetest-dir.o54lNh': =
No such file or directory
> And if you find this kind of new error message like above, please report =
it.
> This is more important for us.
>
>> #
>> #
>> # # of passed:  85
>> # # of failed:  26
>> # # of unresolved:  1
>> # # of untested:  0
>> # # of unsupported:  0
>> # # of xfailed:  1
>> # # of undefined(test bug):  0
>> not ok 1 selftests: ftrace: ftracetest # exit=3D1
> Also, please configure your running environment correctly so that all
> ftracetest passes. If you unsure how to do, please ask me.
>
> Thank you,
>
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          sudo bin/lkp install job.yaml           # job file is attached =
in this email
>>          bin/lkp split-job --compatible job.yaml # generate the yaml fil=
e for lkp run
>>          sudo bin/lkp run generated-yaml-file
>>
>>          # if come across any failure that blocks the test,
>>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>>
>>
>>
>> ---
>> 0DAY/LKP+ Test Infrastructure                   Open Source Technology C=
enter
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corp=
oration
>>
>> Thanks,
>> Oliver Sang
>>
>

--===============2748612571187078105==--

