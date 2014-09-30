Content-Type: multipart/mixed; boundary="===============5218652016881243180=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [mm] f1820361f83: -53.5% proc-vmstat.pgfault
Date: Tue, 30 Sep 2014 16:05:57 +0800
Message-ID: <20140930080557.GE9561@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5218652016881243180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kirill,

FYI, we noticed 53.5% reduction of page faults and more mmap pages on

commit f1820361f83d556a7f0a9f629100f3825e594328 ("mm: implement ->map_pages=
 for page cache")

testbox/testcase/testparams: lituya/will-it-scale/brk1

8c6e50b0290c4c7  f1820361f83d556a7f0a9f629  =

---------------  -------------------------  =

   1111649 =C2=B1 0%     -53.5%     517160 =C2=B1 0%  proc-vmstat.pgfault
        42 =C2=B115%     -39.6%         25 =C2=B122%  sched_debug.cpu#0.load
        21 =C2=B123%     +45.3%         30 =C2=B120%  sched_debug.cfs_rq[3]=
:/.runnable_load_avg
      1907 =C2=B1 0%     +56.4%       2983 =C2=B1 0%  proc-vmstat.nr_mapped
      7631 =C2=B1 0%     +56.4%      11938 =C2=B1 0%  meminfo.Mapped
      5002 =C2=B1 0%     +42.3%       7119 =C2=B1 0%  time.maximum_resident=
_set_size
     38824 =C2=B117%     +40.3%      54478 =C2=B119%  sched_debug.cpu#4.nr_=
load_updates
    572834 =C2=B118%     +32.3%     757713 =C2=B110%  sched_debug.cpu#4.sch=
ed_count
    563679 =C2=B118%     +32.3%     745714 =C2=B111%  sched_debug.cpu#4.nr_=
switches
    280478 =C2=B118%     +32.3%     371078 =C2=B111%  sched_debug.cpu#4.sch=
ed_goidle
     67648 =C2=B1 0%     +25.6%      84935 =C2=B1 0%  meminfo.Active(file)
     16911 =C2=B1 0%     +25.6%      21233 =C2=B1 0%  proc-vmstat.nr_active=
_file
        21 =C2=B1 9%     +27.5%         27 =C2=B117%  sched_debug.cfs_rq[2]=
:/.runnable_load_avg
    331375 =C2=B118%     +31.0%     434139 =C2=B1 9%  sched_debug.cpu#4.ttw=
u_count
    104185 =C2=B1 0%     +16.6%     121516 =C2=B1 0%  meminfo.Active
      2716 =C2=B1 0%     +15.5%       3138 =C2=B1 0%  proc-vmstat.pgactivate
     22227 =C2=B1 0%     -40.5%      13227 =C2=B1 0%  time.minor_page_faults
  14852144 =C2=B1 3%      +7.5%   15967380 =C2=B1 4%  time.voluntary_contex=
t_switches
    103047 =C2=B1 3%      +7.1%     110336 =C2=B1 4%  vmstat.system.cs


                               time.minor_page_faults

   3000 ++-----------------------------------------------------------------=
-+
   2800 *+*..*.*..*.*..*.*.*..*.*..*.*..*.*.*..*.*..*.*..*.*.*..*.*..*.*..*=
.*
        |                                                                  =
 |
   2600 ++                                                                 =
 |
   2400 ++                                                                 =
 |
        |                                                                  =
 |
   2200 ++                                                                 =
 |
   2000 ++                                                                 =
 |
   1800 ++                                                                 =
 |
        |                                                                  =
 |
   1600 ++                                                                 =
 |
   1400 ++                                                                 =
 |
        |                                                                  =
 |
   1200 O+O  O O  O O  O O O  O O  O O  O O O  O O  O O  O O O  O O  O O  O=
 |
   1000 ++-----------------------------------------------------------------=
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
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============5218652016881243180==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2F0Y2gtb29t
OiAKICB3YWl0OiBwcmUtdGVzdAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51
bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1z
dGF0OiAKICBwcm9jLXN0YXQ6IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRz
OiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2
X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgZW5lcmd5OiAKICBjcHVpZGxlOiAKICBjcHVmcmVx
OiAKICB0dXJib3N0YXQ6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVy
OiAKbW9kZWw6IEdyYW50bGV5IEhhc3dlbGwKbnJfY3B1OiAxNgptZW1vcnk6IDE2RwpoZGRfcGFy
dGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246IApwZXJmLXByb2Zp
bGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6CiAgdGVzdDoKICAtIGJyazEKYnJhbmNoOiBs
aW51cy9tYXN0ZXIKY29tbWl0OiAxOTU4M2NhNTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZhZWFkY2Rj
NGE2CnJlcGVhdF90bzogMwplbnF1ZXVlX3RpbWU6IDIwMTQtMDktMjUgMjE6NDU6NDMuMDUxMzc1
MDI3ICswODowMAp0ZXN0Ym94OiBsaXR1eWEKa2NvbmZpZzogeDg2XzY0LXJoZWwKa2VybmVsOiAi
L2tlcm5lbC94ODZfNjQtcmhlbC8xOTU4M2NhNTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZhZWFkY2Rj
NGE2L3ZtbGludXotMy4xNi4wIgp1c2VyOiBsa3AKcXVldWU6IHdmZwpyZXN1bHRfcm9vdDogIi9y
ZXN1bHQvbGl0dXlhL3dpbGwtaXQtc2NhbGUvYnJrMS9kZWJpYW4teDg2XzY0LmNnei94ODZfNjQt
cmhlbC8xOTU4M2NhNTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZhZWFkY2RjNGE2LzAiCmpvYl9maWxl
OiAiL2xrcC9zY2hlZHVsZWQvbGl0dXlhL3dmZ193aWxsLWl0LXNjYWxlLWJyazEteDg2XzY0LXJo
ZWwtMTk1ODNjYTU4NGQ2ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRhNi0yLnlhbWwiCmRlcXVl
dWVfdGltZTogMjAxNC0wOS0yNSAyMzoxOTo0MC41MTI0NDM2MjkgKzA4OjAwCmhpc3RvcnlfdGlt
ZTogMzAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMTQuMjUgNi44MyAyLjcxIDEvNDQz
IDY2MjUKc3RhcnRfdGltZTogJzE0MTE2NTg0MTInCmVuZF90aW1lOiAnMTQxMTY1ODcxNycKdmVy
c2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNDA5MjUtMjEyOTEwIgo=

--===============5218652016881243180==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IGJyazEgMzIgMSA4IDEyIDE2Cg==

--===============5218652016881243180==--

