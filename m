Content-Type: multipart/mixed; boundary="===============1166886033237906990=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [x86_64, entry] 71428f63e68: -35.9% will-it-scale.time.user_time +8.2% will-it-scale.per_process_ops
Date: Wed, 21 Jan 2015 14:16:05 +0800
Message-ID: <1421820965.6126.23.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1166886033237906990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry-devel
commit 71428f63e681e1b4aa1a781e3ef7c27f027d1103 ("x86_64,entry: Use sysret =
to return to userspace when possible")


testbox/testcase/testparams: wsm/will-it-scale/performance-unlink2

c9a418c3dc3993cb  71428f63e681e1b4aa1a781e3e  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     35.37 =C2=B1  0%     -39.9%      21.24 =C2=B1  0%  will-it-scale.time.=
user_time
    206954 =C2=B1  0%      +2.1%     211373 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
       992 =C2=B1  0%      +1.3%       1005 =C2=B1  0%  will-it-scale.time.=
system_time
     35.37 =C2=B1  0%     -39.9%      21.24 =C2=B1  0%  time.user_time
      8.51 =C2=B1  1%     -18.5%       6.93 =C2=B1  1%  perf-profile.cpu-cy=
cles.close
    157780 =C2=B1  1%     +10.5%     174306 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_objs
    157803 =C2=B1  1%     +10.5%     174330 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_objs
      4930 =C2=B1  1%     +10.5%       5447 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_slabs
      4930 =C2=B1  1%     +10.5%       5447 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_slabs
    157357 =C2=B1  1%     +10.5%     173860 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.active_objs
    157370 =C2=B1  1%     +10.5%     173871 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.num_objs
      6556 =C2=B1  1%     +10.5%       7244 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.active_slabs
      6556 =C2=B1  1%     +10.5%       7244 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.num_slabs
     44396 =C2=B1  2%      +9.9%      48785 =C2=B1  2%  proc-vmstat.nr_slab=
_unreclaimable

testbox/testcase/testparams: wsm/will-it-scale/performance-signal1

c9a418c3dc3993cb  71428f63e681e1b4aa1a781e3e  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     35.20 =C2=B1  2%     -35.9%      22.56 =C2=B1  1%  will-it-scale.time.=
user_time
    365460 =C2=B1  1%      +7.3%     391965 =C2=B1  2%  will-it-scale.per_t=
hread_ops
    971513 =C2=B1  0%      +8.2%    1050889 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.59 =C2=B1  1%      -5.0%       0.56 =C2=B1  0%  will-it-scale.scala=
bility
      1028 =C2=B1  0%      +1.2%       1040 =C2=B1  0%  will-it-scale.time.=
system_time
       640 =C2=B1 33%     -49.5%        323 =C2=B1 20%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
    127248 =C2=B1 37%     +85.3%     235849 =C2=B1 22%  sched_debug.cpu#1.t=
twu_local
    129447 =C2=B1 36%     +84.0%     238199 =C2=B1 21%  sched_debug.cpu#1.t=
twu_count
    129567 =C2=B1 36%     +83.6%     237839 =C2=B1 22%  sched_debug.cpu#1.s=
ched_goidle
    259984 =C2=B1 36%     +83.4%     476883 =C2=B1 21%  sched_debug.cpu#1.n=
r_switches
    260083 =C2=B1 36%     +83.4%     476997 =C2=B1 21%  sched_debug.cpu#1.s=
ched_count
       725 =C2=B1 28%     -44.9%        400 =C2=B1 17%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
     35.20 =C2=B1  2%     -35.9%      22.56 =C2=B1  1%  time.user_time
       112 =C2=B1 30%     -33.6%         74 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.load
       102 =C2=B1 19%     -26.9%         74 =C2=B1 14%  sched_debug.cpu#1.l=
oad
        62 =C2=B1  4%     +33.9%         84 =C2=B1  7%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
       109 =C2=B1  3%     -19.5%         87 =C2=B1  9%  sched_debug.cpu#6.c=
pu_load[3]
        52 =C2=B1  9%     +19.6%         62 =C2=B1 11%  sched_debug.cpu#10.=
cpu_load[2]
        64 =C2=B1  8%     +23.9%         80 =C2=B1  6%  sched_debug.cpu#4.c=
pu_load[0]
        61 =C2=B1 12%     +35.2%         82 =C2=B1 23%  sched_debug.cfs_rq[=
10]:/.load
       103 =C2=B1  3%     -17.1%         85 =C2=B1  6%  sched_debug.cpu#6.c=
pu_load[2]
      0.83 =C2=B1  3%     +16.9%       0.97 =C2=B1  8%  perf-profile.cpu-cy=
cles._raw_spin_lock_irq.get_signal.do_signal.do_notify_resume.int_signal
      0.89 =C2=B1  3%     +21.3%       1.08 =C2=B1  2%  perf-profile.cpu-cy=
cles.setup_sigcontext.do_signal.do_notify_resume.int_signal.raise
       114 =C2=B1  4%     -19.0%         92 =C2=B1 11%  sched_debug.cpu#6.c=
pu_load[4]
      1861 =C2=B1  6%     -16.2%       1560 =C2=B1  8%  cpuidle.C3-NHM.usage
       410 =C2=B1  6%     -16.3%        343 =C2=B1  9%  cpuidle.C1-NHM.usage
      3.18 =C2=B1  2%     +13.8%       3.62 =C2=B1  3%  perf-profile.cpu-cy=
cles.init_fpu.__restore_xstate_sig.restore_sigcontext.sys_rt_sigreturn.stub=
_rt_sigreturn
      7.29 =C2=B1  1%     +15.6%       8.43 =C2=B1  4%  perf-profile.cpu-cy=
cles.__sigqueue_free.part.12.__dequeue_signal.dequeue_signal.get_signal.do_=
signal
      0.92 =C2=B1  3%     +11.7%       1.03 =C2=B1  4%  perf-profile.cpu-cy=
cles.system_call.handler
      3469 =C2=B1  2%     -18.2%       2838 =C2=B1 15%  sched_debug.cpu#1.c=
urr->pid
      2.37 =C2=B1  1%     +13.1%       2.67 =C2=B1  4%  perf-profile.cpu-cy=
cles.free_uid.__sigqueue_free.__dequeue_signal.dequeue_signal.get_signal
     13.43 =C2=B1  2%     +13.4%      15.23 =C2=B1  3%  perf-profile.cpu-cy=
cles.get_signal.do_signal.do_notify_resume.int_signal.raise
     12.93 =C2=B1  3%     +12.8%      14.58 =C2=B1  4%  perf-profile.cpu-cy=
cles.__send_signal.send_signal.do_send_sig_info.do_send_specific.do_tkill
      2.67 =C2=B1  1%     +12.7%       3.01 =C2=B1  4%  perf-profile.cpu-cy=
cles.memset.init_fpu.__restore_xstate_sig.restore_sigcontext.sys_rt_sigretu=
rn
     10.12 =C2=B1  2%     +11.9%      11.33 =C2=B1  3%  perf-profile.cpu-cy=
cles.stub_rt_sigreturn.raise
     13.75 =C2=B1  3%     +12.6%      15.49 =C2=B1  4%  perf-profile.cpu-cy=
cles.send_signal.do_send_sig_info.do_send_specific.do_tkill.sys_tgkill
     23.31 =C2=B1  2%     +12.3%      26.18 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_notify_resume.int_signal.raise
      1.04 =C2=B1  5%     +14.4%       1.19 =C2=B1  5%  perf-profile.cpu-cy=
cles.__lock_task_sighand.do_send_sig_info.do_send_specific.do_tkill.sys_tgk=
ill
     23.37 =C2=B1  2%     +12.3%      26.25 =C2=B1  3%  perf-profile.cpu-cy=
cles.int_signal.raise
     22.76 =C2=B1  2%     +12.2%      25.55 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_signal.do_notify_resume.int_signal.raise
     20.06 =C2=B1  3%     +11.9%      22.45 =C2=B1  4%  perf-profile.cpu-cy=
cles.do_send_specific.do_tkill.sys_tgkill.system_call_fastpath.raise
      0.81 =C2=B1  7%     +17.6%       0.95 =C2=B1  5%  perf-profile.cpu-cy=
cles._raw_spin_unlock_irqrestore.try_to_wake_up.wake_up_state.signal_wake_u=
p_state.complete_signal
     16.43 =C2=B1  3%     +12.1%      18.41 =C2=B1  4%  perf-profile.cpu-cy=
cles.do_send_sig_info.do_send_specific.do_tkill.sys_tgkill.system_call_fast=
path
      9.83 =C2=B1  2%     +11.6%      10.97 =C2=B1  3%  perf-profile.cpu-cy=
cles.sys_rt_sigreturn.stub_rt_sigreturn.raise
      3.44 =C2=B1  4%     +14.2%       3.93 =C2=B1  4%  perf-profile.cpu-cy=
cles.signal_wake_up_state.complete_signal.__send_signal.send_signal.do_send=
_sig_info
        96 =C2=B1  3%     -12.7%         84 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[1]
      8.99 =C2=B1  2%     +13.6%      10.21 =C2=B1  3%  perf-profile.cpu-cy=
cles.__dequeue_signal.dequeue_signal.get_signal.do_signal.do_notify_resume
     10.33 =C2=B1  2%     +13.0%      11.66 =C2=B1  4%  perf-profile.cpu-cy=
cles.dequeue_signal.get_signal.do_signal.do_notify_resume.int_signal
     22.68 =C2=B1  3%     +11.7%      25.33 =C2=B1  3%  perf-profile.cpu-cy=
cles.sys_tgkill.system_call_fastpath.raise
      8.64 =C2=B1  2%     +11.7%       9.66 =C2=B1  3%  perf-profile.cpu-cy=
cles.restore_sigcontext.sys_rt_sigreturn.stub_rt_sigreturn.raise
     22.37 =C2=B1  3%     +11.6%      24.96 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_tkill.sys_tgkill.system_call_fastpath.raise
     22.87 =C2=B1  3%     +11.7%      25.53 =C2=B1  3%  perf-profile.cpu-cy=
cles.system_call_fastpath.raise
      8.12 =C2=B1  2%     +11.9%       9.08 =C2=B1  3%  perf-profile.cpu-cy=
cles.__restore_xstate_sig.restore_sigcontext.sys_rt_sigreturn.stub_rt_sigre=
turn.raise
      4.11 =C2=B1  4%     +12.3%       4.61 =C2=B1  4%  perf-profile.cpu-cy=
cles.complete_signal.__send_signal.send_signal.do_send_sig_info.do_send_spe=
cific
      1.17 =C2=B1  5%     +10.7%       1.30 =C2=B1  4%  perf-profile.cpu-cy=
cles.selinux_task_kill.security_task_kill.check_kill_permission.do_send_spe=
cific.do_tkill
      5.84 =C2=B1  4%     +13.6%       6.63 =C2=B1  5%  perf-profile.cpu-cy=
cles.__sigqueue_alloc.__send_signal.send_signal.do_send_sig_info.do_send_sp=
ecific
      1.32 =C2=B1  5%     +11.4%       1.47 =C2=B1  4%  perf-profile.cpu-cy=
cles.security_task_kill.check_kill_permission.do_send_specific.do_tkill.sys=
_tgkill

wsm: Westmere
Memory: 6G




                          will-it-scale.time.user_time

  40 ++--------------------------------------------------------------------=
-+
     *..*..*...*..*..*..*...*..*..*      *..*..  .*..  ..*..               =
 |
  35 ++                           :      :     *.    *.     *..*..*...*    =
 |
  30 ++                           :     :                                  =
 |
     |                             :    :                                  =
 |
  25 ++                            :    :                                  =
 |
     O  O  O   O  O         O  O  O:   :                                   =
 O
  20 ++              O  O          : O : O  O  O  O  O   O  O  O  O   O  O =
 |
     |                              :  :                                   =
 |
  15 ++                             :  :                                   =
 |
  10 ++                             : :                                    =
 |
     |                              : :                                    =
 |
   5 ++                              ::                                    =
 |
     |                               :                                     =
 |
   0 ++------------------------------*-------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby ruby-oj
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
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


--===============1166886033237906990==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3
YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpj
b21taXQ6IGI4NDIzNTM2NzEyMGI2MGMzMzkyZTc3NGU5NzI1YTNmZTZhNzQ2NGQKbW9kZWw6IFdl
c3RtZXJlCm1lbW9yeTogNkcKbnJfaGRkX3BhcnRpdGlvbnM6IDEKaGRkX3BhcnRpdGlvbnM6IApz
d2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0Y29uc29sZV9wb3J0OiA2NjY3
CnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OgogIC0gdW5s
aW5rMgp0ZXN0Ym94OiB3c20KdGJveF9ncm91cDogd3NtCmtjb25maWc6IHg4Nl82NC1yaGVsCmVu
cXVldWVfdGltZTogMjAxNS0wMS0xNyAwNTozNzo0Ni4yNjg3ODMxMzMgKzA4OjAwCmhlYWRfY29t
bWl0OiBiODQyMzUzNjcxMjBiNjBjMzM5MmU3NzRlOTcyNWEzZmU2YTc0NjRkCmJhc2VfY29tbWl0
OiBlYWEyN2YzNGU5MWExNGNkY2VlZDI2ZWQ2YzY3OTNlYzFkMTg2MTE1CmJyYW5jaDogbGludXgt
ZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwMTE3MTgKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhl
bC9iODQyMzUzNjcxMjBiNjBjMzM5MmU3NzRlOTcyNWEzZmU2YTc0NjRkL3ZtbGludXotMy4xOS4w
LXJjNC1nYjg0MjM1MyIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2
XzY0LTIwMTUtMDEtMTMuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC93c20vd2lsbC1pdC1zY2Fs
ZS9wZXJmb3JtYW5jZS11bmxpbmsyL2RlYmlhbi14ODZfNjQtMjAxNS0wMS0xMy5jZ3oveDg2XzY0
LXJoZWwvYjg0MjM1MzY3MTIwYjYwYzMzOTJlNzc0ZTk3MjVhM2ZlNmE3NDY0ZC8wIgpqb2JfZmls
ZTogIi9sa3Avc2NoZWR1bGVkL3dzbS9jeWNsaWNfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS11
bmxpbmsyLXg4Nl82NC1yaGVsLUhFQUQtYjg0MjM1MzY3MTIwYjYwYzMzOTJlNzc0ZTk3MjVhM2Zl
NmE3NDY0ZC0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wMS0xNyAyMToxNTozOC45NzA3NjM0
MjIgKzA4OjAwCm5yX2NwdTogIiQobnByb2MpIgpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6
IDguNDYgNC45MSAyLjAyIDEvMTQ2IDY2OTkKc3RhcnRfdGltZTogJzE0MjE1MDA1NzQnCmVuZF90
aW1lOiAnMTQyMTUwMDg3OCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTAxMTYtMTEzNTI1
Igo=

--===============1166886033237906990==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IHVubGluazIgMzIgMSA2IDkgMTIK

--===============1166886033237906990==--

