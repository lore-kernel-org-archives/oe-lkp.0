Content-Type: multipart/mixed; boundary="===============8140232307172868256=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [vfs] f3f86e33dc: -5.3% will-it-scale.per_process_ops
Date: Wed, 18 Nov 2015 14:44:07 +0800
Message-ID: <87y4dvg62w.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8140232307172868256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit f3f86e33dc3da437fa4f204588ce7c78ea756982 ("vfs: Fix pathological per=
formance case for __alloc_fd()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  ivb42/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perf=
ormance/dup1

commit: =

  8a28d67457b613258aa0578ccece206d166f2b9f
  f3f86e33dc3da437fa4f204588ce7c78ea756982

8a28d67457b61325 f3f86e33dc3da437fa4f204588 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5994379 =C2=B1  0%      -5.3%    5678711 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1440545 =C2=B1  0%      -5.1%    1367766 =C2=B1  2%  will-it-scale.per_t=
hread_ops
      0.57 =C2=B1  0%      -5.9%       0.54 =C2=B1  0%  will-it-scale.scala=
bility
      4.47 =C2=B1  2%      -3.1%       4.33 =C2=B1  1%  turbostat.RAMWatt
     59880 =C2=B1  5%     -13.1%      52055 =C2=B1 11%  cpuidle.C1-IVT.usage
    597.50 =C2=B1  4%     -19.7%     479.50 =C2=B1 16%  cpuidle.POLL.usage
  15756223 =C2=B1  0%    +367.7%   73688311 =C2=B1 84%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  35858260 =C2=B1  0%    +113.3%   76474871 =C2=B1 77%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      1560 =C2=B1171%    +300.1%       6241 =C2=B1  0%  numa-numastat.node0=
.other_node
      3101 =C2=B1 99%     -99.7%       9.50 =C2=B1 67%  numa-numastat.node1=
.other_node
      2980 =C2=B1  3%     -13.4%       2582 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_objs
      3139 =C2=B1  3%     -12.5%       2746 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
      5018 =C2=B1 14%     -50.4%       2487 =C2=B1 13%  numa-vmstat.node0.n=
r_active_anon
      3121 =C2=B1 31%     -77.6%     700.00 =C2=B1132%  numa-vmstat.node0.n=
r_shmem
      3349 =C2=B1 20%     +76.6%       5916 =C2=B1  7%  numa-vmstat.node1.n=
r_active_anon
      1210 =C2=B1 80%    +200.8%       3640 =C2=B1 25%  numa-vmstat.node1.n=
r_shmem
     70442 =C2=B1  5%     -12.7%      61484 =C2=B1  0%  numa-meminfo.node0.=
Active
     20079 =C2=B1 14%     -50.4%       9954 =C2=B1 13%  numa-meminfo.node0.=
Active(anon)
     12487 =C2=B1 31%     -77.6%       2801 =C2=B1132%  numa-meminfo.node0.=
Shmem
     61970 =C2=B1  5%     +18.0%      73096 =C2=B1  1%  numa-meminfo.node1.=
Active
     13402 =C2=B1 20%     +76.6%      23671 =C2=B1  7%  numa-meminfo.node1.=
Active(anon)
      4843 =C2=B1 80%    +200.7%      14564 =C2=B1 25%  numa-meminfo.node1.=
Shmem
   1999660 =C2=B1  2%      -9.1%    1817792 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    814.25 =C2=B1  6%     -11.9%     717.00 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.util_avg
   -220009 =C2=B1-25%     -83.5%     -36294 =C2=B1-314%  sched_debug.cfs_rq=
[10]:/.spread0
   -220410 =C2=B1-25%     -82.7%     -38205 =C2=B1-290%  sched_debug.cfs_rq=
[11]:/.spread0
   -868154 =C2=B1 -5%     -20.7%    -688065 =C2=B1-16%  sched_debug.cfs_rq[=
14]:/.spread0
     13.00 =C2=B1  0%    +105.8%      26.75 =C2=B1 61%  sched_debug.cfs_rq[=
15]:/.load
   -952278 =C2=B1-16%     -27.9%    -687025 =C2=B1-16%  sched_debug.cfs_rq[=
16]:/.spread0
   -876660 =C2=B1 -6%     -21.8%    -685915 =C2=B1-15%  sched_debug.cfs_rq[=
17]:/.spread0
   -869841 =C2=B1 -6%     -20.5%    -691511 =C2=B1-15%  sched_debug.cfs_rq[=
18]:/.spread0
   -872906 =C2=B1 -6%     -21.0%    -689435 =C2=B1-15%  sched_debug.cfs_rq[=
19]:/.spread0
   -220042 =C2=B1-24%     -82.8%     -37798 =C2=B1-282%  sched_debug.cfs_rq=
[1]:/.spread0
   -870736 =C2=B1 -6%     -20.9%    -689178 =C2=B1-16%  sched_debug.cfs_rq[=
20]:/.spread0
   -870782 =C2=B1 -5%     -20.6%    -691440 =C2=B1-16%  sched_debug.cfs_rq[=
21]:/.spread0
     12.50 =C2=B1 12%     +20.0%      15.00 =C2=B1  8%  sched_debug.cfs_rq[=
23]:/.load_avg
   -947289 =C2=B1-16%     -27.8%    -684292 =C2=B1-16%  sched_debug.cfs_rq[=
23]:/.spread0
     12.50 =C2=B1 12%     +20.0%      15.00 =C2=B1  8%  sched_debug.cfs_rq[=
23]:/.tg_load_avg_contrib
    424.00 =C2=B1 13%     +27.4%     540.00 =C2=B1  9%  sched_debug.cfs_rq[=
23]:/.util_avg
   -180921 =C2=B1-30%    -100.2%     424.29 =C2=B126645%  sched_debug.cfs_r=
q[25]:/.spread0
   -179335 =C2=B1-30%     -82.3%     -31706 =C2=B1-346%  sched_debug.cfs_rq=
[26]:/.spread0
   -180972 =C2=B1-30%    -100.1%     163.84 =C2=B168609%  sched_debug.cfs_r=
q[27]:/.spread0
   -179636 =C2=B1-30%    -100.4%     736.15 =C2=B115384%  sched_debug.cfs_r=
q[28]:/.spread0
   -180380 =C2=B1-30%    -101.1%       1963 =C2=B15772%  sched_debug.cfs_rq=
[29]:/.spread0
     26.00 =C2=B1  3%     -18.3%      21.25 =C2=B1 22%  sched_debug.cfs_rq[=
2]:/.load
     29.50 =C2=B1  9%     -21.2%      23.25 =C2=B1 23%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
   -211354 =C2=B1-27%     -97.3%      -5780 =C2=B1-2383%  sched_debug.cfs_r=
q[2]:/.spread0
    762.25 =C2=B1  6%     -17.1%     632.00 =C2=B1 11%  sched_debug.cfs_rq[=
2]:/.util_avg
   -179346 =C2=B1-31%    -101.0%       1767 =C2=B16351%  sched_debug.cfs_rq=
[30]:/.spread0
   -182129 =C2=B1-30%     -99.9%    -200.51 =C2=B1-56625%  sched_debug.cfs_=
rq[31]:/.spread0
   -178388 =C2=B1-30%     -99.9%    -162.33 =C2=B1-69718%  sched_debug.cfs_=
rq[32]:/.spread0
   -178678 =C2=B1-30%    -100.0%     -67.48 =C2=B1-166628%  sched_debug.cfs=
_rq[33]:/.spread0
   -177514 =C2=B1-30%    -100.1%     200.37 =C2=B156326%  sched_debug.cfs_r=
q[34]:/.spread0
   -178339 =C2=B1-29%    -101.6%       2870 =C2=B13873%  sched_debug.cfs_rq=
[35]:/.spread0
   -795803 =C2=B1 -8%     -34.5%    -521305 =C2=B1-40%  sched_debug.cfs_rq[=
37]:/.spread0
   -783897 =C2=B1 -6%     -22.6%    -607100 =C2=B1-18%  sched_debug.cfs_rq[=
38]:/.spread0
      3.00 =C2=B1  0%    +250.0%      10.50 =C2=B1 40%  sched_debug.cfs_rq[=
39]:/.load_avg
   -784040 =C2=B1 -6%     -33.2%    -523669 =C2=B1-39%  sched_debug.cfs_rq[=
39]:/.spread0
      3.00 =C2=B1  0%    +250.0%      10.50 =C2=B1 40%  sched_debug.cfs_rq[=
39]:/.tg_load_avg_contrib
    173.75 =C2=B1  4%     +36.8%     237.75 =C2=B1 30%  sched_debug.cfs_rq[=
39]:/.util_avg
   -220092 =C2=B1-24%     -82.4%     -38783 =C2=B1-288%  sched_debug.cfs_rq=
[3]:/.spread0
   -783338 =C2=B1 -6%     -22.8%    -604971 =C2=B1-18%  sched_debug.cfs_rq[=
41]:/.spread0
   -784423 =C2=B1 -6%     -23.1%    -603402 =C2=B1-17%  sched_debug.cfs_rq[=
42]:/.spread0
   -785872 =C2=B1 -6%     -23.0%    -605005 =C2=B1-18%  sched_debug.cfs_rq[=
43]:/.spread0
   -782962 =C2=B1 -6%     -22.9%    -603838 =C2=B1-19%  sched_debug.cfs_rq[=
44]:/.spread0
   -783170 =C2=B1 -6%     -23.2%    -601383 =C2=B1-18%  sched_debug.cfs_rq[=
45]:/.spread0
   -784950 =C2=B1 -6%     -23.2%    -602937 =C2=B1-18%  sched_debug.cfs_rq[=
46]:/.spread0
     32.25 =C2=B1 35%     -24.8%      24.25 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.load
   -217411 =C2=B1-24%     -83.2%     -36433 =C2=B1-300%  sched_debug.cfs_rq=
[4]:/.spread0
   -219424 =C2=B1-25%     -83.0%     -37233 =C2=B1-299%  sched_debug.cfs_rq=
[5]:/.spread0
   -219112 =C2=B1-25%     -82.4%     -38536 =C2=B1-289%  sched_debug.cfs_rq=
[6]:/.spread0
   -218643 =C2=B1-24%     -82.8%     -37629 =C2=B1-298%  sched_debug.cfs_rq=
[7]:/.spread0
   -220909 =C2=B1-24%     -85.0%     -33175 =C2=B1-350%  sched_debug.cfs_rq=
[8]:/.spread0
   -220076 =C2=B1-25%     -85.9%     -31115 =C2=B1-337%  sched_debug.cfs_rq=
[9]:/.spread0
     89160 =C2=B1  6%      -8.7%      81395 =C2=B1  7%  sched_debug.cpu#0.n=
r_load_updates
     -2.75 =C2=B1-126%    -172.7%       2.00 =C2=B1136%  sched_debug.cpu#12=
.nr_uninterruptible
     16563 =C2=B1 21%     -39.6%      10009 =C2=B1  9%  sched_debug.cpu#13.=
nr_switches
     16901 =C2=B1 21%     -34.5%      11064 =C2=B1  9%  sched_debug.cpu#13.=
sched_count
      6432 =C2=B1 27%     -47.2%       3396 =C2=B1 38%  sched_debug.cpu#13.=
sched_goidle
      7244 =C2=B1 14%     -45.3%       3961 =C2=B1 39%  sched_debug.cpu#14.=
sched_goidle
     13.00 =C2=B1  0%    +105.8%      26.75 =C2=B1 61%  sched_debug.cpu#15.=
load
      1554 =C2=B1 21%     +62.9%       2531 =C2=B1 30%  sched_debug.cpu#16.=
ttwu_local
      6965 =C2=B1 21%     +48.0%      10308 =C2=B1 17%  sched_debug.cpu#18.=
sched_count
     28.25 =C2=B1  2%     -17.7%      23.25 =C2=B1 23%  sched_debug.cpu#2.c=
pu_load[4]
     26.00 =C2=B1  3%     -18.3%      21.25 =C2=B1 22%  sched_debug.cpu#2.l=
oad
      2703 =C2=B1  9%     +11.5%       3014 =C2=B1  8%  sched_debug.cpu#24.=
curr->pid
    420.00 =C2=B1 27%     -34.1%     276.75 =C2=B1 30%  sched_debug.cpu#25.=
sched_goidle
    247.00 =C2=B1 24%     +55.7%     384.50 =C2=B1 26%  sched_debug.cpu#27.=
sched_goidle
     -2.25 =C2=B1-79%    -211.1%       2.50 =C2=B1 82%  sched_debug.cpu#30.=
nr_uninterruptible
    715.75 =C2=B1 46%     -44.2%     399.50 =C2=B1 35%  sched_debug.cpu#32.=
ttwu_count
    133.50 =C2=B1 22%     +99.4%     266.25 =C2=B1 29%  sched_debug.cpu#33.=
ttwu_local
      1212 =C2=B1 47%     -46.7%     646.25 =C2=B1 25%  sched_debug.cpu#35.=
nr_switches
    506.50 =C2=B1 46%     -51.6%     245.00 =C2=B1 30%  sched_debug.cpu#35.=
sched_goidle
     32.25 =C2=B1 35%     -24.8%      24.25 =C2=B1  1%  sched_debug.cpu#4.l=
oad
      2973 =C2=B1 46%    +161.2%       7766 =C2=B1 47%  sched_debug.cpu#40.=
nr_switches
      3062 =C2=B1 46%    +156.1%       7843 =C2=B1 47%  sched_debug.cpu#40.=
sched_count
      1219 =C2=B1 55%    +155.9%       3121 =C2=B1 60%  sched_debug.cpu#40.=
sched_goidle
      1429 =C2=B1  2%     +49.2%       2131 =C2=B1 41%  sched_debug.cpu#44.=
curr->pid
      1.75 =C2=B1 93%     -57.1%       0.75 =C2=B1145%  sched_debug.cpu#45.=
nr_uninterruptible
    433.75 =C2=B1 32%     +75.1%     759.50 =C2=B1 14%  sched_debug.cpu#6.t=
twu_count


ivb42: Ivytown Ivy Bridge-EP
Memory: 64G




                             will-it-scale.per_process_ops

  6.05e+06 ++--------------------------------------------------------------=
-+
           *.*.**.*.*.**.*.*.         .*.   *.          .*   .*.**.        =
 |
     6e+06 ++                **.*.*.**   *.*  *.*.**.*.*  *.*      *.*.**.*=
.*
  5.95e+06 ++                                                              =
 |
           |                                                               =
 |
   5.9e+06 ++                                                              =
 |
  5.85e+06 ++                                                              =
 |
           |                                                               =
 |
   5.8e+06 ++                                                              =
 |
  5.75e+06 ++                                                              =
 |
           |               O OO O                                          =
 |
   5.7e+06 O+  OO   O O  O           O   O OO O O                          =
 |
  5.65e+06 ++O    O    O          O    O          OO O                     =
 |
           |                        O                                      =
 |
   5.6e+06 ++--------------------------------------------------------------=
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

--===============8140232307172868256==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1h
LW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3Rh
dDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86
IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGly
cXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVp
ZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVm
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDgwMDVj
NDlkOWFlYTc0ZDM4MmY0NzRjZTExYWZiYmM3ZDcxMzBiZWMKbW9kZWw6IEl2eXRvd24gSXZ5IEJy
aWRnZS1FUApucl9jcHU6IDQ4Cm1lbW9yeTogNjRHCnN3YXBfcGFydGl0aW9uczogTEFCRUw9U1dB
UApyb290ZnNfcGFydGl0aW9uOiBMQUJFTD1MS1AtUk9PVEZTCmNhdGVnb3J5OiBiZW5jaG1hcmsK
cGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IGR1cDEKcXVl
dWU6IGN5Y2xpYwp0ZXN0Ym94OiBpdmI0Mgp0Ym94X2dyb3VwOiBpdmI0MgprY29uZmlnOiB4ODZf
NjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMTEtMTcgMDg6Mjc6MzYuMzA5NDkwNDExICswODow
MAppZDogNzM2MzAzMTMwM2UzOTY5YzU4MWE4NDMzNGE0Njk2MmEyZGZmYTRjMwp1c2VyOiBsa3AK
Y29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IGEyNTQ5OGY3ODJlMjhmY2JkNzZiOTNjZDkz
MjViOWUxOGMxYzgyOWEKYmFzZV9jb21taXQ6IDgwMDVjNDlkOWFlYTc0ZDM4MmY0NzRjZTExYWZi
YmM3ZDcxMzBiZWMKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTExMTcwNQpr
ZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvODAwNWM0OWQ5YWVhNzRkMzgy
ZjQ3NGNlMTFhZmJiYzdkNzEzMGJlYy92bWxpbnV6LTQuNC4wLXJjMSIKcm9vdGZzOiBkZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC93aWxsLWl0LXNjYWxl
L3BlcmZvcm1hbmNlLWR1cDEvaXZiNDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZf
NjQtcmhlbC9nY2MtNC45LzgwMDVjNDlkOWFlYTc0ZDM4MmY0NzRjZTExYWZiYmM3ZDcxMzBiZWMv
MCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9pdmI0Mi9jeWNsaWNfd2lsbC1pdC1zY2FsZS1w
ZXJmb3JtYW5jZS1kdXAxLXg4Nl82NC1yaGVsLUNZQ0xJQ19CQVNFLTgwMDVjNDlkOWFlYTc0ZDM4
MmY0NzRjZTExYWZiYmM3ZDcxMzBiZWMtMjAxNTExMTctNzYyNDEtNXh0ZGw3LTAueWFtbCIKZGVx
dWV1ZV90aW1lOiAyMDE1LTExLTE3IDA5OjUxOjIxLjg0MzU1OTU5OSArMDg6MDAKbWF4X3VwdGlt
ZTogMTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpv
Yj0vbGtwL3NjaGVkdWxlZC9pdmI0Mi9jeWNsaWNfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1k
dXAxLXg4Nl82NC1yaGVsLUNZQ0xJQ19CQVNFLTgwMDVjNDlkOWFlYTc0ZDM4MmY0NzRjZTExYWZi
YmM3ZDcxMzBiZWMtMjAxNTExMTctNzYyNDEtNXh0ZGw3LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0g
a2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NTExMTcwNQotIGNvbW1pdD04MDA1YzQ5ZDlhZWE3NGQzODJmNDc0Y2UxMWFmYmJjN2Q3MTMwYmVj
Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvODAwNWM0OWQ5YWVh
NzRkMzgyZjQ3NGNlMTFhZmJiYzdkNzEzMGJlYy92bWxpbnV6LTQuNC4wLXJjMQotIG1heF91cHRp
bWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1k
dXAxL2l2YjQyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQu
OS84MDA1YzQ5ZDlhZWE3NGQzODJmNDc0Y2UxMWFmYmJjN2Q3MTMwYmVjLzAKLSBMS1BfU0VSVkVS
PWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVs
PWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1
X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlf
d2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0w
CiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtw
X2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS84MDA1YzQ5ZDlhZWE3NGQzODJmNDc0Y2UxMWFmYmJj
N2Q3MTMwYmVjL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0
LmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS5jZ3oiCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogNDEuODAgMTguODYgNy4zNyAxLzUwMSA5Mjg1CnN0YXJ0X3RpbWU6ICcxNDQ3
NzI1MTIzJwplbmRfdGltZTogJzE0NDc3MjU0MzMnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIw
MTUxMTE2LTIzNTIxNCIK

--===============8140232307172868256==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgouL3J1bnRlc3QucHkgZHVwMSAyNSBib3RoIDEgMTIgMjQgMzYgNDgK

--===============8140232307172868256==--

