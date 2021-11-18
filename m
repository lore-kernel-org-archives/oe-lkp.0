Content-Type: multipart/mixed; boundary="===============2643424512514506919=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: [PATCH 0/2] SA_IMMUTABLE fixes
Date: Thu, 18 Nov 2021 15:58:02 -0600
Message-ID: <87h7c9qg7p.fsf_-_@email.froward.int.ebiederm.org>
In-Reply-To: <202111171728.D85A4E2571@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============2643424512514506919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


SA_IMMUTABLE fixed issues with force_sig_seccomp and the introduction
for force_sig_fatal where the exit previously could not be interrupted
but now it can.  Unfortunately it added that behavior to all force_sig
functions under the right conditions which debuggers usage of SIG_TRAP
and debuggers handling of SIGSEGV.

Solve that by limiting SA_IMMUTABLE to just the cases that historically
debuggers have not been able to intercept.

The first patch changes force_sig_info_to_task to take a flag
that requests which behavior is desired.

The second patch adds force_exit_sig which replaces force_fatal_sig
in the cases where historically userspace would only find out about
the ``signal'' after the process has exited.

The first one with the hunk changing force_fatal_sig removed should be
suitable for backporting to v5.15. v5.15 does not implement
force_fatal_sig.

This should be enough to fix the regressions.

Kyle if you can double check me that I have properly fixed these issues
that would be appreciated.

Any other review or suggestions to improve the names would be
appreciated.  I think I have named things reasonably well but I am very
close to the code so it is easy for me to miss things.

Eric W. Biederman (2):
      signal: Don't always set SA_IMMUTABLE for forced signals
      signal: Replace force_fatal_sig with force_exit_sig when in doubt

 arch/m68k/kernel/traps.c              |  2 +-
 arch/powerpc/kernel/signal_32.c       |  2 +-
 arch/powerpc/kernel/signal_64.c       |  4 ++--
 arch/s390/kernel/traps.c              |  2 +-
 arch/sparc/kernel/signal_32.c         |  4 ++--
 arch/sparc/kernel/windows.c           |  2 +-
 arch/x86/entry/vsyscall/vsyscall_64.c |  2 +-
 arch/x86/kernel/vm86_32.c             |  2 +-
 include/linux/sched/signal.h          |  1 +
 kernel/entry/syscall_user_dispatch.c  |  4 ++--
 kernel/signal.c                       | 36 ++++++++++++++++++++++++++++---=
----
 11 files changed, 42 insertions(+), 19 deletions(-)

Eric
--===============2643424512514506919==--

