Content-Type: multipart/mixed; boundary="===============5404824383459221543=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [percpu] 28c9dada65: invoked_oom-killer:gfp_mask=0x
Date: Mon, 29 Mar 2021 11:19:07 -0700
Message-ID: <YGIaG2LecGEWvaGY@carbon.dhcp.thefacebook.com>
In-Reply-To: <20210329083715.GE3633@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5404824383459221543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 04:37:15PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 28c9dada655513462112084f5f1769ee49d6fe87 ("[PATCH rfc 3/4] percpu=
: on demand chunk depopulation")
> url: https://github.com/0day-ci/linux/commits/Roman-Gushchin/percpu-parti=
al-chunk-depopulation/20210325-030746
> base: https://git.kernel.org/cgit/linux/kernel/git/dennis/percpu.git for-=
next
> =

> in testcase: trinity
> version: trinity-i386-4d2343bd-1_20200320
> with following parameters:
> =

> 	group: group-01
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/ =

> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------------+------------+-=
-----------+
> |                                                         | 0a6ed3d793 | =
28c9dada65 |
> +---------------------------------------------------------+------------+-=
-----------+
> | boot_successes                                          | 6          | =
0          |
> | boot_failures                                           | 0          | =
6          |
> | invoked_oom-killer:gfp_mask=3D0x                          | 0          =
| 6          |
> | Mem-Info                                                | 0          | =
6          |
> | Out_of_memory_and_no_killable_processes                 | 0          | =
6          |
> | Kernel_panic-not_syncing:System_is_deadlocked_on_memory | 0          | =
6          |
> +---------------------------------------------------------+------------+-=
-----------+

Found and fixed the problem. V2 will include the fix.

Thanks!
--===============5404824383459221543==--

