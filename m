Content-Type: multipart/mixed; boundary="===============1073695720430373198=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [block] fbccf1df065: +276.3% boot-meminfo.KernelStack
Date: Mon, 01 Jun 2015 09:46:02 +0800
Message-ID: <1433123162.6691.156.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1073695720430373198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/mlin/linux.git block-generic-=
req
commit fbccf1df06574add60bdb71103cc1662e477f02d ("block: make generic_make_=
request handle arbitrarily sized bios")


testcase/path_params/tbox_group: boot/1/vm-kbuild-1G

        v4.1-rc4  fbccf1df06574add60bdb71103  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      1587 =C2=B1  7%    +276.3%       5972 =C2=B1  1%  boot-meminfo.Kernel=
Stack
    152390 =C2=B1  0%      +4.8%     159697 =C2=B1  0%  boot-slabinfo.num_o=
bjs
     10149 =C2=B1  0%     +15.8%      11750 =C2=B1  0%  boot-slabinfo.num_p=
ages
     35916 =C2=B1  5%     +18.0%      42368 =C2=B1  9%  boot-meminfo.Direct=
Map4k
    478516 =C2=B1  0%      -1.9%     469269 =C2=B1  0%  boot-meminfo.MemFree
     11477 =C2=B1  0%     +49.1%      17111 =C2=B1  1%  boot-meminfo.SUnrec=
laim
     40551 =C2=B1  0%     +15.7%      46910 =C2=B1  0%  boot-meminfo.Slab

vm-kbuild-1G: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
Memory: 1G

                             boot-meminfo.KernelStack

  7000 ++------------------------------------------------------------------=
-+
       |        O         O                           O               O    =
 |
  6000 O+ O  O      O  O     O  O  O  O   O  O  O  O     O  O  O   O     O =
 O
       |                                                                   =
 |
  5000 ++                                                                  =
 |
       |                                                                   =
 |
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                          *..                                     =
 |
       *            *..*..*..*    :   *                                    =
 |
  1000 ++         ..          +   :                                        =
 |
       | +       .             + :                                         =
 |
     0 ++-*--*--*---------------*------------------------------------------=
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
-------------------------------------
lkp(a)eclists.intel.com
https://eclists.intel.com/sympa/info/lkp
Unsubscribe by sending email to sympa(a)eclists.intel.com with subject "Uns=
ubscribe lkp"


--===============1073695720430373198==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgp0ZXN0Y2FzZTogYm9vdApkZWZhdWx0LW1vbml0b3JzOiAKZGVm
YXVsdC13YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJu
b3I6IAptb2RlbDogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3ZtIC1jcHUgSGFzd2VsbCwr
c21lcCwrc21hcApucl92bTogMTYKbnJfY3B1OiAyCm1lbW9yeTogMUcKZGlza190eXBlOiB2aXJ0
aW8tc2NzaQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKaGRkX3BhcnRpdGlv
bnM6ICIvZGV2L3NkYSAvZGV2L3NkYiAvZGV2L3NkYyAvZGV2L3NkZCIKc3dhcF9wYXJ0aXRpb25z
OiAiL2Rldi9zZGUiCmJvb3Qtc2xhYmluZm86IApib290LW1lbWluZm86IAptZW1tYXA6IApib290
LW1lbW9yeTogCmJvb3QtdGltZTogCmtlcm5lbC1zaXplOiAKdGltZW91dDogMTBtCnNsZWVwOiAx
CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNTI1MTUKY29tbWl0OiA5ZTQ2
YTFlYmExMDUwMGRmNjIwNjgzZTMxNzQyNzg5ZWYyNzgxZTkzCnJlcGVhdF90bzogMgp0ZXN0Ym94
OiB2bS1rYnVpbGQtMUctNgp0Ym94X2dyb3VwOiB2bS1rYnVpbGQtMUcKa2NvbmZpZzogeDg2XzY0
LWxrcAplbnF1ZXVlX3RpbWU6IDIwMTUtMDUtMjUgMTY6MTE6MTQuODg4MzUwODMwICswODowMAp1
c2VyOiBsa3AKcXVldWU6IGJvb3QKY29tcGlsZXI6IGdjYy00LjkKa2VybmVsOiAiL3BrZy9saW51
eC94ODZfNjQtbGtwL2djYy00LjkvOWU0NmExZWJhMTA1MDBkZjYyMDY4M2UzMTc0Mjc4OWVmMjc4
MWU5My92bWxpbnV6LTQuMS4wLXJjNS0wMjUxMC1nOWU0NmExZSIKcmVzdWx0X3Jvb3Q6ICIvcmVz
dWx0L2Jvb3QvMS92bS1rYnVpbGQtMUcvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZf
NjQtbGtwL2djYy00LjkvOWU0NmExZWJhMTA1MDBkZjYyMDY4M2UzMTc0Mjc4OWVmMjc4MWU5My8w
Igpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3ZtLWtidWlsZC0xRy02L2Jvb3RfYm9vdC0xLWRl
Ymlhbi14ODZfNjQuY2d6LXg4Nl82NC1sa3AtOWU0NmExZWJhMTA1MDBkZjYyMDY4M2UzMTc0Mjc4
OWVmMjc4MWU5My0xLTIwMTUwNTI1LTQ4NTM5LWlha2VmYi55YW1sIgpkZXF1ZXVlX3RpbWU6IDIw
MTUtMDUtMjUgMTY6MTE6MTkuOTg3NzgzMjA5ICswODowMAptYXhfdXB0aW1lOiA2MDAKaW5pdHJk
OiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2Fk
ZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVs
ZWQvdm0ta2J1aWxkLTFHLTYvYm9vdF9ib290LTEtZGViaWFuLXg4Nl82NC5jZ3oteDg2XzY0LWxr
cC05ZTQ2YTFlYmExMDUwMGRmNjIwNjgzZTMxNzQyNzg5ZWYyNzgxZTkzLTEtMjAxNTA1MjUtNDg1
MzktaWFrZWZiLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LWxrcAotIGJyYW5j
aD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA1MjUxNQotIGNvbW1pdD05ZTQ2YTFlYmEx
MDUwMGRmNjIwNjgzZTMxNzQyNzg5ZWYyNzgxZTkzCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4
Nl82NC1sa3AvZ2NjLTQuOS85ZTQ2YTFlYmExMDUwMGRmNjIwNjgzZTMxNzQyNzg5ZWYyNzgxZTkz
L3ZtbGludXotNC4xLjAtcmM1LTAyNTEwLWc5ZTQ2YTFlCi0gbWF4X3VwdGltZT02MDAKLSBSRVNV
TFRfUk9PVD0vcmVzdWx0L2Jvb3QvMS92bS1rYnVpbGQtMUcvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei94ODZfNjQtbGtwL2djYy00LjkvOWU0NmExZWJhMTA1MDBkZjYyMDY4M2UzMTc0Mjc4
OWVmMjc4MWU5My8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMw
LDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fs
d2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0t
MSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9y
YW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9
dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNn
eiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1sa3AvZ2NjLTQuOS85ZTQ2YTFl
YmExMDUwMGRmNjIwNjgzZTMxNzQyNzg5ZWYyNzgxZTkzL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6
ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiIK
am9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAwLjEzIDAuMDMgMC4wMSAxLzM3MyAyNzE4CnN0
YXJ0X3RpbWU6ICcxNDMyNTQxNTM3JwplbmRfdGltZTogJzE0MzI1NDE1MzgnCnZlcnNpb246ICIv
bGtwL2xrcC8uc3JjLTIwMTUwNTI1LTEzMTIzMiIK

--===============1073695720430373198==--

