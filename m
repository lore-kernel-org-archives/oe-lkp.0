Content-Type: multipart/mixed; boundary="===============2296832308401204394=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fsnotify] 47d9c7cc45: WARNING:at_ip_fsnotify/0x
Date: Fri, 22 Jun 2018 10:45:15 +0200
Message-ID: <20180622084515.pkokxeeaflhequwf@quack2.suse.cz>
In-Reply-To: <CAOQ4uxhrTWWa9tjiqJce_-FL=fvQJ-U4_hsnOsSFdu4=W+Phww@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2296832308401204394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 21-06-18 11:43:36, Amir Goldstein wrote:
> On Thu, Jun 21, 2018 at 10:54 AM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
> >
> > FYI, we noticed the following commit (built with gcc-7):
> >
> > commit: 47d9c7cc457adc5d6d8ca966482a51459f81e852 ("fsnotify: generalize=
 iteration of marks by object type")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git pendin=
g-fixes
> >
> > in testcase: hackbench
> > with following parameters:
> >
> >         nr_threads: 100%
> >         mode: process
> >         ipc: pipe
> >         cpufreq_governor: performance
> >
> > test-description: Hackbench is both a benchmark and a stress test for t=
he Linux kernel scheduler.
> > test-url: https://github.com/linux-test-project/ltp/blob/master/testcas=
es/kernel/sched/cfs-scheduler/hackbench.c
> >
> >
> > on test machine: 256 threads Phi with 96G memory
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> > +---------------------------------------------------------------------+=
------------+------------+
> > |                                                                     |=
 d9a6f30bb8 | 47d9c7cc45 |
> > +---------------------------------------------------------------------+=
------------+------------+
> > | boot_successes                                                      |=
 2          | 4          |
> > | boot_failures                                                       |=
 24         | 21         |
> > | WARNING:stack_recursion                                             |=
 23         | 21         |
> > | WARNING:at#for_ip_swapgs_restore_regs_and_return_to_usermode/0x     |=
 5          | 3          |
> > | WARNING:stack_going_in_the_wrong_direction?ip=3D__schedule/0x        =
 | 17         | 18         |
> > | WARNING:stack_going_in_the_wrong_direction?ip=3Dfinish_task_switch/0x=
 | 2          | 1          |
> > | WARNING:at#for_ip_reschedule_interrupt/0x                           |=
 3          | 5          |
> > | WARNING:at#for_ip_interrupt_entry/0x                                |=
 7          | 5          |
> > | WARNING:stack_going_in_the_wrong_direction?ip=3Dtouch_atime/0x       =
 | 3          | 1          |
> > | WARNING:at_ip__mutex_lock/0x                                        |=
 2          | 2          |
> > | WARNING:at#for_ip_apic_timer_interrupt/0x                           |=
 1          |            |
> > | WARNING:at#for_ip_retint_user/0x                                    |=
 1          |            |
> > | WARNING:at#for_ip_call_function_single_interrupt/0x                 |=
 0          | 1          |
> > | WARNING:at_ip_fsnotify/0x                                           |=
 0          | 7          |
> > | WARNING:at#for_ip_error_entry/0x                                    |=
 0          | 1          |
> > | WARNING:at#for_ip_ret_from_intr/0x                                  |=
 0          | 1          |
> > +---------------------------------------------------------------------+=
------------+------------+
> >
> >
> >
> > [  560.857516] WARNING: missing regs for base reg R10 at ip fsnotify+0x=
14/0x37a
> >
> =

> Wow. I have no idea what that means.
> Why is this specific warning pointed out in the report and not all
> other warnings
> that show up in the table above?
> How reliable is this bisection?
> =

> Frankly, this specific commit is so technically boring - it doesn't add a=
ny
> new functions nor change existing function signatures, so I find it
> hard to believe
> it has anything to do with the warning, but I don't know which conditions
> may trigger the warning in the first place.

Agreed. I don't see anything in your patch that could upset unwinding. Just
in case added the ORC unwinder author to CC if he has some idea.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============2296832308401204394==--

