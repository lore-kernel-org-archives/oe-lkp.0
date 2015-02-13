Content-Type: multipart/mixed; boundary="===============1162571395905517403=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mmu_gather] fb7332a9fed: +5.4% tlbflush.mem_acc_time_thread_ms -6.2% will-it-scale.per_thread_ops
Date: Fri, 13 Feb 2015 13:37:12 +0800
Message-ID: <1423805832.5968.138.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1162571395905517403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit fb7332a9fedfd62b1ba6530c86f39f0fa38afd49 ("mmu_gather: move minimal =
range calculations into generic code")


testbox/testcase/testparams: ivb42/will-it-scale/performance-brk1

63648dd20fa0780a  fb7332a9fedfd62b1ba6530c86  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    733067 =C2=B1  0%      -6.2%     687433 =C2=B1  0%  will-it-scale.per_t=
hread_ops
   3728462 =C2=B1  0%      -5.7%    3516927 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.46 =C2=B1  0%      -3.3%       0.44 =C2=B1  0%  will-it-scale.scala=
bility
    140435 =C2=B1 22%     -75.2%      34877 =C2=B1 32%  sched_debug.cpu#19.=
ttwu_count
        85 =C2=B1 32%    +144.6%        208 =C2=B1 30%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
    892437 =C2=B1 34%     -55.5%     397177 =C2=B1 16%  sched_debug.cpu#5.n=
r_switches
    445593 =C2=B1 34%     -55.5%     198460 =C2=B1 16%  sched_debug.cpu#5.s=
ched_goidle
        92 =C2=B1 29%    +136.7%        219 =C2=B1 29%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    374967 =C2=B1 14%     -56.3%     163891 =C2=B1 35%  sched_debug.cpu#5.t=
twu_count
    924309 =C2=B1 32%     -51.0%     452960 =C2=B1  9%  sched_debug.cpu#5.s=
ched_count
        90 =C2=B1 41%     +78.2%        161 =C2=B1 18%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
    205529 =C2=B1 15%     -38.3%     126863 =C2=B1 32%  sched_debug.cpu#40.=
ttwu_count
      1152 =C2=B1 33%     +50.4%       1734 =C2=B1 22%  sched_debug.cpu#13.=
ttwu_local
      3.44 =C2=B1 38%     +86.6%       6.42 =C2=B1 18%  perf-profile.cpu-cy=
cles.rwsem_spin_on_owner.rwsem_down_write_failed.call_rwsem_down_write_fail=
ed.sys_brk.system_call_fastpath
         6 =C2=B1 39%    +100.0%         13 =C2=B1  9%  sched_debug.cpu#2.c=
pu_load[0]
      1.03 =C2=B1 11%     +46.6%       1.52 =C2=B1 12%  perf-profile.cpu-cy=
cles.find_vma.do_munmap.sys_brk.system_call_fastpath.brk
      0.76 =C2=B1 32%     +65.2%       1.26 =C2=B1 14%  perf-profile.cpu-cy=
cles.up_write.vma_adjust.vma_merge.do_brk.sys_brk
    538886 =C2=B1 38%     +70.3%     917481 =C2=B1 20%  sched_debug.cpu#26.=
ttwu_count
      0.76 =C2=B1 21%     +69.6%       1.28 =C2=B1 14%  perf-profile.cpu-cy=
cles.find_vma.sys_brk.system_call_fastpath.brk
        16 =C2=B1  5%     +25.8%         20 =C2=B1 18%  sched_debug.cpu#30.=
cpu_load[1]
      2224 =C2=B1 11%     +21.8%       2709 =C2=B1 16%  sched_debug.cpu#41.=
curr->pid
      3.94 =C2=B1  9%     -30.5%       2.74 =C2=B1 17%  perf-profile.cpu-cy=
cles._raw_spin_lock.try_to_wake_up.wake_up_process.__rwsem_do_wake.rwsem_wa=
ke
        28 =C2=B1 14%     -32.1%         19 =C2=B1 14%  sched_debug.cfs_rq[=
25]:/.load
        16 =C2=B1  4%     +25.0%         20 =C2=B1 12%  sched_debug.cpu#32.=
cpu_load[2]
        17 =C2=B1 16%     +20.3%         20 =C2=B1 10%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
    180505 =C2=B1 26%     -43.4%     102128 =C2=B1 18%  sched_debug.cpu#44.=
ttwu_count
      2135 =C2=B1  7%     +28.7%       2747 =C2=B1 22%  sched_debug.cpu#44.=
curr->pid
     13.14 =C2=B1 10%     +20.4%      15.82 =C2=B1  5%  perf-profile.cpu-cy=
cles.call_rwsem_down_write_failed.sys_brk.system_call_fastpath.brk
     13.05 =C2=B1 10%     +20.4%      15.71 =C2=B1  5%  perf-profile.cpu-cy=
cles.rwsem_down_write_failed.call_rwsem_down_write_failed.sys_brk.system_ca=
ll_fastpath.brk
      2.30 =C2=B1 10%     +24.1%       2.86 =C2=B1  7%  perf-profile.cpu-cy=
cles.vma_adjust.vma_merge.do_brk.sys_brk.system_call_fastpath
      1.70 =C2=B1  6%     -13.2%       1.47 =C2=B1 11%  perf-profile.cpu-cy=
cles.clockevents_program_event.tick_program_event.__hrtimer_start_range_ns.=
hrtimer_start_range_ns.tick_nohz_restart
      5512 =C2=B1  1%     +27.7%       7040 =C2=B1 22%  sched_debug.cfs_rq[=
20]:/.exec_clock
        17 =C2=B1  5%     -30.9%         11 =C2=B1 32%  sched_debug.cpu#40.=
load
      2.73 =C2=B1  9%     +21.0%       3.30 =C2=B1  7%  perf-profile.cpu-cy=
cles.vma_merge.do_brk.sys_brk.system_call_fastpath.brk
    505131 =C2=B1 13%     +26.4%     638526 =C2=B1  7%  sched_debug.cpu#32.=
ttwu_count
      1.09 =C2=B1  7%     -14.9%       0.93 =C2=B1 11%  perf-profile.cpu-cy=
cles._raw_spin_unlock_irqrestore.rwsem_wake.call_rwsem_wake.sys_brk.system_=
call_fastpath
        16 =C2=B1  2%     +13.8%         18 =C2=B1  8%  sched_debug.cpu#32.=
cpu_load[3]
      1.73 =C2=B1  6%     -12.5%       1.52 =C2=B1 11%  perf-profile.cpu-cy=
cles.tick_program_event.__hrtimer_start_range_ns.hrtimer_start_range_ns.tic=
k_nohz_restart.tick_nohz_idle_exit
      1.89 =C2=B1  5%     -12.2%       1.66 =C2=B1  1%  perf-profile.cpu-cy=
cles.set_next_entity.pick_next_task_fair.__sched_text_start.schedule_preemp=
t_disabled.cpu_startup_entry
     17.50 =C2=B1  5%     -14.4%      14.98 =C2=B1  6%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_w=
ake
     18.55 =C2=B1  5%     -13.8%      16.00 =C2=B1  6%  perf-profile.cpu-cy=
cles.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.sys_brk
       229 =C2=B1  6%     -10.5%        205 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     10557 =C2=B1  6%     -10.2%       9478 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     18.66 =C2=B1  5%     -13.4%      16.16 =C2=B1  5%  perf-profile.cpu-cy=
cles.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.sys_brk.system_call_fastpath
    745968 =C2=B1  4%      +9.1%     813977 =C2=B1  5%  sched_debug.cpu#10.=
avg_idle
      3.53 =C2=B1  2%     +13.0%       3.98 =C2=B1  5%  perf-profile.cpu-cy=
cles.unmap_region.do_munmap.sys_brk.system_call_fastpath.brk
    738761 =C2=B1  5%     +13.5%     838441 =C2=B1  3%  sched_debug.cpu#2.a=
vg_idle
     21.09 =C2=B1  5%     -13.4%      18.27 =C2=B1  6%  perf-profile.cpu-cy=
cles.rwsem_wake.call_rwsem_wake.sys_brk.system_call_fastpath.brk
        16 =C2=B1  6%     +12.1%         18 =C2=B1  2%  sched_debug.cpu#29.=
cpu_load[2]
     21.21 =C2=B1  5%     -13.2%      18.40 =C2=B1  6%  perf-profile.cpu-cy=
cles.call_rwsem_wake.sys_brk.system_call_fastpath.brk
     11.09 =C2=B1  3%     +11.3%      12.35 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_munmap.sys_brk.system_call_fastpath.brk
    678615 =C2=B1  4%      +7.4%     728663 =C2=B1  3%  sched_debug.cpu#25.=
avg_idle
      2757 =C2=B1  5%      -7.4%       2551 =C2=B1  2%  sched_debug.cpu#25.=
curr->pid
       885 =C2=B1 11%     +22.0%       1080 =C2=B1 11%  slabinfo.RAW.num_ob=
js
       885 =C2=B1 11%     +22.0%       1080 =C2=B1 11%  slabinfo.RAW.active=
_objs
      2528 =C2=B1  3%      +4.7%       2647 =C2=B1  5%  sched_debug.cpu#35.=
curr->pid
       230 =C2=B1  4%     -10.0%        207 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib

testbox/testcase/testparams: lkp-t410/tlbflush/performance-200%-32x-512

63648dd20fa0780a  fb7332a9fedfd62b1ba6530c86  =

----------------  --------------------------  =

       113 =C2=B1  0%      -5.5%        107 =C2=B1  0%  tlbflush.mem_acc_co=
st_ns_time
      8758 =C2=B1  0%      +5.4%       9227 =C2=B1  0%  tlbflush.mem_acc_ti=
me_thread_ms
      3314 =C2=B1 11%     -21.2%       2610 =C2=B1 15%  slabinfo.anon_vma.n=
um_objs

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

lkp-t410: Westmere
Memory: 2G




                          tlbflush.mem_acc_time_thread_ms

  9300 ++-O-------------------O--------O-------------------O---------------=
-O
       |                   O        O                            O O     O =
 |
  9200 O+       O  O    O        O        O O  O  O  O  O     O       O    =
 |
  9100 ++    O                                                             =
 |
       |                                                                   =
 |
  9000 ++            O                                                     =
 |
       |                                                                   =
 |
  8900 ++                                        .*                        =
 |
       |  *                     .*..      *    *.  +                       =
 |
  8800 ++. +        .*..*     *.         + + ..     +  .*..  .*..          =
 |
  8700 *+   +     .*     :   :      *.. +   *        *.    *.    *         =
 |
       |     *..*.        :  :         *                                   =
 |
  8600 ++                 : :                                              =
 |
       |                   *                                               =
 |
  8500 ++------------------------------------------------------------------=
-+


        [*] bisect-good sample
        [O] bisect-bad  sample

To reproduce:

        apt-get install ruby
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
Fengguang



_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============1162571395905517403==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB0bGJmbHVzaApkZWZhdWx0X21vbml0b3JzOgogIHdhaXQ6IHByZS10ZXN0
CiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVt
YS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDog
CiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAg
bGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0
YXRzOiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0dXJib3N0YXQ6IAogIHNjaGVkX2RlYnVn
OgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVyOiAKZGVmYXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gt
b29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6Ci0gcGVyZm9ybWFuY2UKY29tbWl0
OiA5N2JmNmFmMWY5MjgyMTZmZDZjNWE2NmU4YTU3YmZhOTVhNjU5NjcyCm1vZGVsOiBXZXN0bWVy
ZQptZW1vcnk6IDJHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1GVUpJVFNV
X01KQTIyNTBCSF9HMl9LOTVDVDlDMkcyOVctcGFydDYiCnN3YXBfcGFydGl0aW9uczogCnJvb3Rm
c19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRhLUZVSklUU1VfTUpBMjI1MEJIX0cyX0s5
NUNUOUMyRzI5Vy1wYXJ0NyIKbnJfdGhyZWFkczogMjAwJQppdGVyYXRpb25zOiAzMngKdGxiZmx1
c2g6CiAgZW50cmllczogNTEyCnRlc3Rib3g6IGxrcC10NDEwCnRib3hfZ3JvdXA6IGxrcC10NDEw
Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNC0xMi0xNSAxMzo0MDo1NC4x
Nzk2MjI5MTAgKzA4OjAwCmhlYWRfY29tbWl0OiA5NzE4MTQzZjhlYjEyMWE2YzUzNzU3ODU1NDI3
ZjQxZGEzYTVhZDdmCmJhc2VfY29tbWl0OiA5N2JmNmFmMWY5MjgyMTZmZDZjNWE2NmU4YTU3YmZh
OTVhNjU5NjcyCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTQxMjIzMTUKa2Vy
bmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC85N2JmNmFmMWY5MjgyMTZmZDZjNWE2NmU4YTU3YmZh
OTVhNjU5NjcyL3ZtbGludXotMy4xOS4wLXJjMS1nOTdiZjZhZiIKdXNlcjogbGtwCnF1ZXVlOiBj
eWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvbGtw
LXQ0MTAvdGxiZmx1c2gvcGVyZm9ybWFuY2UtMjAwJS0zMngtNTEyL2RlYmlhbi14ODZfNjQuY2d6
L3g4Nl82NC1yaGVsLzk3YmY2YWYxZjkyODIxNmZkNmM1YTY2ZThhNTdiZmE5NWE2NTk2NzIvMCIK
am9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtdDQxMC9jeWNsaWNfdGxiZmx1c2gtcGVyZm9y
bWFuY2UtMjAwJS0zMngtNTEyLXg4Nl82NC1yaGVsLUJBU0UtOTdiZjZhZjFmOTI4MjE2ZmQ2YzVh
NjZlOGE1N2JmYTk1YTY1OTY3Mi0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNC0xMi0yMyAxNjo0
Mzo1Ni40MDcxNjU1NzUgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMC4xMCAw
LjEzIDAuMDggMS85OCA3NzUwCnN0YXJ0X3RpbWU6ICcxNDE5MzI0MjY4JwplbmRfdGltZTogJzE0
MTkzMjQ3NjInCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTQxMjIzLTExMjkyNyIK

--===============1162571395905517403==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCi4vdGxiZmx1c2ggLW4gOTEgLXQgOAouL3RsYmZsdXNoIC1uIDE1OSAtdCA4Ci4vdGxi
Zmx1c2ggLW4gMjA1IC10IDgKLi90bGJmbHVzaCAtbiAzMTQgLXQgOAouL3RsYmZsdXNoIC1uIDM1
MiAtdCA4Ci4vdGxiZmx1c2ggLW4gNDMwIC10IDgKLi90bGJmbHVzaCAtbiA0NzkgLXQgOAouL3Rs
YmZsdXNoIC1uIDM2IC10IDgKLi90bGJmbHVzaCAtbiA3NiAtdCA4Ci4vdGxiZmx1c2ggLW4gMTY2
IC10IDgKLi90bGJmbHVzaCAtbiAyNTMgLXQgOAouL3RsYmZsdXNoIC1uIDI3MSAtdCA4Ci4vdGxi
Zmx1c2ggLW4gMzcyIC10IDgKLi90bGJmbHVzaCAtbiAzOTcgLXQgOAouL3RsYmZsdXNoIC1uIDUx
MSAtdCA4Ci4vdGxiZmx1c2ggLW4gNTAgLXQgOAouL3RsYmZsdXNoIC1uIDg3IC10IDgKLi90bGJm
bHVzaCAtbiAxNjIgLXQgOAouL3RsYmZsdXNoIC1uIDIyMyAtdCA4Ci4vdGxiZmx1c2ggLW4gMjcx
IC10IDgKLi90bGJmbHVzaCAtbiAzNzggLXQgOAouL3RsYmZsdXNoIC1uIDQzNyAtdCA4Ci4vdGxi
Zmx1c2ggLW4gNDY1IC10IDgKLi90bGJmbHVzaCAtbiAyNyAtdCA4Ci4vdGxiZmx1c2ggLW4gOTcg
LXQgOAouL3RsYmZsdXNoIC1uIDE3MiAtdCA4Ci4vdGxiZmx1c2ggLW4gMjI1IC10IDgKLi90bGJm
bHVzaCAtbiAyODkgLXQgOAouL3RsYmZsdXNoIC1uIDMzOSAtdCA4Ci4vdGxiZmx1c2ggLW4gNDM2
IC10IDgKLi90bGJmbHVzaCAtbiA0NDkgLXQgOAouL3RsYmZsdXNoIC1uIDUzIC10IDgK

--===============1162571395905517403==--

