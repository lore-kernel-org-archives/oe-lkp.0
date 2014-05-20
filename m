Content-Type: multipart/mixed; boundary="===============7876820237946345245=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: [x86, vdso] cfda7bb9ecb: +14.7% will-it-scale.per_thread_ops
Date: Tue, 20 May 2014 13:59:09 +0800
Message-ID: <537AEF2D.9040207@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7876820237946345245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy,

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/vdso
commit cfda7bb9ecbf9d96264bb5bade33a842966d1062 ("x86, vdso: Move syscall a=
nd sysenter setup into kernel/cpu/common.c")

test case: nhm4/will-it-scale/sched_yield

3d7ee969bffcc98  cfda7bb9ecbf9d96264bb5bad
---------------  -------------------------
     5497021 ~ 0%     +14.7%    6303424 ~ 0%  TOTAL will-it-scale.per_threa=
d_ops
        0.54 ~ 0%      +5.6%       0.57 ~ 0%  TOTAL will-it-scale.scalabili=
ty
     6209483 ~ 0%      +1.6%    6305917 ~ 0%  TOTAL will-it-scale.per_proce=
ss_ops
        2455 ~ 5%     +16.9%       2870 ~ 5%  TOTAL cpuidle.C1-NHM.usage
        8829 ~ 7%     +15.2%      10169 ~10%  TOTAL slabinfo.kmalloc-64.act=
ive_objs
       24.13 ~12%     +48.9%      35.93 ~14%  TOTAL time.user_time
         393 ~ 0%      -3.0%        382 ~ 1%  TOTAL time.system_time


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


Thanks,
Jet



--===============7876820237946345245==
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
bGluZ19nb3Zlcm5vcgouL3J1bnRlc3QucHkgc2NoZWRfeWllbGQgMzIgMSA0IDYgOAoKCg==

--===============7876820237946345245==--

