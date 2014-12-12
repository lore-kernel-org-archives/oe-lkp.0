Content-Type: multipart/mixed; boundary="===============0969672121304079265=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [ext4] fdfe0739876: Failed to mount
Date: Fri, 12 Dec 2014 11:02:45 +0800
Message-ID: <1418353365.5745.95.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0969672121304079265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

After the commit, the file system failed to mount as in stderr file attache=
d.

git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
commit fdfe073987619ec375da8d8a2701ab271d1b1339 ("ext4: fix potential use a=
fter free during resize")


testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-ext4-16MB-=
60G-NoSync-16d-256fpd

2f2d74ef698b163a  fdfe073987619ec375da8d8a27  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :20          80%          16:20    stderr.mount:wrong_fs_type,ba=
d_option,bad_superblock_on/dev/sda1
           :20          80%          16:20    stderr.missing_codepage_or_he=
lper_program,or_other_error
           :20          80%          16:20    stderr.In_some_cases_useful_i=
nfo_is_found_in_syslog-try
           :20          80%          16:20    stderr.dmesg|tail_or_so
           :20          80%          16:20    last_state.fs.exit_code.32
           :20          80%          16:20    last_state.has_stderr
           :20          15%           3:20    last_state.running
          4:20         -20%            :20    last_state.booting

nhm4: Nehalem
Memory: 4G

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


--===============0969672121304079265==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBmc21hcmsKZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEt
dm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6IAog
IG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxh
dGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0
czogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcTogCiAgdHVyYm9zdGF0OiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiAxMAogIHBtZXRlcjogCmRlZmF1bHRfd2F0Y2hkb2dzOgogIHdhdGNoLW9v
bTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOgotIHBlcmZvcm1hbmNlCmNvbW1pdDog
ODE5MWQwN2RiYjE2YWU4OGNjMmJjNDc1NTg0YjlmMTg1ZjAyNzk1Zgptb2RlbDogTmVoYWxlbQpu
cl9jcHU6IDgKbWVtb3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEt
V0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MSIKc3dhcF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2
ODEyMDQxLXBhcnQyIgpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENf
V0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQzIgppdGVyYXRpb25zOiAxeApu
cl90aHJlYWRzOiAzMnQKZGlzazogMUhERApmczoKLSBleHQ0CmZzMjoKLSAKZnNtYXJrOgogIGZp
bGVzaXplOiAxNk1CCiAgdGVzdF9zaXplOiA2MEcKICBzeW5jX21ldGhvZDoKICAtIE5vU3luYwog
IG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAyNTZmcGQKdGVz
dGJveDogbmhtNAp0Ym94X2dyb3VwOiBuaG00Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVf
dGltZTogMjAxNC0xMi0wNSAyMTo0MjoxNC45MTg5NjAyMTkgKzA4OjAwCmhlYWRfY29tbWl0OiA4
MTkxZDA3ZGJiMTZhZTg4Y2MyYmM0NzU1ODRiOWYxODVmMDI3OTVmCmJhc2VfY29tbWl0OiAwMDlk
MDQzMWMzOTE0ZGU2NDY2NmJlYzBkMzUwZTU0ZmRkNTlkZjZhCmJyYW5jaDogbmV4dC9tYXN0ZXIK
a2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC84MTkxZDA3ZGJiMTZhZTg4Y2MyYmM0NzU1ODRi
OWYxODVmMDI3OTVmL3ZtbGludXotMy4xOC4wLXJjNy1uZXh0LTIwMTQxMjA1LWc4MTkxZDA3Igp1
c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyb290ZnM6IGRlYmlhbi14ODZfNjQuY2d6CnJlc3VsdF9y
b290OiAiL3Jlc3VsdC9uaG00L2ZzbWFyay9wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1leHQ0LTE2
TUItNjBHLU5vU3luYy0xNmQtMjU2ZnBkL2RlYmlhbi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsLzgx
OTFkMDdkYmIxNmFlODhjYzJiYzQ3NTU4NGI5ZjE4NWYwMjc5NWYvMCIKam9iX2ZpbGU6ICIvbGtw
L3NjaGVkdWxlZC9uaG00L2N5Y2xpY19mc21hcmstcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtZXh0
NC0xNk1CLTYwRy1Ob1N5bmMtMTZkLTI1NmZwZC14ODZfNjQtcmhlbC1IRUFELTgxOTFkMDdkYmIx
NmFlODhjYzJiYzQ3NTU4NGI5ZjE4NWYwMjc5NWYtMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTQt
MTItMDYgMTE6NTc6MDguMzI3NDY1OTg4ICswODowMApqb2Jfc3RhdGU6IGZhaWxlZApsb2FkYXZn
OiAwLjI0IDAuMDYgMC4wMiAxLzE0NiAxNzg5CnN0YXJ0X3RpbWU6ICcnCmVuZF90aW1lOiAnMTQx
NzgzODI1OCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNDEyMDYtMDYwMjE5Igo=

--===============0969672121304079265==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgpta2ZzIC10IGV4dDQgLXEgLUYgL2Rldi9zZGExCm1vdW50IC10IGV4dDQg
L2Rldi9zZGExIC9mcy9zZGExCg==

--===============0969672121304079265==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="stderr.ksh"

bW91bnQ6IHdyb25nIGZzIHR5cGUsIGJhZCBvcHRpb24sIGJhZCBzdXBlcmJsb2NrIG9uIC9kZXYv
c2RhMSwKICAgICAgIG1pc3NpbmcgY29kZXBhZ2Ugb3IgaGVscGVyIHByb2dyYW0sIG9yIG90aGVy
IGVycm9yCiAgICAgICBJbiBzb21lIGNhc2VzIHVzZWZ1bCBpbmZvIGlzIGZvdW5kIGluIHN5c2xv
ZyAtIHRyeQogICAgICAgZG1lc2cgfCB0YWlsICBvciBzbwoK

--===============0969672121304079265==--

