Content-Type: multipart/mixed; boundary="===============0114284120451633481=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] 7d5b506f3c2: -3.9% pigz.time.minor_page_faults
Date: Thu, 12 Feb 2015 09:35:26 +0800
Message-ID: <1423704926.5968.117.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0114284120451633481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 7d5b506f3c295ff81e34235544a9e6ac143743c1 ("mm: incorporate read-only=
 pages into transparent huge pages")


testbox/testcase/testparams: xps2/pigz/performance-100%-512K

c3916839649ddb3c  7d5b506f3c295ff81e34235544  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     27105 =C2=B1  0%      -3.9%      26056 =C2=B1  1%  pigz.time.minor_pag=
e_faults
      0.93 =C2=B1 49%     -55.0%       0.42 =C2=B1 17%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.default_wak=
e_function
      0.83 =C2=B1 43%     -49.5%       0.42 =C2=B1  9%  perf-profile.cpu-cy=
cles.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_u=
p_common.__wake_up_sync_key
      2.53 =C2=B1 37%     -41.0%       1.49 =C2=B1  6%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.pipe_write.new_sync_write.v=
fs_write
      0.77 =C2=B1 47%     -49.0%       0.40 =C2=B1  2%  perf-profile.cpu-cy=
cles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_read=
.new_sync_read
      0.77 =C2=B1 47%     -49.4%       0.39 =C2=B1  3%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.__wake_up_common.__wake=
_up_sync_key.pipe_read
      0.77 =C2=B1 47%     -46.1%       0.42 =C2=B1 10%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up_sync_key.pipe_read.new_sync_read.__vfs_read
      1.62 =C2=B1 37%     -40.8%       0.96 =C2=B1 14%  perf-profile.cpu-cy=
cles.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.pipe=
_write.new_sync_write
      0.78 =C2=B1 18%     -47.7%       0.40 =C2=B1 16%  perf-profile.cpu-cy=
cles.run_timer_softirq.__do_softirq.irq_exit.do_IRQ.ret_from_intr
      2.78 =C2=B1 32%     -35.1%       1.80 =C2=B1  8%  perf-profile.cpu-cy=
cles.alloc_pages_current.pipe_write.new_sync_write.vfs_write.sys_write
      1.09 =C2=B1 28%     -35.5%       0.71 =C2=B1 23%  perf-profile.cpu-cy=
cles.put_page.anon_pipe_buf_release.pipe_read.new_sync_read.__vfs_read
      1.48 =C2=B1 15%     -33.5%       0.98 =C2=B1 17%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.do_IRQ.ret_from_intr
      1.63 =C2=B1 20%     -30.9%       1.12 =C2=B1 14%  perf-profile.cpu-cy=
cles.anon_pipe_buf_release.pipe_read.new_sync_read.__vfs_read.vfs_read
     15.76 =C2=B1 10%     +27.5%      20.09 =C2=B1  6%  perf-profile.cpu-cy=
cles.tick_program_event.hrtimer_interrupt.hpet_interrupt_handler.handle_irq=
_event_percpu.handle_irq_event
     15.61 =C2=B1 10%     +26.8%      19.79 =C2=B1  6%  perf-profile.cpu-cy=
cles.clockevents_program_event.tick_program_event.hrtimer_interrupt.hpet_in=
terrupt_handler.handle_irq_event_percpu
     15.21 =C2=B1  9%     +27.9%      19.45 =C2=B1  6%  perf-profile.cpu-cy=
cles.hpet_msi_next_event.clockevents_program_event.tick_program_event.hrtim=
er_interrupt.hpet_interrupt_handler
      1758 =C2=B1 36%     +46.6%       2578 =C2=B1  3%  sched_debug.cpu#0.c=
urr->pid
      2.43 =C2=B1 10%     +27.9%       3.11 =C2=B1  3%  perf-profile.cpu-cy=
cles.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
       130 =C2=B1  4%     +13.8%        148 =C2=B1  5%  sched_debug.cpu#3.l=
oad
       130 =C2=B1  4%     +13.8%        148 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.load
      2498 =C2=B1  5%     +10.4%       2757 =C2=B1  6%  slabinfo.kmalloc-25=
6.num_objs

xps2: Nehalem
Memory: 4G

                             pigz.time.minor_page_faults

  27400 ++-----------------------------------------------------------------=
-+
  27200 ++                 *.                          *.*             .*  =
 |
        |  .*.            +  *                        +   + *   *   *.*  + =
.*
  27000 *+*   *.*.*.*.*.**    +   .*.*.*.*.*.*.*.*. .*     * : : + +      *=
 |
  26800 ++                     *.*                 *         : :  *        =
 |
        |                                                     *            =
 |
  26600 ++                                                                 =
 |
  26400 ++                       O             O                           =
 |
  26200 ++                         O       O                               =
 |
        |           O O  O                                                 =
 |
  26000 ++O                                                                =
 |
  25800 ++  O O         O  O O O       O O   O                             =
 |
        |       O O                                                        =
 |
  25600 O+                           O                                     =
 |
  25400 ++-----------------------------------------------------------------=
-+


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


--===============0114284120451633481==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBwaWd6CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAKICBt
ZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRl
bmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6
IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDog
CiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0X3dhdGNo
ZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9y
bWFuY2UKY29tbWl0OiBmNjFiOGQ2ZDc3N2RmYjI0MWViZTg3NDc4YzVjODIxMjZhYzhkNjg3Cm1v
ZGVsOiBOZWhhbGVtCm1lbW9yeTogNEcKbnJfc3NkX3BhcnRpdGlvbnM6IDEKc3NkX3BhcnRpdGlv
bnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUlOVEVMX1NTRFNDMkNXMjQwQTNfQ1ZDVjIwNDMwM1hC
MjQwQ0dOLXBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJDVzI0MEEzX0NWQ1YyMDQzMDNYQjI0MENHTi1wYXJ0
MiIKbmV0Y29uc29sZV9wb3J0OiA2NjY1CnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKbnJfdGhy
ZWFkczogMTAwJQpwaWd6OgogIGJsb2Nrc2l6ZTogNTEySwp0ZXN0Ym94OiB4cHMyCnRib3hfZ3Jv
dXA6IHhwczIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTAyLTExIDA4
OjU0OjI0LjA4NDg2Mzc5NSArMDg6MDAKaGVhZF9jb21taXQ6IGY2MWI4ZDZkNzc3ZGZiMjQxZWJl
ODc0NzhjNWM4MjEyNmFjOGQ2ODcKYmFzZV9jb21taXQ6IGJmYTc2ZDQ5NTc2NTk5YTRiOWY5Yjdh
NzFmMjNkNzNkNmRjZmY3MzUKYnJhbmNoOiBuZXh0L21hc3RlcgprZXJuZWw6ICIva2VybmVsL3g4
Nl82NC1yaGVsL2Y2MWI4ZDZkNzc3ZGZiMjQxZWJlODc0NzhjNWM4MjEyNmFjOGQ2ODcvdm1saW51
ei0zLjE5LjAtbmV4dC0yMDE1MDIxMC1nZjYxYjhkNiIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMK
cm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3Vs
dC94cHMyL3BpZ3ovcGVyZm9ybWFuY2UtMTAwJS01MTJLL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oveDg2XzY0LXJoZWwvZjYxYjhkNmQ3NzdkZmIyNDFlYmU4NzQ3OGM1YzgyMTI2YWM4ZDY4
Ny8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3hwczIvY3ljbGljX3BpZ3otcGVyZm9ybWFu
Y2UtMTAwJS01MTJLLXg4Nl82NC1yaGVsLUhFQUQtZjYxYjhkNmQ3NzdkZmIyNDFlYmU4NzQ3OGM1
YzgyMTI2YWM4ZDY4Ny0wLTIwMTUwMjExLTE0OTgxLWllYTZmZC55YW1sIgpkZXF1ZXVlX3RpbWU6
IDIwMTUtMDItMTEgMDk6MDg6NTIuMDg2NDQ5ODg5ICswODowMApucl9jcHU6ICIkKG5wcm9jKSIK
am9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA2LjM4IDUuMDQgMi4yOCAxLzEzMyA1MzA4CnN0
YXJ0X3RpbWU6ICcxNDIzNjE2OTU4JwplbmRfdGltZTogJzE0MjM2MTcyNTknCnZlcnNpb246ICIv
bGtwL2xrcC8uc3JjLTIwMTUwMjEwLTIxMzQzNSIK

--===============0114284120451633481==--

