Content-Type: multipart/mixed; boundary="===============5119195000291760053=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [timer] 17cdf560f27: +4.0% boot-meminfo.VmallocUsed
Date: Thu, 02 Apr 2015 09:06:09 +0800
Message-ID: <1427936769.6726.2.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5119195000291760053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git timer/alloc=
_tvec_statically
commit 17cdf560f2727f687ab159707d0aa591f8a2f82d ("timer: Allocate per-cpu t=
vec_base's statically")


testbox/testcase/testparams: lkp-sbx04/boot/performance-1

c5e77f5216abdd1d  17cdf560f2727f687ab159707d  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    410996 =C2=B1  0%      +4.0%     427412 =C2=B1  0%  boot-meminfo.Vmallo=
cUsed

testbox/testcase/testparams: wsm/boot/performance-1

c5e77f5216abdd1d  17cdf560f2727f687ab159707d  =

----------------  --------------------------  =

     85712 =C2=B1  0%      +2.4%      87772 =C2=B1  0%  boot-meminfo.Vmallo=
cUsed

testbox/testcase/testparams: lkp-snb01/boot/performance-1

c5e77f5216abdd1d  17cdf560f2727f687ab159707d  =

----------------  --------------------------  =

    447001 =C2=B1  0%      -1.0%     442558 =C2=B1  0%  boot-slabinfo.num_o=
bjs
    125616 =C2=B1  5%     -13.5%     108720 =C2=B1  4%  boot-meminfo.Direct=
Map4k
    347196 =C2=B1  0%      +4.7%     363612 =C2=B1  0%  boot-meminfo.Vmallo=
cUsed

lkp-sbx04: Sandy Bridge-EX
Memory: 64G

wsm: Westmere
Memory: 6G

lkp-snb01: Sandy Bridge-EP
Memory: 32G




                              boot-meminfo.VmallocUsed

  90000 O+-O--O--O-O--O--O--O--O--O-O--O--O--O--O--O-O--O--O--O--O--O-O--O-=
-O
        *..*..*..*.*..*..*..*..*       *..*..*..*       *..*..*..*         =
 |
  80000 ++                     :       :        :       :                  =
 |
  70000 ++                     :       :        :       :                  =
 |
        |                       :     :          :     :                   =
 |
  60000 ++                      :     :          :     :                   =
 |
  50000 ++                      :     :          :     :                   =
 |
        |                       :     :          :     :                   =
 |
  40000 ++                       :   :            :   :                    =
 |
  30000 ++                       :   :            :   :                    =
 |
        |                        :   :            :   :                    =
 |
  20000 ++                       :   :            :   :                    =
 |
  10000 ++                        : :              : :                     =
 |
        |                         : :              : :                     =
 |
      0 ++------------------------*-*--------------*-*---------------------=
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


--===============5119195000291760053==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBib290CmRlZmF1bHQtbW9uaXRvcnM6IApkZWZhdWx0LXdhdGNoZG9nczoK
ICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UK
bW9kZWw6IFdlc3RtZXJlCm1lbW9yeTogNkcKbnJfaGRkX3BhcnRpdGlvbnM6IDEKaGRkX3BhcnRp
dGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0Y29uc29sZV9w
b3J0OiA2NjY3CmJvb3Qtc2xhYmluZm86IApib290LW1lbWluZm86IAptZW1tYXA6IApib290LW1l
bW9yeTogCmJvb3QtdGltZTogCmtlcm5lbC1zaXplOiAKc2xlZXA6IDEKYnJhbmNoOiBsaW51eC1k
ZXZlbC9kZXZlbC1ob3VybHktMjAxNTA0MDExMQpjb21taXQ6IDRhNWNiYTIwZDU4YzhhY2NjYWI2
NzFiMTNjODMxNjViZTljYmEwZmIKcmVwZWF0X3RvOiAxCnRlc3Rib3g6IHdzbQp0Ym94X2dyb3Vw
OiB3c20Ka2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTA0LTAxIDEzOjM4
OjA4LjQ4MDY0ODEwMCArMDg6MDAKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC80YTVjYmEy
MGQ1OGM4YWNjY2FiNjcxYjEzYzgzMTY1YmU5Y2JhMGZiL3ZtbGludXotNC4wLjAtcmM2LTAzNzA5
LWc0YTVjYmEyIgp1c2VyOiBsa3AKcXVldWU6IGJvb3QKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC93c20vYm9vdC9wZXJmb3JtYW5jZS0x
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvNGE1Y2JhMjBkNThjOGFj
Y2NhYjY3MWIxM2M4MzE2NWJlOWNiYTBmYi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3dz
bS9ib290X2Jvb3QtcGVyZm9ybWFuY2UtMS14ODZfNjQtcmhlbC00YTVjYmEyMGQ1OGM4YWNjY2Fi
NjcxYjEzYzgzMTY1YmU5Y2JhMGZiLTAtMjAxNTA0MDEtMTgyNDQtNTJmNDBkLnlhbWwiCmRlcXVl
dWVfdGltZTogMjAxNS0wNC0wMSAxMzozODoyNi45NzU1OTA4MzAgKzA4OjAwCm5yX2NwdTogIiQo
bnByb2MpIgptYXhfdXB0aW1lOiAzNjAwCm1vZHVsZXNfaW5pdHJkOiAiL2tlcm5lbC94ODZfNjQt
cmhlbC80YTVjYmEyMGQ1OGM4YWNjY2FiNjcxYjEzYzgzMTY1YmU5Y2JhMGZiL21vZHVsZXMuY2d6
Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDAuMTUgMC4wNCAwLjAyIDEvMTg5IDYzMQpz
dGFydF90aW1lOiAnMTQyNzg2NjY0MycKZW5kX3RpbWU6ICcxNDI3ODY2NjQ0Jwp2ZXJzaW9uOiAi
L2xrcC9sa3AvLnNyYy0yMDE1MDMzMS0xNzU1MjAiCg==

--===============5119195000291760053==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgo=

--===============5119195000291760053==--

