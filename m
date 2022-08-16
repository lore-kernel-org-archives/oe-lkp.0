Content-Type: multipart/mixed; boundary="===============1354089088128091057=="
MIME-Version: 1.0
From: Sean Christopherson <seanjc@google.com>
To: lkp@lists.01.org
Subject: Re: [KVM] e923b0537d: kernel-selftests.kvm.rseq_test.fail
Date: Tue, 16 Aug 2022 22:23:01 +0000
Message-ID: <YvwYxeE4vc/Srbil@google.com>
In-Reply-To: <9bfeae26-b4b1-eedb-6cbd-b4f9f1e1cc55@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1354089088128091057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022, Gavin Shan wrote:
> Hi Sean,
> =

> On 8/16/22 3:02 PM, Gavin Shan wrote:
> > On 8/16/22 7:42 AM, Sean Christopherson wrote:
> > > On Mon, Aug 15, 2022, kernel test robot wrote:
> > > > commit: e923b0537d28e15c9d31ce8b38f810b325816903 ("KVM: selftests: =
Fix target thread to be migrated in rseq_test")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
> > > =

> > > ...
> > > =

> > > > # selftests: kvm: rseq_test
> > > > # =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> > > > #=C2=A0=C2=A0 rseq_test.c:278: i > (NR_TASK_MIGRATIONS / 2)
> > > > #=C2=A0=C2=A0 pid=3D49599 tid=3D49599 errno=3D4 - Interrupted syste=
m call
> > > > #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0 0x0000000000402=
65d: main at rseq_test.c:278
> > > > #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 0x00007fe44eed0=
7fc: ?? ??:0
> > > > #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0=C2=A0 0x0000000000402=
6d9: _start at ??:?
> > > > #=C2=A0=C2=A0 Only performed 23174 KVM_RUNs, task stalled too much?
> > > > #
> > > > not ok 56 selftests: kvm: rseq_test # exit=3D254
> > > =

> > > ...
> > > =

> > > > # Automatically generated file; DO NOT EDIT.
> > > > # Linux/x86_64 5.19.0-rc6 Kernel Configuration
> > > > #
> > > > CONFIG_CC_VERSION_TEXT=3D"gcc-11 (Debian 11.3.0-3) 11.3.0"
> > > > CONFIG_CC_IS_GCC=3Dy
> > > > CONFIG_GCC_VERSION=3D110300
> > > > CONFIG_CLANG_VERSION=3D0
> > > > CONFIG_AS_IS_GNU=3Dy
> > > > CONFIG_AS_VERSION=3D23800
> > > > CONFIG_LD_IS_BFD=3Dy
> > > > CONFIG_LD_VERSION=3D23800
> > > > CONFIG_LLD_VERSION=3D0
> > > =

> > > Assuming 23800 =3D=3D 2.38, this is a known issue.
> > > =

> > > https://lore.kernel.org/all/20220810104114.6838-1-gshan(a)redhat.com
> > > =

> > =

> > It's probably different story this time.

Doh, if I had bothered to actually look at the error message...

> > The assert is triggered because of the following instructions. I would
> > guess the reason is vcpu thread has been running on CPU where we has hi=
gh
> > CPU load. In this case, the vcpu thread can't be run in time. More
> > specific, the vcpu thread can't be run in the 1 - 10us time window, whi=
ch
> > is specified by the migration worker (thread).
> > =

> >  =C2=A0=C2=A0=C2=A0 TEST_ASSERT(i > (NR_TASK_MIGRATIONS / 2),
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "Only performed %d KVM_RUNs, task stalled too much?\n=
", i);
> > =

> > I think we need to improve the handshake mechanism between the vcpu thr=
ead
> > and migration worker. In current implementation, the handshake is done =
through
> > the atomic counter. The mechanism is simple enough, but vcpu thread can=
 miss
> > the aforementioned time window. Another issue is the test case much mor=
e time
> > than expected to finish.

There's not really an expected time to finish.  The original purpose of the=
 test
is to trigger a kernel race condition, so it's a balance between letting th=
e test
run long enough to have some confidence that the kernel is bug free, and no=
t running
so long that it wastes time.

> > Sean, if you think it's reasonable, I can figure out something to do:
> > =

> > - Reuse the atomic counter for a full synchronization between these two
> >  =C2=A0 threads. Something like below:
> > =

> >  =C2=A0 #define RSEQ_TEST_STATE_RUN_VCPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 // vcpu_run()
> >  =C2=A0 #define RSEQ_TEST_STATE_MIGRATE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 // sched_setaffinity()
> >  =C2=A0 #define RSEQ_TEST_STATE_CHECK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0 // Check rseq.cpu_id and ge=
t_cpu()
> > =

> >  =C2=A0 The atomic counter is reset to RSEQ_TEST_STATE_RUN_VCPU after R=
SEQ_TEST_STATE_RUN_VCPU

Again, because one of the primary goals is to ensure the kernel is race fre=
e, the
test should avoid full synchronization.

> > =

> > - Reduce NR_TASK_MIGRATIONS from 100000 to num_of_online_cpus(). With t=
his,
> >  =C2=A0 less time is needed to finish the test case.
> > =

> =

> I'm able to recreate the issue on my local arm64 system.
> =

> - From the source code, the iteration count is changed from 100000 to 1000
> - Only CPU#0 and CPU#1 are exposed in calc_min_max_cpu, meaning other CPUs
>   are cleared from @possible_mask
> - Run some CPU bound task on CPU#0 and CPU#1
>   # while true; do taskset -c 0 ./a; done
>   # while true; do taskset -c 1 ./a; done
> - Run 'rseq_test' and hit the issue

At this point, this isn't a test bug.  The test is right to complain that i=
t didn't
provide the coverage it's supposed to provide.

If the bot failure is a one-off, my preference is to leave things as-is for=
 now.
If the failure is an ongoing issue, then we probably need to understand why=
 the
bot is failing.
--===============1354089088128091057==--

