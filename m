Content-Type: multipart/mixed; boundary="===============5381151053679842290=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 2/3] mm: page_counter: rearrange struct page_counter fields
Date: Wed, 24 Aug 2022 21:41:42 -0700
Message-ID: <CALvZod6+Y1yvp8evMLTeEwKnQyoXJmzjO7xLN9w=EPcOUH6BHQ@mail.gmail.com>
In-Reply-To: <20220824173330.2a15bcda24d2c3c248bc43c7@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5381151053679842290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 5:33 PM Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> On Thu, 25 Aug 2022 00:05:05 +0000 Shakeel Butt <shakeelb@google.com> w=
rote:
>
> > With memcg v2 enabled, memcg->memory.usage is a very hot member for
> > the workloads doing memcg charging on multiple CPUs concurrently.
> > Particularly the network intensive workloads. In addition, there is a
> > false cache sharing between memory.usage and memory.high on the charge
> > path. This patch moves the usage into a separate cacheline and move all
> > the read most fields into separate cacheline.
> >
> > To evaluate the impact of this optimization, on a 72 CPUs machine, we
> > ran the following workload in a three level of cgroup hierarchy.
> >
> >  $ netserver -6
> >  # 36 instances of netperf with following params
> >  $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
> >
> > Results (average throughput of netperf):
> > Without (6.0-rc1)     10482.7 Mbps
> > With patch            12413.7 Mbps (18.4% improvement)
> >
> > With the patch, the throughput improved by 18.4%.
> >
> > One side-effect of this patch is the increase in the size of struct
> > mem_cgroup. For example with this patch on 64 bit build, the size of
> > struct mem_cgroup increased from 4032 bytes to 4416 bytes. However for
> > the performance improvement, this additional size is worth it. In
> > addition there are opportunities to reduce the size of struct
> > mem_cgroup like deprecation of kmem and tcpmem page counters and
> > better packing.
>
> Did you evaluate the effects of using a per-cpu counter of some form?

Do you mean per-cpu counter for usage or something else? The usage
needs to be compared against the limits and accumulating per-cpu is
costly particularly on larger machines, so, no easy way to make usage
a per-cpu counter. Or maybe I misunderstood you and you meant
something else.
--===============5381151053679842290==--

