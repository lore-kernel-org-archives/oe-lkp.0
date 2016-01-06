Content-Type: multipart/mixed; boundary="===============1214275826312634402=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [rcu] b8084f70e0: No primary result change, 1414.7% unixbench.time.involuntary_context_switches
Date: Wed, 06 Jan 2016 10:47:43 +0800
Message-ID: <878u43fmpc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1214275826312634402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git for-k=
build-bot/current-stable
commit b8084f70e028697b342d6388b244d6171717fc54 ("rcu: Eliminate softirq pr=
ocessing from rcutree")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-d0=
2/fsbuffer/unixbench

commit: =

  ee644236a506642e20637f954d286f49a76ed83a
  b8084f70e028697b342d6388b244d6171717fc54

ee644236a506642e b8084f70e028697b342d6388b2 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    257.25 =C2=B1 18%   +1414.7%       3896 =C2=B1 13%  unixbench.time.invo=
luntary_context_switches
   4425148 =C2=B1 22%     -61.9%    1684712 =C2=B1 29%  cpuidle.C1E-IVB.time
     83.75 =C2=B1 48%     +91.6%     160.50 =C2=B1 31%  cpuidle.POLL.usage
      1902 =C2=B1  7%     -12.0%       1674 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
      1902 =C2=B1  7%     -12.0%       1674 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
    257.25 =C2=B1 18%   +1414.7%       3896 =C2=B1 13%  time.involuntary_co=
ntext_switches
      8.15 =C2=B1  6%     -14.1%       7.00 =C2=B1  1%  time.user_time
     34345 =C2=B1 14%     -33.3%      22908 =C2=B1 33%  sched_debug.cfs_rq:=
/.exec_clock.2
     34987 =C2=B1 13%     -19.7%      28093 =C2=B1 15%  sched_debug.cfs_rq:=
/.exec_clock.max
    642.75 =C2=B1  5%     +59.6%       1025 =C2=B1 55%  sched_debug.cfs_rq:=
/.exec_clock.min
     14639 =C2=B1 13%     -21.8%      11443 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.stddev
    127.75 =C2=B1 16%     -26.2%      94.25 =C2=B1 25%  sched_debug.cfs_rq:=
/.load_avg.3
     38865 =C2=B1 12%     -36.0%      24885 =C2=B1 34%  sched_debug.cfs_rq:=
/.min_vruntime.2
     39385 =C2=B1 12%     -22.8%      30395 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.max
      1090 =C2=B1 11%     +45.3%       1584 =C2=B1 32%  sched_debug.cfs_rq:=
/.min_vruntime.min
     16286 =C2=B1 13%     -25.1%      12200 =C2=B1 18%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      2.00 =C2=B1  0%     -50.0%       1.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.nr_spread_over.0
      2.00 =C2=B1  0%     -50.0%       1.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      0.87 =C2=B1  0%     -42.3%       0.50 =C2=B1  0%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     28.50 =C2=B1 62%    +338.6%     125.00 =C2=B1114%  sched_debug.cfs_rq:=
/.runnable_load_avg.1
     16286 =C2=B1 13%     -25.1%      12200 =C2=B1 18%  sched_debug.cfs_rq:=
/.spread0.stddev
    127.75 =C2=B1 16%     -26.0%      94.50 =C2=B1 25%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.3
    626662 =C2=B1  5%     -13.2%     544121 =C2=B1  9%  sched_debug.cpu.avg=
_idle.0
     20.25 =C2=B1 28%    +419.8%     105.25 =C2=B1132%  sched_debug.cpu.cpu=
_load[3].1
    692.40 =C2=B1  7%     -15.2%     586.96 =C2=B1  9%  sched_debug.cpu.cur=
r->pid.avg
     36187 =C2=B1 12%     -31.5%      24793 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.2
     15625 =C2=B1 11%     +61.6%      25245 =C2=B1 23%  sched_debug.cpu.nr_=
switches.0
     20008 =C2=B1  4%     +14.1%      22828 =C2=B1  4%  sched_debug.cpu.nr_=
switches.avg
     23333 =C2=B1  8%     +40.9%      32872 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.0
     21974 =C2=B1  4%     +12.7%      24771 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.avg
     31771 =C2=B1  9%     +22.6%      38942 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.max
      9514 =C2=B1 28%     +75.8%      16728 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.0
      4323 =C2=B1 10%     +40.6%       6080 =C2=B1 30%  sched_debug.cpu.ttw=
u_count.2
     10068 =C2=B1  4%     +15.6%      11639 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.avg
      4101 =C2=B1 10%     +21.7%       4990 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.min
      3676 =C2=B1 21%    +102.5%       7443 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.0
      2014 =C2=B1 15%     +43.2%       2884 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.2
      3508 =C2=B1  1%     +24.8%       4377 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.avg
      5554 =C2=B1 19%     +34.0%       7444 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.max
      1846 =C2=B1 16%     +40.2%       2588 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.min

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-d0=
2/fsdisk/unixbench

commit: =

  ee644236a506642e20637f954d286f49a76ed83a
  b8084f70e028697b342d6388b244d6171717fc54

ee644236a506642e b8084f70e028697b342d6388b2 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           25%           1:4     kmsg.DHCP/BOOTP:Reply_not_for=
_us,op[#]xid[#]
         %stddev     %change         %stddev
             \          |                \  =

    265.75 =C2=B1 18%   +1313.4%       3756 =C2=B1  9%  unixbench.time.invo=
luntary_context_switches
    659.50 =C2=B1  6%     +16.5%     768.00 =C2=B1  7%  slabinfo.kmalloc-51=
2.num_objs
    265.75 =C2=B1 18%   +1313.4%       3756 =C2=B1  9%  time.involuntary_co=
ntext_switches
   5911312 =C2=B1 13%     -55.9%    2606719 =C2=B1 10%  cpuidle.C1E-IVB.time
     95195 =C2=B1172%    +815.7%     871684 =C2=B1140%  cpuidle.POLL.time
     51.75 =C2=B1 10%     -30.9%      35.75 =C2=B1 24%  cpuidle.POLL.usage
     13361 =C2=B1 22%     -27.0%       9754 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     14632 =C2=B1 24%     -28.1%      10524 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
     14632 =C2=B1 24%     -28.1%      10524 =C2=B1  5%  sched_debug.cfs_rq:=
/.spread0.stddev
    197.25 =C2=B1 14%     +52.9%     301.50 =C2=B1 41%  sched_debug.cfs_rq:=
/.util_avg.0
    552666 =C2=B1  8%      -7.7%     510200 =C2=B1  7%  sched_debug.cpu.avg=
_idle.1
     13610 =C2=B1 30%     +59.7%      21734 =C2=B1  7%  sched_debug.cpu.nr_=
switches.0
     21145 =C2=B1  1%     +12.3%      23752 =C2=B1  7%  sched_debug.cpu.nr_=
switches.avg
     10105 =C2=B1 21%     +62.1%      16380 =C2=B1  7%  sched_debug.cpu.nr_=
switches.min
     11293 =C2=B1 28%     -44.4%       6276 =C2=B1 16%  sched_debug.cpu.nr_=
switches.stddev
     21314 =C2=B1 19%     +38.1%      29437 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.0
     11261 =C2=B1 22%     +57.2%      17703 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.min
     11158 =C2=B1 27%     -36.7%       7068 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.stddev
      5854 =C2=B1 35%     +57.0%       9194 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.0
      3713 =C2=B1 27%     +68.4%       6253 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.min
      5638 =C2=B1 29%     -44.5%       3131 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.stddev
      8286 =C2=B1 32%     +85.0%      15333 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.0
     10697 =C2=B1  1%     +13.2%      12107 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.avg
      4845 =C2=B1  5%     +17.8%       5707 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.min
      2886 =C2=B1 47%    +105.5%       5931 =C2=B1 16%  sched_debug.cpu.ttw=
u_local.0
      3667 =C2=B1  3%     +17.0%       4291 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.avg
      2127 =C2=B1 17%     +29.2%       2748 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.min


lkp-ivb-d02: Ivy Bridge
Memory: 8G

                    unixbench.time.involuntary_context_switches

  5000 ++------------------------------------------------------------------=
-+
  4500 O+                                                                  =
 |
       |                O              O      O            O               =
 O
  4000 ++                            O                            O  O     =
 |
  3500 ++O  O O  O    O           O         O                O  O      O  O=
 |
       |                   O    O         O                                =
 |
  3000 ++                                          O    O                  =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 ++                                                                  =
 |
       |.*.. .*..         .*.  .*.*..             .*..                     =
 |
   500 *+   *    *.*..*.*.   *.       .*.. .*.*..*    *.*..*.*             =
 |
     0 ++----------O---------O-------*----*------O----O--------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

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
Ying Huang

--===============1214275826312634402==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogYjgwODRmNzBl
MDI4Njk3YjM0MmQ2Mzg4YjI0NGQ2MTcxNzE3ZmM1NAptb2RlbDogSXZ5IEJyaWRnZQpucl9jcHU6
IDQKbWVtb3J5OiA4Rwpucl9oZGRfcGFydGl0aW9uczogMQpoZGRfcGFydGl0aW9uczogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtU1QxMDAwRE0wMDMtMUNIMTYyX1oxREJRU0IwLXBhcnQxIgpzd2FwX3Bh
cnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVNUMTAwMERNMDAzLTFDSDE2Ml9aMURCUVNC
MC1wYXJ0MyIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QxMDAwRE0w
MDMtMUNIMTYyX1oxREJRU0IwLXBhcnQ0IgpuZXRjb25zb2xlX3BvcnQ6IDY2NzIzCmNhdGVnb3J5
OiBiZW5jaG1hcmsKbnJfdGFzazogMQp1bml4YmVuY2g6CiAgdGVzdDogZnNkaXNrCnF1ZXVlOiBi
aXNlY3QKdGVzdGJveDogbGtwLWl2Yi1kMDIKdGJveF9ncm91cDogbGtwLWl2Yi1kMDIKa2NvbmZp
ZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAxLTA1IDE2OjI0OjExLjQ2ODY2MDM2
MCArMDg6MDAKaWQ6IDYyYzQzNDM0Mzc4ZWY1MGI5NWZjZDQ5NzM3NTlkYWY2NmExNDg3MzQKdXNl
cjogbGtwCmNvbXBpbGVyOiBnY2MtNC45CmhlYWRfY29tbWl0OiA1YmFlNzkxZTViYjg4OTVhYzNk
NjU2MzQyMzFjOTlkNzlhMGUwMDAyCmJhc2VfY29tbWl0OiAxNjgzMDk4NTVhN2QxZTE2ZGI3NTFl
OWM2NDcxMTlmZTJkMmRjODc4CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYw
MTA1MDIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAi
L3Jlc3VsdC91bml4YmVuY2gvcGVyZm9ybWFuY2UtMS1mc2Rpc2svbGtwLWl2Yi1kMDIvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2I4MDg0ZjcwZTAyODY5
N2IzNDJkNjM4OGIyNDRkNjE3MTcxN2ZjNTQvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9s
a3AtaXZiLWQwMi9iaXNlY3RfdW5peGJlbmNoLXBlcmZvcm1hbmNlLTEtZnNkaXNrLWRlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtYjgwODRmNzBlMDI4Njk3YjM0MmQ2Mzg4
YjI0NGQ2MTcxNzE3ZmM1NC0yMDE2MDEwNS04OTAyNy0xOTNvYWxhLTAueWFtbCIKbWF4X3VwdGlt
ZTogOTIyLjA5OTk5OTk5OTk5OTkKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0g
dXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLWl2Yi1kMDIvYmlzZWN0X3VuaXhiZW5j
aC1wZXJmb3JtYW5jZS0xLWZzZGlzay1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82
NC1yaGVsLWI4MDg0ZjcwZTAyODY5N2IzNDJkNjM4OGIyNDRkNjE3MTcxN2ZjNTQtMjAxNjAxMDUt
ODkwMjctMTkzb2FsYS0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwK
LSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMTA1MDIKLSBjb21taXQ9Yjgw
ODRmNzBlMDI4Njk3YjM0MmQ2Mzg4YjI0NGQ2MTcxNzE3ZmM1NAotIEJPT1RfSU1BR0U9L3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2I4MDg0ZjcwZTAyODY5N2IzNDJkNjM4OGIyNDRkNjE3
MTcxN2ZjNTQvdm1saW51ei00LjQuMC1yYzYtMDAyMzYtZ2I4MDg0ZjcKLSBtYXhfdXB0aW1lPTky
MgotIFJFU1VMVF9ST09UPS9yZXN1bHQvdW5peGJlbmNoL3BlcmZvcm1hbmNlLTEtZnNkaXNrL2xr
cC1pdmItZDAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQu
OS9iODA4NGY3MGUwMjg2OTdiMzQyZDYzODhiMjQ0ZDYxNzE3MTdmYzU0LzAKLSBMS1BfU0VSVkVS
PWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVs
PWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1
X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlf
d2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0w
CiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtw
X2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iODA4NGY3MGUwMjg2OTdiMzQyZDYzODhiMjQ0ZDYx
NzE3MTdmYzU0L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0
LmNneiwvbGtwL2JlbmNobWFya3MvdW5peGJlbmNoLmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6
ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYjgwODRmNzBlMDI4Njk3YjM0MmQ2Mzg4
YjI0NGQ2MTcxNzE3ZmM1NC9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDog
Ii9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iODA4NGY3MGUwMjg2OTdiMzQyZDYzODhi
MjQ0ZDYxNzE3MTdmYzU0L3ZtbGludXotNC40LjAtcmM2LTAwMjM2LWdiODA4NGY3IgpkZXF1ZXVl
X3RpbWU6IDIwMTYtMDEtMDUgMTY6Mzk6NDcuNzA2NDQwNDYxICswODowMApqb2Jfc3RhdGU6IGZp
bmlzaGVkCmxvYWRhdmc6IDAuNTggMC4yNSAwLjEwIDEvMTIzIDI2ODkKc3RhcnRfdGltZTogJzE0
NTE5ODMyMDknCmVuZF90aW1lOiAnMTQ1MTk4MzM1MycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMt
MjAxNjAxMDUtMTYyMTI1Igo=

--===============1214275826312634402==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0wNSAxNjo0MDowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAxNjo0MDowOCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAxNjo0MDowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
MS0wNSAxNjo0MDowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAxNjo0MDowOSAuL1J1biBm
c2Rpc2sgLWMgMQo=

--===============1214275826312634402==--

