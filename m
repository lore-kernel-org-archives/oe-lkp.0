Content-Type: multipart/mixed; boundary="===============5243574729413986005=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Tue, 24 Nov 2015 17:29:41 +0900
Message-ID: <20151124082941.GA4136@js1304-P5Q-DELUXE>
In-Reply-To: <5654116F.1030301@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5243574729413986005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2015 at 03:27:43PM +0800, Aaron Lu wrote:
> On 11/24/2015 12:55 PM, Joonsoo Kim wrote:
> > On Tue, Nov 24, 2015 at 11:40:28AM +0800, Aaron Lu wrote:
> >> BTW, I'm still learning how to do proper ftrace for this case and it m=
ay
> >> take a while.
> > =

> > You can do it simply with trace-cmd.
> > =

> > sudo trace-cmd record -e compaction &
> > run test program
> > fg
> > Ctrl + c
> > =

> > sudo trace-cmd report
> =

> Thanks for the tip, I just recorded it like this:
> trace-cmd record -e compaction ./usemem xxx
> =

> Due to the big size of trace.out(6MB after compress), I've uploaed it:
> https://drive.google.com/open?id=3D0B49uX3igf4K4UkJBOGt3cHhOU00
> =

> The pagetypeinfo, perf and proc-vmstat is also there.
> =


Thanks.

Okay. Output proves the theory. pagetypeinfo shows that there are
too many unmovable pageblocks. isolate_freepages() should skip these
so it's not easy to meet proper pageblock until need_resched(). Hence,
updating cached pfn doesn't happen. (You can see unchanged free_pfn
with 'grep compaction_begin tracepoint-output')

But, I don't think that updating cached pfn is enough to solve your problem.
More complex change would be needed, I guess.

Thanks.

--===============5243574729413986005==--

