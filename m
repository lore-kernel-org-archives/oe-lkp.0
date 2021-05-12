Content-Type: multipart/mixed; boundary="===============4768414488636949131=="
MIME-Version: 1.0
From: Jaegeuk Kim <jaegeuk@google.com>
To: lkp@lists.01.org
Subject: Re: [f2fs_io] 1531853eb7: make fail
Date: Wed, 12 May 2021 09:08:08 -0700
Message-ID: <CAK6vGd8ZshcKH+gjgWJY2yT34n25JKNKDPcEmj5royBkGhrbSw@mail.gmail.com>
In-Reply-To: <a4574a56ef3d46a3bcc5fdff40013a6b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4768414488636949131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I fixed this by this patch. Will update master soon.
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/comm=
it/?h=3Ddev&id=3D870915f282d4666d1c4c37fc6e468682eb33d0ab

Thanks,

On Wed, May 12, 2021 at 12:30 AM Si, Beibei <beibei.si@intel.com> wrote:

> Hi Robin,
>
>
>
> We noticed a compiling issue due to commit 1531853eb7, and its parent
> 3bfcca8c81 has no such compiling issue, could you pls have a check?
>
>
>
> Commit: 1531853eb72b335c488171dd0803e9c417de7e1f (=E2=80=9Cf2fs_io: Add g=
et file
> name encryption mode=E2=80=9D)
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
> master
>
>
>
> We followed steps in /f2fs-tools/README and the output was shown as below.
>
>
>
> /f2fs-tools# ./autogen.sh
>
> /f2fs-tools# ./configure
>
> /f2fs-tools# make
>
> ...
>
> f2fs_io.h:123:28: error: field 'v1' has incomplete type
>
>    struct fscrypt_policy_v1 v1;
>
>                             ^~
>
> f2fs_io.c: In function 'do_get_filename_encrypt_mode':
>
> f2fs_io.c:1141:7: error: 'FSCRYPT_POLICY_V1' undeclared (first use in this
> function); did you mean 'FSCRYPT_POLICY_V2'?
>
>   case FSCRYPT_POLICY_V1:
>
>        ^~~~~~~~~~~~~~~~~
>
>        FSCRYPT_POLICY_V2
>
> f2fs_io.c:1141:7: note: each undeclared identifier is reported only once
> for each function it appears in
>
> make[3]: *** [Makefile:419: f2fs_io.o] Error 1
>
> make[3]: Leaving directory '/tmp/lkp/xfstests/src/f2fs-tools/tools/f2fs_i=
o'
>
> make[2]: *** [Makefile:609: all-recursive] Error 1
>
> make[2]: Leaving directory '/tmp/lkp/xfstests/src/f2fs-tools/tools'
>
> make[1]: *** [Makefile:421: all-recursive] Error 1
>
> make[1]: Leaving directory '/tmp/lkp/xfstests/src/f2fs-tools'
>
> make: *** [Makefile:353: all] Error 2
>
>
>
>
>
> Thanks,
>
> Carel
>
>
>
>
>
>
>


-- =

Jaegeuk Kim

--===============4768414488636949131==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5JIGZpeGVkIHRoaXMgYnkgdGhp
cyBwYXRjaC4gV2lsbCB1cGRhdGUgbWFzdGVyIHNvb24uPC9kaXY+PGRpdj48YSBocmVmPSJodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMt
dG9vbHMuZ2l0L2NvbW1pdC8/aD1kZXYmYW1wO2lkPTg3MDkxNWYyODJkNDY2NmQxYzRjMzdmYzZl
NDY4NjgyZWIzM2QwYWIiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2phZWdldWsvZjJmcy10b29scy5naXQvY29tbWl0Lz9oPWRldiZhbXA7aWQ9ODcwOTE1
ZjI4MmQ0NjY2ZDFjNGMzN2ZjNmU0Njg2ODJlYjMzZDBhYjwvYT48YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBNYXkgMTIsIDIwMjEg
YXQgMTI6MzAgQU0gU2ksIEJlaWJlaSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmJlaWJlaS5zaUBpbnRl
bC5jb20iPmJlaWJlaS5zaUBpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4
O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgi
PgoKCgoKCjxkaXYgbGFuZz0iRU4tVVMiIHN0eWxlPSJvdmVyZmxvdy13cmFwOiBicmVhay13b3Jk
OyI+CjxkaXYgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4NzA1NjJXb3JkU2VjdGlvbjEi
Pgo8cCBjbGFzcz0iZ21haWwtbV8tODkzNzE0OTcwMzE4NDg3MDU2Mk1zb1BsYWluVGV4dCI+SGkg
Um9iaW4sPHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXy04OTM3MTQ5NzAzMTg0
ODcwNTYyTXNvUGxhaW5UZXh0Ij48dT48L3U+wqA8dT48L3U+PC9wPgo8cCBjbGFzcz0iZ21haWwt
bV8tODkzNzE0OTcwMzE4NDg3MDU2Mk1zb1BsYWluVGV4dCI+V2Ugbm90aWNlZCBhIGNvbXBpbGlu
ZyBpc3N1ZSBkdWUgdG8gY29tbWl0IDE1MzE4NTNlYjcsIGFuZCBpdHMgcGFyZW50IDNiZmNjYThj
ODEgaGFzIG5vIHN1Y2ggY29tcGlsaW5nIGlzc3VlLCBjb3VsZCB5b3UgcGxzIGhhdmUgYSBjaGVj
az88dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4NzA1
NjJNc29QbGFpblRleHQiPjx1PjwvdT7CoDx1PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXy04
OTM3MTQ5NzAzMTg0ODcwNTYyTXNvUGxhaW5UZXh0Ij5Db21taXQ6IDE1MzE4NTNlYjcyYjMzNWM0
ODgxNzFkZDA4MDNlOWM0MTdkZTdlMWYgKOKAnGYyZnNfaW86IEFkZCBnZXQgZmlsZSBuYW1lIGVu
Y3J5cHRpb24gbW9kZeKAnSk8dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PGEgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
amFlZ2V1ay9mMmZzLXRvb2xzLmdpdCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy10b29scy5naXQ8L2E+
IG1hc3Rlcjx1PjwvdT48dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+wqA8
dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5XZSBmb2xsb3dlZCBzdGVwcyBpbiAvZjJm
cy10b29scy9SRUFETUUgYW5kIHRoZSBvdXRwdXQgd2FzIHNob3duIGFzIGJlbG93Ljx1PjwvdT48
dT48L3U+PC9wPgo8cCBjbGFzcz0iZ21haWwtbV8tODkzNzE0OTcwMzE4NDg3MDU2Mk1zb1BsYWlu
VGV4dCI+PHU+PC91PsKgPHU+PC91PjwvcD4KPHAgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3MDMx
ODQ4NzA1NjJNc29QbGFpblRleHQiPi9mMmZzLXRvb2xzIyAuL2F1dG9nZW4uc2ggPHU+PC91Pjx1
PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXy04OTM3MTQ5NzAzMTg0ODcwNTYyTXNvUGxhaW5U
ZXh0Ij4vZjJmcy10b29scyMgLi9jb25maWd1cmU8dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9
ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4NzA1NjJNc29QbGFpblRleHQiPi9mMmZzLXRvb2xzIyBt
YWtlPHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXy04OTM3MTQ5NzAzMTg0ODcw
NTYyTXNvUGxhaW5UZXh0Ij4uLi48dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9ImdtYWlsLW1f
LTg5MzcxNDk3MDMxODQ4NzA1NjJNc29QbGFpblRleHQiPmYyZnNfaW8uaDoxMjM6Mjg6IGVycm9y
OiBmaWVsZCAmIzM5O3YxJiMzOTsgaGFzIGluY29tcGxldGUgdHlwZTx1PjwvdT48dT48L3U+PC9w
Pgo8cCBjbGFzcz0iZ21haWwtbV8tODkzNzE0OTcwMzE4NDg3MDU2Mk1zb1BsYWluVGV4dCI+wqDC
oCBzdHJ1Y3QgZnNjcnlwdF9wb2xpY3lfdjEgdjE7PHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNz
PSJnbWFpbC1tXy04OTM3MTQ5NzAzMTg0ODcwNTYyTXNvUGxhaW5UZXh0Ij7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn48dT48L3U+PHU+PC91
PjwvcD4KPHAgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4NzA1NjJNc29QbGFpblRleHQi
PmYyZnNfaW8uYzogSW4gZnVuY3Rpb24gJiMzOTtkb19nZXRfZmlsZW5hbWVfZW5jcnlwdF9tb2Rl
JiMzOTs6PHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXy04OTM3MTQ5NzAzMTg0
ODcwNTYyTXNvUGxhaW5UZXh0Ij5mMmZzX2lvLmM6MTE0MTo3OiBlcnJvcjogJiMzOTtGU0NSWVBU
X1BPTElDWV9WMSYjMzk7IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsg
ZGlkIHlvdSBtZWFuICYjMzk7RlNDUllQVF9QT0xJQ1lfVjImIzM5Oz88dT48L3U+PHU+PC91Pjwv
cD4KPHAgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4NzA1NjJNc29QbGFpblRleHQiPsKg
IGNhc2UgRlNDUllQVF9QT0xJQ1lfVjE6PHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFp
bC1tXy04OTM3MTQ5NzAzMTg0ODcwNTYyTXNvUGxhaW5UZXh0Ij7CoMKgwqDCoMKgwqAgXn5+fn5+
fn5+fn5+fn5+fn48dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3
MDMxODQ4NzA1NjJNc29QbGFpblRleHQiPsKgwqDCoMKgwqDCoCBGU0NSWVBUX1BPTElDWV9WMjx1
PjwvdT48dT48L3U+PC9wPgo8cCBjbGFzcz0iZ21haWwtbV8tODkzNzE0OTcwMzE4NDg3MDU2Mk1z
b1BsYWluVGV4dCI+ZjJmc19pby5jOjExNDE6Nzogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50
aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMg
aW48dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4NzA1
NjJNc29QbGFpblRleHQiPm1ha2VbM106ICoqKiBbTWFrZWZpbGU6NDE5OiBmMmZzX2lvLm9dIEVy
cm9yIDE8dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4
NzA1NjJNc29QbGFpblRleHQiPm1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICYjMzk7L3RtcC9s
a3AveGZzdGVzdHMvc3JjL2YyZnMtdG9vbHMvdG9vbHMvZjJmc19pbyYjMzk7PHU+PC91Pjx1Pjwv
dT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXy04OTM3MTQ5NzAzMTg0ODcwNTYyTXNvUGxhaW5UZXh0
Ij5tYWtlWzJdOiAqKiogW01ha2VmaWxlOjYwOTogYWxsLXJlY3Vyc2l2ZV0gRXJyb3IgMTx1Pjwv
dT48dT48L3U+PC9wPgo8cCBjbGFzcz0iZ21haWwtbV8tODkzNzE0OTcwMzE4NDg3MDU2Mk1zb1Bs
YWluVGV4dCI+bWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJiMzOTsvdG1wL2xrcC94ZnN0ZXN0
cy9zcmMvZjJmcy10b29scy90b29scyYjMzk7PHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJn
bWFpbC1tXy04OTM3MTQ5NzAzMTg0ODcwNTYyTXNvUGxhaW5UZXh0Ij5tYWtlWzFdOiAqKiogW01h
a2VmaWxlOjQyMTogYWxsLXJlY3Vyc2l2ZV0gRXJyb3IgMTx1PjwvdT48dT48L3U+PC9wPgo8cCBj
bGFzcz0iZ21haWwtbV8tODkzNzE0OTcwMzE4NDg3MDU2Mk1zb1BsYWluVGV4dCI+bWFrZVsxXTog
TGVhdmluZyBkaXJlY3RvcnkgJiMzOTsvdG1wL2xrcC94ZnN0ZXN0cy9zcmMvZjJmcy10b29scyYj
Mzk7PHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXy04OTM3MTQ5NzAzMTg0ODcw
NTYyTXNvUGxhaW5UZXh0Ij5tYWtlOiAqKiogW01ha2VmaWxlOjM1MzogYWxsXSBFcnJvciAyPHU+
PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJnbWFpbC1tXy04OTM3MTQ5NzAzMTg0ODcwNTYyTXNv
UGxhaW5UZXh0Ij48dT48L3U+wqA8dT48L3U+PC9wPgo8cCBjbGFzcz0iZ21haWwtbV8tODkzNzE0
OTcwMzE4NDg3MDU2Mk1zb1BsYWluVGV4dCI+PHU+PC91PsKgPHU+PC91PjwvcD4KPHAgY2xhc3M9
ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4NzA1NjJNc29QbGFpblRleHQiPlRoYW5rcyw8dT48L3U+
PHU+PC91PjwvcD4KPHAgY2xhc3M9ImdtYWlsLW1fLTg5MzcxNDk3MDMxODQ4NzA1NjJNc29QbGFp
blRleHQiPkNhcmVsPHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1Pjwv
dT7CoDx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1PjwvdT48L3A+
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1PjwvdT48L3A+CjwvZGl2Pgo8L2Rpdj4K
CjwvYmxvY2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+LS0gPGJy
PjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxk
aXY+PGRpdiBkaXI9Imx0ciI+SmFlZ2V1ayBLaW08L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============4768414488636949131==--

