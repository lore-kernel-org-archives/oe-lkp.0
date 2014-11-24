Content-Type: multipart/mixed; boundary="===============6216469341306019322=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: [net] 4ed2d765dfa:
Date: Mon, 24 Nov 2014 20:38:59 +0800
Message-ID: <20141124123859.GD7310@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6216469341306019322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 4ed2d765dfaccff5ebdac68e2064b59125033a3b ("net-timestamp: TCP timest=
amping")


testbox/testcase/testparams: vm-vp-2G/ltp/syscalls

e7fd2885385157d4  4ed2d765dfaccff5ebdac68e20  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :5          100%           5:5     ltp.recv01.fail
           :5          100%           5:5     ltp.recvfrom01.fail
           :5          100%           5:5     ltp.recvmsg01.fail
           :5           20%           1:5     kmsg.APIC_calibration_not_con=
sistent_with_PM-Timer:#ms_instead_of#ms
           :5           20%           1:5     kmsg.hrtimer:interrupt_took#ns
           :5           20%           1:5     kmsg.TINFO:mlock_failed:errno=
=3DENOMEM(#):Cannot_allocate_memory
           :5           20%           1:5     kmsg.estcases/kernel/syscalls=
/getgroups/../utils/compat_16.h::#-bit_version_of_getgroups()is_not_support=
ed_on_your_platform

testbox/testcase/testparams: nhm-white/ltp/syscalls

e7fd2885385157d4  4ed2d765dfaccff5ebdac68e20  =

----------------  --------------------------  =

           :10         100%           5:5     ltp.recv01.fail
           :10         100%           5:5     ltp.recvfrom01.fail
           :10         100%           5:5     ltp.recvmsg01.fail

vm-vp-2G: qemu-system-x86_64 -enable-kvm -cpu Penryn
Memory: 2G

nhm-white: Nehalem
Memory: 6G




To reproduce:

  apt-get install ruby ruby-oj
  git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
  cd lkp-tests
  bin/setup-local job.yaml # the job file attached in this email
  bin/run-local   job.yaml


	--yliu

--===============6216469341306019322==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBsdHAKZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAogIHZt
c3RhdDogCm1vZGVsOiBxZW11LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLWNwdSBQZW5yeW4K
bnJfdm06IDQKbnJfY3B1OiA0Cm1lbW9yeTogMkcKcm9vdGZzOiBkZWJpYW4teDg2XzY0LmNnegpo
ZGRfcGFydGl0aW9uczogIi9kZXYvdmRiIC9kZXYvdmRjIC9kZXYvdmRkIC9kZXYvdmRlIC9kZXYv
dmRmIgpzd2FwX3BhcnRpdGlvbnM6ICIvZGV2L3ZkYSIKbHRwOgogIHRlc3Q6CiAgLSBzeXNjYWxs
cwplbnF1ZXVlX3RpbWU6IDIwMTQtMTAtMDIgMTA6MDc6MjUuMTk5MjA3NDg1ICswODowMApicmFu
Y2g6IG5ldC9tYXN0ZXIKY29tbWl0OiAwNzU0NDc2NDE5ZjEyN2ViOGMyOTRiMTdiNmZjOGI2Nzg3
ZGVkMWUyCnRlc3Rib3g6IHZtLXZwLTJHLTMKa2NvbmZpZzogeDg2XzY0LXJoZWwKa2VybmVsOiAi
L2tlcm5lbC94ODZfNjQtcmhlbC8wNzU0NDc2NDE5ZjEyN2ViOGMyOTRiMTdiNmZjOGI2Nzg3ZGVk
MWUyL3ZtbGludXotMy4xNy4wLXJjNi0wMDE0NS1nMDc1NDQ3NiIKdXNlcjogbGtwCnF1ZXVlOiBy
YW5kCnJlc3VsdF9yb290OiAiL3Jlc3VsdC92bS12cC0yRy9sdHAvc3lzY2FsbHMvZGViaWFuLXg4
Nl82NC5jZ3oveDg2XzY0LXJoZWwvMDc1NDQ3NjQxOWYxMjdlYjhjMjk0YjE3YjZmYzhiNjc4N2Rl
ZDFlMi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3ZtLXZwLTJHLTMvcmFuZF9sdHAtc3lz
Y2FsbHMtZGViaWFuLXg4Nl82NC5jZ3oteDg2XzY0LXJoZWwtMDc1NDQ3NjQxOWYxMjdlYjhjMjk0
YjE3YjZmYzhiNjc4N2RlZDFlMi0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNC0xMC0wMiAxMTo1
NTo1MS43NjE1ODg0NDYgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNC4zOSA1
LjYxIDIuNjkgMS84NSAxMDQ2MQpzdGFydF90aW1lOiAnMTQxMjIyMjE4OCcKZW5kX3RpbWU6ICcx
NDEyMjIyNzU5Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTAwMS0yMDMzMjEiCg==

--===============6216469341306019322==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW5sdHAgLWYgc3lzY2FsbHMK

--===============6216469341306019322==--

