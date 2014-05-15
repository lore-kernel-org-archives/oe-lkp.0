Content-Type: multipart/mixed; boundary="===============3993686493903252897=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: [tracing] b1169cc69ba: +10060.4% proc-vmstat.numa_pte_updates
Date: Thu, 15 May 2014 12:06:26 +0800
Message-ID: <53743D42.3070309@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3993686493903252897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Steven,

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ftrac=
e/core
commit b1169cc69ba96b124df820904a6d3eb775491d7f ("tracing: Remove mock up p=
oll wait function")

f4874261049e3ab  b1169cc69ba96b124df820904
---------------  -------------------------
       191 ~15%  +10060.4%      19487 ~ 8%  lkp-ne04/dd-write/1HDD-ext4-2dd=
.4k
       191 ~15%  +10060.4%      19487 ~ 8%  TOTAL proc-vmstat.numa_pte_upda=
tes

f4874261049e3ab  b1169cc69ba96b124df820904
---------------  -------------------------
   2419721 ~ 0%     +88.0%    4549654 ~ 2%  lkp-ws02/dd-write/11HDD-JBOD-cf=
q-xfs-1dd
   2419721 ~ 0%     +88.0%    4549654 ~ 2%  TOTAL perf-stat.context-switches

f4874261049e3ab  b1169cc69ba96b124df820904
---------------  -------------------------
       954 ~ 0%     +52.7%       1457 ~ 0%  lkp-ne04/dd-write/1HDD-ext4-2dd=
.4k
      3932 ~ 0%     +89.1%       7438 ~ 2%  lkp-ws02/dd-write/11HDD-JBOD-cf=
q-xfs-1dd
      4887 ~ 0%     +82.0%       8895 ~ 2%  TOTAL vmstat.system.cs

f4874261049e3ab  b1169cc69ba96b124df820904
---------------  -------------------------
    163477 ~ 0%     +60.1%     261769 ~ 0%  lkp-ws02/dd-write/11HDD-JBOD-cf=
q-xfs-1dd
    163477 ~ 0%     +60.1%     261769 ~ 0%  TOTAL perf-stat.cpu-migrations

f4874261049e3ab  b1169cc69ba96b124df820904
---------------  -------------------------
     28742 ~ 0%      +6.4%      30574 ~ 0%  lkp-ws02/dd-write/11HDD-JBOD-cf=
q-xfs-1dd
     28742 ~ 0%      +6.4%      30574 ~ 0%  TOTAL vmstat.system.in


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent

	=

Thanks,
Jet



--===============3993686493903252897==
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
bS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm1rZnMgLXQgZXh0NCAtcSAvZGV2L3Nk
YTIKZWNobyAxID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMvd3JpdGViYWNrL2Jh
bGFuY2VfZGlydHlfcGFnZXMvZW5hYmxlCmVjaG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNp
bmcvZXZlbnRzL3dyaXRlYmFjay9iZGlfZGlydHlfcmF0ZWxpbWl0L2VuYWJsZQplY2hvIDEgPiAv
c3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy93cml0ZWJhY2svZ2xvYmFsX2RpcnR5X3N0
YXRlL2VuYWJsZQplY2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy93cml0
ZWJhY2svd3JpdGViYWNrX3NpbmdsZV9pbm9kZS9lbmFibGUKbW91bnQgLXQgZXh0NCAvZGV2L3Nk
YTIgL2ZzL3NkYTIKZGQgYnM9NGsgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGEyL3plcm8tMSBzdGF0
dXM9bm9uZSAmCmRkIGJzPTRrIGlmPS9kZXYvemVybyBvZj0vZnMvc2RhMi96ZXJvLTIgc3RhdHVz
PW5vbmUgJgpzbGVlcCA2MDAKa2lsbGFsbCAtOSBkZAoKCg==

--===============3993686493903252897==--

