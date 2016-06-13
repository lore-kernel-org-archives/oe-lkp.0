Content-Type: multipart/mixed; boundary="===============3005974870758747873=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Mon, 13 Jun 2016 15:52:48 +0300
Message-ID: <20160613125248.GA30109@black.fi.intel.com>
In-Reply-To: <CA+55aFy4oYis6HTu7o4YwiFawRtDOPO=87v8oHZdTFS+BjnA8g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3005974870758747873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 11, 2016 at 06:02:57PM -0700, Linus Torvalds wrote:
> On Sat, Jun 11, 2016 at 5:49 PM, Huang, Ying <ying.huang@intel.com> wro=
te:
> >
> > From perf profile, the time spent in page_fault and its children
> > functions are almost same (7.85% vs 7.81%).  So the time spent in page
> > fault and page table operation itself doesn't changed much.  So, you
> > mean CPU may be slower to load the page table entry to TLB if accessed
> > bit is not set?
> =

> So the CPU does take a microfault internally when it needs to set the
> accessed/dirty bit. It's not architecturally visible, but you can see
> it when you do timing loops.
> =

> I've timed it at over a thousand cycles on at least some CPU's, but
> that's still peanuts compared to a real page fault. It shouldn't be
> *that* noticeable, ie no way it's a 6% regression on its own.

Looks like setting accessed bit is the problem.

Withouth mkold:

Score: 1952.9

  Performance counter stats for './Run shell8 -c 1' (3 runs):
 =

    468,562,316,621      cycles:u                                          =
            ( +-  0.02% )
      4,596,299,472      dtlb_load_misses_walk_duration:u                  =
                   ( +-  0.07% )
      5,245,488,559      itlb_misses_walk_duration:u                       =
              ( +-  0.10% )
 =

      189.336404566 seconds time elapsed                                   =
       ( +-  0.01% )

With mkold:

Score: 1885.5

  Performance counter stats for './Run shell8 -c 1' (3 runs):
 =

    503,185,676,256      cycles:u                                          =
            ( +-  0.06% )
      8,137,007,894      dtlb_load_misses_walk_duration:u                  =
                   ( +-  0.85% )
      7,220,632,283      itlb_misses_walk_duration:u                       =
              ( +-  1.40% )
 =

      189.363223499 seconds time elapsed                                   =
       ( +-  0.01% )

We spend 36% more time in page walk only, about 1% of total userspace time.
Combining this with page walk footprint on caches, I guess we can get to
this 3.5% score difference I see.

I'm not sure if there's anything we can do to solve the issue without
screwing relacim logic again. :(

-- =

 Kirill A. Shutemov

--===============3005974870758747873==--

