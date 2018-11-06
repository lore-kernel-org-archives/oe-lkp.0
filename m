Content-Type: multipart/mixed; boundary="===============7533186699435301525=="
MIME-Version: 1.0
From: Yonghong Song <yhs@fb.com>
To: lkp@lists.01.org
Subject: Re: [tools/bpf] f6f3bac08f: stderr.failed_to_prepare_for_bpf
Date: Tue, 06 Nov 2018 23:33:23 +0000
Message-ID: <797367e2-4aa9-3ef4-3179-705fecb144be@fb.com>
In-Reply-To: <e91fbb35-0f4f-b2ef-f067-68f6d6116119@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7533186699435301525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/6/18 2:04 AM, Li Zhijian wrote:
> =

> On 11/6/2018 9:47 AM, Yonghong Song wrote:
>> I cannot reproduce in my local fc28 system with the attached steps.
>>
>> The netlink_dumper.c file, could you confirm whether the following
>> header files are missing form you rhel-7.2 host?
>>
>> #include <linux/rtnetlink.h>
>> #include <linux/tc_act/tc_bpf.h>
>>
>> I suspect you probably miss linux/tc_act/tc_bpf.h. But could you confirm
>> it? If this is the case, I can fix the problem by adding tc_bpf.h into
>> tools/include/uapi directory.
> =

> we have installed <linux/tc_act/tc_bpf.h>, but it's a bit old
> =

> root(a)lkp-bdw-ep3 ~/linux-f6f3bac08f# diff =

> /usr/include/linux/tc_act/tc_bpf.h ./include/uapi/linux/tc_act/tc_bpf.h -u
> --- /usr/include/linux/tc_act/tc_bpf.h=C2=A0=C2=A0=C2=A0 2018-03-02 07:52=
:22.000000000 =

> +0000
> +++ ./include/uapi/linux/tc_act/tc_bpf.h=C2=A0=C2=A0=C2=A0 2018-09-07 =

> 05:34:08.000000000 +0000
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
>  =C2=A0/*
>  =C2=A0 * Copyright (c) 2015 Jiri Pirko <jiri@resnulli.us>
>  =C2=A0 *
> @@ -27,6 +28,8 @@
>  =C2=A0=C2=A0=C2=A0=C2=A0 TCA_ACT_BPF_FD,
>  =C2=A0=C2=A0=C2=A0=C2=A0 TCA_ACT_BPF_NAME,
>  =C2=A0=C2=A0=C2=A0=C2=A0 TCA_ACT_BPF_PAD,
> +=C2=A0=C2=A0=C2=A0 TCA_ACT_BPF_TAG,
> +=C2=A0=C2=A0=C2=A0 TCA_ACT_BPF_ID,
>  =C2=A0=C2=A0=C2=A0=C2=A0 __TCA_ACT_BPF_MAX,
>  =C2=A0};
>  =C2=A0#define TCA_ACT_BPF_MAX (__TCA_ACT_BPF_MAX - 1)
> =

> and beside linux/tc_act/tc_bpf.h, it also requires a newer =

> linux/pkt_cls.h to avoid:
> root(a)lkp-bdw-ep3 ~/linux-f6f3bac08f/tools/bpf/bpftool# make V=3D1
> [...snip...]
> gcc -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow =

> -Wno-missing-field-initializers -DPACKAGE=3D'"bpftool"' =

> -D__EXPORTED_HEADERS__ -I/root/linux-f6f3bac08f/kernel/bpf/ =

> -I/root/linux-f6f3bac08f/tools/include =

> -I/root/linux-f6f3bac08f/tools/include/uapi =

> -I/root/linux-f6f3bac08f/tools/lib/bpf =

> -I/root/linux-f6f3bac08f/tools/perf -DBPFTOOL_VERSION=3D'"4.19.0-rc2"' =

> -DCOMPAT_NEED_REALLOCARRAY=C2=A0=C2=A0 -c -MMD -o netlink_dumper.o netlin=
k_dumper.c
> make -C /root/linux-f6f3bac08f/tools/lib/bpf/ OUTPUT=3D libbpf.a
> make[1]: Entering directory '/root/linux-f6f3bac08f/tools/lib/bpf'
> netlink_dumper.c: In function 'do_bpf_filter_dump':
> netlink_dumper.c:153:9: error: 'TCA_BPF_ID' undeclared (first use in =

> this function)
>  =C2=A0 if (tb[TCA_BPF_ID])
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~
> netlink_dumper.c:153:9: note: each undeclared identifier is reported =

> only once for each function it appears in
> netlink_dumper.c:155:9: error: 'TCA_BPF_TAG' undeclared (first use in =

> this function)
>  =C2=A0 if (tb[TCA_BPF_TAG])
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~
> Makefile:96: recipe for target 'netlink_dumper.o' failed
> make: *** [netlink_dumper.o] Error 1
> make: *** Waiting for unfinished jobs....
> make -f /root/linux-f6f3bac08f/tools/build/Makefile.build dir=3D. obj=3Dl=
ibbpf
> make[1]: Leaving directory '/root/linux-f6f3bac08f/tools/lib/bpf'
> =

> =

> In this case, i'm not clear either i should upgrade system's linux =

> header by myself or fix the tools on you side.

I will send out a patch to fix the linux/tools. Thanks!

Yonghong

> =

> =

> Thanks
> Zhijian
> =

> =

> =

>>
>> Thanks,
>>
>> Yonghong
>>
>>
>> On 11/4/18 9:36 PM, kernel test robot wrote:
>>> FYI, we noticed the following commit (built with gcc-7):
>>>
>>> commit: f6f3bac08ff9855d803081a353a1fafaa8845739 ("tools/bpf: =

>>> bpftool: add net support")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>> in testcase: bpf_offload
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0xb00002e
>>>
>>>
>>>
>>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz =

>>> with 64G memory
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire =

>>> log/backtrace):
>>>
>>>
>>>
>>>
>>> KERNEL SELFTESTS: linux_headers_dir is =

>>> /usr/src/linux-headers-x86_64-rhel-7.2-f6f3bac08ff9855d803081a353a1fafa=
a8845739 =

>>>
>>> 2018-11-03 10:11:02 cd =

>>> /usr/src/linux-selftests-x86_64-rhel-7.2-f6f3bac08ff9855d803081a353a1fa=
faa8845739/tools/testing/selftests =

>>>
>>> 2018-11-03 10:11:02 ln -sf /usr/bin/clang-7 /usr/bin/clang
>>> 2018-11-03 10:11:02 ln -sf /usr/bin/llc-7 /usr/bin/llc
>>> make: Entering directory =

>>> '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3bac08ff9855d803081a353a1fa=
faa8845739/tools/bpf' =

>>>
>>>
>>> Auto-detecting system features:
>>> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=
bbfd: [ =1B[31mOFF=1B[m ]
>>> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disassembler-four-args: [=
 =1B[31mOFF=1B[m ]
>>>
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_jit_disas=
m.o
>>> =C2=A0=C2=A0=C2=A0 LINK=C2=A0=C2=A0=C2=A0=C2=A0 bpf_jit_disasm
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_dbg.o
>>> =C2=A0=C2=A0=C2=A0 LINK=C2=A0=C2=A0=C2=A0=C2=A0 bpf_dbg
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_asm.o
>>> =C2=A0=C2=A0=C2=A0 BISON=C2=A0=C2=A0=C2=A0 bpf_exp.yacc.c
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_exp.yacc.o
>>> =C2=A0=C2=A0=C2=A0 FLEX=C2=A0=C2=A0=C2=A0=C2=A0 bpf_exp.lex.c
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_exp.lex.o
>>> =C2=A0=C2=A0=C2=A0 LINK=C2=A0=C2=A0=C2=A0=C2=A0 bpf_asm
>>> =C2=A0=C2=A0=C2=A0 DESCEND=C2=A0 bpftool
>>> make[1]: Entering directory =

>>> '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3bac08ff9855d803081a353a1fa=
faa8845739/tools/bpf/bpftool' =

>>>
>>>
>>> Auto-detecting system features:
>>> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=
bbfd: [ =1B[31mOFF=1B[m ]
>>> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disassembler-four-args: [=
 =1B[31mOFF=1B[m ]
>>>
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map_perf_ring=
.o
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xlated_dumper=
.o
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf.o
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog.o
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 btf_dumper.o
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net.o
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netlink_dumpe=
r.o
>>> Makefile:96: recipe for target 'netlink_dumper.o' failed
>>> make[1]: Leaving directory =

>>> '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3bac08ff9855d803081a353a1fa=
faa8845739/tools/bpf/bpftool' =

>>>
>>> Makefile:99: recipe for target 'bpftool' failed
>>> make: Leaving directory =

>>> '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3bac08ff9855d803081a353a1fa=
faa8845739/tools/bpf' =

>>>
>>>
>>>
>>>
>>> To reproduce:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https:=
//github.com/intel/lkp-tests.git
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install =
job.yaml=C2=A0 # job file is attached in this email
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=
=A0=C2=A0=C2=A0=C2=A0 job.yaml
>>>
>>>
>>>
>>> Thanks,
>>> Rong Chen
>>>
>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.01.org_mail=
man_listinfo_lkp&d=3DDwICaQ&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3DDA8e1B5r073vIqRr=
Fz7MRA&m=3Di-U02mQoRDr-xyq3FJ8tEDa1ZmiDy-Igc5W5JAQVtO8&s=3DYI-mc76fJVQbNj36=
7iCD2avQgWoFkb-z1zZhjg7liD8&e=3D =

>>

--===============7533186699435301525==--

