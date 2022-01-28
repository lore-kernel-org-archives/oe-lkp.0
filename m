Content-Type: multipart/mixed; boundary="===============5603167561883846074=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ocfs2] c42ff46f97: sysctl_table_check_failed
Date: Fri, 28 Jan 2022 10:00:29 +0200
Message-ID: <CAHk-=wgT6wuBB=pK2bGNQbioNCdJHT8Jnvs+4oT25jX1JFyhgg@mail.gmail.com>
In-Reply-To: <20220128065310.GF8421@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5603167561883846074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 8:53 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
> commit: 46e33fd45a52bf03769906e64d8a8a1ab317777d ("ocfs2: simplify subdir=
ectory
> registration with register_sysctl()")

Well, it's apparently commit c42ff46f97c1 ("ocfs2: simplify
subdirectory registration with register_sysctl()") in mainline now.

What worries me a bit is that the commit was auto-generated, and when
reading the commit message it reads as if it wasn't supposed to cause
any semantic changes at all.

Is the cause of this that 'nm' is supposed to be a directory, and
register_sysctl() doesn't handle directories?

I don't know this code at all, should it have been simplified even
further with something (TOTALLY UNTESTED) like the attached?

                 Linus

--===============5603167561883846074==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.diff"

IGZzL29jZnMyL3N0YWNrZ2x1ZS5jIHwgMTMgKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9vY2ZzMi9z
dGFja2dsdWUuYyBiL2ZzL29jZnMyL3N0YWNrZ2x1ZS5jCmluZGV4IDczMTU1OGE2ZjI3ZC4uZGQ3
N2I3YWFhYmY1IDEwMDY0NAotLS0gYS9mcy9vY2ZzMi9zdGFja2dsdWUuYworKysgYi9mcy9vY2Zz
Mi9zdGFja2dsdWUuYwpAQCAtNjYxLDE3ICs2NjEsNiBAQCBzdGF0aWMgc3RydWN0IGN0bF90YWJs
ZSBvY2ZzMl9ubV90YWJsZVtdID0gewogCXsgfQogfTsKIAotc3RhdGljIHN0cnVjdCBjdGxfdGFi
bGUgb2NmczJfbW9kX3RhYmxlW10gPSB7Ci0JewotCQkucHJvY25hbWUJPSAibm0iLAotCQkuZGF0
YQkJPSBOVUxMLAotCQkubWF4bGVuCQk9IDAsCi0JCS5tb2RlCQk9IDA1NTUsCi0JCS5jaGlsZAkJ
PSBvY2ZzMl9ubV90YWJsZQotCX0sCi0JeyB9Ci19OwotCiBzdGF0aWMgc3RydWN0IGN0bF90YWJs
ZV9oZWFkZXIgKm9jZnMyX3RhYmxlX2hlYWRlcjsKIAogLyoKQEAgLTY4Miw3ICs2NzEsNyBAQCBz
dGF0aWMgaW50IF9faW5pdCBvY2ZzMl9zdGFja19nbHVlX2luaXQodm9pZCkKIHsKIAlzdHJjcHko
Y2x1c3Rlcl9zdGFja19uYW1lLCBPQ0ZTMl9TVEFDS19QTFVHSU5fTzJDQik7CiAKLQlvY2ZzMl90
YWJsZV9oZWFkZXIgPSByZWdpc3Rlcl9zeXNjdGwoImZzL29jZnMyIiwgb2NmczJfbW9kX3RhYmxl
KTsKKwlvY2ZzMl90YWJsZV9oZWFkZXIgPSByZWdpc3Rlcl9zeXNjdGwoImZzL29jZnMyL25tIiwg
b2NmczJfbm1fdGFibGUpOwogCWlmICghb2NmczJfdGFibGVfaGVhZGVyKSB7CiAJCXByaW50ayhL
RVJOX0VSUgogCQkgICAgICAgIm9jZnMyIHN0YWNrIGdsdWU6IHVuYWJsZSB0byByZWdpc3RlciBz
eXNjdGxcbiIpOwo=

--===============5603167561883846074==--

