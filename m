Content-Type: multipart/mixed; boundary="===============7756075883363028532=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm] 81c72584a4: -4.3% will-it-scale.per_process_ops
Date: Thu, 08 Oct 2015 10:37:25 +0800
Message-ID: <877fmyxeze.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7756075883363028532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git master
commit 81c72584a480c5a4b7eede527d0b990c83c2dcc9 ("mm: gup: make get_user_pa=
ges_fast and __get_user_pages_fast latency conscious")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  ivb42/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perf=
ormance/futex1

commit: =

  4ae904c494e475048050994f669137c12274da85
  81c72584a480c5a4b7eede527d0b990c83c2dcc9

4ae904c494e47504 81c72584a480c5a4b7eede527d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5375911 =C2=B1  0%      -4.3%    5146855 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1605249 =C2=B1  1%      -3.1%    1555950 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.60 =C2=B1  1%      -4.2%       0.58 =C2=B1  0%  will-it-scale.scala=
bility
      9957 =C2=B1 27%     -28.6%       7114 =C2=B1  0%  numa-meminfo.node0.=
Mapped
      1933 =C2=B1 17%     +16.0%       2243 =C2=B1  6%  numa-meminfo.node1.=
PageTables
      2488 =C2=B1 27%     -28.6%       1777 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    483.00 =C2=B1 17%     +16.0%     560.50 =C2=B1  6%  numa-vmstat.node1.n=
r_page_table_pages
     42.00 =C2=B1 12%     -31.5%      28.75 =C2=B1 11%  sched_debug.cfs_rq[=
0]:/.load
   2032736 =C2=B1  5%     -12.5%    1779371 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.min_vruntime
   -300090 =C2=B1-69%    -103.1%       9378 =C2=B11396%  sched_debug.cfs_rq=
[10]:/.spread0
   -235906 =C2=B1-47%    -103.2%       7486 =C2=B11760%  sched_debug.cfs_rq=
[11]:/.spread0
   -885383 =C2=B1-11%     -29.4%    -625333 =C2=B1-21%  sched_debug.cfs_rq[=
13]:/.spread0
   -883477 =C2=B1-12%     -28.4%    -632137 =C2=B1-19%  sched_debug.cfs_rq[=
14]:/.spread0
   -881069 =C2=B1-12%     -28.6%    -629181 =C2=B1-20%  sched_debug.cfs_rq[=
15]:/.spread0
   -888493 =C2=B1-12%     -29.9%    -622785 =C2=B1-19%  sched_debug.cfs_rq[=
16]:/.spread0
   -883314 =C2=B1-13%     -28.9%    -627753 =C2=B1-20%  sched_debug.cfs_rq[=
17]:/.spread0
  -1037778 =C2=B1-20%     -39.9%    -623972 =C2=B1-21%  sched_debug.cfs_rq[=
18]:/.spread0
   -882564 =C2=B1-12%     -29.3%    -623573 =C2=B1-20%  sched_debug.cfs_rq[=
19]:/.spread0
   -237868 =C2=B1-46%    -106.0%      14369 =C2=B1854%  sched_debug.cfs_rq[=
1]:/.spread0
   -870685 =C2=B1-11%     -29.7%    -612118 =C2=B1-18%  sched_debug.cfs_rq[=
20]:/.spread0
   -879689 =C2=B1-12%     -29.5%    -620241 =C2=B1-20%  sched_debug.cfs_rq[=
21]:/.spread0
   -872185 =C2=B1-13%     -27.7%    -630771 =C2=B1-21%  sched_debug.cfs_rq[=
22]:/.spread0
   -882721 =C2=B1-12%     -28.3%    -633288 =C2=B1-21%  sched_debug.cfs_rq[=
23]:/.spread0
     13.25 =C2=B1 47%     +98.1%      26.25 =C2=B1 29%  sched_debug.cfs_rq[=
24]:/.tg_load_avg_contrib
   -198518 =C2=B1-57%    -127.2%      53978 =C2=B1241%  sched_debug.cfs_rq[=
25]:/.spread0
     15.00 =C2=B1 33%     -53.3%       7.00 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.load_avg
   -166551 =C2=B1-60%    -135.2%      58649 =C2=B1214%  sched_debug.cfs_rq[=
26]:/.spread0
     15.25 =C2=B1 34%     -54.1%       7.00 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_load_avg_contrib
   -195491 =C2=B1-57%    -128.4%      55586 =C2=B1227%  sched_debug.cfs_rq[=
27]:/.spread0
   -189456 =C2=B1-56%    -130.0%      56778 =C2=B1222%  sched_debug.cfs_rq[=
28]:/.spread0
   -198122 =C2=B1-56%    -131.1%      61555 =C2=B1202%  sched_debug.cfs_rq[=
29]:/.spread0
   -267573 =C2=B1-52%    -105.6%      14934 =C2=B1816%  sched_debug.cfs_rq[=
2]:/.spread0
   -196299 =C2=B1-56%    -129.7%      58206 =C2=B1217%  sched_debug.cfs_rq[=
30]:/.spread0
   -188828 =C2=B1-53%    -130.7%      57930 =C2=B1219%  sched_debug.cfs_rq[=
31]:/.spread0
   -197148 =C2=B1-54%    -131.1%      61392 =C2=B1204%  sched_debug.cfs_rq[=
32]:/.spread0
   -191912 =C2=B1-55%    -130.1%      57741 =C2=B1218%  sched_debug.cfs_rq[=
33]:/.spread0
   -196722 =C2=B1-57%    -129.5%      58104 =C2=B1215%  sched_debug.cfs_rq[=
35]:/.spread0
   -802782 =C2=B1-14%     -31.0%    -554283 =C2=B1-22%  sched_debug.cfs_rq[=
37]:/.spread0
    183.25 =C2=B1  7%      -7.9%     168.75 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.util_avg
   -798974 =C2=B1-14%     -31.3%    -548870 =C2=B1-24%  sched_debug.cfs_rq[=
38]:/.spread0
   -804061 =C2=B1-13%     -31.9%    -547569 =C2=B1-23%  sched_debug.cfs_rq[=
39]:/.spread0
   -241212 =C2=B1-46%    -104.2%      10110 =C2=B11225%  sched_debug.cfs_rq=
[3]:/.spread0
   -804833 =C2=B1-13%     -32.5%    -542990 =C2=B1-24%  sched_debug.cfs_rq[=
40]:/.spread0
   -802162 =C2=B1-13%     -31.6%    -548407 =C2=B1-23%  sched_debug.cfs_rq[=
41]:/.spread0
   -804352 =C2=B1-13%     -33.8%    -532778 =C2=B1-26%  sched_debug.cfs_rq[=
43]:/.spread0
   -803450 =C2=B1-13%     -31.6%    -549859 =C2=B1-22%  sched_debug.cfs_rq[=
44]:/.spread0
   -804660 =C2=B1-13%     -32.2%    -545711 =C2=B1-22%  sched_debug.cfs_rq[=
45]:/.spread0
   -803171 =C2=B1-14%     -32.8%    -540079 =C2=B1-22%  sched_debug.cfs_rq[=
46]:/.spread0
   -798603 =C2=B1-14%     -32.2%    -541575 =C2=B1-23%  sched_debug.cfs_rq[=
47]:/.spread0
   -236187 =C2=B1-45%    -106.5%      15418 =C2=B1808%  sched_debug.cfs_rq[=
4]:/.spread0
   -240043 =C2=B1-46%    -105.8%      13821 =C2=B1907%  sched_debug.cfs_rq[=
5]:/.spread0
   -241134 =C2=B1-45%    -105.5%      13348 =C2=B1932%  sched_debug.cfs_rq[=
6]:/.spread0
   -232614 =C2=B1-43%    -104.6%      10696 =C2=B11210%  sched_debug.cfs_rq=
[7]:/.spread0
   -238112 =C2=B1-49%    -104.9%      11721 =C2=B11075%  sched_debug.cfs_rq=
[8]:/.spread0
   -239741 =C2=B1-47%    -104.1%       9844 =C2=B11305%  sched_debug.cfs_rq=
[9]:/.spread0
     42.00 =C2=B1 12%     -31.5%      28.75 =C2=B1 11%  sched_debug.cpu#0.l=
oad
      2239 =C2=B1  9%     +14.0%       2553 =C2=B1 11%  sched_debug.cpu#0.s=
ched_goidle
     12835 =C2=B1102%     -75.7%       3118 =C2=B1 24%  sched_debug.cpu#12.=
ttwu_count
    952259 =C2=B1  4%     -10.0%     857091 =C2=B1  4%  sched_debug.cpu#13.=
avg_idle
      3427 =C2=B1  0%     +19.0%       4078 =C2=B1 10%  sched_debug.cpu#15.=
curr->pid
      9061 =C2=B1 55%    +132.5%      21068 =C2=B1 47%  sched_debug.cpu#22.=
nr_switches
     10463 =C2=B1 43%    +118.0%      22806 =C2=B1 46%  sched_debug.cpu#22.=
sched_count
      1.00 =C2=B1 70%     +75.0%       1.75 =C2=B1 93%  sched_debug.cpu#28.=
nr_uninterruptible
    228.25 =C2=B1 18%     +22.0%     278.50 =C2=B1 11%  sched_debug.cpu#29.=
sched_goidle
      1880 =C2=B1 53%     -62.9%     698.25 =C2=B1 21%  sched_debug.cpu#31.=
nr_switches
      2007 =C2=B1 50%     -58.3%     837.50 =C2=B1 17%  sched_debug.cpu#31.=
sched_count
    422.50 =C2=B1 54%     -42.1%     244.75 =C2=B1 28%  sched_debug.cpu#31.=
sched_goidle
      1014 =C2=B1 79%     -66.5%     340.00 =C2=B1 43%  sched_debug.cpu#31.=
ttwu_count
    619.75 =C2=B1 70%     -69.3%     190.50 =C2=B1 37%  sched_debug.cpu#31.=
ttwu_local
      2.00 =C2=B1 86%     -50.0%       1.00 =C2=B1 70%  sched_debug.cpu#34.=
nr_uninterruptible
      0.50 =C2=B1300%      +0.0%       0.50 =C2=B1100%  sched_debug.cpu#35.=
nr_uninterruptible
      1520 =C2=B1 12%     +47.8%       2247 =C2=B1 41%  sched_debug.cpu#40.=
curr->pid
      5218 =C2=B1 20%     -67.4%       1703 =C2=B1 15%  sched_debug.cpu#41.=
ttwu_count
      3739 =C2=B1 56%    +101.7%       7542 =C2=B1 32%  sched_debug.cpu#42.=
nr_switches
      2.75 =C2=B1 30%    -127.3%      -0.75 =C2=B1-238%  sched_debug.cpu#44=
.nr_uninterruptible
      1870 =C2=B1 31%    +167.9%       5011 =C2=B1 56%  sched_debug.cpu#44.=
ttwu_count
      1849 =C2=B1 27%     -23.8%       1410 =C2=B1  0%  sched_debug.cpu#46.=
curr->pid

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lkp-xbm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/pe=
rformance/futex2

commit: =

  4ae904c494e475048050994f669137c12274da85
  81c72584a480c5a4b7eede527d0b990c83c2dcc9

4ae904c494e47504 81c72584a480c5a4b7eede527d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   3024654 =C2=B1  0%      -5.0%    2872390 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   2475333 =C2=B1  0%      -4.8%    2355651 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      7738 =C2=B1 15%    +205.2%      23616 =C2=B1 41%  cpuidle.C1E-NHM.time
      1484 =C2=B1  8%     -25.2%       1110 =C2=B1  9%  sched_debug.cpu#2.c=
urr->pid
      1254 =C2=B1 12%     -15.1%       1064 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_objs
      0.00 =C2=B1 -1%      +Inf%    1437029 =C2=B1134%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    1588478 =C2=B1120%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    1699671 =C2=B1113%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.66 =C2=B1  4%     +47.1%       0.97 =C2=B1  6%  perf-profile.cpu-cy=
cles.___might_sleep.get_futex_key.futex_wait_setup.futex_wait.do_futex
      0.00 =C2=B1 -1%      +Inf%       2.16 =C2=B1  3%  perf-profile.cpu-cy=
cles.___might_sleep.get_user_pages_fast.get_futex_key.futex_wait_setup.fute=
x_wait
      3.68 =C2=B1  5%      -6.3%       3.45 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock.futex_wait_setup.futex_wait.do_futex.sys_futex
      1.29 =C2=B1 23%     -25.7%       0.96 =C2=B1  4%  perf-profile.cpu-cy=
cles.get_futex_value_locked.futex_wait_setup.futex_wait.do_futex.sys_futex
     21.11 =C2=B1  0%     +13.5%      23.95 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_user_pages_fast.get_futex_key.futex_wait_setup.futex_wait.do_futex
     16.09 =C2=B1  1%     -10.0%      14.48 =C2=B1  0%  perf-profile.cpu-cy=
cles.gup_pud_range.get_user_pages_fast.get_futex_key.futex_wait_setup.futex=
_wait


ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

lkp-xbm: Sandy Bridge
Memory: 2G




                             will-it-scale.per_process_ops

  5.45e+06 ++--------------------------------------------------------------=
-+
   5.4e+06 *+.*..*.*..*..          .*..   *..                   .*..  *..  =
 |
           |             *..     .*     ..          .*..*..  .*.     +   *.=
.*
  5.35e+06 ++               *..*.      *     *..  .*       *.       *      =
 |
   5.3e+06 ++                                   *.                         =
 |
           |                                                               =
 |
  5.25e+06 ++                                                              =
 |
   5.2e+06 ++                                                              =
 |
  5.15e+06 ++                                                    O  O O    =
 |
           |                                                             O =
 |
   5.1e+06 ++                                              O  O            =
 |
  5.05e+06 ++            O  O     O O  O  O  O  O  O O  O                  =
 |
           O       O  O        O                                           =
 |
     5e+06 ++ O  O                                                         =
 |
  4.95e+06 ++--------------------------------------------------------------=
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

--===============7756075883363028532==
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
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDI0Njdk
MzVhZWNjNDM5ZmIyNTEzYjJjMGJkNWQ5Zjg0YzQxNjBiMzMKbW9kZWw6IEl2eXRvd24gSXZ5IEJy
aWRnZS1FUApucl9jcHU6IDQ4Cm1lbW9yeTogNjRHCnN3YXBfcGFydGl0aW9uczogTEFCRUw9U1dB
UApyb290ZnNfcGFydGl0aW9uOiBMQUJFTD1MS1AtUk9PVEZTCmNhdGVnb3J5OiBiZW5jaG1hcmsK
cGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IGZ1dGV4MQpx
dWV1ZTogY3ljbGljCnRlc3Rib3g6IGl2YjQyCnRib3hfZ3JvdXA6IGl2YjQyCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0xMC0wMiAxNzoxNjowNi45NjI0NDA1MzEgKzA4
OjAwCmlkOiBlNTExODg4MTY5MzVlNGM2MDdmZmFkY2E2ZGIwMzJhYmExMjIzMzY4CnVzZXI6IGxr
cApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogMjQ2N2QzNWFlY2M0MzlmYjI1MTNiMmMw
YmQ1ZDlmODRjNDE2MGIzMwpiYXNlX2NvbW1pdDogOWZmZWNiMTAyODM1MDgyNjA5MzZiOTYwMjJk
NGVlNDNhNzc5OGI0YwpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MTAwMjE2
Cmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8yNDY3ZDM1YWVjYzQzOWZi
MjUxM2IyYzBiZDVkOWY4NGM0MTYwYjMzL3ZtbGludXotNC4zLjAtcmMzLXdsLWF0aC0wNTc2My1n
MjQ2N2QzNSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290
OiAiL3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLWZ1dGV4MS9pdmI0Mi9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMjQ2N2QzNWFlY2M0Mzlm
YjI1MTNiMmMwYmQ1ZDlmODRjNDE2MGIzMy8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2l2
YjQyL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLWZ1dGV4MS14ODZfNjQtcmhlbC1D
WUNMSUNfSEVBRC0yNDY3ZDM1YWVjYzQzOWZiMjUxM2IyYzBiZDVkOWY4NGM0MTYwYjMzLTIwMTUx
MDAyLTMyNTMxLTFqZmtmdDQtMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMTAtMDMgMDI6MTg6
MzkuOTA2NzA1ODM5ICswODowMAptYXhfdXB0aW1lOiAxNTAwCmluaXRyZDogIi9vc2ltYWdlL2Rl
Ymlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSBy
b290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2l2YjQyL2N5Y2xp
Y193aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLWZ1dGV4MS14ODZfNjQtcmhlbC1DWUNMSUNfSEVB
RC0yNDY3ZDM1YWVjYzQzOWZiMjUxM2IyYzBiZDVkOWY4NGM0MTYwYjMzLTIwMTUxMDAyLTMyNTMx
LTFqZmtmdDQtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJh
bmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MTAwMjE2Ci0gY29tbWl0PTI0NjdkMzVh
ZWNjNDM5ZmIyNTEzYjJjMGJkNWQ5Zjg0YzQxNjBiMzMKLSBCT09UX0lNQUdFPS9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS8yNDY3ZDM1YWVjYzQzOWZiMjUxM2IyYzBiZDVkOWY4NGM0MTYw
YjMzL3ZtbGludXotNC4zLjAtcmMzLXdsLWF0aC0wNTc2My1nMjQ2N2QzNQotIG1heF91cHRpbWU9
MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1mdXRl
eDEvaXZiNDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45
LzI0NjdkMzVhZWNjNDM5ZmIyNTEzYjJjMGJkNWQ5Zjg0YzQxNjBiMzMvMAotIExLUF9TRVJWRVI9
aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9
ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3Vf
Y3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93
YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAK
ICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3Bf
aW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzI0NjdkMzVhZWNjNDM5ZmIyNTEzYjJjMGJkNWQ5Zjg0
YzQxNjBiMzMvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQu
Y2d6LC9sa3AvYmVuY2htYXJrcy93aWxsLWl0LXNjYWxlLmNneiIKam9iX3N0YXRlOiBmaW5pc2hl
ZApsb2FkYXZnOiA0MS44NiAxOC44MSA3LjM0IDEvNDkzIDkyOTEKc3RhcnRfdGltZTogJzE0NDM4
MDk5NTcnCmVuZF90aW1lOiAnMTQ0MzgxMDI2NycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAx
NTEwMDEtMjMwNDMyIgo=

--===============7756075883363028532==
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
b3Zlcm5vcgouL3J1bnRlc3QucHkgZnV0ZXgxIDI1IGJvdGggMSAxMiAyNCAzNiA0OAo=

--===============7756075883363028532==--

