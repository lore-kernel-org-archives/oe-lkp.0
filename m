Content-Type: multipart/mixed; boundary="===============2543933138724406545=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [bpf] e103a45d2b: stderr.failed_to_make_bpf
Date: Wed, 25 Jul 2018 13:54:46 +0800
Message-ID: <9d4d0ffb-c9f5-53df-72b2-18ce905eb6f3@intel.com>
In-Reply-To: <20180724082242.GI19722@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2543933138724406545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Tha't should be a noise, it's fine with a newer linux-libc-dev(v4.17.8-xx) =
on debian

BTW: the mail content doesn't contain the key errors
--------------
 =C2=A0test_sockmap.c:120:23: fatal error: linux/tls.h: No such file or dir=
ectory
  #include <linux/tls.h>
                        ^
compilation terminated.
make: *** [/usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e59=
7e09e118fa0c/tools/testing/selftests/bpf/test_sockmap] Error 1
--------------


On 7/24/2018 4:22 PM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: e103a45d2b3a34ce3de6f4652e597e09e118fa0c ("bpf: sample and test p=
rogram to support ktls")
> https://github.com/cilium/linux.git ktls-v2
>
> in testcase: bpf_offload
> with following parameters:
>
>
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
>
> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel=
-e103a45d2b3a34ce3de6f4652e597e09e118fa0c
> 2018-07-23 20:34:33 cd /usr/src/linux-selftests-x86_64-rhel-e103a45d2b3a3=
4ce3de6f4652e597e09e118fa0c/tools/testing/selftests
> 2018-07-23 20:34:33 ln -sf /usr/bin/clang-7 /usr/bin/clang
> 2018-07-23 20:34:34 ln -sf /usr/bin/llc-7 /usr/bin/llc
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2b3=
a34ce3de6f4652e597e09e118fa0c/tools/bpf'
>
> Auto-detecting system features:
> ...                        libbfd: [ =1B[31mOFF=1B[m ]
> ...        disassembler-four-args: [ =1B[31mOFF=1B[m ]
>
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
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d=
2b3a34ce3de6f4652e597e09e118fa0c/tools/bpf/bpftool'
>
> Auto-detecting system features:
> ...                        libbfd: [ =1B[31mOFF=1B[m ]
> ...        disassembler-four-args: [ =1B[31mOFF=1B[m ]
>
>    CC       map_perf_ring.o
>    CC       xlated_dumper.o
>    CC       perf.o
>    CC       prog.o
>    CC       common.o
>    CC       cgroup.o
>    CC       main.o
>    CC       json_writer.o
>    CC       cfg.o
>    CC       map.o
>    CC       jit_disasm.o
>    CC       disasm.o
> make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d=
2b3a34ce3de6f4652e597e09e118fa0c/tools/lib/bpf'
>
> Auto-detecting system features:
> ...                        libelf: [ =1B[32mon=1B[m  ]
> ...                           bpf: [ =1B[32mon=1B[m  ]
>
>    CC       libbpf.o
>    CC       bpf.o
>    CC       nlattr.o
>    CC       btf.o
>    LD       libbpf-in.o
>    LINK     libbpf.a
> make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2=
b3a34ce3de6f4652e597e09e118fa0c/tools/lib/bpf'
>    LINK     bpftool
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2=
b3a34ce3de6f4652e597e09e118fa0c/tools/bpf/bpftool'
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a=
34ce3de6f4652e597e09e118fa0c/tools/bpf'
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2b3=
a34ce3de6f4652e597e09e118fa0c/tools/bpf'
>
> Auto-detecting system features:
> ...                        libbfd: [ =1B[31mOFF=1B[m ]
> ...        disassembler-four-args: [ =1B[31mOFF=1B[m ]
>
>    DESCEND  bpftool
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d=
2b3a34ce3de6f4652e597e09e118fa0c/tools/bpf/bpftool'
>
> Auto-detecting system features:
> ...                        libbfd: [ =1B[31mOFF=1B[m ]
> ...        disassembler-four-args: [ =1B[31mOFF=1B[m ]
>
> make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d=
2b3a34ce3de6f4652e597e09e118fa0c/tools/lib/bpf'
> make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2=
b3a34ce3de6f4652e597e09e118fa0c/tools/lib/bpf'
>    INSTALL  bpftool
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2=
b3a34ce3de6f4652e597e09e118fa0c/tools/bpf/bpftool'
>    INSTALL  bpf_jit_disasm
>    INSTALL  bpf_dbg
>    INSTALL  bpf_asm
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a=
34ce3de6f4652e597e09e118fa0c/tools/bpf'
> 2018-07-23 20:34:54 cd bpf
> 2018-07-23 20:34:54 make
> gcc -o /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e=
09e118fa0c/tools/testing/selftests/bpf/urandom_read -static urandom_read.c =
-Wl,--build-id
> make -C ../../../lib/bpf OUTPUT=3D/usr/src/perf_selftests-x86_64-rhel-e10=
3a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/testing/selftests/bpf/
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d=
2b3a34ce3de6f4652e597e09e118fa0c/tools/lib/bpf'
>
> Auto-detecting system features:
> ...                        libelf: [ =1B[32mon=1B[m  ]
> ...                           bpf: [ =1B[32mon=1B[m  ]
>
>    HOSTCC   /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/fixdep.o
>    HOSTLD   /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/fixdep-in.o
>    LINK     /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/fixdep
>    CC       /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/libbpf.o
>    CC       /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/bpf.o
>    CC       /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/nlattr.o
>    CC       /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/btf.o
>    LD       /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/libbpf-in.o
>    LINK     /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/libbpf.a
>    LINK     /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652=
e597e09e118fa0c/tools/testing/selftests/bpf/libbpf.so
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-e103a45d2=
b3a34ce3de6f4652e597e09e118fa0c/tools/lib/bpf'
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_verifier.c /usr/=
src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/too=
ls/testing/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/src/pe=
rf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/tes=
ting/selftests/bpf/test_verifier
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_tag.c /usr/src/p=
erf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/te=
sting/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/src/perf_se=
lftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/testing/=
selftests/bpf/test_tag
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_maps.c /usr/src/=
perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/t=
esting/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/src/perf_s=
elftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/testing=
/selftests/bpf/test_maps
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_lru_map.c /usr/s=
rc/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tool=
s/testing/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/src/per=
f_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/test=
ing/selftests/bpf/test_lru_map
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_lpm_map.c /usr/s=
rc/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tool=
s/testing/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/src/per=
f_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/test=
ing/selftests/bpf/test_lpm_map
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_progs.c /usr/src=
/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/=
testing/selftests/bpf/libbpf.a trace_helpers.c -lcap -lelf -lrt -lpthread -=
o /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118f=
a0c/tools/testing/selftests/bpf/test_progs
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_align.c /usr/src=
/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/=
testing/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/src/perf_=
selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/testin=
g/selftests/bpf/test_align
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_verifier_log.c /=
usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c=
/tools/testing/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/sr=
c/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools=
/testing/selftests/bpf/test_verifier_log
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_dev_cgroup.c /us=
r/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/t=
ools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpth=
read -o /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e0=
9e118fa0c/tools/testing/selftests/bpf/test_dev_cgroup
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_tcpbpf_user.c /u=
sr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/=
tools/testing/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/src=
/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/=
testing/selftests/bpf/test_tcpbpf_user
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_sock.c /usr/src/=
perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/t=
esting/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -=
o /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118f=
a0c/tools/testing/selftests/bpf/test_sock
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_btf.c /usr/src/p=
erf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/te=
sting/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /usr/src/perf_se=
lftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/testing/=
selftests/bpf/test_btf
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf -=
I../../../../include/generated  -I../../../include    test_sockmap.c /usr/s=
rc/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e118fa0c/tool=
s/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthrea=
d -o /usr/src/perf_selftests-x86_64-rhel-e103a45d2b3a34ce3de6f4652e597e09e1=
18fa0c/tools/testing/selftests/bpf/test_sockmap
> ../lib.mk:140: recipe for target '/usr/src/perf_selftests-x86_64-rhel-e10=
3a45d2b3a34ce3de6f4652e597e09e118fa0c/tools/testing/selftests/bpf/test_sock=
map' failed
>
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
>
>
>
> Thanks,
> Rong, Chen
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============2543933138724406545==--

