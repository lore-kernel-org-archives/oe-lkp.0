Content-Type: multipart/mixed; boundary="===============4011167695653985595=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: [GIT PULL] SA_IMMUTABLE fixes for v5.16-rc2
Date: Fri, 19 Nov 2021 09:41:49 -0600
Message-ID: <87r1bcnoea.fsf_-_@email.froward.int.ebiederm.org>
In-Reply-To: <CAP045Ap=1U07er7Y2XO9wmiRtKLoKL4u8zek48ROU668=G9D3A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4011167695653985595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Linus,

Please pull the SA_IMMUTABLE-fixes-for-v5.16-rc2 branch from the git tree:

  git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git=
 SA_IMMUTABLE-fixes-for-v5.16-rc2

  HEAD: fcb116bc43c8c37c052530ead79872f8b2615711 signal: Replace force_fata=
l_sig with force_exit_sig when in doubt

This is just a small set of changes where debuggers were no longer able
to intercept synchronous SIGTRAP and SIGSEGV.  This is essentially the
change you suggested with all of i's dotted and the t's crossed so that
ptrace can intercept all of the cases it has been able to intercept the
past, and all of the cases that made it to exit without giving ptrace a
chance still don't give ptrace a chance.

This change[1] has been tested by both Kyle and Kees.

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

[1]: https://lkml.kernel.org/r/87h7c9qg7p.fsf_-_(a)email.froward.int.ebiede=
rm.org

Eric
--===============4011167695653985595==--

