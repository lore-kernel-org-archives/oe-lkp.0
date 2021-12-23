Content-Type: multipart/mixed; boundary="===============7665109532418285625=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [kthread] 40966e316f: WARNING:at_kernel/sched/core.c:#sched_init
Date: Thu, 23 Dec 2021 10:48:00 +0800
Message-ID: <20211223024800.GA33629@xsang-OptiPlex-9020>
In-Reply-To: <878rwjf9my.fsf@email.froward.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7665109532418285625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Eric,

On Fri, Dec 17, 2021 at 11:01:41AM -0600, Eric W. Biederman wrote:
> kernel test robot <oliver.sang@intel.com> writes:
> =

> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 40966e316f86b8cfd83abd31ccb4df729309d3e7 ("kthread: Ensure stru=
ct kthread is present for all kthreads")
> > https://git.kernel.org/cgit/linux/kernel/git/ebiederm/user-namespace.gi=
t signal-for-v5.17
> >
> > in testcase: trinity
> > version: trinity-x86_64-608712d8-1_20211207
> > with following parameters:
> >
> > 	runtime: 300s
> >
> > test-description: Trinity is a linux system call fuzz tester.
> > test-url: http://codemonkey.org.uk/projects/trinity/
> >
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire
> > log/backtrace):
> =

> =

> Ok. That is very weird.  I will dig into it.
> =

> Silly question is there anything in this testing to cause memory
> allocations to fail early in boot?

we didn't observe it. actually test could finish for both this
commit (though with reported warning) and parent. the only diff seems
the reported warning.

cead18552660702a 40966e316f86b8cfd83abd31ccb
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :8          100%           8:8     dmesg.RIP:sched_init
           :8          100%           8:8     dmesg.WARNING:at_kernel/sched=
/core.c:#sched_init

but could you check in dmesg we attached in original report for any suspico=
us
memory issue?

or could you help check the config we used (also attached in original repor=
t)
to see if we can make some changes then to expose the possible memory issue,
in case our current config cannot capture? Thanks



> =

> Eric
--===============7665109532418285625==--

