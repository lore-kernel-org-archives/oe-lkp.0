Content-Type: multipart/mixed; boundary="===============3502243740637750639=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [drm/i915] f9b61ff6bce: +178.7% piglit.time.elapsed_time
Date: Thu, 26 Feb 2015 13:17:54 +0800
Message-ID: <1424927874.10337.20.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3502243740637750639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit f9b61ff6bce9a44555324b29e593fdffc9a115bc ("drm/i915: Push vblank ena=
ble/disable past encoder->enable/disable")


testbox/testcase/testparams: lkp-t410/piglit/performance-igt-069

676fa5721c2eece4  f9b61ff6bce9a44555324b29e5  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      6743 =C2=B1  0%    +222.7%      21759 =C2=B1  6%  piglit.time.volunta=
ry_context_switches
     73.50 =C2=B1  0%    +178.7%     204.84 =C2=B1  0%  piglit.time.elapsed=
_time.max
     73.50 =C2=B1  0%    +178.7%     204.84 =C2=B1  0%  piglit.time.elapsed=
_time
         5 =C2=B1  8%     -61.9%          2 =C2=B1  0%  piglit.time.percent=
_of_cpu_this_job_got
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  vmstat.procs.b
      6743 =C2=B1  0%    +222.7%      21759 =C2=B1  6%  time.voluntary_cont=
ext_switches
     73.50 =C2=B1  0%    +178.7%     204.84 =C2=B1  0%  time.elapsed_time.m=
ax
     73.50 =C2=B1  0%    +178.7%     204.84 =C2=B1  0%  time.elapsed_time
         5 =C2=B1  8%     -61.9%          2 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
       229 =C2=B1  5%    +101.5%        461 =C2=B1  5%  time.involuntary_co=
ntext_switches
      1.37 =C2=B1  4%     +63.3%       2.24 =C2=B1  3%  time.system_time
      9518 =C2=B1  0%     -46.1%       5130 =C2=B1  5%  vmstat.system.in
     18657 =C2=B1  0%     -44.9%      10286 =C2=B1  5%  vmstat.system.cs

lkp-t410: Westmere
Memory: 2G




                             piglit.time.elapsed_time

  280 ++--------O----------------------------------------------------------=
-+
  260 ++            O                                                      =
 |
      |                                                                    =
 |
  240 ++                                                                   =
 |
  220 ++                                                                   =
 |
  200 O+O O O O   O   O OO O O O O O O O O O O O O O O O O OO O O O O O O O=
 O
  180 ++                                                                   =
 |
      |                                                                    =
 |
  160 ++                                                                   =
 |
  140 ++                           *                                       =
 |
  120 ++                           ::                                      =
 |
  100 ++                          : :                                      =
 |
      |                           :  :                                     =
 |
   80 *+*.*.*.*.*.*.*.*.**.*.*.*.*   *.*.*.*.*.*.*                         =
 |
   60 ++-------------------------------------------------------------------=
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

--===============3502243740637750639==
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
b3V0OiAzMG0KcGlnbGl0OgogIGdyb3VwOiBpZ3QtMDY5CnRlc3Rib3g6IGxrcC10NDEwCnRib3hf
Z3JvdXA6IGxrcC10NDEwCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0w
Mi0xMyAxMzowNToyMi4wMTgxNzc1MjkgKzA4OjAwCmhlYWRfY29tbWl0OiA1YWViMmEzZGM0ZjBl
YTQ3ZmUwZGYzY2IzYWY3NWVmODEzZGRhODMzCmJhc2VfY29tbWl0OiBiZmE3NmQ0OTU3NjU5OWE0
YjlmOWI3YTcxZjIzZDczZDZkY2ZmNzM1CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5
LTIwMTUwMjE2MjMKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC81YWViMmEzZGM0ZjBlYTQ3
ZmUwZGYzY2IzYWY3NWVmODEzZGRhODMzL3ZtbGludXotMy4xOS4wLXdsLWF0aC0wMjMwNS1nNWFl
YjJhMyIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9sa3AtdDQxMC9waWdsaXQvcGVyZm9ybWFu
Y2UtaWd0LTA2OS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsLzVhZWIy
YTNkYzRmMGVhNDdmZTBkZjNjYjNhZjc1ZWY4MTNkZGE4MzMvMCIKam9iX2ZpbGU6ICIvbGtwL3Nj
aGVkdWxlZC9sa3AtdDQxMC9jeWNsaWNfcGlnbGl0LXBlcmZvcm1hbmNlLWlndC0wNjkteDg2XzY0
LXJoZWwtSEVBRC01YWViMmEzZGM0ZjBlYTQ3ZmUwZGYzY2IzYWY3NWVmODEzZGRhODMzLTAtMjAx
NTAyMTMtNjY0MzAtMXZtbTExYi55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDItMTcgMjI6MTQ6
MTQuMjQ1MjQ1MDU0ICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKam9iX3N0YXRlOiBmaW5pc2hl
ZApsb2FkYXZnOiAxLjY2IDAuNTYgMC4yMCAxLzE2OSA3NjcKc3RhcnRfdGltZTogJzE0MjQxODI0
OTAnCmVuZF90aW1lOiAnMTQyNDE4MjY5NicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTAy
MTctMjEwMTAxIgo=

--===============3502243740637750639==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCnBpZ2xpdCBydW4gaWd0IC10IGlndC9rbXNfZmxpcC92YmxhbmstdnMtZHBtcy1zdXNw
ZW5kLWludGVycnVwdGlibGUgL3RtcC9sa3AvcGlnbGl0LXJlc3VsdHMtMApwaWdsaXQgc3VtbWFy
eSBjb25zb2xlIC90bXAvbGtwL3BpZ2xpdC1yZXN1bHRzLTAK

--===============3502243740637750639==--

