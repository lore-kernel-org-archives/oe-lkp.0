Content-Type: multipart/mixed; boundary="===============2965693886242693307=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [ftrace] fef5aeeee9e: -27.2% boot-slabinfo.num_objs
Date: Tue, 23 Dec 2014 11:10:17 +0800
Message-ID: <1419304217.26403.44.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2965693886242693307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit fef5aeeee9e3717e7aea991a7ae9ff6a7a2d4c85 ("ftrace: Replace tramp_has=
h with old_*_hash to save space")


testbox/testcase/testparams: vm-kbuild-4G/boot/1

e1effa0144a1ddf5  fef5aeeee9e3717e7aea991a7a  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    437752 =C2=B1  0%     -27.2%     318545 =C2=B1  0%  boot-slabinfo.num_o=
bjs

vm-kbuild-4G: qemu-system-x86_64 -enable-kvm
Memory: 4G



                               boot-slabinfo.num_objs

  440000 *+*--*-*-*------*----*-*-*--*--------*-*--*-*-*--*----------------=
-+
         |           *.*   *.          *.*..*                              =
 |
  420000 ++                                                                =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  380000 ++                                                                =
 |
         |                                                                 =
 |
  360000 ++                                                                =
 |
         |                                                                 =
 |
  340000 ++                                                                =
 |
         |                                                                 =
 |
  320000 O+O  O   O  O O O O  O O O  O O    O O O    O O  O O O O  O O O  O=
 O
         |      O                        O         O                       =
 |
  300000 ++----------------------------------------------------------------=
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


--===============2965693886242693307==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBib290CmRlZmF1bHRfbW9uaXRvcnM6CiAgYm9vdHRpbWU6IAogIGtlcm5l
bC1zaXplOiAKZGVmYXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNw
dWZyZXFfZ292ZXJub3I6IAptb2RlbDogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3ZtCm5y
X3ZtOiA4Cm5yX2NwdTogNAptZW1vcnk6IDRHCnJvb3RmczogZGViaWFuLXg4Nl82NC5jZ3oKaGRk
X3BhcnRpdGlvbnM6ICIvZGV2L3ZkYSAvZGV2L3ZkYiAvZGV2L3ZkYyAvZGV2L3ZkZCIKc3dhcF9w
YXJ0aXRpb25zOiAiL2Rldi92ZGUiCmJvb3QtbWVtaW5mbzogCmJvb3Qtc2xhYmluZm86IApib290
LW1lbW9yeTogCm1lbW1hcDogCmJvb3RtZW06IApzbGVlcDogMQpicmFuY2g6IGxpbnVzL21hc3Rl
cgpjb21taXQ6IGIyNzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQKdGVzdGJv
eDogdm0ta2J1aWxkLTRHLTEKdGJveF9ncm91cDogdm0ta2J1aWxkLTRHCmtjb25maWc6IHg4Nl82
NC1hbGx5ZXNkZWJpYW4KZW5xdWV1ZV90aW1lOiAyMDE0LTEyLTE1IDA3OjAwOjIyLjI2NzM5MjUz
MSArMDg6MDAKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtYWxseWVzZGViaWFuL2IyNzc2YmY3MTQ5
YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQvdm1saW51ei0zLjE4LjAiCnVzZXI6IGxrcApx
dWV1ZTogcmFuZApyZXN1bHRfcm9vdDogIi9yZXN1bHQvdm0ta2J1aWxkLTRHL2Jvb3QvMS9kZWJp
YW4teDg2XzY0LmNnei94ODZfNjQtYWxseWVzZGViaWFuL2IyNzc2YmY3MTQ5YmRkZDFmNDE2MWYx
NGY3OTUyMGYxN2ZjMWQ3MWQvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC92bS1rYnVpbGQt
NEctMS9yYW5kX2Jvb3QtMS1kZWJpYW4teDg2XzY0LmNnei14ODZfNjQtYWxseWVzZGViaWFuLWIy
Nzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQtMC55YW1sIgpkZXF1ZXVlX3Rp
bWU6IDIwMTQtMTItMTUgMDc6MDE6NTIuMDAwMDkyOTAwICswODowMApqb2Jfc3RhdGU6IGZpbmlz
aGVkCmxvYWRhdmc6IDIuNTQgMS40NyAwLjU4IDIvMTk2IDU3MzQKc3RhcnRfdGltZTogJzE0MTg1
OTgzMDInCmVuZF90aW1lOiAnMTQxODU5ODMwMycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAx
NDEyMTQtMTMzNTMxIgo=

--===============2965693886242693307==--

