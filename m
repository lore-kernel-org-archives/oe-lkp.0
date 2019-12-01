Content-Type: multipart/mixed; boundary="===============0792627446497071460=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: 942437c97f ("y2038: allow disabling time32 system calls"): BUG: kernel hang in test stage
Date: Sun, 01 Dec 2019 17:44:28 +0100
Message-ID: <CAK8P3a2rFb6RykcL3=4djkPgza=yi9hZE8w-Bu4-zUn5W9Pgvg@mail.gmail.com>
In-Reply-To: <20191201151049.GH18573@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0792627446497071460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 1, 2019 at 4:11 PM kernel test robot <lkp@intel.com> wrote:
>
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> commit 942437c97fd9ff23a17c13118f50bd0490f6868c
> Author:     Arnd Bergmann <arnd@arndb.de>
> AuthorDate: Mon Jul 15 11:46:10 2019 +0200
> Commit:     Arnd Bergmann <arnd@arndb.de>
> CommitDate: Fri Nov 15 14:38:30 2019 +0100
>
>     y2038: allow disabling time32 system calls
>
>     At the moment, the compilation of the old time32 system calls depends
>     purely on the architecture. As systems with new libc based on 64-bit
>     time_t are getting deployed, even architectures that previously suppo=
rted
>     these (notably x86-32 and arm32 but also many others) no longer depen=
d on
>     them, and removing them from a kernel image results in a smaller kern=
el
>     binary, the same way we can leave out many other optional system call=
s.
>
>     More importantly, on an embedded system that needs to keep working
>     beyond year 2038, any user space program calling these system calls
>     is likely a bug, so removing them from the kernel image does provide
>     an extra debugging help for finding broken applications.
>
>     I've gone back and forth on hiding this option unless CONFIG_EXPERT
>     is set. This version leaves it visible based on the logic that
>     eventually it will be turned off indefinitely.
>
>     Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> bd40a17576  y2038: itimer: change implementation to timespec64
> 942437c97f  y2038: allow disabling time32 system calls
> +-----------------------------------------------------------+------------=
+------------+
> |                                                           | bd40a17576 =
| 942437c97f |
> +-----------------------------------------------------------+------------=
+------------+
> | boot_successes                                            | 38         =
| 0          |
> | boot_failures                                             | 0          =
| 19         |
> | BUG:kernel_hang_in_test_stage                             | 0          =
| 15         |
> | Assertion_failed                                          | 0          =
| 4          |
> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 0        =
  | 4          |
> +-----------------------------------------------------------+------------=
+------------+
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
>
> Press the [1], [2], [3] or [4] key and hit [enter] to select the debug le=
vel
> [    3.739930] rm (184) used greatest stack depth: 6556 bytes left
> [    5.754828] mount_root: mounting /dev/root
> [    5.762906] urandom-seed: Seed file not found (/etc/urandom.seed)
> [    5.767017] sh (172) used greatest stack depth: 6308 bytes left
> BUG: kernel hang in test stage

Thanks a lot for the report. As far as I can tell from the attached files, =
this
is a randconfig test on a 32-bit platform with
CONFIG_COMPAT_32BIT_TIME disabled, so this is expected
to fail because the existing user space application actually requires
the old system calls until it has been recompiled against a new
C library using 64-bit time_t.

We could probably make the failure more explicit and print an error
message for these particular syscalls when they are disabled.
Alternatively the configuration step would need to be changed that
the 0day bot is unable to run into this case.

      Arnd
--===============0792627446497071460==--

