Content-Type: multipart/mixed; boundary="===============7454267810706340197=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [ipmi] d9b7e4f717a: +52.5% turbostat.%Busy
Date: Wed, 11 Feb 2015 12:05:17 +0800
Message-ID: <1423627517.8112.0.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7454267810706340197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit d9b7e4f717a167610a49ceb9e5969e80146c89a8 ("ipmi: Periodically check =
to see if irqs and messages are set right")

testbox/testcase/testparams: avoton3/idle/performance-10m

6a11e5c67a397e9a  d9b7e4f717a167610a49ceb9e5  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      0.10 =C2=B1  0%     +52.5%       0.15 =C2=B1  2%  turbostat.%Busy
         2 =C2=B1  0%     +50.0%          3 =C2=B1  0%  turbostat.Avg_MHz

                                  turbostat.%Busy

   0.2 ++----O-O-----------------------------------------------------------=
-+
       |                                                                   =
 |
  0.18 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
  0.16 ++         O     O O  O  O       O  O  O O  O  O  O O          O    =
 |
       O  O          O             O O                        O  O  O      =
 |
  0.14 ++                                                                  =
 |
       |                                                                   =
 |
  0.12 ++    *.*                     *                                     =
 |
       |   ..   +                   : +                                    =
 |
       | .*      +                  :  +                                   =
 |
   0.1 *+         *..  .*.*..  .*..*    *..*..*.*..*..*..*.*..*..*..*.*..*.=
.*
       |             *.      *.                                            =
 |
  0.08 ++------------------------------------------------------------------=
-+


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



_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============7454267810706340197==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBpZGxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgbGF0ZW5jeV9zdGF0czogCiAg
aW50ZXJydXB0czogCiAgc29mdGlycXM6IAogIGNwdWlkbGU6IAogIHR1cmJvc3RhdDogCiAgcG1l
dGVyOiAKZGVmYXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZy
ZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCmNvbW1pdDogZjg3NmYwY2ZmNmQ0NjBmMDNjZDkzNzEw
NDMxNGYzNjZkZmE5MjI2MQptb2RlbDogQXZvdG9uCm1lbW9yeTogOEcKaGRkX3BhcnRpdGlvbnM6
ICIvZGV2L2Rpc2svYnktaWQvYXRhLVNUOTI1MDYxME5TXzlYRTBCU1dILXBhcnQyIgpzd2FwX3Bh
cnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDkyNTA2
MTBOU185WEUwQlNXSC1wYXJ0MSIKdXNlcjogd2ZnCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnegpwbWV0ZXJfc2VydmVyOiBsa3Atd2lsZGNhdApwbWV0ZXJfZGV2aWNlOiB5b2tv
Z2F3YS13dDMxMApzdG9wX2RhZW1vbnM6IApzbGVlcDogMTBtCnRlc3Rib3g6IGF2b3RvbjMKdGJv
eF9ncm91cDogYXZvdG9uMwprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUt
MDItMDcgMTU6Mjc6MzEuMDg1OTMxMzQ3ICswODowMApoZWFkX2NvbW1pdDogZjg3NmYwY2ZmNmQ0
NjBmMDNjZDkzNzEwNDMxNGYzNjZkZmE5MjI2MQpiYXNlX2NvbW1pdDogZTM2ZjAxNGVkZmY3MGZj
MDJiM2QzZDc5Y2VhZDFkNThmMjg5MzMyZQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJs
eS0yMDE1MDIwNTIyCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvZjg3NmYwY2ZmNmQ0NjBm
MDNjZDkzNzEwNDMxNGYzNjZkZmE5MjI2MS92bWxpbnV6LTMuMTkuMC1yYzctZ2Y4NzZmMGMiCnF1
ZXVlOiBjeWNsaWMKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2F2b3RvbjMvaWRsZS9wZXJmb3JtYW5j
ZS0xMG0vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9mODc2ZjBjZmY2
ZDQ2MGYwM2NkOTM3MTA0MzE0ZjM2NmRmYTkyMjYxLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVs
ZWQvYXZvdG9uMy9jeWNsaWNfaWRsZS1wZXJmb3JtYW5jZS0xMG0tZGViaWFuLXg4Nl82NC5jZ3ot
eDg2XzY0LXJoZWwtSEVBRC1mODc2ZjBjZmY2ZDQ2MGYwM2NkOTM3MTA0MzE0ZjM2NmRmYTkyMjYx
LTAtMjAxNTAyMDctOTU4OTMtMWkxbzJrbS55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDItMDcg
MTU6NDc6MzUuNTkwNDk3NTU5ICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKam9iX3N0YXRlOiBm
aW5pc2hlZApsb2FkYXZnOiAwLjAwIDAuMDQgMC4wNSAxLzkzIDY4MApzdGFydF90aW1lOiAnMTQy
MzI5NTM3OCcKZW5kX3RpbWU6ICcxNDIzMjk1OTc4Jwp2ZXJzaW9uOiAiL2xrcC93ZmcvLnNyYy0y
MDE1MDIwNy0xMjUxMzQiCg==

--===============7454267810706340197==--

