Content-Type: multipart/mixed; boundary="===============7004893290497445745=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 638476007d1: +1.1% unixbench.score
Date: Mon, 09 Feb 2015 11:27:35 +0800
Message-ID: <1423452455.5968.47.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7004893290497445745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
commit 638476007d13534b2ed4134bf0279ef44071140b ("sched/fair: Fix the deali=
ng with decay_count in __synchronize_entity_decay()")

It appears that your patch cause CPU usage increased a little, so that unix=
bench score increased.

testbox/testcase/testparams: nhm-white/unixbench/spawn

7f1a169b88f513e3  638476007d13534b2ed4134bf0  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    268908 =C2=B1  0%      +4.6%     281320 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 1.147e+08 =C2=B1  0%      +1.5%  1.164e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
      3607 =C2=B1  0%      +1.1%       3648 =C2=B1  0%  unixbench.score
       324 =C2=B1  0%      +1.2%        328 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
       633 =C2=B1  0%      +1.2%        641 =C2=B1  0%  unixbench.time.syst=
em_time
     54100 =C2=B1  3%     +51.0%      81705 =C2=B1 21%  sched_debug.cpu#4.t=
twu_local
     65678 =C2=B1  7%     +49.5%      98187 =C2=B1 16%  sched_debug.cpu#6.t=
twu_local
      5624 =C2=B1 31%     +52.1%       8553 =C2=B1 11%  sched_debug.cpu#6.c=
urr->pid
        58 =C2=B1 20%     +37.6%         80 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
        61 =C2=B1 10%     +22.5%         74 =C2=B1 14%  sched_debug.cpu#2.c=
pu_load[3]
    218479 =C2=B1  5%     +15.4%     252190 =C2=B1  5%  sched_debug.cpu#6.t=
twu_count
       102 =C2=B1 17%     -19.3%         82 =C2=B1 10%  sched_debug.cpu#4.c=
pu_load[2]
    423974 =C2=B1  4%     +15.6%     490072 =C2=B1  5%  sched_debug.cpu#5.a=
vg_idle
        62 =C2=B1  4%     +16.9%         72 =C2=B1  9%  sched_debug.cpu#2.c=
pu_load[4]
    152298 =C2=B1  2%      +9.7%     167037 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    156795 =C2=B1  1%     +11.3%     174544 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
    155535 =C2=B1  3%     +11.8%     173813 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.min_vruntime
      9231 =C2=B1  0%      +1.3%       9348 =C2=B1  0%  vmstat.system.in

nhm-white: Nehalem
Memory: 6G


                            unixbench.time.system_time

  643 ++---------------------------------------------------------------O---=
-+
  642 ++                    O                                   O          =
 O
      O O  O O  O O O  O O    O  O   O  O O  O   O  O O    O  O   O       O=
 |
  641 ++                           O           O         O           O     =
 |
  640 ++                                                                   =
 |
      |                                                                    =
 |
  639 ++                                                                   =
 |
  638 ++                                                                   =
 |
  637 ++                                                                   =
 |
      |                                                                    =
 |
  636 ++                                                                   =
 |
  635 ++         .*                                                        =
 |
      *.*.. .*..*  +         .*.. .*.*..  *                                =
 |
  634 ++   *        *..*.*..*    *       +                                 =
 |
  633 ++--------------------------------*----------------------------------=
-+


                     unixbench.time.involuntary_context_switches

  286000 ++----------------------------------------------------------------=
-+
  284000 ++                                                 O              =
 |
         |                                                    O    O       =
 |
  282000 ++                                                          O O   =
 O
  280000 O+O    O          O      O      O  O   O  O O    O     O         O=
 |
         |    O      O O O           O O      O        O                   =
 |
  278000 ++       O           O O                                          =
 |
  276000 ++                                                                =
 |
  274000 ++                                                                =
 |
         |                                                                 =
 |
  272000 ++                                                                =
 |
  270000 ++  .*.*.              *.*..      .*                              =
 |
         *.*.     *..*. .*     :     *.*.*.                                =
 |
  268000 ++            *  +    :                                           =
 |
  266000 ++----------------*--*--------------------------------------------=
-+


                       kmsg.tsc:Fast_TSC_calibration_failed

    1 ++-------------------------------------O--------O--------------------=
-+
      |                                                                    =
 |
      |                                                                    =
 |
  0.8 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  0.6 ++                                                                   =
 |
      |                                                                    =
 |
  0.4 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  0.2 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
    0 O+O--O-O--O-O-O--O-O--O-O--O-O-O--O-O----O-O--O----O-O--O-O-O--O-O--O=
-O

        [*] bisect-good sample
        [O] bisect-bad  sample

To reproduce:

        apt-get install ruby ruby-oj
        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/setup-local job.yaml # the job file attached in this email
        bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Huang, Ying



_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============7004893290497445745==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB1bml4YmVuY2gKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVz
dAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51
bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6
IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAog
IGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tz
dGF0czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9z
dGF0OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHRf
d2F0Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOiAK
Y29tbWl0OiBmODc2ZjBjZmY2ZDQ2MGYwM2NkOTM3MTA0MzE0ZjM2NmRmYTkyMjYxCm1vZGVsOiBO
ZWhhbGVtCm1lbW9yeTogNkcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUhp
dGFjaGlfSERUNzIxMDUwU0xBMzYwX1NUSDNEN01FMFlFTTVZLXBhcnQ1CiAgL2Rldi9kaXNrL2J5
LWlkL2F0YS1IaXRhY2hpX0hEVDcyMTA1MFNMQTM2MF9TVEgzRDdNRTBZRU01WS1wYXJ0NiAvZGV2
L2Rpc2svYnktaWQvYXRhLUhpdGFjaGlfSERUNzIxMDUwU0xBMzYwX1NUSDNEN01FMFlFTTVZLXBh
cnQ3CiAgL2Rldi9kaXNrL2J5LWlkL2F0YS1IaXRhY2hpX0hEVDcyMTA1MFNMQTM2MF9TVEgzRDdN
RTBZRU01WS1wYXJ0OCIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtSGl0YWNoaV9IRFQ3MjEwNTBTTEEzNjBfU1RIM0Q3TUUwWUVNNVktcGFy
dDIiCm5ldGNvbnNvbGVfcG9ydDogNjY0Nwp1bml4YmVuY2g6CiAgdGVzdDogc3Bhd24KdGVzdGJv
eDogbmhtLXdoaXRlCnRib3hfZ3JvdXA6IG5obS13aGl0ZQprY29uZmlnOiB4ODZfNjQtcmhlbApl
bnF1ZXVlX3RpbWU6IDIwMTUtMDItMDcgMTA6MzM6NTguMDYyODI0MTMxICswODowMApoZWFkX2Nv
bW1pdDogZjg3NmYwY2ZmNmQ0NjBmMDNjZDkzNzEwNDMxNGYzNjZkZmE5MjI2MQpiYXNlX2NvbW1p
dDogZTM2ZjAxNGVkZmY3MGZjMDJiM2QzZDc5Y2VhZDFkNThmMjg5MzMyZQpicmFuY2g6IGxpbnV4
LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDIwNTIyCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJo
ZWwvZjg3NmYwY2ZmNmQ0NjBmMDNjZDkzNzEwNDMxNGYzNjZkZmE5MjI2MS92bWxpbnV6LTMuMTku
MC1yYzctZ2Y4NzZmMGMiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJvb3RmczogZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvbmhtLXdoaXRlL3VuaXhi
ZW5jaC9zcGF3bi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2Y4NzZm
MGNmZjZkNDYwZjAzY2Q5MzcxMDQzMTRmMzY2ZGZhOTIyNjEvMCIKam9iX2ZpbGU6ICIvbGtwL3Nj
aGVkdWxlZC9uaG0td2hpdGUvY3ljbGljX3VuaXhiZW5jaC1zcGF3bi14ODZfNjQtcmhlbC1IRUFE
LWY4NzZmMGNmZjZkNDYwZjAzY2Q5MzcxMDQzMTRmMzY2ZGZhOTIyNjEtMC0yMDE1MDIwNy0yMDM0
LWl1d3k0MC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDItMDcgMTc6MDI6NDkuMDQ1NjQ4MzAy
ICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA0
LjUyIDEuOTcgMC43NCAxLzE1MSAyNDIwNApzdGFydF90aW1lOiAnMTQyMzI5OTc5MycKZW5kX3Rp
bWU6ICcxNDIzMjk5OTkxJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDIwNy0wMzAyMTIi
Cg==

--===============7004893290497445745==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9SdW4gc3Bhd24K

--===============7004893290497445745==--

