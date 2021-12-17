Content-Type: multipart/mixed; boundary="===============6524383994340625523=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [kthread] 40966e316f: WARNING:at_kernel/sched/core.c:#sched_init
Date: Fri, 17 Dec 2021 11:01:41 -0600
Message-ID: <878rwjf9my.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <20211216102956.GC10708@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6524383994340625523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 40966e316f86b8cfd83abd31ccb4df729309d3e7 ("kthread: Ensure struct=
 kthread is present for all kthreads")
> https://git.kernel.org/cgit/linux/kernel/git/ebiederm/user-namespace.git =
signal-for-v5.17
>
> in testcase: trinity
> version: trinity-x86_64-608712d8-1_20211207
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):


Ok. That is very weird.  I will dig into it.

Silly question is there anything in this testing to cause memory
allocations to fail early in boot?

Eric
--===============6524383994340625523==--

