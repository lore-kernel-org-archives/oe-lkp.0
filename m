Content-Type: multipart/mixed; boundary="===============0247560354226560473=="
MIME-Version: 1.0
From: Dmitry V. Levin <ldv@altlinux.org>
To: lkp@lists.01.org
Subject: [PATCH] selftests/seccomp/seccomp_bpf: update for PTRACE_GET_SYSCALL_INFO
Date: Mon, 08 Jul 2019 21:29:04 +0300
Message-ID: <20190708182904.GA12332@altlinux.org>
In-Reply-To: <20190708090627.GO17490@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0247560354226560473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The syscall entry/exit is now exposed via PTRACE_GETEVENTMSG,
update the test accordingly.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/=
selftests/seccomp/seccomp_bpf.c
index dc66fe852768..6ef7f16c4cf5 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1775,13 +1775,18 @@ void tracer_ptrace(struct __test_metadata *_metadat=
a, pid_t tracee,
 	unsigned long msg;
 	static bool entry;
 =

-	/* Make sure we got an empty message. */
+	/*
+	 * The traditional way to tell PTRACE_SYSCALL entry/exit
+	 * is by counting.
+	 */
+	entry =3D !entry;
+
+	/* Make sure we got an appropriate message. */
 	ret =3D ptrace(PTRACE_GETEVENTMSG, tracee, NULL, &msg);
 	EXPECT_EQ(0, ret);
-	EXPECT_EQ(0, msg);
+	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
+			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
 =

-	/* The only way to tell PTRACE_SYSCALL entry/exit is by counting. */
-	entry =3D !entry;
 	if (!entry)
 		return;
 =

-- =

ldv

--===============0247560354226560473==--

