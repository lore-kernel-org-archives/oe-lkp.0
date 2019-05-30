Content-Type: multipart/mixed; boundary="===============0534989253322398370=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 2996e1f8bc: aim7.jobs-per-min -13.2% regression
Date: Thu, 30 May 2019 21:32:15 +0800
Message-ID: <20190530133215.GC22325@shao2-debian>
In-Reply-To: <20190527114914.GG15290@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0534989253322398370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 01:49:14PM +0200, David Sterba wrote:
> On Mon, May 27, 2019 at 05:17:19PM +0800, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed a -13.2% regression of aim7.jobs-per-min due to commit:
> =

> That's interesting and worth an investigation. This should not happen,
> the code is almost the same, moved from one function to another and the
> call is direct. I'd suspect some low-level causes like cache effects or
> branching, the perf-stats.i.* show some differences.
> =

> Other stats say (slabinfo.*extent_buffer) that there was less work over
> the period. The slab object counter says that the object reuse was
> higher in the bad case.
> =

> And there are many stats that show two digit difference, I'm trying to
> make some sense of that, eg. if memory placement on NUMA nodes can
> affect the speed of checksumming (changed by the patch)
> =

> So I wonder how reliable the test is and if it really does the same
> thing in both cases or if there's some subtle change in the patch that
> we've missed.

Hi,

The test is unstable, we can't reproduce the issue. It's probably a false
positive, sorry for the inconvenience.

Best Regards,
Rong Chen

--===============0534989253322398370==--

