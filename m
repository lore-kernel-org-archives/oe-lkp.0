Content-Type: multipart/mixed; boundary="===============7746123748791992204=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] b191f9b106e: -8.8% netperf.time.minor_page_faults
Date: Wed, 01 Apr 2015 11:23:34 +0800
Message-ID: <1427858614.17170.102.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7746123748791992204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit b191f9b106ea1a24a711dbebb2925d3313da5852 ("mm: numa: preserve PTE wr=
ite permissions across a NUMA hinting fault")


testbox/testcase/testparams: lkp-ne02/netperf/performance-300s-200%-TCP_SEN=
DFILE

bea66fbd11af1ca9  b191f9b106ea1a24a711dbebb2  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     13115 =C2=B1  0%      -8.8%      11968 =C2=B1  0%  netperf.time.minor_=
page_faults
     65.63 =C2=B1  6%     -14.6%      56.05 =C2=B1  7%  netperf.time.user_t=
ime
     65.63 =C2=B1  6%     -14.6%      56.05 =C2=B1  7%  time.user_time
    728886 =C2=B1 12%     -29.2%     516121 =C2=B1 25%  proc-vmstat.pgalloc=
_dma32
       259 =C2=B1 12%     -21.8%        203 =C2=B1 19%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
       139 =C2=B1 26%     -40.9%         82 =C2=B1 48%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
   1437779 =C2=B1  5%      -9.7%    1298979 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.max_vruntime
   1437779 =C2=B1  5%      -9.7%    1298979 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.MIN_vruntime
       518 =C2=B1 37%     -52.1%        248 =C2=B1 40%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
       117 =C2=B1  6%     +13.5%        132 =C2=B1  9%  sched_debug.cfs_rq[=
3]:/.load
       191 =C2=B1 28%     +71.7%        328 =C2=B1 35%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    306355 =C2=B1 47%     -33.0%     205153 =C2=B1  1%  sched_debug.cpu#11.=
nr_switches
    306423 =C2=B1 47%     -33.0%     205208 =C2=B1  1%  sched_debug.cpu#11.=
sched_count
      1050 =C2=B1 13%     +59.2%       1672 =C2=B1 18%  sched_debug.cpu#15.=
curr->pid
      1020 =C2=B1  6%     +35.1%       1379 =C2=B1  6%  sched_debug.cpu#4.c=
urr->pid
      1082 =C2=B1 18%     +44.5%       1563 =C2=B1 28%  sched_debug.cpu#5.c=
urr->pid
      1215 =C2=B1 14%     -17.6%       1001 =C2=B1  7%  sched_debug.cpu#8.c=
urr->pid

lkp-ne02: Nehalem-EP
Memory: 5G




                           netperf.time.minor_page_faults

  13400 ++---------------------------------*-------------------------------=
-+
        |     *..      *..                :                                =
 |
  13200 *+. ..       ..   *..     .*..*.. :   *..*..*..*..*..     .*..*..  =
 |
  13000 ++ *     *..*        *..*.       *                   *..*.       *.=
.*
        |                                                                  =
 |
  12800 ++                                                                 =
 |
        |                                                                  =
 |
  12600 ++                                                                 =
 |
        |                                                                  =
 |
  12400 ++                                                                 =
 |
  12200 ++                                                                 =
 |
        |                                                                  =
 |
  12000 O+                         O          O     O  O     O             =
 |
        |  O  O  O  O  O  O  O  O     O  O O     O        O     O          =
 |
  11800 ++-----------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
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
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============7746123748791992204==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBuZXRwZXJmCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QK
ICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1h
LXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAK
ICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBs
YXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3Rh
dHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3Rh
dDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0LXdh
dGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVy
Zm9ybWFuY2UKY29tbWl0OiBlNDIzOTFjZDA0ODgwOWQ5MDMyOTFkMDdmODZlZDM5MzRjZTEzOGU5
Cm1vZGVsOiBOZWhhbGVtLUVQCm1lbW9yeTogNUcKbnJfaGRkX3BhcnRpdGlvbnM6IDEyCmhkZF9w
YXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL3Njc2ktMzUwMDBjNTAwMCpwYXJ0MSIKc3dhcF9w
YXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL3Njc2ktU0FUQV9TVDM1MDAzMjBOU185UU02WVdU
WS1wYXJ0MiIKcnVudGltZTogMzAwcwpucl90aHJlYWRzOiAyMDAlCnBlcmYtcHJvZmlsZToKICBm
cmVxOiA4MDAKY2x1c3RlcjogY3MtbG9jYWxob3N0CmlmIHJvbGUgc2VydmVyOgogIG5ldHNlcnZl
cjogCmlmIHJvbGUgY2xpZW50OgogIG5ldHBlcmY6CiAgICB0ZXN0OiBUQ1BfU0VOREZJTEUKdGVz
dGJveDogbGtwLW5lMDIKdGJveF9ncm91cDogbGtwLW5lMDIKa2NvbmZpZzogeDg2XzY0LXJoZWwK
ZW5xdWV1ZV90aW1lOiAyMDE1LTAzLTMxIDExOjU3OjQ4LjI5NzE0NjAzMiArMDg6MDAKaGVhZF9j
b21taXQ6IDA1MWQxMDFkZGNkMjY4YTc0MjlkNjg5MmMwODljMWMwODU4ZGYyMGIKYmFzZV9jb21t
aXQ6IGU0MjM5MWNkMDQ4ODA5ZDkwMzI5MWQwN2Y4NmVkMzkzNGNlMTM4ZTkKYnJhbmNoOiBsaW51
eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTAzMzEwOQprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1y
aGVsL2U0MjM5MWNkMDQ4ODA5ZDkwMzI5MWQwN2Y4NmVkMzkzNGNlMTM4ZTkvdm1saW51ei00LjAu
MC1yYzYiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvbGtwLW5lMDIvbmV0cGVyZi9wZXJmb3Jt
YW5jZS0zMDBzLTIwMCUtVENQX1NFTkRGSUxFL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
eDg2XzY0LXJoZWwvZTQyMzkxY2QwNDg4MDlkOTAzMjkxZDA3Zjg2ZWQzOTM0Y2UxMzhlOS8wIgpu
b2RlX3JvbGVzOiBzZXJ2ZXIgY2xpZW50CmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLW5l
MDIvY3ljbGljX25ldHBlcmYtcGVyZm9ybWFuY2UtMzAwcy0yMDAlLVRDUF9TRU5ERklMRS14ODZf
NjQtcmhlbC1CQVNFLWU0MjM5MWNkMDQ4ODA5ZDkwMzI5MWQwN2Y4NmVkMzkzNGNlMTM4ZTktMC0y
MDE1MDMzMS0zMjk1Ni0xdWhndW9lLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wMy0zMSAxMjoy
OTozNC4xMzMxMzYyODcgKzA4OjAwCm5yX2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiAxNTAw
Cm1vZHVsZXNfaW5pdHJkOiAiL2tlcm5lbC94ODZfNjQtcmhlbC9lNDIzOTFjZDA0ODgwOWQ5MDMy
OTFkMDdmODZlZDM5MzRjZTEzOGU5L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvbGtwL2JlbmNo
bWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvbmV0cGVyZi1kZWJpYW4uY2d6LC9s
a3AvYmVuY2htYXJrcy9uZXRwZXJmLmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAz
NC45MSAyOS4zNSAxMy40OSAxLzIxNCA5MzE4CnN0YXJ0X3RpbWU6ICcxNDI3Nzc2MjA2JwplbmRf
dGltZTogJzE0Mjc3NzY1MDcnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwMzMxLTEwNDc1
NSIK

--===============7746123748791992204==
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
bS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm5ldHNlcnZlcgpuZXRwZXJmIC10IFRD
UF9TRU5ERklMRSAtYyAtQyAtbCAzMDAKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwg
MzAwCm5ldHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9T
RU5ERklMRSAtYyAtQyAtbCAzMDAKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAw
Cm5ldHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5E
RklMRSAtYyAtQyAtbCAzMDAKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCm5l
dHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5ERklM
RSAtYyAtQyAtbCAzMDAKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCm5ldHBl
cmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAt
YyAtQyAtbCAzMDAKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCm5ldHBlcmYg
LXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAt
QyAtbCAzMDAKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQg
VENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAt
bCAzMDAKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQgVENQ
X1NFTkRGSUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAz
MDAKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQgVENQX1NF
TkRGSUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAK
bmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQgVENQX1NFTkRG
SUxFIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAKbmV0
cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQgVENQX1NFTkRGSUxF
IC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAKbmV0cGVy
ZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwCg==

--===============7746123748791992204==--

