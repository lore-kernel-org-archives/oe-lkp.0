Content-Type: multipart/mixed; boundary="===============8888343361965891965=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [x86, pkeys] 2205cb3c40: 22.4% will-it-scale.per_thread_ops
Date: Thu, 08 Oct 2015 14:12:03 +0800
Message-ID: <87a8rtx51o.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8888343361965891965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/daveh/x86-pkeys.git pkeys-v=
005-protsyscalls
commit 2205cb3c40c2ba6521427c9f8f36b2d4f2f2a98d ("x86, pkeys: arch-specific=
 protection bits")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lkp-xbm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/pe=
rformance/pread1

commit: =

  d1d70274836b555fdc790a4957ce5ca24b427bf4
  2205cb3c40c2ba6521427c9f8f36b2d4f2f2a98d

d1d70274836b555f 2205cb3c40c2ba6521427c9f8f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1440317 =C2=B1  0%     +22.4%    1762590 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    313.14 =C2=B1  0%      -2.1%     306.57 =C2=B1  0%  will-it-scale.time.=
system_time
     27.99 =C2=B1  0%     +24.0%      34.71 =C2=B1  0%  will-it-scale.time.=
user_time
     13.25 =C2=B1 20%     -50.9%       6.50 =C2=B1 41%  cpuidle.POLL.usage
     27.99 =C2=B1  0%     +24.0%      34.71 =C2=B1  0%  time.user_time
      1965 =C2=B1  0%     -19.1%       1590 =C2=B1  3%  vmstat.system.cs
     37.50 =C2=B1  4%     -24.0%      28.50 =C2=B1  9%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
    144.50 =C2=B1  6%     -17.8%     118.75 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.load_avg
    145.50 =C2=B1  6%     -18.6%     118.50 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib


lkp-xbm: Sandy Bridge
Memory: 2G




                             will-it-scale.per_thread_ops

   1.8e+06 ++------------O-O--O--O-O-----O--O---------O-----O-O--O---------=
-+
           O  O O  O                  O       O  O  O    O          O  O O =
 O
  1.75e+06 ++         O                                                    =
 |
           |                                                               =
 |
   1.7e+06 ++                                                              =
 |
  1.65e+06 ++                                                              =
 |
           |                                                               =
 |
   1.6e+06 ++                                                              =
 |
           |                                                               =
 |
  1.55e+06 ++                                                              =
 |
   1.5e+06 ++                                                              =
 |
           |                          *..*..                               =
 |
  1.45e+06 ++                       ..                             .*      =
 |
           *..*.*..*..*..*.*..*..*.*        *.*..*..*.*..*..*.*..*.        =
 |
   1.4e+06 ++--------------------------------------------------------------=
-+


                          will-it-scale.time.user_time

  36 ++--------------------------------------------------------------------=
-+
     |     O  O                 O                                          =
 |
  35 ++             O     O  O        O  O       O  O  O  O  O  O  O  O  O =
 O
  34 ++                O           O       O                               =
 |
     O  O                                     O                            =
 |
  33 ++          O                                                         =
 |
  32 ++                                                                    =
 |
     |                                                                     =
 |
  31 ++                                                                    =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  29 ++                            *..*..                                  =
 |
  28 ++                          ..                               .*       =
 |
     *..*..  .*..*..*..        .*        *.*..*..*..*..*..*..*..*.         =
 |
  27 ++----*-----------*--*--*---------------------------------------------=
-+


                          will-it-scale.time.system_time

  315 ++-------------------------------------------------------------------=
-+
  314 ++   .*..        .*.*..*..                                           =
 |
      *..*.    *..*..*.         *..      *..*..  .*..*..*..*.  .*..        =
 |
  313 ++                           *.. ..      *.            *.    *       =
 |
  312 ++                              *                                    =
 |
      |                                                                    =
 |
  311 ++                                                                   =
 |
  310 ++                                                                   =
 |
  309 ++                                                                   =
 |
      |           O                                                        =
 |
  308 O+ O                                     O                           =
 |
  307 ++                O          O        O     O     O    O             =
 |
      |              O    O  O  O     O  O           O     O    O  O  O  O =
 O
  306 ++    O  O                                                           =
 |
  305 ++-------------------------------------------------------------------=
-+


                                 time.user_time

  36 ++--------------------------------------------------------------------=
-+
     |     O  O                 O                                          =
 |
  35 ++             O     O  O        O  O       O  O  O  O  O  O  O  O  O =
 O
  34 ++                O           O       O                               =
 |
     O  O                                     O                            =
 |
  33 ++          O                                                         =
 |
  32 ++                                                                    =
 |
     |                                                                     =
 |
  31 ++                                                                    =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  29 ++                            *..*..                                  =
 |
  28 ++                          ..                               .*       =
 |
     *..*..  .*..*..*..        .*        *.*..*..*..*..*..*..*..*.         =
 |
  27 ++----*-----------*--*--*---------------------------------------------=
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

--===============8888343361965891965==
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
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDBhMTgw
MjM0OGU4ZjUzMDFiZGI2YTVkNTliOGRlZjIwMzRhYzNjM2UKbW9kZWw6IFNhbmR5IEJyaWRnZQpt
ZW1vcnk6IDJHCm5yX2NwdTogOApoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJv
b3Rmc19wYXJ0aXRpb246IApjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJvZmlsZToKICBmcmVx
OiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OiBwcmVhZDEKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94
OiBsa3AteGJtCnRib3hfZ3JvdXA6IGxrcC14Ym0Ka2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1
ZV90aW1lOiAyMDE1LTA5LTIwIDA3OjI1OjIyLjk1MDYwMjgyNyArMDg6MDAKaWQ6IGExMmFmM2Q5
YmY5MzJkOGIzOGVjODM2ZmM1MzM3ZDNmNzZjOGQ1MWIKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2Mt
NC45CmhlYWRfY29tbWl0OiAwYTE4MDIzNDhlOGY1MzAxYmRiNmE1ZDU5YjhkZWYyMDM0YWMzYzNl
CmJhc2VfY29tbWl0OiA2ZmYzM2YzOTAyYzNiMWM1ZDBkYjZiMWUyYzcwYjZkNzZmYmEzNTdmCmJy
YW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwOTIxMDEKa2VybmVsOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzBhMTgwMjM0OGU4ZjUzMDFiZGI2YTVkNTliOGRlZjIw
MzRhYzNjM2Uvdm1saW51ei00LjMuMC1yYzEtMDE0MjctZzBhMTgwMjMiCnJvb3RmczogZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvd2lsbC1pdC1zY2Fs
ZS9wZXJmb3JtYW5jZS1wcmVhZDEvbGtwLXhibS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3g4Nl82NC1yaGVsL2djYy00LjkvMGExODAyMzQ4ZThmNTMwMWJkYjZhNWQ1OWI4ZGVmMjAzNGFj
M2MzZS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC14Ym0vY3ljbGljX3dpbGwtaXQt
c2NhbGUtcGVyZm9ybWFuY2UtcHJlYWQxLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELTBhMTgwMjM0
OGU4ZjUzMDFiZGI2YTVkNTliOGRlZjIwMzRhYzNjM2UtMjAxNTA5MjAtNjA1NzUtMTJscWZ6OS0w
LnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wOS0yMSAwMjo0MjowMi44NDI0OTQwMTMgKzA4OjAw
Cm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNl
cj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLXhibS9jeWNsaWNfd2lsbC1pdC1zY2FsZS1w
ZXJmb3JtYW5jZS1wcmVhZDEteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtMGExODAyMzQ4ZThmNTMw
MWJkYjZhNWQ1OWI4ZGVmMjAzNGFjM2MzZS0yMDE1MDkyMC02MDU3NS0xMmxxZno5LTAueWFtbAot
IEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9k
ZXZlbC1ob3VybHktMjAxNTA5MjEwMQotIGNvbW1pdD0wYTE4MDIzNDhlOGY1MzAxYmRiNmE1ZDU5
YjhkZWYyMDM0YWMzYzNlCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvMGExODAyMzQ4ZThmNTMwMWJkYjZhNWQ1OWI4ZGVmMjAzNGFjM2MzZS92bWxpbnV6LTQuMy4w
LXJjMS0wMTQyNy1nMGExODAyMwotIG1heF91cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1
bHQvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1wcmVhZDEvbGtwLXhibS9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMGExODAyMzQ4ZThmNTMwMWJkYjZh
NWQ1OWI4ZGVmMjAzNGFjM2MzZS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJp
bnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVn
IHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAK
ICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFu
aWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3At
eDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvMGExODAyMzQ4ZThmNTMwMWJkYjZhNWQ1OWI4ZGVmMjAzNGFjM2MzZS9tb2R1bGVzLmNneiIK
Ym1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xr
cC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNv
bmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJv
c3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3dp
bGwtaXQtc2NhbGUuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDYuODMgMy4yOCAx
LjMwIDEvMTIwIDM2ODIKc3RhcnRfdGltZTogJzE0NDI3NzQ1OTAnCmVuZF90aW1lOiAnMTQ0Mjc3
NDgxOCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA5MjEtMDAwNzIyIgo=

--===============8888343361965891965==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCi4vcnVudGVzdC5weSBwcmVhZDEgMzIgYm90aCAxIDYgOAo=

--===============8888343361965891965==--

