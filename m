Content-Type: multipart/mixed; boundary="===============3141387315136746216=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Fri, 13 Sep 2013 08:51:33 +0800
Message-ID: <20130913005133.GA32479@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============3141387315136746216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

FYI, we noticed much increased vmap_area_lock contentions since this
commit:

commit 20bafb3d23d108bc0a896eb8b7c1501f4f649b77
Author: Peter Hurley <peter@hurleysoftware.com>
Date:   Sat Jun 15 10:21:19 2013 -0400

    n_tty: Move buffers into n_tty_data
    =

    Reduce pointer reloading and improve locality-of-reference;
    allocate read_buf and echo_buf within struct n_tty_data.
    =

    Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

:040000 040000 96d92e4e242c4b2ff11b25c005bccd093865b350 2822d87b2425c3e7adc=
7b722a20d739c9d4a3046 M	drivers
bisect run success

# bad: [9cdfea961eeaf9b6b939fb9dc822a204a1d94d08] Merge remote-tracking bra=
nch 'ipvs-next/master' into devel-hourly-2013090112
# good: [d4e4ab86bcba5a72779c43dc1459f71fea3d89c8] Linux 3.11-rc5
git bisect start '9cdfea961eeaf9b6b939fb9dc822a204a1d94d08' 'd4e4ab86bcba5a=
72779c43dc1459f71fea3d89c8' '--'
# good: [903bc7e8c2a4f9ef8e40aed615ed48023f9460e3] Merge remote-tracking br=
anch 'spi/for-next'
git bisect good 903bc7e8c2a4f9ef8e40aed615ed48023f9460e3
# bad: [d926318427c1fa8df182d3dcd7f802d7d0609225] Merge remote-tracking bra=
nch 'bcon/master'
git bisect bad d926318427c1fa8df182d3dcd7f802d7d0609225
# bad: [adcb2bcd0dd2bb88f21180c8ffb9ec2549f4d883] Merge remote-tracking bra=
nch 'usb/usb-next'
git bisect bad adcb2bcd0dd2bb88f21180c8ffb9ec2549f4d883
# good: [a83605266423437d8afe73cbd538df33cf8fb32b] Merge remote-tracking br=
anch 'driver-core/driver-core-next'
git bisect good a83605266423437d8afe73cbd538df33cf8fb32b
# good: [224563b6ce034b82f8511969d9496113da34fb2c] Merge tag 'for-usb-next-=
2013-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/sarah/xhci int=
o usb-next
git bisect good 224563b6ce034b82f8511969d9496113da34fb2c
# bad: [5284eba7b37dfeffe75bfdf81a13e9efebe0480a] serial/arc-uart: Handle R=
x Error Interrupts w/o any data
git bisect bad 5284eba7b37dfeffe75bfdf81a13e9efebe0480a
# bad: [7d88d637a3c75257b7611f9feee0c17fa187ecc9] n_tty: Factor standard pe=
r-char i/o into separate fn
git bisect bad 7d88d637a3c75257b7611f9feee0c17fa187ecc9
# good: [11b9faa44df76189b8346ff602a2c01c610c37eb] tty: Merge tty_buffer_fi=
nd() into tty_buffer_alloc()
git bisect good 11b9faa44df76189b8346ff602a2c01c610c37eb
# good: [019ebdf9f26fd2e43b9e1af576835183e95dc82e] n_tty: Eliminate echo_co=
mmit memory barrier
git bisect good 019ebdf9f26fd2e43b9e1af576835183e95dc82e
# bad: [1bb9d562856279a217a4e581a803dee9bb48a708] n_tty: Rename process_cha=
r_map to char_map
git bisect bad 1bb9d562856279a217a4e581a803dee9bb48a708
# good: [9dfd16ddea9bdbc8343340e543732db0a467ae32] n_tty: Avoid false-shari=
ng echo buffer indices
git bisect good 9dfd16ddea9bdbc8343340e543732db0a467ae32
# good: [8cb06c983822103da1cfe57b9901e60a00e61f67] n_tty: Remove alias ptrs=
 in __receive_buf()
git bisect good 8cb06c983822103da1cfe57b9901e60a00e61f67
# bad: [20bafb3d23d108bc0a896eb8b7c1501f4f649b77] n_tty: Move buffers into =
n_tty_data
git bisect bad 20bafb3d23d108bc0a896eb8b7c1501f4f649b77
# first bad commit: [20bafb3d23d108bc0a896eb8b7c1501f4f649b77] n_tty: Move =
buffers into n_tty_data


Compare of all good/bad commits in this bisect:

                        lock_stat.vmap_area_lock.contentions

   22000 ++----------------------------------------------------------------=
-+
   20000 ++O    O O O    O O O O OO O O   OO O O O OO   O O O O  O O O O   =
 |
         O   OO       OO                O             O        O           =
 |
   18000 ++                                                                =
 |
   16000 ++                                                                =
 |
         |                                                                 =
 |
   14000 ++                                                                =
 |
   12000 ++                                                                =
 |
   10000 ++                                                                =
 |
         |                                                                 =
 |
    8000 ++                                                                =
 |
    6000 ++                                                                =
 |
         |                                                                 =
 |
    4000 *+*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*=
.*
    2000 ++----------------------------------------------------------------=
-+


                lock_stat.vmap_area_lock.contentions.get_vmalloc_info

   45000 ++----------------------------------------------------------------=
-+
         | O                   O    O            O      O   O      O       =
 |
   40000 O+  OO O O O OO O O O   OO   O O OO O O   OO O   O   OO O   O O   =
 |
   35000 ++                                                                =
 |
         |                                                                 =
 |
   30000 ++                                                                =
 |
         |                                                                 =
 |
   25000 ++                                                                =
 |
         |                                                                 =
 |
   20000 ++                                                                =
 |
   15000 ++                                                                =
 |
         |                                                                 =
 |
   10000 ++                                                                =
 |
         |                        *.*.     *. .*.          .*.  .*.*.      =
 |
    5000 *+*-**-*-*-*-**-*-*-*-*-*----*-*-*--*---*-**-*-*-*---**-----*-**-*=
-*


--===============3141387315136746216==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-n_tty-Move-buffers-into-n_tty_data.patch"

PkZyb20gMjBiYWZiM2QyM2QxMDhiYzBhODk2ZWI4YjdjMTUwMWY0ZjY0OWI3NyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogUGV0ZXIgSHVybGV5IDxwZXRlckBodXJsZXlzb2Z0d2FyZS5j
b20+CkRhdGU6IFNhdCwgMTUgSnVuIDIwMTMgMTA6MjE6MTkgLTA0MDAKU3ViamVjdDogW1BBVENI
XSBuX3R0eTogTW92ZSBidWZmZXJzIGludG8gbl90dHlfZGF0YQoKUmVkdWNlIHBvaW50ZXIgcmVs
b2FkaW5nIGFuZCBpbXByb3ZlIGxvY2FsaXR5LW9mLXJlZmVyZW5jZTsKYWxsb2NhdGUgcmVhZF9i
dWYgYW5kIGVjaG9fYnVmIHdpdGhpbiBzdHJ1Y3Qgbl90dHlfZGF0YS4KClNpZ25lZC1vZmYtYnk6
IFBldGVyIEh1cmxleSA8cGV0ZXJAaHVybGV5c29mdHdhcmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZl
cnMvdHR5L25fdHR5LmMgfCAyNSArKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3R0eS9uX3R0eS5jIGIvZHJpdmVycy90dHkvbl90dHkuYwppbmRleCBkNmViYTk5Li41MWNi
ZGQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9uX3R0eS5jCisrKyBiL2RyaXZlcnMvdHR5L25f
dHR5LmMKQEAgLTEwNSw5ICsxMDUsOSBAQCBzdHJ1Y3Qgbl90dHlfZGF0YSB7CiAJdW5zaWduZWQg
Y2hhciBsbmV4dDoxLCBlcmFzaW5nOjEsIHJhdzoxLCByZWFsX3JhdzoxLCBpY2Fub246MTsKIAog
CS8qIHNoYXJlZCBieSBwcm9kdWNlciBhbmQgY29uc3VtZXIgKi8KLQljaGFyICpyZWFkX2J1ZjsK
KwljaGFyIHJlYWRfYnVmW05fVFRZX0JVRl9TSVpFXTsKIAlERUNMQVJFX0JJVE1BUChyZWFkX2Zs
YWdzLCBOX1RUWV9CVUZfU0laRSk7Ci0JdW5zaWduZWQgY2hhciAqZWNob19idWY7CisJdW5zaWdu
ZWQgY2hhciBlY2hvX2J1ZltOX1RUWV9CVUZfU0laRV07CiAKIAlpbnQgbWluaW11bV90b193YWtl
OwogCkBAIC0xNjk1LDkgKzE2OTUsNyBAQCBzdGF0aWMgdm9pZCBuX3R0eV9jbG9zZShzdHJ1Y3Qg
dHR5X3N0cnVjdCAqdHR5KQogCWlmICh0dHktPmxpbmspCiAJCW5fdHR5X3BhY2tldF9tb2RlX2Zs
dXNoKHR0eSk7CiAKLQlrZnJlZShsZGF0YS0+cmVhZF9idWYpOwotCWtmcmVlKGxkYXRhLT5lY2hv
X2J1Zik7Ci0Ja2ZyZWUobGRhdGEpOworCXZmcmVlKGxkYXRhKTsKIAl0dHktPmRpc2NfZGF0YSA9
IE5VTEw7CiB9CiAKQEAgLTE3MTUsNyArMTcxMyw4IEBAIHN0YXRpYyBpbnQgbl90dHlfb3Blbihz
dHJ1Y3QgdHR5X3N0cnVjdCAqdHR5KQogewogCXN0cnVjdCBuX3R0eV9kYXRhICpsZGF0YTsKIAot
CWxkYXRhID0ga3phbGxvYyhzaXplb2YoKmxkYXRhKSwgR0ZQX0tFUk5FTCk7CisJLyogQ3VycmVu
dGx5IGEgbWFsbG9jIGZhaWx1cmUgaGVyZSBjYW4gcGFuaWMgKi8KKwlsZGF0YSA9IHZtYWxsb2Mo
c2l6ZW9mKCpsZGF0YSkpOwogCWlmICghbGRhdGEpCiAJCWdvdG8gZXJyOwogCkBAIC0xNzIzLDE2
ICsxNzIyLDE0IEBAIHN0YXRpYyBpbnQgbl90dHlfb3BlbihzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5
KQogCW11dGV4X2luaXQoJmxkYXRhLT5hdG9taWNfcmVhZF9sb2NrKTsKIAltdXRleF9pbml0KCZs
ZGF0YS0+b3V0cHV0X2xvY2spOwogCi0JLyogVGhlc2UgYXJlIHVnbHkuIEN1cnJlbnRseSBhIG1h
bGxvYyBmYWlsdXJlIGhlcmUgY2FuIHBhbmljICovCi0JbGRhdGEtPnJlYWRfYnVmID0ga3phbGxv
YyhOX1RUWV9CVUZfU0laRSwgR0ZQX0tFUk5FTCk7Ci0JbGRhdGEtPmVjaG9fYnVmID0ga3phbGxv
YyhOX1RUWV9CVUZfU0laRSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFsZGF0YS0+cmVhZF9idWYgfHwg
IWxkYXRhLT5lY2hvX2J1ZikKLQkJZ290byBlcnJfZnJlZV9idWZzOwotCiAJdHR5LT5kaXNjX2Rh
dGEgPSBsZGF0YTsKIAlyZXNldF9idWZmZXJfZmxhZ3ModHR5LT5kaXNjX2RhdGEpOwogCWxkYXRh
LT5jb2x1bW4gPSAwOworCWxkYXRhLT5jYW5vbl9jb2x1bW4gPSAwOwogCWxkYXRhLT5taW5pbXVt
X3RvX3dha2UgPSAxOworCWxkYXRhLT5udW1fb3ZlcnJ1biA9IDA7CisJbGRhdGEtPm5vX3Jvb20g
PSAwOworCWxkYXRhLT5sbmV4dCA9IDA7CiAJdHR5LT5jbG9zaW5nID0gMDsKIAkvKiBpbmRpY2F0
ZSBidWZmZXIgd29yayBtYXkgcmVzdW1lICovCiAJY2xlYXJfYml0KFRUWV9MRElTQ19IQUxURUQs
ICZ0dHktPmZsYWdzKTsKQEAgLTE3NDAsMTAgKzE3MzcsNiBAQCBzdGF0aWMgaW50IG5fdHR5X29w
ZW4oc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSkKIAl0dHlfdW50aHJvdHRsZSh0dHkpOwogCiAJcmV0
dXJuIDA7Ci1lcnJfZnJlZV9idWZzOgotCWtmcmVlKGxkYXRhLT5yZWFkX2J1Zik7Ci0Ja2ZyZWUo
bGRhdGEtPmVjaG9fYnVmKTsKLQlrZnJlZShsZGF0YSk7CiBlcnI6CiAJcmV0dXJuIC1FTk9NRU07
CiB9Ci0tIAoxLjguMy4yCgo=

--===============3141387315136746216==--

