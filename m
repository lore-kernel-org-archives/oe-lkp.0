Content-Type: multipart/mixed; boundary="===============5634974108805101153=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
To: lkp@lists.01.org
Subject: [PATCH] x86/ftrace: Exclude functions in head64.c from function-tracing
Date: Tue, 27 Jun 2017 14:59:48 +0300
Message-ID: <20170627115948.17938-1-kirill.shutemov@linux.intel.com>
In-Reply-To: <20170627033414.chxwdvlvc2smnm3s@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5634974108805101153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We've moved most logic of early boot up from startup_64() written in
assembly to __startup_64() written in C.

Fengguang reported breakage due to the change. It was tracked down to
CONFIG_FUNCTION_TRACER being enabled.

Looks like function-tracing of the new code is harmful.

Let's not comple the code with -pg compiler option.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
---
 arch/x86/kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 4b994232cb57..0db512092f37 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -18,6 +18,7 @@ CFLAGS_REMOVE_pvclock.o =3D -pg
 CFLAGS_REMOVE_kvmclock.o =3D -pg
 CFLAGS_REMOVE_ftrace.o =3D -pg
 CFLAGS_REMOVE_early_printk.o =3D -pg
+CFLAGS_REMOVE_head64.o =3D -pg
 endif
 =

 KASAN_SANITIZE_head$(BITS).o				:=3D n
-- =

2.11.0


--===============5634974108805101153==--

