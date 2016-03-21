Content-Type: multipart/mixed; boundary="===============7697612088452253912=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [cpufreq] 9be4fd2c77: No primary result change, 56.4% fsmark.time.involuntary_context_switches
Date: Mon, 21 Mar 2016 14:34:49 +0800
Message-ID: <20160321063449.GC32569@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7697612088452253912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that fsmark.time.involuntary_context_switches +56.4% change=
 with your commit: =


https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 9be4fd2c7723a3057b0b39676fe4c8d5fd7118a4 ("cpufreq: governor: Replac=
e timers with utilization update callbacks")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filesize/fs2/fs/iterations/kconfig/nr_directories/nr_files_pe=
r_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/1HDD/8K/nfsv4/ext4/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-20=
15-02-07.cgz/fsyncBeforeClose/lkp-ws02/400M/fsmark

commit: =

  a4675fbc4a7abe072ac6ba38c252f22a91ebcd94
  9be4fd2c7723a3057b0b39676fe4c8d5fd7118a4

a4675fbc4a7abe07 9be4fd2c7723a3057b0b39676f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     70792 =C2=B1  0%     +56.4%     110713 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
    108756 =C2=B1  2%     -10.4%      97492 =C2=B1  6%  meminfo.DirectMap4k
     70792 =C2=B1  0%     +56.4%     110713 =C2=B1  1%  time.involuntary_co=
ntext_switches
     21.50 =C2=B1 57%     +48.8%      32.00 =C2=B1  2%  turbostat.Avg_MHz
     92879 =C2=B1  1%     -12.2%      81528 =C2=B1  2%  softirqs.RCU
    107180 =C2=B1  1%     -19.4%      86414 =C2=B1  0%  softirqs.SCHED
      7477 =C2=B1  0%      +7.5%       8036 =C2=B1  0%  vmstat.system.cs
    710.75 =C2=B1  0%     +92.2%       1366 =C2=B1  2%  vmstat.system.in
 1.165e+09 =C2=B1  0%     -12.3%  1.022e+09 =C2=B1  3%  cpuidle.C3-NHM.time
    266839 =C2=B1  1%     -20.5%     212259 =C2=B1  2%  cpuidle.C3-NHM.usage
  58012774 =C2=B1  4%     +26.7%   73508891 =C2=B1  2%  cpuidle.POLL.time


lkp-ws02: Westmere-EP
Memory: 16G


                      fsmark.time.involuntary_context_switches

  115000 ++----------------------------------------------------------------=
-+
         |                                          OOOO O   OOO           =
 |
  110000 ++        O                                      OO    O O        =
 |
  105000 +O   O  O   O  O  O  O OO OOO  O  O O  OO                         =
 |
         O  OO O  O   OO  O O  O       O O  O O   O                        =
 |
  100000 ++                                                                =
 |
   95000 ++                                                                =
 |
         |                                                                 =
 |
   90000 ++                                                                =
 |
   85000 ++                                                                =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
   75000 ++                                                                =
 |
         |     *.***.* **.            .***.****.***.                       =
 |
   70000 **-***-------*---***-****-***--------------****-***-****-***-****-=
**


                          time.involuntary_context_switches

  115000 ++----------------------------------------------------------------=
-+
         |                                          OOOO O   OOO           =
 |
  110000 ++        O                                      OO    O O        =
 |
  105000 +O   O  O   O  O  O  O OO OOO  O  O O  OO                         =
 |
         O  OO O  O   OO  O O  O       O O  O O   O                        =
 |
  100000 ++                                                                =
 |
   95000 ++                                                                =
 |
         |                                                                 =
 |
   90000 ++                                                                =
 |
   85000 ++                                                                =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
   75000 ++                                                                =
 |
         |     *.***.* **.            .***.****.***.                       =
 |
   70000 **-***-------*---***-****-***--------------****-***-****-***-****-=
**


                                 vmstat.system.in

  1500 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1400 ++                                          OOO OO  OOO O           =
 |
  1300 +O OO      O O OO    O  OO OOO OOO OOOO O         O      OO         =
 |
       O    O OOO  O    O OO  O                                            =
 |
  1200 ++                                       OO                         =
 |
       |                                                                   =
 |
  1100 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
   900 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++.*  .** .*  .**   *     .*     *. ** .* *.  *.     *              =
 |
       **  **   *  **   *.* *.***  **.**  *  *  *  **  ***.* *.***.***.*   =
 |
   700 ++---------------------------------------------------------------**-=
**


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
Xiaolong Ye.

--===============7697612088452253912==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3RhdDog
CiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJv
Yy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNs
YWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAog
IHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDog
CiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAog
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IApkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogOWJlNGZkMmM3
NzIzYTMwNTdiMGIzOTY3NmZlNGM4ZDVmZDcxMThhNAptb2RlbDogV2VzdG1lcmUtRVAKbWVtb3J5
OiAxNkcKbnJfaGRkX3BhcnRpdGlvbnM6IDEwCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5
LWlkL3Njc2ktMzUwMDBjNTAwKi1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRp
dGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwMkZBRVgtMDBaM0EwX1dELVdDQVRS
NTQwODU2NC1wYXJ0MyIKY2F0ZWdvcnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJl
YWRzOiAzMnQKZGlzazogMUhERApmczogZXh0NApmczI6IG5mc3Y0CmZzbWFyazoKICBmaWxlc2l6
ZTogOEsKICB0ZXN0X3NpemU6IDQwME0KICBzeW5jX21ldGhvZDogZnN5bmNCZWZvcmVDbG9zZQog
IG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAyNTZmcGQKcXVl
dWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3Atd3MwMgp0Ym94X2dyb3VwOiBsa3Atd3MwMgprY29uZmln
OiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDMtMjAgMTA6MDk6MjQuNTI1MjE5NTg4
ICswODowMApjb21waWxlcjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oKaWQ6IGZkZDQwNGRhY2NhZWU1ZTBjOTZhOTBkMWM2ZjExMzU0ZWQ3NjFmNTEKdXNlcjog
bGtwCmhlYWRfY29tbWl0OiA2YzAxZTM2ZjM2ODYxMjM1Y2MxNTE3MDZiMWJjYjY3NGU5NjVjNWE1
CmJhc2VfY29tbWl0OiBiNTYyZTQ0ZjUwN2U4NjNjNjc5Mjk0NmU0ZTFiMTQ0OWZiYmFjODVkCmJy
YW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzE5MDEKcmVzdWx0X3Jvb3Q6ICIv
cmVzdWx0L2ZzbWFyay8xeC0zMnQtMUhERC1leHQ0LW5mc3Y0LThLLTQwME0tZnN5bmNCZWZvcmVD
bG9zZS0xNmQtMjU2ZnBkL2xrcC13czAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2
XzY0LXJoZWwvZ2NjLTQuOS85YmU0ZmQyYzc3MjNhMzA1N2IwYjM5Njc2ZmU0YzhkNWZkNzExOGE0
LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXdzMDIvYmlzZWN0X2ZzbWFyay0xeC0z
MnQtMUhERC1leHQ0LW5mc3Y0LThLLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLWRl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtOWJlNGZkMmM3NzIzYTMwNTdi
MGIzOTY3NmZlNGM4ZDVmZDcxMThhNC0yMDE2MDMyMC0zOTQyOS1icThvajYtMC55YW1sIgpucl9j
cHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMTc1Ni43MDAwMDAwMDAwMDAzCmluaXRyZDogIi9v
c2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2Fw
cGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xr
cC13czAyL2Jpc2VjdF9mc21hcmstMXgtMzJ0LTFIREQtZXh0NC1uZnN2NC04Sy00MDBNLWZzeW5j
QmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82
NC1yaGVsLTliZTRmZDJjNzcyM2EzMDU3YjBiMzk2NzZmZTRjOGQ1ZmQ3MTE4YTQtMjAxNjAzMjAt
Mzk0MjktYnE4b2o2LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAot
IGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAzMTkwMQotIGNvbW1pdD05YmU0
ZmQyYzc3MjNhMzA1N2IwYjM5Njc2ZmU0YzhkNWZkNzExOGE0Ci0gQk9PVF9JTUFHRT0vcGtnL2xp
bnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOWJlNGZkMmM3NzIzYTMwNTdiMGIzOTY3NmZlNGM4ZDVm
ZDcxMThhNC92bWxpbnV6LTQuNS4wLXJjMi0wMDAwNC1nOWJlNGZkMgotIG1heF91cHRpbWU9MTc1
NgotIFJFU1VMVF9ST09UPS9yZXN1bHQvZnNtYXJrLzF4LTMydC0xSERELWV4dDQtbmZzdjQtOEst
NDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvbGtwLXdzMDIvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzliZTRmZDJjNzcyM2EzMDU3YjBiMzk2
NzZmZTRjOGQ1ZmQ3MTE4YTQvMAotIExLUF9TRVJWRVI9aW5uCi0gfC0KICBpcG1pX3dhdGNoZG9n
LnN0YXJ0X25vdz0xCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZl
bD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJj
dV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1p
X3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9
MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3Cmxr
cF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOWJlNGZkMmM3NzIzYTMwNTdiMGIzOTY3NmZlNGM4
ZDVmZDcxMThhNC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3Rh
dC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMyLmNneiwvbGtwL2Jl
bmNobWFya3MvZnNtYXJrLmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvOWJlNGZkMmM3NzIzYTMwNTdiMGIzOTY3NmZlNGM4ZDVmZDcxMThh
NC9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2
XzY0LXJoZWwvZ2NjLTQuOS85YmU0ZmQyYzc3MjNhMzA1N2IwYjM5Njc2ZmU0YzhkNWZkNzExOGE0
L3ZtbGludXotNC41LjAtcmMyLTAwMDA0LWc5YmU0ZmQyIgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDMt
MjAgMTA6MTY6MzguMzgwNDM3MzEyICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6
IDM3LjM5IDMxLjU3IDE2LjEwIDMvMzczIDEzNzA2CnN0YXJ0X3RpbWU6ICcxNDU4NDQwMjU4Jwpl
bmRfdGltZTogJzE0NTg0NDA3NTInCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMzE4LTE1
NTAxMiIK

--===============7697612088452253912==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yMCAxMDoxNzozNSBta2ZzIC10IGV4dDQgLXEgLUYgL2Rldi9zZGQxCjIwMTYtMDMt
MjAgMTA6MTc6MzcgbW91bnQgLXQgZXh0NCAvZGV2L3NkZDEgL2ZzL3NkZDEKMjAxNi0wMy0yMCAx
MDoxNzozNyAvZXRjL2luaXQuZC9ycGNiaW5kIHN0YXJ0CjIwMTYtMDMtMjAgMTA6MTc6MzcgL2V0
Yy9pbml0LmQvbmZzLWNvbW1vbiBzdGFydAoyMDE2LTAzLTIwIDEwOjE3OjM3IC9ldGMvaW5pdC5k
L25mcy1rZXJuZWwtc2VydmVyIHN0YXJ0CjIwMTYtMDMtMjAgMTA6MTc6MzcgbW91bnQgLXQgbmZz
IC1vIHZlcnM9NCBsb2NhbGhvc3Q6L2ZzL3NkZDEgL25mcy9zZGQxCjIwMTYtMDMtMjAgMTA6MTc6
MzkgLi9mc19tYXJrIC1kIC9uZnMvc2RkMS8xIC1kIC9uZnMvc2RkMS8yIC1kIC9uZnMvc2RkMS8z
IC1kIC9uZnMvc2RkMS80IC1kIC9uZnMvc2RkMS81IC1kIC9uZnMvc2RkMS82IC1kIC9uZnMvc2Rk
MS83IC1kIC9uZnMvc2RkMS84IC1kIC9uZnMvc2RkMS85IC1kIC9uZnMvc2RkMS8xMCAtZCAvbmZz
L3NkZDEvMTEgLWQgL25mcy9zZGQxLzEyIC1kIC9uZnMvc2RkMS8xMyAtZCAvbmZzL3NkZDEvMTQg
LWQgL25mcy9zZGQxLzE1IC1kIC9uZnMvc2RkMS8xNiAtZCAvbmZzL3NkZDEvMTcgLWQgL25mcy9z
ZGQxLzE4IC1kIC9uZnMvc2RkMS8xOSAtZCAvbmZzL3NkZDEvMjAgLWQgL25mcy9zZGQxLzIxIC1k
IC9uZnMvc2RkMS8yMiAtZCAvbmZzL3NkZDEvMjMgLWQgL25mcy9zZGQxLzI0IC1kIC9uZnMvc2Rk
MS8yNSAtZCAvbmZzL3NkZDEvMjYgLWQgL25mcy9zZGQxLzI3IC1kIC9uZnMvc2RkMS8yOCAtZCAv
bmZzL3NkZDEvMjkgLWQgL25mcy9zZGQxLzMwIC1kIC9uZnMvc2RkMS8zMSAtZCAvbmZzL3NkZDEv
MzIgLUQgMTYgLU4gMjU2IC1uIDE2MDAgLUwgMSAtUyAxIC1zIDgxOTIK

--===============7697612088452253912==--

