Content-Type: multipart/mixed; boundary="===============3581727622522801535=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [x86, mm] 982792c782e: -12.3% boot-meminfo.SUnreclaim
Date: Thu, 18 Dec 2014 16:15:47 +0800
Message-ID: <1418890547.26403.4.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3581727622522801535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 982792c782ef337381e982fd2047391886f89693 ("x86, mm: probe memory blo=
ck size for generic x86 64bit")

I think this is use memory size reduction, so should be a good thing.

testbox/testcase/testparams: brickland3/boot/1

c46a7c817e662a82  982792c782ef337381e982fd20  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    128348 =C2=B1  0%     -12.3%     112541 =C2=B1  1%  boot-meminfo.SUnrec=
laim
    903719 =C2=B1  0%     -13.9%     778082 =C2=B1  0%  boot-slabinfo.num_o=
bjs
    169283 =C2=B1  0%      -9.7%     152819 =C2=B1  1%  boot-meminfo.Slab
     45691 =C2=B1  0%      -8.2%      41954 =C2=B1  1%  boot-slabinfo.num_p=
ages

brickland3: Brickland Ivy Bridge-EX
Memory: 512G




                               boot-slabinfo.num_objs

  940000 ++----------------------------------------------------------------=
-+
  920000 ++         *.     *                                               =
 |
         *.**.**.*. : *   + *.* .*.**. *.*.  .* .*                         =
 |
  900000 ++        *   *.*     *      *    **  *  *                        =
 |
  880000 ++                                                                =
 |
         |                                                                 =
 |
  860000 ++                                                                =
 |
  840000 ++                                                                =
 |
  820000 ++                                                                =
 |
         |                                                                 =
 |
  800000 O+    O           O                                               =
 |
  780000 ++OO O  O OO         OO           OO    O  O  O      OO  O O OO   =
 O
         |            OO O       O OO O  O    OO  O       O O    O       OO=
 |
  760000 ++                 O          O              O  O                 =
 |
  740000 ++----------------------------------------------------------------=
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


--===============3581727622522801535==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBib290CmJvb3QtbWVtaW5mbzogCmJvb3Qtc2xhYmluZm86IApib290LW1l
bW9yeTogCm1lbW1hcDogCmJvb3RtZW06IApkZWZhdWx0X21vbml0b3JzOgogIGJvb3R0aW1lOiAK
ICBrZXJuZWwtc2l6ZTogCnNsZWVwOiAxCmtjb25maWc6IHg4Nl82NC1yaGVsCmtlcm5lbDogIi9r
ZXJuZWwveDg2XzY0LXJoZWwvMTk1ODNjYTU4NGQ2ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRh
Ni92bWxpbnV6LTMuMTYuMCIKY29tbWl0OiAxOTU4M2NhNTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZh
ZWFkY2RjNGE2CnVzZXI6IGxrcApxdWV1ZTogd2ZnCnRlc3Rib3g6IGJyaWNrbGFuZDMKYnJhbmNo
OiBsaW51cy9tYXN0ZXIKZW5xdWV1ZV90aW1lOiAyMDE0LTA5LTI1IDIxOjU2OjE1LjA2OTUzOTMy
MiArMDg6MDAKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2JyaWNrbGFuZDMvYm9vdC8xL2RlYmlhbi14
ODZfNjQuY2d6L3g4Nl82NC1yaGVsLzE5NTgzY2E1ODRkNmY1NzQzODRlMTdmZTc2MTNkZmFlYWRj
ZGM0YTYvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9icmlja2xhbmQzL3dmZ19ib290LTEt
eDg2XzY0LXJoZWwtMTk1ODNjYTU4NGQ2ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRhNi0wLnlh
bWwiCmRlcXVldWVfdGltZTogMjAxNC0wOS0yNSAyMjowMDoyNi4wNjc4NDk0NDIgKzA4OjAwCmpv
Yl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMS4wOSAwLjI5IDAuMTAgMS85NzkgMzQxMwpzdGFy
dF90aW1lOiAnMTQxMTY1MzcxMCcKZW5kX3RpbWU6ICcxNDExNjUzNzExJwp2ZXJzaW9uOiAiL2xr
cC9sa3AvLnNyYy0yMDE0MDkyNS0yMTI5MTAiCg==

--===============3581727622522801535==--

