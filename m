Content-Type: multipart/mixed; boundary="===============1665775381356424977=="
MIME-Version: 1.0
From: Yonghong Song <yhs@fb.com>
To: lkp@lists.01.org
Subject: Re: [tools/bpf] f6f3bac08f: stderr.failed_to_prepare_for_bpf
Date: Tue, 06 Nov 2018 01:47:52 +0000
Message-ID: <ad890bee-0cce-c2fd-c1a4-900c928d82f0@fb.com>
In-Reply-To: <20181105053635.GS24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1665775381356424977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


I cannot reproduce in my local fc28 system with the attached steps.

The netlink_dumper.c file, could you confirm whether the following =

header files are missing form you rhel-7.2 host?

#include <linux/rtnetlink.h>
#include <linux/tc_act/tc_bpf.h>

I suspect you probably miss linux/tc_act/tc_bpf.h. But could you confirm =

it? If this is the case, I can fix the problem by adding tc_bpf.h into
tools/include/uapi directory.

Thanks,

Yonghong


On 11/4/18 9:36 PM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: f6f3bac08ff9855d803081a353a1fafaa8845739 ("tools/bpf: bpftool: ad=
d net support")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: bpf_offload
> with following parameters:
> =

> 	ucode: 0xb00002e
> =

> =

> =

> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel=
-7.2-f6f3bac08ff9855d803081a353a1fafaa8845739
> 2018-11-03 10:11:02 cd /usr/src/linux-selftests-x86_64-rhel-7.2-f6f3bac08=
ff9855d803081a353a1fafaa8845739/tools/testing/selftests
> 2018-11-03 10:11:02 ln -sf /usr/bin/clang-7 /usr/bin/clang
> 2018-11-03 10:11:02 ln -sf /usr/bin/llc-7 /usr/bin/llc
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3bac=
08ff9855d803081a353a1fafaa8845739/tools/bpf'
> =

> Auto-detecting system features:
> ...                        libbfd: [ =1B[31mOFF=1B[m ]
> ...        disassembler-four-args: [ =1B[31mOFF=1B[m ]
> =

>    CC       bpf_jit_disasm.o
>    LINK     bpf_jit_disasm
>    CC       bpf_dbg.o
>    LINK     bpf_dbg
>    CC       bpf_asm.o
>    BISON    bpf_exp.yacc.c
>    CC       bpf_exp.yacc.o
>    FLEX     bpf_exp.lex.c
>    CC       bpf_exp.lex.o
>    LINK     bpf_asm
>    DESCEND  bpftool
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3=
bac08ff9855d803081a353a1fafaa8845739/tools/bpf/bpftool'
> =

> Auto-detecting system features:
> ...                        libbfd: [ =1B[31mOFF=1B[m ]
> ...        disassembler-four-args: [ =1B[31mOFF=1B[m ]
> =

>    CC       map_perf_ring.o
>    CC       xlated_dumper.o
>    CC       perf.o
>    CC       prog.o
>    CC       btf_dumper.o
>    CC       net.o
>    CC       netlink_dumper.o
> Makefile:96: recipe for target 'netlink_dumper.o' failed
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3b=
ac08ff9855d803081a353a1fafaa8845739/tools/bpf/bpftool'
> Makefile:99: recipe for target 'bpftool' failed
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.2-f6f3bac0=
8ff9855d803081a353a1fafaa8845739/tools/bpf'
> =

> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Rong Chen
>=20

--===============1665775381356424977==--

