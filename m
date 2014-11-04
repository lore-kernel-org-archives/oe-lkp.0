Content-Type: multipart/mixed; boundary="===============3408854186543805427=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [mm] aabfb57296e: -14.0% time.system_time
Date: Tue, 04 Nov 2014 12:26:04 +0800
Message-ID: <20141104042604.GK27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3408854186543805427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit aabfb57296e3dd9761e47736ec69305c95461d7d ("mm: memcontrol: do not ki=
ll uncharge batching in free_pages_and_swap_cache")


01c2965f0723a252  aabfb57296e3dd9761e47736ec  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \
      2017 =C2=B1  3%     -14.0%       1735 =C2=B1  2%  lkp-hsw01/vm-scalab=
ility/performance-300s-16G-shm-pread-rand
      2017           -14.0%       1735        GEO-MEAN time.system_time

01c2965f0723a252  aabfb57296e3dd9761e47736ec
----------------  --------------------------
       332 =C2=B1  0%      -1.3%        328 =C2=B1  0%  lkp-hsw01/vm-scalab=
ility/performance-300s-16G-shm-pread-rand
       332            -1.3%        328        GEO-MEAN time.elapsed_time



                                 time.elapsed_time

  334 ++-------------------------------------------------------------------=
-+
      *.    .*.. .*.*.. .*..*.*..*.*.*..*.                                 =
 |
  333 ++*..*    *      *                  *..*.*.*..*.    .*..   .*..*     =
 |
      |                                               *..*    *.*     +  .*=
 |
  332 ++                                                               *.  =
 |
      |                                                                    =
 |
  331 ++                                                                   =
 |
      |                                                                    =
 |
  330 ++                                                                   =
 |
      |                                                                    =
 |
  329 ++                                                                   =
 |
      |    O O  O O              O O O       O   O         O      O  O     =
 |
  328 O+            O  O O  O O         O           O O  O      O      O  O=
 O
      | O                                 O    O              O            =
 |
  327 ++-------------------------------------------------------------------=
-+


  =

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

--===============3408854186543805427==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB2bS1zY2FsYWJpbGl0eQpkZWZhdWx0X21vbml0b3JzOgogIHdhaXQ6IHBy
ZS10ZXN0CiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDog
CiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mt
c3RhdDogCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3Rh
dDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAg
ZGlza3N0YXRzOiAKICBlbmVyZ3k6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3Rh
dDogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dh
dGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBw
ZXJmb3JtYW5jZQpjb21taXQ6IGYxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1
ZTEKbW9kZWw6IEdyYW50bGV5IEhhc3dlbGwtRVAKbnJfY3B1OiA1NgptZW1vcnk6IDY0RwpoZGRf
cGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246IApwZXJmLXBy
b2ZpbGU6IApydW50aW1lOiAzMDBzCnNpemU6IDE2Rwp2bS1zY2FsYWJpbGl0eToKICB0ZXN0Ogog
IC0gc2htLXByZWFkLXJhbmQKZW5xdWV1ZV90aW1lOiAyMDE0LTEwLTIwIDIzOjQ1OjI3LjMwMzA0
MDYxNyArMDg6MDAKdGVzdGJveDogbGtwLWhzdzAxCnRib3hfZ3JvdXA6IGxrcC1oc3cwMQprY29u
ZmlnOiB4ODZfNjQtcmhlbApoZWFkX2NvbW1pdDogMzQyOTU4ODRmMTM1YzFkOWYzNDkzNmEzOWI4
Nzc0MWNkYjA0YzQ5MgpiYXNlX2NvbW1pdDogZjExNDA0MGUzZWE2ZTA3MzcyMzM0YWRlNzVkMWVl
MDc3NWMzNTVlMQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE0MTAyMTA5Cmtl
cm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvZjExNDA0MGUzZWE2ZTA3MzcyMzM0YWRlNzVkMWVl
MDc3NWMzNTVlMS92bWxpbnV6LTMuMTguMC1yYzEtZ2YxMTQwNDAiCnVzZXI6IGxrcApxdWV1ZTog
Y3ljbGljCnJlc3VsdF9yb290OiAiL3Jlc3VsdC9sa3AtaHN3MDEvdm0tc2NhbGFiaWxpdHkvcGVy
Zm9ybWFuY2UtMzAwcy0xNkctc2htLXByZWFkLXJhbmQvZGViaWFuLXg4Nl82NC5jZ3oveDg2XzY0
LXJoZWwvZjExNDA0MGUzZWE2ZTA3MzcyMzM0YWRlNzVkMWVlMDc3NWMzNTVlMS8wIgpqb2JfZmls
ZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1oc3cwMS9jeWNsaWNfdm0tc2NhbGFiaWxpdHktcGVyZm9y
bWFuY2UtMzAwcy0xNkctc2htLXByZWFkLXJhbmQteDg2XzY0LXJoZWwtQkFTRS1mMTE0MDQwZTNl
YTZlMDczNzIzMzRhZGU3NWQxZWUwNzc1YzM1NWUxLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0
LTEwLTIxIDEwOjA4OjMxLjE0MDUxMjYwOSArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2Fk
YXZnOiA1MS4yNSAzNi40OCAxNi40MSAxLzQ1MSAxMTA1OApzdGFydF90aW1lOiAnMTQxMzg1NzM1
OCcKZW5kX3RpbWU6ICcxNDEzODU3Njg2Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTAy
MC0yMzA0MzgiCg==

--===============3408854186543805427==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKbW91bnQgLXQgdG1wZnMgLW8gc2l6ZT0xMDAl
IHZtLXNjYWxhYmlsaXR5LXRtcCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcAp0cnVuY2F0ZSAtcyA2
NzQwNzIxMjU0NCAvdG1wL3ZtLXNjYWxhYmlsaXR5LmltZwpta2ZzLnhmcyAtcSAvdG1wL3ZtLXNj
YWxhYmlsaXR5LmltZwptb3VudCAtbyBsb29wIC90bXAvdm0tc2NhbGFiaWxpdHkuaW1nIC90bXAv
dm0tc2NhbGFiaWxpdHkKLi9jYXNlLXNobS1wcmVhZC1yYW5kCnRydW5jYXRlIC90bXAvdm0tc2Nh
bGFiaWxpdHktdG1wL3NwYXJzZS1zaG0tcHJlYWQtcmFuZCAtcyA2NzQwNzIxMjU0NAouL3VzZW1l
bSAtLXJ1bnRpbWUgMzAwIC1uIDU2IC1mIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3NwYXJzZS1z
aG0tcHJlYWQtcmFuZCAtLXJlYWRvbmx5IC0tcmFuZG9tIDMzNzAzNjA2MjcyCnVtb3VudCAvdG1w
L3ZtLXNjYWxhYmlsaXR5LXRtcAp1bW91bnQgL3RtcC92bS1zY2FsYWJpbGl0eQpybSAvdG1wL3Zt
LXNjYWxhYmlsaXR5LmltZwo=

--===============3408854186543805427==--

