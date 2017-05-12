Content-Type: multipart/mixed; boundary="===============6380928325563709677=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [lkp-robot] [mm, page_alloc] d34b0733b4: will-it-scale.per_thread_ops -4% regression
Date: Fri, 12 May 2017 12:47:23 +0800
Message-ID: <20170512044723.GI24200@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6380928325563709677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Greeting,

We noticed a -4% regression of will-it-scale.per_thread_ops due to commit:

commit: d34b0733b452ca3ef1dee36436dab08b8aa6a85c ("Revert "mm, page_alloc: =
only use per-cpu allocator for irq-safe requests"")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

in testcase: will-it-scale
on test machine: 256 threads Phi with 96G memory
with following parameters:

	nr_task: 100%
	mode: thread
	test: page_fault2
	cpufreq_governor: performance

test-description: Will It Scale takes a testcase and runs it from 1 through=
 to n parallel copies to see if the testcase will scale. It builds both a p=
rocess and threads based test in order to see any differences between the t=
wo.
test-url: https://github.com/antonblanchard/will-it-scale



Details are as below:
---------------------------------------------------------------------------=
----------------------->


To reproduce:

        git clone https://github.com/01org/lkp-tests.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml

testcase/path_params/tbox_group/run: will-it-scale/100%-thread-page_fault2-=
performance/lkp-knl-f1

f61143c45077df4f  d34b0733b452ca3ef1dee36436  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

      2363              -4%       2278        will-it-scale.per_thread_ops
      9383              -3%       9069        will-it-scale.time.percent_of=
_cpu_this_job_got
 1.845e+08              -3%  1.782e+08        will-it-scale.time.minor_page=
_faults
     29880              -4%      28713        will-it-scale.time.system_time
   2085066 =C2=B1  4%        -5%    1981442        interrupts.CAL:Function_=
call_interrupts
          1:4          -25%            :4     stderr./lkp/lkp/src/monitors/=
wrapper:#:/lkp/lkp/src/monitors/wrapper:cannot_create/tmp/lkp/fifo-kmsg:Int=
errupted_system_call
 1.852e+08              -3%  1.789e+08        perf-stat.page-faults
 1.852e+08              -3%  1.789e+08        perf-stat.minor-faults
 6.039e+10              -3%  5.832e+10        perf-stat.cache-references
 1.136e+10              -4%  1.091e+10        perf-stat.iTLB-load-misses
 4.297e+13              -4%  4.122e+13        perf-stat.cpu-cycles
 4.623e+12              -4%  4.431e+12        perf-stat.instructions
 4.624e+12              -4%  4.428e+12        perf-stat.iTLB-loads
 1.171e+10              -4%   1.12e+10        perf-stat.cache-misses
 1.658e+12              -4%  1.583e+12        perf-stat.branch-instructions
      0.83              -7%       0.77        perf-stat.branch-miss-rate%
 1.369e+10             -11%  1.219e+10        perf-stat.branch-misses



                           will-it-scale.per_thread_ops

  2380 ++------------------------------------------------------------------=
-+
       |      .*..*                   .*..*.       .*..*.               .*.=
.|
  2360 *+. .*.     +  .*..    .*.. .*.      *.. .*.      *..*..*.*..*..*   =
 *
       |  *         *.    *.*.    *            *                           =
 |
  2340 ++                                                                  =
 |
       |                                                                   =
 |
  2320 ++                                                                  =
 |
       |                                       O                           =
 |
  2300 ++                                                                  =
 |
       |                                                                   =
 |
  2280 O+   O     O                              O                         =
 |
       |  O    O          O O  O  O    O    O       O                      =
 |
  2260 ++           O  O            O     O            O                   =
 |
       |                                                                   =
 |
  2240 ++------------------------------------------------------------------=
-+


                           will-it-scale.time.system_time

  30400 ++-----------------------------------------------------------------=
-+
  30200 *+.                     *.           *.                            =
 |
        |  *                   :  *..       +  *..             *..*        =
 |
  30000 ++  +          .*.     :           +             .*. ..    +  .*.*.=
.*
  29800 ++   *..*.*..*.   *.. :      *.*..*       *.*..*.   *       *.     =
 |
  29600 ++                   *                                             =
 |
  29400 ++                                                                 =
 |
        |                                                                  =
 |
  29200 ++                                                                 =
 |
  29000 ++                                                                 =
 |
  28800 ++   O                       O O  O  O    O O                      =
 |
  28600 ++      O O       O                    O                           =
 |
        O  O         O       O  O O                    O                   =
 |
  28400 ++                                                                 =
 |
  28200 ++--------------O--------------------------------------------------=
-+

  [*] bisect-good sample
  [O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Xiaolong

--===============6380928325563709677==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job-script.ksh"

IyEvYmluL3NoCgpleHBvcnRfdG9wX2VudigpCnsKCWV4cG9ydCBzdWl0ZT0nd2lsbC1pdC1zY2Fs
ZScKCWV4cG9ydCB0ZXN0Y2FzZT0nd2lsbC1pdC1zY2FsZScKCWV4cG9ydCBjYXRlZ29yeT0nYmVu
Y2htYXJrJwoJZXhwb3J0IG5yX3Rhc2s9MjU2CglleHBvcnQgam9iX29yaWdpbj0nL2xrcC9sa3Av
LnNyYy0yMDE3MDQyNi0yMjQwMTAvYWxsb3QvY3ljbGljOmxpbnV4LWRldmVsOmRldmVsLWhvdXJs
eS9sa3Ata25sLWYxL3dpbGwtaXQtc2NhbGUtMTAwLnlhbWwnCglleHBvcnQgcXVldWU9J2Jpc2Vj
dCcKCWV4cG9ydCB0ZXN0Ym94PSdsa3Ata25sLWYxJwoJZXhwb3J0IHRib3hfZ3JvdXA9J2xrcC1r
bmwtZjEnCglleHBvcnQgc3VibWl0X2lkPSc1OTEyN2I2NDBiOWE5MzcxNjI3MjYxZGMnCglleHBv
cnQgam9iX2ZpbGU9Jy9sa3Avc2NoZWR1bGVkL2xrcC1rbmwtZjEvd2lsbC1pdC1zY2FsZS0xMDAl
LXRocmVhZC1wYWdlX2ZhdWx0Mi1wZXJmb3JtYW5jZS1kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEu
Y2d6LWQzNGIwNzMzYjQ1MmNhM2VmMWRlZTM2NDM2ZGFiMDhiOGFhNmE4NWMtMjAxNzA1MTAtOTQ1
NjIteGp1dDllLTAueWFtbCcKCWV4cG9ydCBpZD0nNDY3YzYzOTI5ZjI0ZDQ4OWVjOWJiZWFiNTE2
Yzg1MjhjY2NmYzdkZicKCWV4cG9ydCBtb2RlbD0nUGhpJwoJZXhwb3J0IG5yX2NwdT0yNTYKCWV4
cG9ydCBtZW1vcnk9Jzk2RycKCWV4cG9ydCBucl9zc2RfcGFydGl0aW9ucz0KCWV4cG9ydCBzd2Fw
X3BhcnRpdGlvbnM9CglleHBvcnQgcm9vdGZzX3BhcnRpdGlvbj0KCWV4cG9ydCBjb21taXQ9J2Qz
NGIwNzMzYjQ1MmNhM2VmMWRlZTM2NDM2ZGFiMDhiOGFhNmE4NWMnCglleHBvcnQga2NvbmZpZz0n
eDg2XzY0LWtleGVjJwoJZXhwb3J0IGNvbXBpbGVyPSdnY2MtNicKCWV4cG9ydCByb290ZnM9J2Rl
Ymlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3onCglleHBvcnQgZW5xdWV1ZV90aW1lPScyMDE3LTA1
LTEwIDEwOjMxOjAxICswODAwJwoJZXhwb3J0IF9pZD0nNTkxMjdiNjQwYjlhOTM3MTYyNzI2MWRj
JwoJZXhwb3J0IF9ydD0nL3Jlc3VsdC93aWxsLWl0LXNjYWxlLzEwMCUtdGhyZWFkLXBhZ2VfZmF1
bHQyLXBlcmZvcm1hbmNlL2xrcC1rbmwtZjEvZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNnei94
ODZfNjQta2V4ZWMvZ2NjLTYvZDM0YjA3MzNiNDUyY2EzZWYxZGVlMzY0MzZkYWIwOGI4YWE2YTg1
YycKCWV4cG9ydCB1c2VyPSdsa3AnCglleHBvcnQgaGVhZF9jb21taXQ9J2FlNmRiZjgzYzg4YWU2
Njc4YjgwODk3ZDRlMzc5MjFkYTAyZTY2OTYnCglleHBvcnQgYmFzZV9jb21taXQ9JzVhN2FkMTE0
NmNhYTg5NWFkNzE4YTUzNDM5OWUzOGJkMmJhNzIxYjcnCglleHBvcnQgYnJhbmNoPSdsaW51eC1k
ZXZlbC9kZXZlbC1ob3VybHktMjAxNzA0MzAxNCcKCWV4cG9ydCByZXN1bHRfcm9vdD0nL3Jlc3Vs
dC93aWxsLWl0LXNjYWxlLzEwMCUtdGhyZWFkLXBhZ2VfZmF1bHQyLXBlcmZvcm1hbmNlL2xrcC1r
bmwtZjEvZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNnei94ODZfNjQta2V4ZWMvZ2NjLTYvZDM0
YjA3MzNiNDUyY2EzZWYxZGVlMzY0MzZkYWIwOGI4YWE2YTg1Yy8wJwoJZXhwb3J0IExLUF9TRVJW
RVI9J2lubicKCWV4cG9ydCBtYXhfdXB0aW1lPTE1MDAKCWV4cG9ydCBpbml0cmQ9Jy9vc2ltYWdl
L2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6JwoJZXhwb3J0IGJvb3Rsb2FkZXJf
YXBwZW5kPSdyb290PS9kZXYvcmFtMAp1c2VyPWxrcApqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLWtu
bC1mMS93aWxsLWl0LXNjYWxlLTEwMCUtdGhyZWFkLXBhZ2VfZmF1bHQyLXBlcmZvcm1hbmNlLWRl
Ymlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3otZDM0YjA3MzNiNDUyY2EzZWYxZGVlMzY0MzZkYWIw
OGI4YWE2YTg1Yy0yMDE3MDUxMC05NDU2Mi14anV0OWUtMC55YW1sCkFSQ0g9eDg2XzY0Cmtjb25m
aWc9eDg2XzY0LWtleGVjCmJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNzA0MzAx
NApjb21taXQ9ZDM0YjA3MzNiNDUyY2EzZWYxZGVlMzY0MzZkYWIwOGI4YWE2YTg1YwpCT09UX0lN
QUdFPS9wa2cvbGludXgveDg2XzY0LWtleGVjL2djYy02L2QzNGIwNzMzYjQ1MmNhM2VmMWRlZTM2
NDM2ZGFiMDhiOGFhNmE4NWMvdm1saW51ei00LjExLjAtcmM3LTAwMDQzLWdkMzRiMDczCm1heF91
cHRpbWU9MTUwMApSRVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvMTAwJS10aHJlYWQt
cGFnZV9mYXVsdDItcGVyZm9ybWFuY2UvbGtwLWtubC1mMS9kZWJpYW4teDg2XzY0LTIwMTYtMDgt
MzEuY2d6L3g4Nl82NC1rZXhlYy9nY2MtNi9kMzRiMDczM2I0NTJjYTNlZjFkZWUzNjQzNmRhYjA4
YjhhYTZhODVjLzAKTEtQX1NFUlZFUj1pbm4KZGVidWcKYXBpYz1kZWJ1ZwpzeXNycV9hbHdheXNf
ZW5hYmxlZApyY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCm5ldC5pZm5hbWVzPTAK
cHJpbnRrLmRldmttc2c9b24KcGFuaWM9LTEKc29mdGxvY2t1cF9wYW5pYz0xCm5taV93YXRjaGRv
Zz1wYW5pYwpvb3BzPXBhbmljCmxvYWRfcmFtZGlzaz0yCnByb21wdF9yYW1kaXNrPTAKZHJiZC5t
aW5vcl9jb3VudD04CnN5c3RlbWQubG9nX2xldmVsPWVycgppZ25vcmVfbG9nbGV2ZWwKZWFybHlw
cmludGs9dHR5UzAsMTE1MjAwCmNvbnNvbGU9dHR5UzAsMTE1MjAwCmNvbnNvbGU9dHR5MAp2Z2E9
bm9ybWFsCnJ3JwoJZXhwb3J0IGxrcF9pbml0cmQ9Jy9sa3AvbGtwL2xrcC14ODZfNjQuY2d6JwoJ
ZXhwb3J0IG1vZHVsZXNfaW5pdHJkPScvcGtnL2xpbnV4L3g4Nl82NC1rZXhlYy9nY2MtNi9kMzRi
MDczM2I0NTJjYTNlZjFkZWUzNjQzNmRhYjA4YjhhYTZhODVjL21vZHVsZXMuY2d6JwoJZXhwb3J0
IGJtX2luaXRyZD0nL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L2xr
cF8yMDE3LTA1LTAxLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5j
Z3ovcnN5bmMtcm9vdGZzXzIwMTYtMTEtMTUuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE2LTA4LTMxLmNnei9ydW4taXBjb25maWdfMjAxNi0xMS0xNS5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L3dpbGwtaXQtc2NhbGVfMjAxNi0xMS0xNS5j
Z3osL29zaW1hZ2UvcGtnL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3ovd2lsbC1pdC1zY2Fs
ZS14ODZfNjRfMjAxNi0wOS0wMi5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTYt
MDgtMzEuY2d6L2lvc3RhdF8yMDE2LTExLTE1LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZf
NjQtMjAxNi0wOC0zMS5jZ3ovdHVyYm9zdGF0XzIwMTYtMTEtMTUuY2d6LC9vc2ltYWdlL3BrZy9k
ZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L3R1cmJvc3RhdC14ODZfNjRfMjAxNi0wOS0wMi5j
Z3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L3BlcmZfMjAxNy0w
NC0yNC5jZ3osL29zaW1hZ2UvcGtnL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3ovcGVyZi14
ODZfNjRfMjAxNy0wNS0wOC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTYtMDgt
MzEuY2d6L2h3XzIwMTYtMTEtMTUuY2d6JwoJZXhwb3J0IHNpdGU9J2lubicKCWV4cG9ydCBMS1Bf
Q0dJX1BPUlQ9ODAKCWV4cG9ydCBMS1BfQ0lGU19QT1JUPTEzOQoJZXhwb3J0IHJlcGVhdF90bz0y
CglleHBvcnQga2VybmVsPScvcGtnL2xpbnV4L3g4Nl82NC1rZXhlYy9nY2MtNi9kMzRiMDczM2I0
NTJjYTNlZjFkZWUzNjQzNmRhYjA4YjhhYTZhODVjL3ZtbGludXotNC4xMS4wLXJjNy0wMDA0My1n
ZDM0YjA3MycKCWV4cG9ydCBkZXF1ZXVlX3RpbWU9JzIwMTctMDUtMTAgMTA6MzY6MzkgKzA4MDAn
CglleHBvcnQgam9iX2luaXRyZD0nL2xrcC9zY2hlZHVsZWQvbGtwLWtubC1mMS93aWxsLWl0LXNj
YWxlLTEwMCUtdGhyZWFkLXBhZ2VfZmF1bHQyLXBlcmZvcm1hbmNlLWRlYmlhbi14ODZfNjQtMjAx
Ni0wOC0zMS5jZ3otZDM0YjA3MzNiNDUyY2EzZWYxZGVlMzY0MzZkYWIwOGI4YWE2YTg1Yy0yMDE3
MDUxMC05NDU2Mi14anV0OWUtMC5jZ3onCgoJWyAtbiAiJExLUF9TUkMiIF0gfHwKCWV4cG9ydCBM
S1BfU1JDPS9sa3AvJHt1c2VyOi1sa3B9L3NyYwp9CgpydW5fam9iKCkKewoJZWNobyAkJCA+ICRU
TVAvcnVuLWpvYi5waWQKCgkuICRMS1BfU1JDL2xpYi9odHRwLnNoCgkuICRMS1BfU1JDL2xpYi9q
b2Iuc2gKCS4gJExLUF9TUkMvbGliL2Vudi5zaAoKCWV4cG9ydF90b3BfZW52CgoJcnVuX3NldHVw
ICRMS1BfU1JDL3NldHVwL2NwdWZyZXFfZ292ZXJub3IgJ3BlcmZvcm1hbmNlJwoKCXJ1bl9tb25p
dG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIga21zZwoJcnVuX21vbml0b3IgJExLUF9TUkMv
bW9uaXRvcnMvd3JhcHBlciBpb3N0YXQKCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dy
YXBwZXIgaGVhcnRiZWF0CglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIHZt
c3RhdAoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBudW1hLW51bWFzdGF0
CglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIG51bWEtdm1zdGF0CglydW5f
bW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIG51bWEtbWVtaW5mbwoJcnVuX21vbml0
b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBwcm9jLXZtc3RhdAoJcnVuX21vbml0b3IgJExL
UF9TUkMvbW9uaXRvcnMvd3JhcHBlciBwcm9jLXN0YXQKCXJ1bl9tb25pdG9yICRMS1BfU1JDL21v
bml0b3JzL3dyYXBwZXIgbWVtaW5mbwoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3Jh
cHBlciBzbGFiaW5mbwoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBpbnRl
cnJ1cHRzCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIGxvY2tfc3RhdAoJ
cnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBsYXRlbmN5X3N0YXRzCglydW5f
bW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIHNvZnRpcnFzCglydW5fbW9uaXRvciAk
TEtQX1NSQy9tb25pdG9ycy9vbmUtc2hvdC93cmFwcGVyIGJkaV9kZXZfbWFwcGluZwoJcnVuX21v
bml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBkaXNrc3RhdHMKCXJ1bl9tb25pdG9yICRM
S1BfU1JDL21vbml0b3JzL3dyYXBwZXIgbmZzc3RhdAoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9u
aXRvcnMvd3JhcHBlciBjcHVpZGxlCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFw
cGVyIGNwdWZyZXEtc3RhdHMKCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIg
dHVyYm9zdGF0CglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIHNjaGVkX2Rl
YnVnCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIHBlcmYtc3RhdAoJcnVu
X21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBtcHN0YXQKCXJ1bl9tb25pdG9yICRM
S1BfU1JDL21vbml0b3JzL25vLXN0ZG91dC93cmFwcGVyIHBlcmYtcHJvZmlsZQoJcnVuX21vbml0
b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBvb20ta2lsbGVyCglydW5fbW9uaXRvciAkTEtQ
X1NSQy9tb25pdG9ycy9wbGFpbi93YXRjaGRvZwoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRv
cnMvd3JhcHBlciBuZnMtaGFuZwoKCXJ1bl90ZXN0IG1vZGU9J3RocmVhZCcgdGVzdD0ncGFnZV9m
YXVsdDInICRMS1BfU1JDL3Rlc3RzL3dyYXBwZXIgd2lsbC1pdC1zY2FsZQp9CgpleHRyYWN0X3N0
YXRzKCkKewoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciB3aWxsLWl0LXNjYWxlCgkkTEtQX1NSQy9z
dGF0cy93cmFwcGVyIGttc2cKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgaW9zdGF0CgkkTEtQX1NS
Qy9zdGF0cy93cmFwcGVyIHZtc3RhdAoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBudW1hLW51bWFz
dGF0CgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIG51bWEtdm1zdGF0CgkkTEtQX1NSQy9zdGF0cy93
cmFwcGVyIG51bWEtbWVtaW5mbwoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBwcm9jLXZtc3RhdAoJ
JExLUF9TUkMvc3RhdHMvd3JhcHBlciBtZW1pbmZvCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHNs
YWJpbmZvCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIGludGVycnVwdHMKCSRMS1BfU1JDL3N0YXRz
L3dyYXBwZXIgbG9ja19zdGF0CgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIGxhdGVuY3lfc3RhdHMK
CSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgc29mdGlycXMKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIg
ZGlza3N0YXRzCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIG5mc3N0YXQKCSRMS1BfU1JDL3N0YXRz
L3dyYXBwZXIgY3B1aWRsZQoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciB0dXJib3N0YXQKCSRMS1Bf
U1JDL3N0YXRzL3dyYXBwZXIgc2NoZWRfZGVidWcKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgcGVy
Zi1zdGF0CgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIG1wc3RhdAoJJExLUF9TUkMvc3RhdHMvd3Jh
cHBlciBwZXJmLXByb2ZpbGUKCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHRpbWUgd2lsbC1pdC1z
Y2FsZS50aW1lCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHRpbWUKCSRMS1BfU1JDL3N0YXRzL3dy
YXBwZXIgZG1lc2cKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIga21zZwoJJExLUF9TUkMvc3RhdHMv
d3JhcHBlciBzdGRlcnIKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgbGFzdF9zdGF0ZQp9CgoiJEAi
Cg==

--===============6380928325563709677==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCgojISBqb2JzL3dpbGwtaXQtc2NhbGUtMTAwLnlhbWwKc3VpdGU6IHdpbGwtaXQtc2NhbGUK
dGVzdGNhc2U6IHdpbGwtaXQtc2NhbGUKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90YXNrOiAxMDAl
CndpbGwtaXQtc2NhbGU6CiAgbW9kZTogdGhyZWFkCiAgdGVzdDogcGFnZV9mYXVsdDIKam9iX29y
aWdpbjogIi9sa3AvbGtwLy5zcmMtMjAxNzA0MjYtMjI0MDEwL2FsbG90L2N5Y2xpYzpsaW51eC1k
ZXZlbDpkZXZlbC1ob3VybHkvbGtwLWtubC1mMS93aWxsLWl0LXNjYWxlLTEwMC55YW1sIgoKIyEg
cXVldWUgb3B0aW9ucwpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1rbmwtZjEKdGJveF9ncm91
cDogbGtwLWtubC1mMQpzdWJtaXRfaWQ6IDU5MTI3YjY0MGI5YTkzNzE2MjcyNjFkYwpqb2JfZmls
ZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1rbmwtZjEvd2lsbC1pdC1zY2FsZS0xMDAlLXRocmVhZC1w
YWdlX2ZhdWx0Mi1wZXJmb3JtYW5jZS1kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6LWQzNGIw
NzMzYjQ1MmNhM2VmMWRlZTM2NDM2ZGFiMDhiOGFhNmE4NWMtMjAxNzA1MTAtOTQ1NjIteGp1dDll
LTAueWFtbCIKaWQ6IDQ2N2M2MzkyOWYyNGQ0ODllYzliYmVhYjUxNmM4NTI4Y2NjZmM3ZGYKCiMh
IGhvc3RzL2xrcC1rbmwtZjEKbW9kZWw6IFBoaQpucl9jcHU6IDI1NgptZW1vcnk6IDk2Rwpucl9z
c2RfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246IAoKIyEg
aW5jbHVkZS9jYXRlZ29yeS9iZW5jaG1hcmsKa21zZzogCmlvc3RhdDogCmhlYXJ0YmVhdDogCnZt
c3RhdDogCm51bWEtbnVtYXN0YXQ6IApudW1hLXZtc3RhdDogCm51bWEtbWVtaW5mbzogCnByb2Mt
dm1zdGF0OiAKcHJvYy1zdGF0OiAKbWVtaW5mbzogCnNsYWJpbmZvOiAKaW50ZXJydXB0czogCmxv
Y2tfc3RhdDogCmxhdGVuY3lfc3RhdHM6IApzb2Z0aXJxczogCmJkaV9kZXZfbWFwcGluZzogCmRp
c2tzdGF0czogCm5mc3N0YXQ6IApjcHVpZGxlOiAKY3B1ZnJlcS1zdGF0czogCnR1cmJvc3RhdDog
CnNjaGVkX2RlYnVnOiAKcGVyZi1zdGF0OiAKbXBzdGF0OiAKcGVyZi1wcm9maWxlOiAKCiMhIGlu
Y2x1ZGUvY2F0ZWdvcnkvQUxMCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCgojISBpbmNs
dWRlL3F1ZXVlL2N5Y2xpYwpjb21taXQ6IGQzNGIwNzMzYjQ1MmNhM2VmMWRlZTM2NDM2ZGFiMDhi
OGFhNmE4NWMKCiMhIGluY2x1ZGUvdGVzdGJveC9sa3Ata25sLWYxCmtjb25maWc6IHg4Nl82NC1r
ZXhlYwoKIyEgZGVmYXVsdCBwYXJhbXMKY29tcGlsZXI6IGdjYy02CnJvb3RmczogZGViaWFuLXg4
Nl82NC0yMDE2LTA4LTMxLmNnegplbnF1ZXVlX3RpbWU6IDIwMTctMDUtMTAgMTA6MzE6MDEuMTcz
NTQxMzE2ICswODowMApfaWQ6IDU5MTI3YjY0MGI5YTkzNzE2MjcyNjFkYwpfcnQ6ICIvcmVzdWx0
L3dpbGwtaXQtc2NhbGUvMTAwJS10aHJlYWQtcGFnZV9mYXVsdDItcGVyZm9ybWFuY2UvbGtwLWtu
bC1mMS9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L3g4Nl82NC1rZXhlYy9nY2MtNi9kMzRi
MDczM2I0NTJjYTNlZjFkZWUzNjQzNmRhYjA4YjhhYTZhODVjIgoKIyEgc2NoZWR1bGUgb3B0aW9u
cwp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IGFlNmRiZjgzYzg4YWU2Njc4YjgwODk3ZDRlMzc5MjFk
YTAyZTY2OTYKYmFzZV9jb21taXQ6IDVhN2FkMTE0NmNhYTg5NWFkNzE4YTUzNDM5OWUzOGJkMmJh
NzIxYjcKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNzA0MzAxNApyZXN1bHRf
cm9vdDogIi9yZXN1bHQvd2lsbC1pdC1zY2FsZS8xMDAlLXRocmVhZC1wYWdlX2ZhdWx0Mi1wZXJm
b3JtYW5jZS9sa3Ata25sLWYxL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3oveDg2XzY0LWtl
eGVjL2djYy02L2QzNGIwNzMzYjQ1MmNhM2VmMWRlZTM2NDM2ZGFiMDhiOGFhNmE4NWMvMCIKTEtQ
X1NFUlZFUjogaW5uCm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2Rl
Ymlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rl
di9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLWtubC1mMS93aWxsLWl0
LXNjYWxlLTEwMCUtdGhyZWFkLXBhZ2VfZmF1bHQyLXBlcmZvcm1hbmNlLWRlYmlhbi14ODZfNjQt
MjAxNi0wOC0zMS5jZ3otZDM0YjA3MzNiNDUyY2EzZWYxZGVlMzY0MzZkYWIwOGI4YWE2YTg1Yy0y
MDE3MDUxMC05NDU2Mi14anV0OWUtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82
NC1rZXhlYwotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNzA0MzAxNAotIGNv
bW1pdD1kMzRiMDczM2I0NTJjYTNlZjFkZWUzNjQzNmRhYjA4YjhhYTZhODVjCi0gQk9PVF9JTUFH
RT0vcGtnL2xpbnV4L3g4Nl82NC1rZXhlYy9nY2MtNi9kMzRiMDczM2I0NTJjYTNlZjFkZWUzNjQz
NmRhYjA4YjhhYTZhODVjL3ZtbGludXotNC4xMS4wLXJjNy0wMDA0My1nZDM0YjA3MwotIG1heF91
cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvd2lsbC1pdC1zY2FsZS8xMDAlLXRocmVh
ZC1wYWdlX2ZhdWx0Mi1wZXJmb3JtYW5jZS9sa3Ata25sLWYxL2RlYmlhbi14ODZfNjQtMjAxNi0w
OC0zMS5jZ3oveDg2XzY0LWtleGVjL2djYy02L2QzNGIwNzMzYjQ1MmNhM2VmMWRlZTM2NDM2ZGFi
MDhiOGFhNmE4NWMvMAotIExLUF9TRVJWRVI9aW5uCi0gZGVidWcKLSBhcGljPWRlYnVnCi0gc3lz
cnFfYWx3YXlzX2VuYWJsZWQKLSByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCi0g
bmV0LmlmbmFtZXM9MAotIHByaW50ay5kZXZrbXNnPW9uCi0gcGFuaWM9LTEKLSBzb2Z0bG9ja3Vw
X3BhbmljPTEKLSBubWlfd2F0Y2hkb2c9cGFuaWMKLSBvb3BzPXBhbmljCi0gbG9hZF9yYW1kaXNr
PTIKLSBwcm9tcHRfcmFtZGlzaz0wCi0gZHJiZC5taW5vcl9jb3VudD04Ci0gc3lzdGVtZC5sb2df
bGV2ZWw9ZXJyCi0gaWdub3JlX2xvZ2xldmVsCi0gZWFybHlwcmludGs9dHR5UzAsMTE1MjAwCi0g
Y29uc29sZT10dHlTMCwxMTUyMDAKLSBjb25zb2xlPXR0eTAKLSB2Z2E9bm9ybWFsCi0gcncKbGtw
X2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cv
bGludXgveDg2XzY0LWtleGVjL2djYy02L2QzNGIwNzMzYjQ1MmNhM2VmMWRlZTM2NDM2ZGFiMDhi
OGFhNmE4NWMvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE2LTA4LTMxLmNnei9sa3BfMjAxNy0wNS0wMS5jZ3osL29zaW1hZ2UvZGVwcy9kZWJp
YW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L3JzeW5jLXJvb3Rmc18yMDE2LTExLTE1LmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3ovcnVuLWlwY29uZmlnXzIwMTYt
MTEtMTUuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNnei93aWxs
LWl0LXNjYWxlXzIwMTYtMTEtMTUuY2d6LC9vc2ltYWdlL3BrZy9kZWJpYW4teDg2XzY0LTIwMTYt
MDgtMzEuY2d6L3dpbGwtaXQtc2NhbGUteDg2XzY0XzIwMTYtMDktMDIuY2d6LC9vc2ltYWdlL2Rl
cHMvZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNnei9pb3N0YXRfMjAxNi0xMS0xNS5jZ3osL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L3R1cmJvc3RhdF8yMDE2LTEx
LTE1LmNneiwvb3NpbWFnZS9wa2cvZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNnei90dXJib3N0
YXQteDg2XzY0XzIwMTYtMDktMDIuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE2
LTA4LTMxLmNnei9wZXJmXzIwMTctMDQtMjQuY2d6LC9vc2ltYWdlL3BrZy9kZWJpYW4teDg2XzY0
LTIwMTYtMDgtMzEuY2d6L3BlcmYteDg2XzY0XzIwMTctMDUtMDguY2d6LC9vc2ltYWdlL2RlcHMv
ZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNnei9od18yMDE2LTExLTE1LmNneiIKc2l0ZTogaW5u
CgojISAvbGtwL2xrcC8uc3JjLTIwMTcwNDMwLTIxMDgyMi9pbmNsdWRlL3NpdGUvaW5uCkxLUF9D
R0lfUE9SVDogODAKTEtQX0NJRlNfUE9SVDogMTM5Cm9vbS1raWxsZXI6IAp3YXRjaGRvZzogCm5m
cy1oYW5nOiAKCiMhIHJ1bnRpbWUgc3RhdHVzCnJlcGVhdF90bzogMgoKIyEgdXNlciBvdmVycmlk
ZXMKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQta2V4ZWMvZ2NjLTYvZDM0YjA3MzNiNDUyY2Ez
ZWYxZGVlMzY0MzZkYWIwOGI4YWE2YTg1Yy92bWxpbnV6LTQuMTEuMC1yYzctMDAwNDMtZ2QzNGIw
NzMiCmRlcXVldWVfdGltZTogMjAxNy0wNS0xMCAxMDozNjozOS4zMTEwODc0MzIgKzA4OjAwCgoj
ISAvbGtwL2xrcC8uc3JjLTIwMTcwNTA5LTIwNTYxMS9pbmNsdWRlL3NpdGUvaW5uCmpvYl9zdGF0
ZTogZmluaXNoZWQKbG9hZGF2ZzogJzExMS4yMycK

--===============6380928325563709677==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

CmZvciBmaWxlIGluIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdSovY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmRvCgllY2hvIHBlcmZvcm1hbmNlID4gJGZpbGUKZG9uZQoKLi9ydW50ZXN0LnB5
IHBhZ2VfZmF1bHQyIDI5NSB0aHJlYWQgMjU2Cg==

--===============6380928325563709677==--

