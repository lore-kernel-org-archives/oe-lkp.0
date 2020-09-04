Content-Type: multipart/mixed; boundary="===============8779398542049718382=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: [PATCH] syscalls/ptrace10: Add new regression test
Date: Fri, 04 Sep 2020 20:00:30 +0200
Message-ID: <20200904180030.14838-1-chrubis@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8779398542049718382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

New regression test for a kernel commit:

commit bd14406b78e6daa1ea3c1673bda1ffc9efdeead0
Author: Jiri Olsa <jolsa@kernel.org>
Date:   Mon Aug 27 11:12:25 2018 +0200

    perf/hw_breakpoint: Modify breakpoint even if the new attr has disabled=
 set

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Andy Lutomirski <luto@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Alexandre Chartre <alexandre.chartre@oracle.com>
---

This is a follow up for the ptrace08 fixes.

 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/ptrace/.gitignore |  1 +
 testcases/kernel/syscalls/ptrace/ptrace10.c | 86 +++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace10.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 398145f65..163471bcd 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -993,6 +993,7 @@ ptrace05 ptrace05
 ptrace07 ptrace07
 ptrace08 ptrace08
 ptrace09 ptrace09
+ptrace10 ptrace10
 =

 pwrite01 pwrite01
 pwrite02 pwrite02
diff --git a/testcases/kernel/syscalls/ptrace/.gitignore b/testcases/kernel=
/syscalls/ptrace/.gitignore
index 7639e1a9f..7ee3b3c47 100644
--- a/testcases/kernel/syscalls/ptrace/.gitignore
+++ b/testcases/kernel/syscalls/ptrace/.gitignore
@@ -5,3 +5,4 @@
 /ptrace07
 /ptrace08
 /ptrace09
+/ptrace10
diff --git a/testcases/kernel/syscalls/ptrace/ptrace10.c b/testcases/kernel=
/syscalls/ptrace/ptrace10.c
new file mode 100644
index 000000000..b5d6b9f8f
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace10.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Cyril Hrubis <chrbis@suse.cz>
+ *
+ * After fix for CVE-2018-1000199 (see ptrace08.c) subsequent calls to POK=
EUSER
+ * for x86 debug registers were ignored silently.
+ *
+ * This is a regression test for commit:
+ *
+ * commit bd14406b78e6daa1ea3c1673bda1ffc9efdeead0
+ * Author: Jiri Olsa <jolsa@kernel.org>
+ * Date:   Mon Aug 27 11:12:25 2018 +0200
+ *
+ *     perf/hw_breakpoint: Modify breakpoint even if the new attr has disa=
bled set
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <stddef.h>
+#include <sys/ptrace.h>
+#include <sys/user.h>
+#include <signal.h>
+#include "tst_test.h"
+
+#if defined(__i386__) || defined(__x86_64__)
+
+static pid_t child_pid;
+
+static void child_main(void)
+{
+	raise(SIGSTOP);
+	exit(0);
+}
+
+static void run(void)
+{
+	int status;
+	unsigned long addr;
+
+	child_pid =3D SAFE_FORK();
+
+	if (!child_pid)
+		child_main();
+
+	if (SAFE_WAITPID(child_pid, &status, WUNTRACED) !=3D child_pid)
+		tst_brk(TBROK, "Received event from unexpected PID");
+
+	SAFE_PTRACE(PTRACE_ATTACH, child_pid, NULL, NULL);
+	SAFE_PTRACE(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[0]), (void *)1);
+	SAFE_PTRACE(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[0]), (void *)2);
+
+	addr =3D ptrace(PTRACE_PEEKUSER, child_pid,
+	              (void*)offsetof(struct user, u_debugreg[0]), NULL);
+
+	if (addr =3D=3D 2)
+		tst_res(TPASS, "The rd0 was set on second PTRACE_POKEUSR");
+	else
+		tst_res(TFAIL, "The rd0 wasn't set on second PTRACE_POKEUSER");
+
+	SAFE_PTRACE(PTRACE_DETACH, child_pid, NULL, NULL);
+	SAFE_KILL(child_pid, SIGCONT);
+	child_pid =3D 0;
+	tst_reap_children();
+}
+
+static void cleanup(void)
+{
+	/* Main process terminated by tst_brk() with child still paused */
+	if (child_pid)
+		SAFE_KILL(child_pid, SIGKILL);
+}
+
+static struct tst_test test =3D {
+	.test_all =3D run,
+	.cleanup =3D cleanup,
+	.forks_child =3D 1,
+	.tags =3D (const struct tst_tag[]) {
+		{"linux-git", "bd14406b78e6"},
+		{}
+	}
+};
+#else
+TST_TEST_TCONF("This test is only supported on x86 systems");
+#endif
-- =

2.26.2

--===============8779398542049718382==--

