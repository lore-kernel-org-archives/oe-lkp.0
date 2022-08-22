Content-Type: multipart/mixed; boundary="===============8750159442831324834=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] mm: page_counter: rearrange struct page_counter fields
Date: Sun, 21 Aug 2022 21:55:28 -0700
Message-ID: <CALvZod4r5_vcL4ZcSpR_DdLc_2sppnPTv1DXmFchCULWLu3Riw@mail.gmail.com>
In-Reply-To: <CACSApvYU5gfbDv9dyaypu1oOPB58eT1inX9EX6gV5b2q3+qr6Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8750159442831324834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 21, 2022 at 5:24 PM Soheil Hassas Yeganeh <soheil@google.com>=
 wrote:
>
> On Sun, Aug 21, 2022 at 8:18 PM Shakeel Butt <shakeelb@google.com> wrot=
e:
> >
> > With memcg v2 enabled, memcg->memory.usage is a very hot member for
> > the workloads doing memcg charging on multiple CPUs concurrently.
> > Particularly the network intensive workloads. In addition, there is a
> > false cache sharing between memory.usage and memory.high on the charge
> > path. This patch moves the usage into a separate cacheline and move all
> > the read most fields into separate cacheline.
> >
> > To evaluate the impact of this optimization, on a 72 CPUs machine, we
> > ran the following workload in a three level of cgroup hierarchy with top
> > level having min and low setup appropriately. More specifically
> > memory.min equal to size of netperf binary and memory.low double of
> > that.
> >
> >  $ netserver -6
> >  # 36 instances of netperf with following params
> >  $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
> >
> > Results (average throughput of netperf):
> > Without (6.0-rc1)       10482.7 Mbps
> > With patch              12413.7 Mbps (18.4% improvement)
> >
> > With the patch, the throughput improved by 18.4%.
>
> Shakeel, for my understanding: is this on top of the gains from the
> previous patch?
>

No, this is independent of the previous patch. The cover letter has
the numbers for all three optimizations applied together.
--===============8750159442831324834==--

