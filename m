Content-Type: multipart/mixed; boundary="===============6169825895046411978=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [NUMA Balancing] e39bb6be9f: will-it-scale.per_thread_ops 64.4% improvement
Date: Sat, 02 Apr 2022 16:50:05 +0800
Message-ID: <20220402085005.GC32311@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=wg+mJrTvun6qkdEnkZk9FSyj6vNYU2j7QY-iPn0g_y1nw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6169825895046411978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Apr 01, 2022 at 09:35:24AM -0700, Linus Torvalds wrote:
> On Fri, Apr 1, 2022 at 2:42 AM kernel test robot <oliver.sang@intel.com=
> wrote:
> >
> > FYI, we noticed a 64.4% improvement of will-it-scale.per_thread_ops due=
 to commit:
> > e39bb6be9f2b ("NUMA Balancing: add page promotion counter")
> =

> That looks odd and unlikely.
> =

> That commit only modifies some page counting statistics. Sure, it
> could be another cache layout thing, and maybe it's due to the subtle
> change in how NUMA_PAGE_MIGRATE gets counted, but it still looks a bit
> odd.

We did a quick check about cache stuff by disabling HW cache prefetch
completely (writing 0xf to MSR 0x1a4), and the performance change
is almost gone:

  ee97347fe058d020     e39bb6be9f2b39a6dbaeff48436 =

  ----------------     --------------------------- =

    134793            -1.4%     132867        will-it-scale.per_thread_ops

The test box is a Cascadelake machine with 4 nodes, and the similar trend
is found on a 2 nodes machine, that the commit has 55% improvement with
HW cache prefetch enabled, and has less than 1% change when disabled.

Though we still cannot pin-point the exact place affected.

Also per our experience, the patch changing vm statistics can easily
trigger strange performance bumps for micro-benchmarks like will-it-scale,
stress-ng etc.

Thanks,
Feng


>                Linus
--===============6169825895046411978==--

