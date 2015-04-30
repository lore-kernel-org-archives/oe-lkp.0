Content-Type: multipart/mixed; boundary="===============5522839023192805053=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: [block] 5a19fe29ba7: +5.4% boot-slabinfo.num_objs
Date: Thu, 30 Apr 2015 12:07:34 +0800
Message-ID: <20150430040734.GA9795@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5522839023192805053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/mlin/linux.git block-generic-=
req
commit 5a19fe29ba7d052c0d8fa8a2bf461abc1e4d89bb ("block: make generic_make_=
request handle arbitrarily sized bios")


testbox/testcase/testparams: vm-kbuild-1G/boot/1

        v4.1-rc1  5a19fe29ba7d052c0d8fa8a2bf  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    152092 =C2=B1  0%      +5.4%     160249 =C2=B1  0%  boot-slabinfo.num_o=
bjs
     10106 =C2=B1  0%     +21.6%      12293 =C2=B1  0%  boot-slabinfo.num_p=
ages
      8.30 =C2=B1 21%     -33.9%       5.48 =C2=B1  1%  boot-time.boot
      7.44 =C2=B1 23%     -34.9%       4.84 =C2=B1  1%  boot-time.dhcp
     10.01 =C2=B1 17%     -27.0%       7.31 =C2=B1  1%  boot-time.idle
     35507 =C2=B1  2%     +17.9%      41856 =C2=B1 10%  boot-meminfo.Direct=
Map4k
      1558 =C2=B1  8%    +276.5%       5868 =C2=B1  1%  boot-meminfo.Kernel=
Stack
    480717 =C2=B1  0%      -2.8%     467414 =C2=B1  0%  boot-meminfo.MemFree
     11462 =C2=B1  1%     +70.0%      19488 =C2=B1  0%  boot-meminfo.SUnrec=
laim
     40390 =C2=B1  0%     +21.7%      49146 =C2=B1  0%  boot-meminfo.Slab

vm-kbuild-1G: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
Memory: 1G




                               boot-slabinfo.num_objs

  162000 ++----------------------------------------------------------------=
-+
         |  O                                             O            O   =
 O
  160000 O+             O       O       O    O    O    O                 O =
 |
         |    O  O         O         O     O    O    O       O O  O        =
 |
         |         O          O    O                                O      =
 |
  158000 ++                                                                =
 |
         |            O                                                    =
 |
  156000 ++                                                                =
 |
         |                                                                 =
 |
  154000 ++                                                                =
 |
         |                                                                 =
 |
         |  *.  .*.*..     *..*.*..                                        =
 |
  152000 ++.  *.      *. ..        *                                       =
 |
         *              *                                                  =
 |
  150000 ++----------------------------------------------------------------=
-+


                               boot-slabinfo.num_pages

  12500 ++-----------------------------------------------------------------=
-+
        O  O O  O O  O  O O     O O  O O  O  O O  O O  O  O O  O  O    O O =
 O
        |                    O                                      O      =
 |
  12000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  11500 ++                                                                 =
 |
        |                                                                  =
 |
  11000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  10500 ++                                                                 =
 |
        |                                                                  =
 |
        |   .*..*.  .*..*.*..*..*.*                                        =
 |
  10000 *+-*------*--------------------------------------------------------=
-+


                                boot-meminfo.MemFree

  484000 ++----------------------------------------------------------------=
-+
  482000 ++                *                                               =
 |
         | .*.*.. .*..*   : +   *..                                        =
 |
  480000 *+      *     :  :  + +                                           =
 |
  478000 ++            : :    *    *                                       =
 |
         |              *                                                  =
 |
  476000 ++                                                                =
 |
  474000 ++                                                                =
 |
  472000 ++                                                                =
 |
         |                                                                 =
 |
  470000 ++                                O O       O O     O O           =
 |
  468000 ++   O  O O  O    O  O         O         O       O            O O =
 |
         |  O           O       O  O                              O O      =
 |
  466000 O+                          O          O                          =
 O
  464000 ++----------------------------------------------------------------=
-+


                                  boot-meminfo.Slab

  50000 ++-----------------------------------------------------------------=
-+
  49000 O+ O O  O O  O    O     O O  O O  O  O O  O O  O  O O  O  O    O O =
 O
        |               O    O                                      O      =
 |
  48000 ++                                                                 =
 |
  47000 ++                                                                 =
 |
        |                                                                  =
 |
  46000 ++                                                                 =
 |
  45000 ++                                                                 =
 |
  44000 ++                                                                 =
 |
        |                                                                  =
 |
  43000 ++                                                                 =
 |
  42000 ++                                                                 =
 |
        |                                                                  =
 |
  41000 ++.*.*..*.  .*..*.  .*..*.*                                        =
 |
  40000 *+--------*-------*------------------------------------------------=
-+


                               boot-meminfo.SUnreclaim

  20000 ++----------------------O----O---------O----------O--------------O-=
-+
        O  O O  O O  O  O O  O    O    O  O  O    O O  O    O  O  O O  O   =
 O
  19000 ++                                                                 =
 |
  18000 ++                                                                 =
 |
        |                                                                  =
 |
  17000 ++                                                                 =
 |
  16000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
  14000 ++                                                                 =
 |
        |                                                                  =
 |
  13000 ++                                                                 =
 |
  12000 ++                                                                 =
 |
        *..*.*..*.*..*..*.*..*..*.*                                        =
 |
  11000 ++-----------------------------------------------------------------=
-+


                             boot-meminfo.KernelStack

  6000 O+------O--O-O-----O----O--O-O-----O-O--O----O--O-O--O--O-O--O--O---=
-O
  5500 ++ O O          O    O          O         O                       O =
 |
       |                                                                   =
 |
  5000 ++                                                                  =
 |
  4500 ++                                                                  =
 |
       |                                                                   =
 |
  4000 ++                                                                  =
 |
  3500 ++                                                                  =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
       | .*.  .*..*.*..*..*.  .*..*                                        =
 |
  1500 *+   *.              *.                                             =
 |
  1000 ++------------------------------------------------------------------=
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
lkp

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============5522839023192805053==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBib290CmRlZmF1bHQtbW9uaXRvcnM6IApkZWZhdWx0LXdhdGNoZG9nczoK
ICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogCm1vZGVsOiBxZW11
LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLWNwdSBIYXN3ZWxsLCtzbWVwLCtzbWFwCm5yX3Zt
OiAxNgpucl9jcHU6IDIKbWVtb3J5OiAxRwpkaXNrX3R5cGU6IHZpcnRpby1zY3NpCnJvb3Rmczog
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpoZGRfcGFydGl0aW9uczogIi9kZXYvc2RhIC9k
ZXYvc2RiIC9kZXYvc2RjIC9kZXYvc2RkIgpzd2FwX3BhcnRpdGlvbnM6ICIvZGV2L3NkZSIKYm9v
dC1zbGFiaW5mbzogCmJvb3QtbWVtaW5mbzogCm1lbW1hcDogCmJvb3QtbWVtb3J5OiAKYm9vdC10
aW1lOiAKa2VybmVsLXNpemU6IAp0aW1lb3V0OiAxMG0Kc2xlZXA6IDEKYnJhbmNoOiBsaW51eC1k
ZXZlbC9kZXZlbC1ob3VybHktMjAxNTA0MjkwMQpjb21taXQ6IDAxMDYwYmZiNzk5ODdjZjFiN2Iy
MDEyYzViZmJjM2FlNmQ3YTdlNzgKcmVwZWF0X3RvOiAyCnRlc3Rib3g6IHZtLWtidWlsZC0xRy0y
CnRib3hfZ3JvdXA6IHZtLWtidWlsZC0xRwprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3Rp
bWU6IDIwMTUtMDQtMjkgMDk6NTY6MTMuNzI2NjQ5ODQ1ICswODowMAprZXJuZWw6ICIva2VybmVs
L3g4Nl82NC1yaGVsLzAxMDYwYmZiNzk5ODdjZjFiN2IyMDEyYzViZmJjM2FlNmQ3YTdlNzgvdm1s
aW51ei00LjEuMC1yYzEtMDEwMDktZzAxMDYwYmYiCnVzZXI6IGxrcApxdWV1ZTogYm9vdApyZXN1
bHRfcm9vdDogIi9yZXN1bHQvdm0ta2J1aWxkLTFHL2Jvb3QvMS9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L3g4Nl82NC1yaGVsLzAxMDYwYmZiNzk5ODdjZjFiN2IyMDEyYzViZmJjM2FlNmQ3
YTdlNzgvMCIKTEtQX1NFUlZFUjogaW5uCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvdm0ta2J1
aWxkLTFHLTIvYm9vdF9ib290LTEtZGViaWFuLXg4Nl82NC5jZ3oteDg2XzY0LXJoZWwtMDEwNjBi
ZmI3OTk4N2NmMWI3YjIwMTJjNWJmYmMzYWU2ZDdhN2U3OC0xLTIwMTUwNDI5LTEwMDIxLTFncjFh
ZnkueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA0LTI5IDA5OjU3OjU0LjQ2OTA2NDc4MyArMDg6
MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oi
CmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xr
cC9zY2hlZHVsZWQvdm0ta2J1aWxkLTFHLTIvYm9vdF9ib290LTEtZGViaWFuLXg4Nl82NC5jZ3ot
eDg2XzY0LXJoZWwtMDEwNjBiZmI3OTk4N2NmMWI3YjIwMTJjNWJmYmMzYWU2ZDdhN2U3OC0xLTIw
MTUwNDI5LTEwMDIxLTFncjFhZnkueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQt
cmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA0MjkwMQotIGNvbW1p
dD0wMTA2MGJmYjc5OTg3Y2YxYjdiMjAxMmM1YmZiYzNhZTZkN2E3ZTc4Ci0gQk9PVF9JTUFHRT0v
a2VybmVsL3g4Nl82NC1yaGVsLzAxMDYwYmZiNzk5ODdjZjFiN2IyMDEyYzViZmJjM2FlNmQ3YTdl
Nzgvdm1saW51ei00LjEuMC1yYzEtMDEwMDktZzAxMDYwYmYKLSBSRVNVTFRfUk9PVD0vcmVzdWx0
L3ZtLWtidWlsZC0xRy9ib290LzEvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQt
cmhlbC8wMTA2MGJmYjc5OTg3Y2YxYjdiMjAxMmM1YmZiYzNhZTZkN2E3ZTc4LzAKLSBMS1BfU0VS
VkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHJkLnVkZXYubG9nLXBy
aW9yaXR5PWVyciBzeXN0ZW1kLmxvZ190YXJnZXQ9am91cm5hbCBzeXN0ZW1kLmxvZ19sZXZlbD13
YXJuaW5nCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5y
Y3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpt
YXhfdXB0aW1lOiA2MDAKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1
bGVzX2luaXRyZDogIi9rZXJuZWwveDg2XzY0LXJoZWwvMDEwNjBiZmI3OTk4N2NmMWI3YjIwMTJj
NWJmYmMzYWU2ZDdhN2U3OC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3oiCmpvYl9zdGF0ZTogZmluaXNoZWQK
bG9hZGF2ZzogMC4wNSAwLjAxIDAuMDEgMS8zNTUgNzIxCnN0YXJ0X3RpbWU6ICcxNDMwMjcyNzA5
JwplbmRfdGltZTogJzE0MzAyNzI3MTAnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwNDI5
LTA5MjI0NSIK

--===============5522839023192805053==--

