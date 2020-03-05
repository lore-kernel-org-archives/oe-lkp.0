Content-Type: multipart/mixed; boundary="===============0013316431524793437=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Thu, 05 Mar 2020 10:12:57 +0000
Message-ID: <20200305101257.GQ3818@techsingularity.net>
In-Reply-To: <20200305025822.GH5972@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0013316431524793437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2020 at 10:58:22AM +0800, Rong Chen wrote:
> Hi,
> =

> I tested on branch tip/sched/core, the regression is still there.
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/ucode:
>   gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-phoronix/lkp-nhm-2ep1/a=
om-av1-1.2.0/phoronix-test-suite/0x1d
> =

> commit: =

>   6d4d22468dae3d8757af9f8b81b848a76ef4409d ("sched/fair: Reorder enqueue/=
dequeue_task_fair path")
>   6499b1b2dd1b8d404a16b9fbbf1af6b9b3c1d83d ("sched/numa: Replace runnable=
_load_avg by load_avg")
>   253e2b69ef8fda4d9345ff496b12058faaeeff6b ("sched/fair: fix statistics f=
or find_idlest_group()")
> =


Are you sure? I ask because tip/sched/core does not have the
patch "sched/fair: fix statistics for find_idlest_group" in it
nor is commit 253e2b69ef8fda4d9345ff496b12058faaeeff6b part of the
tip/sched/core history. You'd need to test the full series in the current
tip/sched/core with minimally 289de3598481 ("sched/fair: Fix statistics
for find_idlest_group()") from tip/sched/urgent on top. That's still
missing two fixes but one is a build issue and the other is a missing
rcu_read_lock that is unlikely to cause corruption unless there is a
hotplug event during the test.

Also, can you tell me more about the hardware? The stats indicate it's NUMA
but it only has 16 threads which seems very low for a modern NUMA machine.

-- =

Mel Gorman
SUSE Labs
--===============0013316431524793437==--

