Content-Type: multipart/mixed; boundary="===============2826111480472754692=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [ext4] 71d4f7d0321: -49.6% xfstests.generic.274.seconds
Date: Thu, 21 Aug 2014 22:30:06 +0800
Message-ID: <20140821143006.GA19943@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2826111480472754692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ted,

We noticed increased xfstests 274's test speed and the first good
commit is 71d4f7d032149b935a26eb3ff85c6c837f3714e1 ("ext4: remove
metadata reservation checks").

test case: snb-drag/xfstests/4HDD-ext4-generic-slow2
snb-drag is a Sandy Bridge PC with 6G memory.

d5e03cbb0c88cd1  71d4f7d032149b935a26eb3ff =

---------------  ------------------------- =

        51 =C2=B1 2%     -49.6%         25 =C2=B1 1%  TOTAL xfstests.generi=
c.274.seconds
       817 =C2=B1 1%      -3.0%        792 =C2=B1 1%  TOTAL time.elapsed_ti=
me

                          xfstests.generic.274.seconds

  60 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  55 ++         .*..*..             *..               *..                  =
 |
     |       .*.       .          ..                ..                     =
 |
  50 *+.*..*.           *..*..*..*     *..*..*..*..*     *                 =
 |
     |                                                                     =
 |
  45 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  25 O+-O--O--O--O--O---O--O--O--O--O--O--O--O--O--O--O--O---O--O--O--O--O-=
-O


	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

--===============2826111480472754692==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCm1rZnMgLXQgZXh0NCAtcSAvZGV2L3NkYTcKbWtmcyAtdCBleHQ0IC1xIC9kZXYvc2Rh
MTAKbWtmcyAtdCBleHQ0IC1xIC9kZXYvc2RhNgpta2ZzIC10IGV4dDQgLXEgL2Rldi9zZGE1Cm1v
dW50IC10IGV4dDQgL2Rldi9zZGExMCAvZnMvc2RhMTAKbW91bnQgLXQgZXh0NCAvZGV2L3NkYTUg
L2ZzL3NkYTUKbW91bnQgLXQgZXh0NCAvZGV2L3NkYTYgL2ZzL3NkYTYKbW91bnQgLXQgZXh0NCAv
ZGV2L3NkYTcgL2ZzL3NkYTcKZXhwb3J0IFRFU1RfRElSPS9mcy9zZGExMApleHBvcnQgVEVTVF9E
RVY9L2Rldi9zZGExMApleHBvcnQgU0NSQVRDSF9NTlQ9L2ZzL3NjcmF0Y2gKbWtkaXIgL2ZzL3Nj
cmF0Y2ggLXAKZXhwb3J0IFNDUkFUQ0hfREVWPS9kZXYvc2RhNwouL2NoZWNrIGdlbmVyaWMvMjI0
IGdlbmVyaWMvMjMxIGdlbmVyaWMvMjc0IGdlbmVyaWMvMjk5IGdlbmVyaWMvMzAwCg==

--===============2826111480472754692==--

