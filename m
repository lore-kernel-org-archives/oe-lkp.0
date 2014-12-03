Content-Type: multipart/mixed; boundary="===============3045466198450560634=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: [drm/fb] f5ef139cbe5: *ERROR* not all connectors configured
Date: Wed, 03 Dec 2014 10:31:31 +0800
Message-ID: <20141203023131.GC10048@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3045466198450560634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://people.freedesktop.org/~airlied/linux.git radeon-mst-hacks
commit f5ef139cbe5dbd755dab3706022d7147800099a8 ("drm/fb: add support for t=
iled monitor configurations.")


testbox/testcase/testparams: vm-kbuild-1G/xfstests/4HDD-btrfs-generic-113

9cf13203b1fd7cc3  f5ef139cbe5dbd755dab370602  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :10         100%          10:10    kmsg.drm:drm_setup_crtcs[drm_=
kms_helper]]*ERROR*not_all_connectors_configured

vm-kbuild-1G: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
Memory: 1G




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



	--yliu

--===============3045466198450560634==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB4ZnN0ZXN0cwpkZWZhdWx0X21vbml0b3JzOgogIHdhaXQ6IHByZS10ZXN0
CiAgdm1zdGF0OiAKZGVmYXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzog
CmNwdWZyZXFfZ292ZXJub3I6IAptb2RlbDogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3Zt
IC1jcHUgSGFzd2VsbCwrc21lcCwrc21hcApucl92bTogMTYKbnJfY3B1OiAyCm1lbW9yeTogMUcK
ZGlza190eXBlOiB2aXJ0aW8tc2NzaQpyb290ZnM6IGRlYmlhbi14ODZfNjQuY2d6CmhkZF9wYXJ0
aXRpb25zOiAiL2Rldi9zZGEgL2Rldi9zZGIgL2Rldi9zZGMgL2Rldi9zZGQiCnN3YXBfcGFydGl0
aW9uczogIi9kZXYvc2RlIgpkaXNrOiA0SERECmZzOgotIGJ0cmZzCnhmc3Rlc3RzOgogIHRlc3Q6
CiAgLSBnZW5lcmljLTExMwplbnF1ZXVlX3RpbWU6IDIwMTQtMTEtMjYgMTM6MTE6MTkuMTkxODQw
NzU5ICswODowMApicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE0MTEyNjExCmNv
bW1pdDogYTdhMTE2OGY2YjQ1YmIwZDI5YTIwYzk0MmUxY2EzMDBlZjU0ZGM2ZQpyZXBlYXRfdG86
IDIKdGVzdGJveDogdm0ta2J1aWxkLTFHLTMKdGJveF9ncm91cDogdm0ta2J1aWxkLTFHCmtjb25m
aWc6IHg4Nl82NC1yaGVsCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvYTdhMTE2OGY2YjQ1
YmIwZDI5YTIwYzk0MmUxY2EzMDBlZjU0ZGM2ZS92bWxpbnV6LTMuMTguMC1yYzYtd2wtYXRoLWdh
N2ExMTY4ZiIKdXNlcjogbGtwCnF1ZXVlOiByYW5kCnJlc3VsdF9yb290OiAiL3Jlc3VsdC92bS1r
YnVpbGQtMUcveGZzdGVzdHMvNEhERC1idHJmcy1nZW5lcmljLTExMy9kZWJpYW4teDg2XzY0LmNn
ei94ODZfNjQtcmhlbC9hN2ExMTY4ZjZiNDViYjBkMjlhMjBjOTQyZTFjYTMwMGVmNTRkYzZlLzAi
CmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvdm0ta2J1aWxkLTFHLTMvcmFuZF94ZnN0ZXN0cy00
SERELWJ0cmZzLWdlbmVyaWMtMTEzLWRlYmlhbi14ODZfNjQuY2d6LXg4Nl82NC1yaGVsLWE3YTEx
NjhmNmI0NWJiMGQyOWEyMGM5NDJlMWNhMzAwZWY1NGRjNmUtMS55YW1sIgpkZXF1ZXVlX3RpbWU6
IDIwMTQtMTEtMjYgMTM6MjU6MTAuNjA1NDcxNDY0ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVk
CmxvYWRhdmc6IDk2LjM3IDMzLjg5IDEyLjIwIDEvNTkzIDMzMzkKc3RhcnRfdGltZTogJzE0MTY5
Nzk1NTYnCmVuZF90aW1lOiAnMTQxNjk3OTcyNycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAx
NDExMjYtMDUzMTQyIgo=

--===============3045466198450560634==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCBidHJmcyAvZGV2L3NkZApta2ZzIC10IGJ0cmZzIC9kZXYvc2RjCm1rZnMgLXQgYnRy
ZnMgL2Rldi9zZGIKbWtmcyAtdCBidHJmcyAvZGV2L3NkYQptb3VudCAtdCBidHJmcyAvZGV2L3Nk
YSAvZnMvc2RhCm1vdW50IC10IGJ0cmZzIC9kZXYvc2RiIC9mcy9zZGIKbW91bnQgLXQgYnRyZnMg
L2Rldi9zZGMgL2ZzL3NkYwptb3VudCAtdCBidHJmcyAvZGV2L3NkZCAvZnMvc2RkCmV4cG9ydCBU
RVNUX0RJUj0vZnMvc2RhCmV4cG9ydCBURVNUX0RFVj0vZGV2L3NkYQpleHBvcnQgRlNUWVA9YnRy
ZnMKZXhwb3J0IFNDUkFUQ0hfTU5UPS9mcy9zY3JhdGNoCm1rZGlyIC9mcy9zY3JhdGNoIC1wCmV4
cG9ydCBTQ1JBVENIX0RFVl9QT09MPSIvZGV2L3NkYiAvZGV2L3NkYyAvZGV2L3NkZCIKLi9jaGVj
ayBnZW5lcmljLzExMwo=

--===============3045466198450560634==--

