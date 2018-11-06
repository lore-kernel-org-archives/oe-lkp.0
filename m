Content-Type: multipart/mixed; boundary="===============2787393362257006000=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [tools/bpf] f6f3bac08f: stderr.failed_to_prepare_for_bpf
Date: Tue, 06 Nov 2018 18:04:50 +0800
Message-ID: <e91fbb35-0f4f-b2ef-f067-68f6d6116119@intel.com>
In-Reply-To: <ad890bee-0cce-c2fd-c1a4-900c928d82f0@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2787393362257006000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 11/6/2018 9:47 AM, Yonghong Song wrote:
> I cannot reproduce in my local fc28 system with the attached steps.
>
> The netlink_dumper.c file, could you confirm whether the following
> header files are missing form you rhel-7.2 host?
>
> #include <linux/rtnetlink.h>
> #include <linux/tc_act/tc_bpf.h>
>
> I suspect you probably miss linux/tc_act/tc_bpf.h. But could you confirm
> it? If this is the case, I can fix the problem by adding tc_bpf.h into
> tools/include/uapi directory.

we have installed <linux/tc_act/tc_bpf.h>, but it's a bit old

root(a)lkp-bdw-ep3 ~/linux-f6f3bac08f# diff /usr/include/linux/tc_act/tc_bp=
f.h ./include/uapi/linux/tc_act/tc_bpf.h -u
--- /usr/include/linux/tc_act/tc_bpf.h	2018-03-02 07:52:22.000000000 +0000
+++ ./include/uapi/linux/tc_act/tc_bpf.h	2018-09-07 05:34:08.000000000 +0000
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
  /*
   * Copyright (c) 2015 Jiri Pirko <jiri@resnulli.us>
   *
@@ -27,6 +28,8 @@
  	TCA_ACT_BPF_FD,
  	TCA_ACT_BPF_NAME,
  	TCA_ACT_BPF_PAD,
+	TCA_ACT_BPF_TAG,
+	TCA_ACT_BPF_ID,
  	__TCA_ACT_BPF_MAX,
  };
  #define TCA_ACT_BPF_MAX (__TCA_ACT_BPF_MAX - 1)

and beside linux/tc_act/tc_bpf.h, it also requires a newer linux/pkt_cls.h =
to avoid:
root(a)lkp-bdw-ep3 ~/linux-f6f3bac08f/tools/bpf/bpftool# make V=3D1
[...snip...]
gcc -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow -Wno-missing-field-=
initializers -DPACKAGE=3D'"bpftool"' -D__EXPORTED_HEADERS__ -I/root/linux-f=
6f3bac08f/kernel/bpf/ -I/root/linux-f6f3bac08f/tools/include -I/root/linux-=
f6f3bac08f/tools/include/uapi -I/root/linux-f6f3bac08f/tools/lib/bpf -I/roo=
t/linux-f6f3bac08f/tools/perf -DBPFTOOL_VERSION=3D'"4.19.0-rc2"' -DCOMPAT_N=
EED_REALLOCARRAY   -c -MMD -o netlink_dumper.o netlink_dumper.c
make -C /root/linux-f6f3bac08f/tools/lib/bpf/ OUTPUT=3D libbpf.a
make[1]: Entering directory '/root/linux-f6f3bac08f/tools/lib/bpf'
netlink_dumper.c: In function 'do_bpf_filter_dump':
netlink_dumper.c:153:9: error: 'TCA_BPF_ID' undeclared (first use in this f=
unction)
   if (tb[TCA_BPF_ID])
          ^~~~~~~~~~
netlink_dumper.c:153:9: note: each undeclared identifier is reported only o=
nce for each function it appears in
netlink_dumper.c:155:9: error: 'TCA_BPF_TAG' undeclared (first use in this =
function)
   if (tb[TCA_BPF_TAG])
          ^~~~~~~~~~~
Makefile:96: recipe for target 'netlink_dumper.o' failed
make: *** [netlink_dumper.o] Error 1
make: *** Waiting for unfinished jobs....
make -f /root/linux-f6f3bac08f/tools/build/Makefile.build dir=3D. obj=3Dlib=
bpf
make[1]: Leaving directory '/root/linux-f6f3bac08f/tools/lib/bpf'


In this case, i'm not clear either i should upgrade system's linux header b=
y myself or fix the tools on you side.


Thanks
Zhijian

  =


>
> Thanks,
>
> Yonghong
>
>
> On 11/4/18 9:36 PM, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: f6f3bac08ff9855d803081a353a1fafaa8845739 ("tools/bpf: bpftool: a=
dd net support")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: bpf_offload
>> with following parameters:
>>
>> 	ucode: 0xb00002e
>>
>>
>>
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 64G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>>
>> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhe=
l-7.2-f6f3bac08ff9855d803081a353a1fafaa8845739
>> 2018-11-03 10:11:02 cd /usr/src/linux-selftests-x86_64-rhel-7.2-f6f3bac0=
8ff9855d803081a353a1fafaa8845739/tools/testing/selftests
>> 2018-11-03 10:11:02 ln -sf /usr/bin/clang-7 /usr/bin/clang
>> 2018-11-03 10:11:02 ln -sf /usr/bin/llc-7 /usr/bin/llc
>> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3ba=
c08ff9855d803081a353a1fafaa8845739/tools/bpf'
>>
>> Auto-detecting system features:
>> ...                        libbfd: [ =1B[31mOFF=1B[m ]
>> ...        disassembler-four-args: [ =1B[31mOFF=1B[m ]
>>
>>     CC       bpf_jit_disasm.o
>>     LINK     bpf_jit_disasm
>>     CC       bpf_dbg.o
>>     LINK     bpf_dbg
>>     CC       bpf_asm.o
>>     BISON    bpf_exp.yacc.c
>>     CC       bpf_exp.yacc.o
>>     FLEX     bpf_exp.lex.c
>>     CC       bpf_exp.lex.o
>>     LINK     bpf_asm
>>     DESCEND  bpftool
>> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f=
3bac08ff9855d803081a353a1fafaa8845739/tools/bpf/bpftool'
>>
>> Auto-detecting system features:
>> ...                        libbfd: [ =1B[31mOFF=1B[m ]
>> ...        disassembler-four-args: [ =1B[31mOFF=1B[m ]
>>
>>     CC       map_perf_ring.o
>>     CC       xlated_dumper.o
>>     CC       perf.o
>>     CC       prog.o
>>     CC       btf_dumper.o
>>     CC       net.o
>>     CC       netlink_dumper.o
>> Makefile:96: recipe for target 'netlink_dumper.o' failed
>> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3=
bac08ff9855d803081a353a1fafaa8845739/tools/bpf/bpftool'
>> Makefile:99: recipe for target 'bpftool' failed
>> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3bac=
08ff9855d803081a353a1fafaa8845739/tools/bpf'
>>
>>
>>
>> To reproduce:
>>
>>           git clone https://github.com/intel/lkp-tests.git
>>           cd lkp-tests
>>           bin/lkp install job.yaml  # job file is attached in this email
>>           bin/lkp run     job.yaml
>>
>>
>>
>> Thanks,
>> Rong Chen
>>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============2787393362257006000==--

