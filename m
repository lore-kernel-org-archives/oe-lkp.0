Content-Type: multipart/mixed; boundary="===============1659828476892714687=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [drm/i915] 3f678c96abb: piglit.igt/kms_cursor_crc/cursor-64-offscreen.fail
Date: Thu, 26 Feb 2015 11:06:00 +0800
Message-ID: <1424919960.10337.9.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1659828476892714687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://anongit.freedesktop.org/drm-intel for-linux-next
commit 3f678c96abb43a977d2ea41aefccdc49e8a3e896 ("drm/i915: Switch planes f=
rom transitional helpers to full atomic helpers")


testbox/testcase/testparams: lkp-t410/piglit/performance-igt-035

1ed1f968b6bec3a8  3f678c96abb43a977d2ea41aef  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :10         100%          10:10    piglit.igt/kms_cursor_crc/cur=
sor-64-offscreen.fail

testbox/testcase/testparams: lkp-t410/piglit/performance-igt-037

1ed1f968b6bec3a8  3f678c96abb43a977d2ea41aef  =

----------------  --------------------------  =

           :10         100%          10:10    piglit.igt/kms_cursor_crc/cur=
sor-128-offscreen.fail

lkp-t410: Westmere
Memory: 2G

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


--===============1659828476892714687==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBwaWdsaXQKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHZtc3RhdDogCmRlZmF1bHRfd2F0Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApj
cHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpjb21taXQ6IDVhZWIyYTNkYzRmMGVhNDdmZTBk
ZjNjYjNhZjc1ZWY4MTNkZGE4MzMKbW9kZWw6IFdlc3RtZXJlCm1lbW9yeTogMkcKaGRkX3BhcnRp
dGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUZVSklUU1VfTUpBMjI1MEJIX0cyX0s5NUNUOUMy
RzI5Vy1wYXJ0NiIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlz
ay9ieS1pZC9hdGEtRlVKSVRTVV9NSkEyMjUwQkhfRzJfSzk1Q1Q5QzJHMjlXLXBhcnQ3Igp0aW1l
b3V0OiAzMG0KcGlnbGl0OgogIGdyb3VwOiBpZ3QtMDM3CnRlc3Rib3g6IGxrcC10NDEwCnRib3hf
Z3JvdXA6IGxrcC10NDEwCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0w
Mi0xMyAxMzowNToyMi4wMTgxNzc1MjkgKzA4OjAwCmhlYWRfY29tbWl0OiA1YWViMmEzZGM0ZjBl
YTQ3ZmUwZGYzY2IzYWY3NWVmODEzZGRhODMzCmJhc2VfY29tbWl0OiBiZmE3NmQ0OTU3NjU5OWE0
YjlmOWI3YTcxZjIzZDczZDZkY2ZmNzM1CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5
LTIwMTUwMjE2MjMKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC81YWViMmEzZGM0ZjBlYTQ3
ZmUwZGYzY2IzYWY3NWVmODEzZGRhODMzL3ZtbGludXotMy4xOS4wLXdsLWF0aC0wMjMwNS1nNWFl
YjJhMyIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9sa3AtdDQxMC9waWdsaXQvcGVyZm9ybWFu
Y2UtaWd0LTAzNy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsLzVhZWIy
YTNkYzRmMGVhNDdmZTBkZjNjYjNhZjc1ZWY4MTNkZGE4MzMvMCIKam9iX2ZpbGU6ICIvbGtwL3Nj
aGVkdWxlZC9sa3AtdDQxMC9jeWNsaWNfcGlnbGl0LXBlcmZvcm1hbmNlLWlndC0wMzcteDg2XzY0
LXJoZWwtSEVBRC01YWViMmEzZGM0ZjBlYTQ3ZmUwZGYzY2IzYWY3NWVmODEzZGRhODMzLTAtMjAx
NTAyMTMtNjY0MzAtMXI1MWw4cS55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDItMTcgMTg6MjU6
NDguNDAzMTQyNzM3ICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKam9iX3N0YXRlOiBmaW5pc2hl
ZApsb2FkYXZnOiAwLjk0IDAuNDQgMC4xNiAxLzEyMCA2NzgKc3RhcnRfdGltZTogJzE0MjQxNjg3
ODUnCmVuZF90aW1lOiAnMTQyNDE2ODg0NCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTAy
MTctMTc0NjIzIgo=

--===============1659828476892714687==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCnBpZ2xpdCBydW4gaWd0IC10IGlndC9rbXNfY3Vyc29yX2NyYy9jdXJzb3ItMTI4LW9m
ZnNjcmVlbiAvdG1wL2xrcC9waWdsaXQtcmVzdWx0cy0wCnBpZ2xpdCBzdW1tYXJ5IGNvbnNvbGUg
L3RtcC9sa3AvcGlnbGl0LXJlc3VsdHMtMAo=

--===============1659828476892714687==--

