Content-Type: multipart/mixed; boundary="===============4918979587792479787=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Tue, 29 Jul 2014 13:24:05 +0800
Message-ID: <53D72FF5.90908@intel.com>
In-Reply-To: <53d70ee6.JsUEmW5dWsv8dev+%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4918979587792479787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit a43455a1d572daf7b730fe12eb747d1e17411365 ("sched/numa: Ensure task_n=
uma_migrate() checks the preferred node")

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

     94500 ~ 3%    +115.6%     203711 ~ 6%  ivb42/hackbench/50%-threads-pipe
     67745 ~ 4%     +64.1%     111174 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
    162245 ~ 3%     +94.1%     314885 ~ 6%  TOTAL proc-vmstat.numa_hint_fau=
lts_local

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

    147474 ~ 3%     +70.6%     251650 ~ 5%  ivb42/hackbench/50%-threads-pipe
     94889 ~ 3%     +46.3%     138815 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
    242364 ~ 3%     +61.1%     390465 ~ 5%  TOTAL proc-vmstat.numa_pte_upda=
tes

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

    147104 ~ 3%     +69.5%     249306 ~ 5%  ivb42/hackbench/50%-threads-pipe
     94431 ~ 3%     +43.9%     135902 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
    241535 ~ 3%     +59.5%     385209 ~ 5%  TOTAL proc-vmstat.numa_hint_fau=
lts

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

       308 ~ 8%     +24.1%        382 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
       308 ~ 8%     +24.1%        382 ~ 5%  TOTAL numa-vmstat.node0.nr_page=
_table_pages

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

      1234 ~ 8%     +24.0%       1530 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
      1234 ~ 8%     +24.0%       1530 ~ 5%  TOTAL numa-meminfo.node0.PageTa=
bles

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

       381 ~ 6%     -17.9%        313 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
       381 ~ 6%     -17.9%        313 ~ 6%  TOTAL numa-vmstat.node1.nr_page=
_table_pages

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

      1528 ~ 6%     -18.0%       1253 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
      1528 ~ 6%     -18.0%       1253 ~ 6%  TOTAL numa-meminfo.node1.PageTa=
bles

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

     24533 ~ 2%     -16.2%      20560 ~ 3%  ivb42/hackbench/50%-threads-pipe
     13551 ~ 2%     -10.7%      12096 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     38084 ~ 2%     -14.2%      32657 ~ 3%  TOTAL proc-vmstat.numa_pages_mi=
grated

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

     24533 ~ 2%     -16.2%      20560 ~ 3%  ivb42/hackbench/50%-threads-pipe
     13551 ~ 2%     -10.7%      12096 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     38084 ~ 2%     -14.2%      32657 ~ 3%  TOTAL proc-vmstat.pgmigrate_suc=
cess

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

      3538 ~ 7%     +11.6%       3949 ~ 7%  lkp-snb01/hackbench/50%-threads=
-socket
      3538 ~ 7%     +11.6%       3949 ~ 7%  TOTAL numa-vmstat.node0.nr_anon=
_pages

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

     14154 ~ 7%     +11.6%      15799 ~ 7%  lkp-snb01/hackbench/50%-threads=
-socket
     14154 ~ 7%     +11.6%      15799 ~ 7%  TOTAL numa-meminfo.node0.AnonPa=
ges

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

      3511 ~ 7%     +11.0%       3898 ~ 7%  lkp-snb01/hackbench/50%-threads=
-socket
      3511 ~ 7%     +11.0%       3898 ~ 7%  TOTAL numa-vmstat.node0.nr_acti=
ve_anon

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

     14044 ~ 7%     +11.1%      15597 ~ 7%  lkp-snb01/hackbench/50%-threads=
-socket
     14044 ~ 7%     +11.1%      15597 ~ 7%  TOTAL numa-meminfo.node0.Active=
(anon)

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

    187958 ~ 2%     +56.6%     294375 ~ 5%  ivb42/hackbench/50%-threads-pipe
    124490 ~ 2%     +35.0%     168004 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    312448 ~ 2%     +48.0%     462379 ~ 5%  TOTAL time.minor_page_faults

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

     11.47 ~ 1%      -2.8%      11.15 ~ 1%  ivb42/hackbench/50%-threads-pipe
     11.47 ~ 1%      -2.8%      11.15 ~ 1%  TOTAL turbostat.RAM_W

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

 3.649e+08 ~ 0%      -2.4%  3.562e+08 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
 3.649e+08 ~ 0%      -2.4%  3.562e+08 ~ 0%  TOTAL time.involuntary_context_=
switches

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

   1924472 ~ 0%      -2.6%    1874425 ~ 0%  ivb42/hackbench/50%-threads-pipe
   1924472 ~ 0%      -2.6%    1874425 ~ 0%  TOTAL vmstat.system.in

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

---------------  -------------------------  =

  1.38e+09 ~ 0%      -1.8%  1.355e+09 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
  1.38e+09 ~ 0%      -1.8%  1.355e+09 ~ 0%  TOTAL time.voluntary_context_sw=
itches


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Aaron

--===============4918979587792479787==
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
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAt
bCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3Iv
YmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJl
YWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAK
L3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNr
YmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAt
LXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2
MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmlu
L2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1n
IDE2IC0tdGhyZWFkcyAtbCA2MDAwMAoK

--===============4918979587792479787==--

