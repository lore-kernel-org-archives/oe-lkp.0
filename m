Content-Type: multipart/mixed; boundary="===============7283904864797615614=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] 089e25e502: -5.4% will-it-scale.per_process_ops
Date: Wed, 23 Sep 2015 14:57:57 +0800
Message-ID: <871tdpoc5m.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7283904864797615614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git master
commit 089e25e5022ed5a1bb821f0c7ca6b48781ecc122 ("mm: gup: make get_user_pa=
ges_fast and __get_user_pages_fast latency conscious")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  lkp-sb03/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/f=
utex2

commit: =

  226c833d8e769b4bb1900eaffd3efb1cbb95f820
  089e25e5022ed5a1bb821f0c7ca6b48781ecc122

226c833d8e769b4b 089e25e5022ed5a1bb821f0c7c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   4287684 =C2=B1  0%      -5.4%    4055429 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1432530 =C2=B1  0%      -3.9%    1377184 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.60 =C2=B1  0%      -1.8%       0.59 =C2=B1  0%  will-it-scale.scala=
bility
    142663 =C2=B1 18%    +171.2%     386864 =C2=B1 82%  cpuidle.C3-SNB.time
    220.25 =C2=B1  8%     +49.0%     328.25 =C2=B1 14%  cpuidle.C3-SNB.usage
  24244125 =C2=B1 41%     -91.9%    1963754 =C2=B1108%  cpuidle.POLL.time
    663.50 =C2=B1 12%     -77.8%     147.50 =C2=B1134%  cpuidle.POLL.usage
    344.25 =C2=B1 12%     -29.6%     242.25 =C2=B1 17%  slabinfo.kmem_cache=
.active_objs
    344.25 =C2=B1 12%     -29.6%     242.25 =C2=B1 17%  slabinfo.kmem_cache=
.num_objs
    474.00 =C2=B1 11%     -27.0%     346.00 =C2=B1 15%  slabinfo.kmem_cache=
_node.active_objs
    496.00 =C2=B1 10%     -25.8%     368.00 =C2=B1 14%  slabinfo.kmem_cache=
_node.num_objs
      1.50 =C2=B1 33%    +150.0%       3.75 =C2=B1 22%  sched_debug.cfs_rq[=
20]:/.nr_spread_over
      7.00 =C2=B1 58%    +285.7%      27.00 =C2=B1 35%  sched_debug.cfs_rq[=
25]:/.load
    151.50 =C2=B1 23%     +34.8%     204.25 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.util_avg
   -764780 =C2=B1-13%     -18.2%    -625478 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.spread0
     12046 =C2=B1  8%     -15.5%      10180 =C2=B1 14%  sched_debug.cpu#1.n=
r_switches
      7057 =C2=B1  8%     -33.8%       4669 =C2=B1 23%  sched_debug.cpu#10.=
ttwu_count
     24588 =C2=B1 17%     -31.8%      16770 =C2=B1 16%  sched_debug.cpu#11.=
nr_switches
     -2.50 =C2=B1-60%    -120.0%       0.50 =C2=B1223%  sched_debug.cpu#11.=
nr_uninterruptible
     25784 =C2=B1 16%     -29.9%      18064 =C2=B1 16%  sched_debug.cpu#11.=
sched_count
      1536 =C2=B1 15%    +124.0%       3441 =C2=B1 49%  sched_debug.cpu#13.=
ttwu_local
     -4.00 =C2=B1  0%    -106.2%       0.25 =C2=B11479%  sched_debug.cpu#14=
.nr_uninterruptible
      2563 =C2=B1 42%     -50.0%       1281 =C2=B1 12%  sched_debug.cpu#16.=
nr_switches
      2760 =C2=B1 39%     -47.0%       1463 =C2=B1 10%  sched_debug.cpu#16.=
sched_count
      3.25 =C2=B1107%    -192.3%      -3.00 =C2=B1-54%  sched_debug.cpu#2.n=
r_uninterruptible
      2635 =C2=B1 14%     -27.0%       1923 =C2=B1 10%  sched_debug.cpu#2.s=
ched_goidle
    957.25 =C2=B1 14%     +44.7%       1385 =C2=B1 29%  sched_debug.cpu#21.=
nr_switches
      1140 =C2=B1 11%     +37.3%       1566 =C2=B1 25%  sched_debug.cpu#21.=
sched_count
      3293 =C2=B1 64%     -49.9%       1648 =C2=B1 74%  sched_debug.cpu#23.=
nr_switches
      4654 =C2=B1 43%     -60.8%       1824 =C2=B1 66%  sched_debug.cpu#23.=
sched_count
      1595 =C2=B1 25%     +79.0%       2856 =C2=B1 25%  sched_debug.cpu#25.=
curr->pid
      7.00 =C2=B1 58%    +285.7%      27.00 =C2=B1 35%  sched_debug.cpu#25.=
load
      2.25 =C2=B1184%    -355.6%      -5.75 =C2=B1-31%  sched_debug.cpu#3.n=
r_uninterruptible
      1.25 =C2=B1153%    +320.0%       5.25 =C2=B1 15%  sched_debug.cpu#31.=
nr_uninterruptible
     24696 =C2=B1 21%     -36.6%      15662 =C2=B1 29%  sched_debug.cpu#9.n=
r_switches
     11398 =C2=B1 24%     -43.2%       6474 =C2=B1 30%  sched_debug.cpu#9.s=
ched_goidle


lkp-sb03: Sandy Bridge-EP
Memory: 64G

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

--===============7283904864797615614==
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
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogCmRlZmF1bHQtd2F0Y2hk
b2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0OiBiNTg3MzBhYzlkMzNjOWIy
YTU5MTE3ZjRiM2YzZDgzMzY4ZmYzNGYxCm1vZGVsOiBTYW5keSBCcmlkZ2UtRVAKbWVtb3J5OiA2
NEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwRUFSUy0wMFk1
QjFfV0QtV0NBVjVGMDU5NDk5LXBhcnQzIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0
aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMEVBUlMtMDBZNUIxX1dELVdDQVY1RjA1
OTQ5OS1wYXJ0NCIKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAw
CndpbGwtaXQtc2NhbGU6CiAgdGVzdDogZnV0ZXgyCnF1ZXVlOiBjeWNsaWMKdGVzdGJveDogbGtw
LXNiMDMKdGJveF9ncm91cDogbGtwLXNiMDMKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90
aW1lOiAyMDE1LTA5LTE2IDAxOjU1OjMyLjc5MDAzNTYzNSArMDg6MDAKaWQ6IDJlYjhjNjQ5MjY1
NGE5ZTQ1YzZiMzBjOTAxMjZlMzQ1NmY0MGRlODQKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45
CmhlYWRfY29tbWl0OiBiNTg3MzBhYzlkMzNjOWIyYTU5MTE3ZjRiM2YzZDgzMzY4ZmYzNGYxCmJh
c2VfY29tbWl0OiA2ZmYzM2YzOTAyYzNiMWM1ZDBkYjZiMWUyYzcwYjZkNzZmYmEzNTdmCmJyYW5j
aDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwOTE2MDcKa2VybmVsOiAiL3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45L2I1ODczMGFjOWQzM2M5YjJhNTkxMTdmNGIzZjNkODMzNjhm
ZjM0ZjEvdm1saW51ei00LjMuMC1yYzEtd2wtYXRoLTAxMjMyLWdiNTg3MzBhIgpyb290ZnM6IGRl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3dpbGwtaXQt
c2NhbGUvZnV0ZXgyL2xrcC1zYjAzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0
LXJoZWwvZ2NjLTQuOS9iNTg3MzBhYzlkMzNjOWIyYTU5MTE3ZjRiM2YzZDgzMzY4ZmYzNGYxLzAi
CmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXNiMDMvY3ljbGljX3dpbGwtaXQtc2NhbGUt
ZnV0ZXgyLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELWI1ODczMGFjOWQzM2M5YjJhNTkxMTdmNGIz
ZjNkODMzNjhmZjM0ZjEtMjAxNTA5MTYtMzI0OTgteGVsaDAyLTAueWFtbCIKZGVxdWV1ZV90aW1l
OiAyMDE1LTA5LTE2IDA3OjM2OjM0LjcxMzQxNjgwNSArMDg6MDAKbnJfY3B1OiAiJChucHJvYyki
Cm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNl
cj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLXNiMDMvY3ljbGljX3dpbGwtaXQtc2NhbGUt
ZnV0ZXgyLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELWI1ODczMGFjOWQzM2M5YjJhNTkxMTdmNGIz
ZjNkODMzNjhmZjM0ZjEtMjAxNTA5MTYtMzI0OTgteGVsaDAyLTAueWFtbAotIEFSQ0g9eDg2XzY0
Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHkt
MjAxNTA5MTYwNwotIGNvbW1pdD1iNTg3MzBhYzlkMzNjOWIyYTU5MTE3ZjRiM2YzZDgzMzY4ZmYz
NGYxCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYjU4NzMwYWM5
ZDMzYzliMmE1OTExN2Y0YjNmM2Q4MzM2OGZmMzRmMS92bWxpbnV6LTQuMy4wLXJjMS13bC1hdGgt
MDEyMzItZ2I1ODczMGEKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3dp
bGwtaXQtc2NhbGUvZnV0ZXgyL2xrcC1zYjAzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
eDg2XzY0LXJoZWwvZ2NjLTQuOS9iNTg3MzBhYzlkMzNjOWIyYTU5MTE3ZjRiM2YzZDgzMzY4ZmYz
NGYxLzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAw
IHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2Vu
YWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRs
b2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9
MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZn
YT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1
bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iNTg3MzBhYzlkMzNj
OWIyYTU5MTE3ZjRiM2YzZDgzMzY4ZmYzNGYxL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9k
ZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2Jl
bmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS5jZ3oi
CmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjUuNDEgMTIuMjkgNC44OCAxLzM2MCA4OTQ0
CnN0YXJ0X3RpbWU6ICcxNDQyMzYwMjQzJwplbmRfdGltZTogJzE0NDIzNjA1NTQnCnZlcnNpb246
ICIvbGtwL2xrcC8uc3JjLTIwMTUwOTE1LTIzNTE1OSIK

--===============7283904864797615614==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IGZ1dGV4MiAyNSBib3RoIDEgOCAxNiAyNCAzMgo=

--===============7283904864797615614==--

