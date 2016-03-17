Content-Type: multipart/mixed; boundary="===============8295484780158292856=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [x86/tlb] ff9b625d26: stderr.Run:"Process_Creation":Fork_failed_at_iteration in unixbench test
Date: Thu, 17 Mar 2016 14:00:38 +0800
Message-ID: <20160317060037.GD1670@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8295484780158292856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed stderr.Run:"Process_Creation":Fork_failed_at_iteration in u=
nixbench test on

https://github.com/alexshi/power-scheduling.git x86-tlb
commit ff9b625d26ba7750745d235dc6f1792fb36fea48 ("x86/tlb: just do tlb flus=
h on one of siblings of SMT")

2016-03-17 06:04:39 ./Run spawn -c 1

   #    #  #    #  #  #    #          #####   ######  #    #   ####   #    #
   #    #  ##   #  #   #  #           #    #  #       ##   #  #    #  #    #
   #    #  # #  #  #    ##            #####   #####   # #  #  #       ######
   #    #  #  # #  #    ##            #    #  #       #  # #  #       #    #
   #    #  #   ##  #   #  #           #    #  #       #   ##  #    #  #    #
    ####   #    #  #  #    #          #####   ######  #    #   ####   #    #

   Version 5.1.3                      Based on the Byte Magazine Unix Bench=
mark

   Multi-CPU version                  Version 5 revisions by Ian Smith,
                                      Sunnyvale, CA, USA
   January 13, 2011                   johantheghost at yahoo period com


1 x Process Creation  1


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-d0=
2/spawn/unixbench

commit: =

  v4.5
  ff9b625d26ba7750745d235dc6f1792fb36fea48

            v4.5 ff9b625d26ba7750745d235dc6 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4          100%           4:4     last_state.failed
           :4          100%           4:4     last_state.is_incomplete_run
           :4          100%           4:4     last_state.unixbench.exit_cod=
e.1
           :4          100%           4:4     stderr.**********************=
************************
           :4           50%           2:4     stderr.Reason:Success;aborting
           :4          100%           4:4     stderr.Run:"Process_Creation"=
:Fork_failed_at_iteration
           :4           50%           2:4     stderr.Segmentation_fault;abo=
rting

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-d0=
4/spawn/unixbench

commit: =

  v4.5
  ff9b625d26ba7750745d235dc6f1792fb36fea48

            v4.5 ff9b625d26ba7750745d235dc6 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :8          100%           8:8     last_state.failed
           :8          100%           8:8     last_state.is_incomplete_run
           :8          100%           8:8     last_state.unixbench.exit_cod=
e.1
           :8          100%           8:8     stderr.**********************=
************************
           :8           12%           1:8     stderr.Aborted;aborting
           :8           62%           5:8     stderr.Reason:Success;aborting
           :8           75%           6:8     stderr.Run:"Process_Creation"=
:Fork_failed_at_iteration
           :8           12%           1:8     stderr.Run:"Process_Creation"=
:Segmentation_fault;aborting
           :8           12%           1:8     stderr.Run:"Process_Creation"=
:spawn:../nptl/sysdeps/unix/sysv/linux/x86_64/../fork.c:#:__libc_fork:Asser=
tion`({__typeof(({struct_pthread*__self;asm("mov%%fs:%c1,%#":"=3Dr"(__self)=
:"i"(__builtin_offsetof(struct_pthread,header.self)));__self;})->tid)__valu=
e;if(sizeof(__value)=3D=3D#)asm_volatile("movb%%fs:%P2,%b0":"=3Dq"(__value)=
:"#"(#),"i"(__builtin_offsetof(struct_pthread,tid)));else_if(sizeof(__value=
)=3D=3D#)asm_volatile("movl%%fs:%P1,%#":"=3Dr"(__value):"i"(__builtin_offse=
tof(struct_pthread,tid)));else{if(sizeof(__value)!=3D#)abort();asm_volatile=
("movq%%fs:%P1,%q0":"=3Dr"(__value):"i"(__builtin_offsetof(struct_pthread,t=
id)));}__value;})=3D=3Dppid'failed
           :8           12%           1:8     stderr.Segmentation_fault;abo=
rting

lkp-ivb-d02: Ivy Bridge
Memory: 8G

lkp-ivb-d04: Ivy Bridge
Memory: 4G


To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Xiaolong Ye

--===============8295484780158292856==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZv
cm1hbmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29t
bWl0OiBmZjliNjI1ZDI2YmE3NzUwNzQ1ZDIzNWRjNmYxNzkyZmIzNmZlYTQ4Cm1vZGVsOiBJdnkg
QnJpZGdlCm5yX2NwdTogNAptZW1vcnk6IDhHCm5yX2hkZF9wYXJ0aXRpb25zOiAxCmhkZF9wYXJ0
aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDEwMDBETTAwMy0xQ0gxNjJfWjFEQlFTQjAt
cGFydDEiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QxMDAwRE0wMDMt
MUNIMTYyX1oxREJRU0IwLXBhcnQzIgpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlk
L2F0YS1TVDEwMDBETTAwMy0xQ0gxNjJfWjFEQlFTQjAtcGFydDQiCm5ldGNvbnNvbGVfcG9ydDog
NjY3MjMKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90YXNrOiAxCnVuaXhiZW5jaDoKICB0ZXN0OiBz
cGF3bgpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1pdmItZDAyCnRib3hfZ3JvdXA6IGxrcC1p
dmItZDAyCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wMy0xNyAwNTo0
NDozMS45NDE3MDg2MDAgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnegppZDogYWIwNTg2M2RiMzcyOTcxNmZhNWVmNzIzMDliYmQwMDc2
MDA1Mzg5NAp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IDk0YzMxNjkzNWUyNmIxMTAzMDAzYWM3MzY0
N2JjMjZjNGZkZjNmNzAKYmFzZV9jb21taXQ6IGI1NjJlNDRmNTA3ZTg2M2M2NzkyOTQ2ZTRlMWIx
NDQ5ZmJiYWM4NWQKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAzMTYyMgpy
ZXN1bHRfcm9vdDogIi9yZXN1bHQvdW5peGJlbmNoL3BlcmZvcm1hbmNlLTEtc3Bhd24vbGtwLWl2
Yi1kMDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2Zm
OWI2MjVkMjZiYTc3NTA3NDVkMjM1ZGM2ZjE3OTJmYjM2ZmVhNDgvMCIKam9iX2ZpbGU6ICIvbGtw
L3NjaGVkdWxlZC9sa3AtaXZiLWQwMi9iaXNlY3RfdW5peGJlbmNoLXBlcmZvcm1hbmNlLTEtc3Bh
d24tZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC1mZjliNjI1ZDI2YmE3
NzUwNzQ1ZDIzNWRjNmYxNzkyZmIzNmZlYTQ4LTIwMTYwMzE3LTUxNTM4LTFibzNmMXEtMC55YW1s
IgptYXhfdXB0aW1lOiA4MzEuNTYKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0g
dXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLWl2Yi1kMDIvYmlzZWN0X3VuaXhiZW5j
aC1wZXJmb3JtYW5jZS0xLXNwYXduLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0
LXJoZWwtZmY5YjYyNWQyNmJhNzc1MDc0NWQyMzVkYzZmMTc5MmZiMzZmZWE0OC0yMDE2MDMxNy01
MTUzOC0xYm8zZjFxLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAot
IGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAzMTYyMgotIGNvbW1pdD1mZjli
NjI1ZDI2YmE3NzUwNzQ1ZDIzNWRjNmYxNzkyZmIzNmZlYTQ4Ci0gQk9PVF9JTUFHRT0vcGtnL2xp
bnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZmY5YjYyNWQyNmJhNzc1MDc0NWQyMzVkYzZmMTc5MmZi
MzZmZWE0OC92bWxpbnV6LTQuNS4wLTAwMDAxLWdmZjliNjI1Ci0gbWF4X3VwdGltZT04MzEKLSBS
RVNVTFRfUk9PVD0vcmVzdWx0L3VuaXhiZW5jaC9wZXJmb3JtYW5jZS0xLXNwYXduL2xrcC1pdmIt
ZDAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9mZjli
NjI1ZDI2YmE3NzUwNzQ1ZDIzNWRjNmYxNzkyZmIzNmZlYTQ4LzAKLSBMS1BfU0VSVkVSPWlubgot
IHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgog
IGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9z
dGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hk
b2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29u
c29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRy
ZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS9mZjliNjI1ZDI2YmE3NzUwNzQ1ZDIzNWRjNmYxNzkyZmIzNmZl
YTQ4L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwv
bGtwL2JlbmNobWFya3MvdW5peGJlbmNoLmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZmY5YjYyNWQyNmJhNzc1MDc0NWQyMzVkYzZmMTc5
MmZiMzZmZWE0OC9saW51eC1oZWFkZXJzLmNneiIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45L2ZmOWI2MjVkMjZiYTc3NTA3NDVkMjM1ZGM2ZjE3OTJmYjM2ZmVhNDgvdm1s
aW51ei00LjUuMC0wMDAwMS1nZmY5YjYyNSIKZGVxdWV1ZV90aW1lOiAyMDE2LTAzLTE3IDA2OjA0
OjE3LjA5ODU2ODQ0NyArMDg6MDAKam9iX3N0YXRlOiBmYWlsZWQKbG9hZGF2ZzogMC4yMSAwLjA1
IDAuMDIgMS8xMjEgNDY5OQpzdGFydF90aW1lOiAnMTQ1ODE2NTg3OScKZW5kX3RpbWU6ICcxNDU4
MTY1ODgyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDMxNi0yMTU0MDkiCg==

--===============8295484780158292856==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0xNyAwNjowNDozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xNyAwNjowNDozOCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xNyAwNjowNDozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xNyAwNjowNDozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xNyAwNjowNDozOSAuL1J1biBz
cGF3biAtYyAxCg==

--===============8295484780158292856==--

