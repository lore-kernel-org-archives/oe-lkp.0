Content-Type: multipart/mixed; boundary="===============1799049766847052948=="
MIME-Version: 1.0
From: Kyle Huey <me@kylehuey.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/2] SA_IMMUTABLE fixes
Date: Thu, 18 Nov 2021 17:12:23 -0800
Message-ID: <CAP045Ap=1U07er7Y2XO9wmiRtKLoKL4u8zek48ROU668=G9D3A@mail.gmail.com>
In-Reply-To: <87h7c9qg7p.fsf_-_@email.froward.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1799049766847052948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 1:58 PM Eric W. Biederman <ebiederm@xmission.com>=
 wrote:
>
>
> SA_IMMUTABLE fixed issues with force_sig_seccomp and the introduction
> for force_sig_fatal where the exit previously could not be interrupted
> but now it can.  Unfortunately it added that behavior to all force_sig
> functions under the right conditions which debuggers usage of SIG_TRAP
> and debuggers handling of SIGSEGV.
>
> Solve that by limiting SA_IMMUTABLE to just the cases that historically
> debuggers have not been able to intercept.
>
> The first patch changes force_sig_info_to_task to take a flag
> that requests which behavior is desired.
>
> The second patch adds force_exit_sig which replaces force_fatal_sig
> in the cases where historically userspace would only find out about
> the ``signal'' after the process has exited.
>
> The first one with the hunk changing force_fatal_sig removed should be
> suitable for backporting to v5.15. v5.15 does not implement
> force_fatal_sig.
>
> This should be enough to fix the regressions.
>
> Kyle if you can double check me that I have properly fixed these issues
> that would be appreciated.
>
> Any other review or suggestions to improve the names would be
> appreciated.  I think I have named things reasonably well but I am very
> close to the code so it is easy for me to miss things.
>
> Eric W. Biederman (2):
>       signal: Don't always set SA_IMMUTABLE for forced signals
>       signal: Replace force_fatal_sig with force_exit_sig when in doubt
>
>  arch/m68k/kernel/traps.c              |  2 +-
>  arch/powerpc/kernel/signal_32.c       |  2 +-
>  arch/powerpc/kernel/signal_64.c       |  4 ++--
>  arch/s390/kernel/traps.c              |  2 +-
>  arch/sparc/kernel/signal_32.c         |  4 ++--
>  arch/sparc/kernel/windows.c           |  2 +-
>  arch/x86/entry/vsyscall/vsyscall_64.c |  2 +-
>  arch/x86/kernel/vm86_32.c             |  2 +-
>  include/linux/sched/signal.h          |  1 +
>  kernel/entry/syscall_user_dispatch.c  |  4 ++--
>  kernel/signal.c                       | 36 ++++++++++++++++++++++++++++-=
------
>  11 files changed, 42 insertions(+), 19 deletions(-)
>
> Eric

rr's test suite passes with both diffs applied

Tested-by: Kyle Huey <khuey@kylehuey.com>

- Kyle
--===============1799049766847052948==--

