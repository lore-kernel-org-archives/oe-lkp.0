Content-Type: multipart/mixed; boundary="===============8326490078977809399=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [aio] 6098b45b32e: 2200.00% xfstests.generic.239.seconds
Date: Mon, 15 Dec 2014 09:02:09 +0800
Message-ID: <1418605329.5745.141.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8326490078977809399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 6098b45b32e6baeacc04790773ced9340601d511 ("aio: block exit_aio() unt=
il all context requests are completed")


testbox/testcase/testparams: vm-vp-2G/xfstests/4HDD-btrfs-generic-quick

2ff396be602f10b5  6098b45b32e6baeacc04790773  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     26352 =C2=B1  9%     -13.6%      22774 =C2=B1  1%  vmstat.system.cs
     10342 =C2=B1  6%     -12.3%       9066 =C2=B1  0%  vmstat.system.in
        37 =C2=B1  4%     -12.1%         32 =C2=B1  3%  time.percent_of_cpu=
_this_job_got
      1197 =C2=B1  2%     -14.2%       1028 =C2=B1  0%  vmstat.io.bi
     18470 =C2=B1  2%     -10.1%      16609 =C2=B1  1%  vmstat.io.bo
       157 =C2=B1  3%     +13.7%        179 =C2=B1  0%  time.elapsed_time

vm-vp-2G: qemu-system-x86_64 -enable-kvm -cpu Penryn
Memory: 2G

                          xfstests.generic.239.seconds

  30 ++-----------O--------------------------------------------------------=
-+
     |              O         O            O         O                     =
 |
  25 ++                O                                                   =
 |
     |  O O  O O            O    O O  O  O    O O  O                       =
 |
     |                   O                                                 =
 |
  20 O+                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
   5 ++                                                                    =
 |
     |                                                                     =
 |
   0 *+-*-*--*-*--*-*--*-*--*-*--*-*--*--*-*--*-*--*-*--*-*--*-*--*-*--*-*-=
-*


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


--===============8326490078977809399==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB4ZnN0ZXN0cwpkZWZhdWx0X21vbml0b3JzOgogIHdhaXQ6IHByZS10ZXN0
CiAgdm1zdGF0OiAKZGVmYXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzog
CmNwdWZyZXFfZ292ZXJub3I6IAptb2RlbDogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3Zt
IC1jcHUgUGVucnluCm5yX3ZtOiA0Cm5yX2NwdTogNAptZW1vcnk6IDJHCnJvb3RmczogZGViaWFu
LXg4Nl82NC5jZ3oKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L3ZkYSAvZGV2L3ZkYiAvZGV2L3ZkYyAv
ZGV2L3ZkZCAvZGV2L3ZkZSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi92ZGYiCmRpc2s6IDRIREQK
ZnM6Ci0gYnRyZnMKeGZzdGVzdHM6CiAgdGVzdDoKICAtIGdlbmVyaWMtcXVpY2sKZW5xdWV1ZV90
aW1lOiAyMDE0LTEyLTEyIDE0OjEwOjM1Ljk1MzM0MDE2NSArMDg6MDAKYnJhbmNoOiByZW5lc2Fz
LWRyaXZlcnMvbWFzdGVyCmNvbW1pdDogYmZlMDFhNWJhMjQ5MGYyOTllMWQyZDU1MDhjYmJiYWRk
ODk3YmJlOQp0ZXN0Ym94OiB2bS12cC0yRy0xCnRib3hfZ3JvdXA6IHZtLXZwLTJHCmtjb25maWc6
IHg4Nl82NC1sa3AKdXNlcjogbGtwCnF1ZXVlOiByZWNvbmZpcm0KcmVzdWx0X3Jvb3Q6ICIvcmVz
dWx0L3ZtLXZwLTJHL3hmc3Rlc3RzLzRIREQtYnRyZnMtZ2VuZXJpYy1xdWljay9kZWJpYW4teDg2
XzY0LmNnei94ODZfNjQtbGtwL2JmZTAxYTViYTI0OTBmMjk5ZTFkMmQ1NTA4Y2JiYmFkZDg5N2Ji
ZTkvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC92bS12cC0yRy0xL3JlY29uZmlybV94ZnN0
ZXN0cy00SERELWJ0cmZzLWdlbmVyaWMtcXVpY2stZGViaWFuLXg4Nl82NC5jZ3oteDg2XzY0LWxr
cC1iZmUwMWE1YmEyNDkwZjI5OWUxZDJkNTUwOGNiYmJhZGQ4OTdiYmU5LTQueWFtbCIKcmVwZWF0
X3RvOiA1Cmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LWxrcC9iZmUwMWE1YmEyNDkwZjI5OWUxZDJk
NTUwOGNiYmJhZGQ4OTdiYmU5L3ZtbGludXotMy4xNy4wIgpkZXF1ZXVlX3RpbWU6IDIwMTQtMTIt
MTIgMTQ6Mjc6NDcuNjc5MDg3NTM3ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6
IDYzLjg3IDI3LjMzIDEwLjE4IDEvMTA4IDY2ODMKc3RhcnRfdGltZTogJzE0MTgzNjU3MTInCmVu
ZF90aW1lOiAnMTQxODM2NjAwMicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNDEyMTItMDc1
MzAxIgo=

--===============8326490078977809399==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCBidHJmcyAvZGV2L3ZkYg0KbWtmcyAtdCBidHJmcyAvZGV2L3ZkZA0KbWtmcyAtdCBi
dHJmcyAvZGV2L3ZkYQ0KbWtmcyAtdCBidHJmcyAvZGV2L3ZkYw0KbW91bnQgLXQgYnRyZnMgL2Rl
di92ZGEgL2ZzL3ZkYQ0KbW91bnQgLXQgYnRyZnMgL2Rldi92ZGIgL2ZzL3ZkYg0KbW91bnQgLXQg
YnRyZnMgL2Rldi92ZGMgL2ZzL3ZkYw0KbW91bnQgLXQgYnRyZnMgL2Rldi92ZGQgL2ZzL3ZkZA0K
ZXhwb3J0IFRFU1RfRElSPS9mcy92ZGENCmV4cG9ydCBURVNUX0RFVj0vZGV2L3ZkYQ0KZXhwb3J0
IEZTVFlQPWJ0cmZzDQpleHBvcnQgU0NSQVRDSF9NTlQ9L2ZzL3NjcmF0Y2gNCm1rZGlyIC9mcy9z
Y3JhdGNoIC1wDQpleHBvcnQgU0NSQVRDSF9ERVZfUE9PTD0iL2Rldi92ZGIgL2Rldi92ZGMgL2Rl
di92ZGQiDQouL2NoZWNrIGdlbmVyaWMvMDAxIGdlbmVyaWMvMDAyIGdlbmVyaWMvMDAzIGdlbmVy
aWMvMDA0IGdlbmVyaWMvMDA1IGdlbmVyaWMvMDA2IGdlbmVyaWMvMDA3IGdlbmVyaWMvMDA4IGdl
bmVyaWMvMDA5IGdlbmVyaWMvMDEwIGdlbmVyaWMvMDExIGdlbmVyaWMvMDEyIGdlbmVyaWMvMDE0
IGdlbmVyaWMvMDE1IGdlbmVyaWMvMDE2IGdlbmVyaWMvMDE3IGdlbmVyaWMvMDE4IGdlbmVyaWMv
MDE5IGdlbmVyaWMvMDIwIGdlbmVyaWMvMDIxIGdlbmVyaWMvMDIyIGdlbmVyaWMvMDIzIGdlbmVy
aWMvMDI0IGdlbmVyaWMvMDI1IGdlbmVyaWMvMDI2IGdlbmVyaWMvMDI4IGdlbmVyaWMvMDUzIGdl
bmVyaWMvMDYyIGdlbmVyaWMvMDY5IGdlbmVyaWMvMDc2IGdlbmVyaWMvMDc3IGdlbmVyaWMvMDc5
IGdlbmVyaWMvMDg4IGdlbmVyaWMvMDg5IGdlbmVyaWMvMDkzIGdlbmVyaWMvMDk3IGdlbmVyaWMv
MDk5IGdlbmVyaWMvMTA1IGdlbmVyaWMvMTIzIGdlbmVyaWMvMTI0IGdlbmVyaWMvMTI2IGdlbmVy
aWMvMTI4IGdlbmVyaWMvMTI5IGdlbmVyaWMvMTMxIGdlbmVyaWMvMTM1IGdlbmVyaWMvMTQxIGdl
bmVyaWMvMTY5IGdlbmVyaWMvMTg0IGdlbmVyaWMvMTkzIGdlbmVyaWMvMTk4IGdlbmVyaWMvMjA3
IGdlbmVyaWMvMjEwIGdlbmVyaWMvMjExIGdlbmVyaWMvMjEyIGdlbmVyaWMvMjEzIGdlbmVyaWMv
MjE0IGdlbmVyaWMvMjE1IGdlbmVyaWMvMjE5IGdlbmVyaWMvMjIxIGdlbmVyaWMvMjI4IGdlbmVy
aWMvMjM0IGdlbmVyaWMvMjM1IGdlbmVyaWMvMjM2IGdlbmVyaWMvMjM3IGdlbmVyaWMvMjM5IGdl
bmVyaWMvMjQwIGdlbmVyaWMvMjQ1IGdlbmVyaWMvMjQ2IGdlbmVyaWMvMjQ4IGdlbmVyaWMvMjQ5
IGdlbmVyaWMvMjUxIGdlbmVyaWMvMjU1IGdlbmVyaWMvMjU3IGdlbmVyaWMvMjU4IGdlbmVyaWMv
MjYwIGdlbmVyaWMvMjc3IGdlbmVyaWMvMjgwIGdlbmVyaWMvMjg1IGdlbmVyaWMvMjg2IGdlbmVy
aWMvMjg4IGdlbmVyaWMvMjk0IGdlbmVyaWMvMzA3IGdlbmVyaWMvMzA4IGdlbmVyaWMvMzA5IGdl
bmVyaWMvMzEyIGdlbmVyaWMvMzEzIGdlbmVyaWMvMzE0IGdlbmVyaWMvMzE1IGdlbmVyaWMvMzE2
IGdlbmVyaWMvMzE3IGdlbmVyaWMvMzE4IGdlbmVyaWMvMzIwIGdlbmVyaWMvMzIxIGdlbmVyaWMv
MzIyDQoN
--===============8326490078977809399==--

