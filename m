Content-Type: multipart/mixed; boundary="===============7778394224507925134=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/hotplug] 2558aacff8: will-it-scale.per_thread_ops -1.6% regression
Date: Tue, 15 Dec 2020 09:37:32 +0100
Message-ID: <20201215083732.GC3040@hirez.programming.kicks-ass.net>
In-Reply-To: <33c543f8-97c9-cb18-a2f8-a90b8a5769cc@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7778394224507925134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 01:35:46PM +0800, Xing Zhengjun wrote:
> On 12/11/2020 12:14 AM, Peter Zijlstra wrote:
> > On Thu, Dec 10, 2020 at 04:18:59PM +0800, kernel test robot wrote:
> > > FYI, we noticed a -1.6% regression of will-it-scale.per_thread_ops du=
e to commit:
> > > commit: 2558aacff8586699bcd248b406febb28b0a25de2 ("sched/hotplug: Ens=
ure only per-cpu kthreads run during hotplug")
> > =

> > Mooo, weird but whatever. Does the below help at all?
> =

> I test the patch

Thanks!

> , the regression reduced to -0.6%.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/cpufreq_gov=
ernor/ucode:
> =

> lkp-cpl-4sp1/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.=
3/gcc-9/100%/thread/sched_yield/performance/0x700001e
> =

> commit:
>   565790d28b1e33ee2f77bad5348b99f6dfc366fd
>   2558aacff8586699bcd248b406febb28b0a25de2
>   4b26139b8db627a55043183614a32b0aba799d27 (this test patch)
> =

> 565790d28b1e33ee 2558aacff8586699bcd248b406f 4b26139b8db627a55043183614a
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>  4.011e+08            -1.6%  3.945e+08            -0.6%  3.989e+08 will-i=
t-scale.144.threads
>    2785455            -1.6%    2739520            -0.6%    2769967 will-i=
t-scale.per_thread_ops
>  4.011e+08            -1.6%  3.945e+08            -0.6%  3.989e+08 will-i=
t-scale.workload

Well, that's better. But I'm rather confused now, because with this new
patch, the actual hot paths are identical, so I've no idea what is
actually causing the regression :/

The above numbers don't seem to have variance, how sure are we the
results are stable? The thing is, when I tried reproducing this locally,
I was mostly looking at noise.

> > ---
> >   kernel/sched/core.c  | 40 +++++++++++++++-------------------------
> >   kernel/sched/sched.h | 13 +++++--------
> >   2 files changed, 20 insertions(+), 33 deletions(-)

Anyway, let me queue this in sched/urgent, it's simpler code and has
less regression.
--===============7778394224507925134==--

