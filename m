Content-Type: multipart/mixed; boundary="===============8256457317762455670=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/munlock] 237b445401: stress-ng.remap.ops_per_sec -62.6% regression
Date: Sun, 20 Feb 2022 22:32:28 -0800
Message-ID: <a733e937-987e-921-8152-28d48fd89ed7@google.com>
In-Reply-To: <7d35c86-77f6-8bf-84a-5c23ff610f4@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8256457317762455670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Feb 2022, Hugh Dickins wrote:
> On Fri, 18 Feb 2022, kernel test robot wrote:
> > =

> > Greeting,
> > =

> > FYI, we noticed a -62.6% regression of stress-ng.remap.ops_per_sec due =
to commit:
> > =

> > =

> > commit: 237b4454014d3759acc6459eb329c5e3d55113ed ("[PATCH v2 07/13] mm/=
munlock: mlock_pte_range() when mlocking or munlocking")
> > url: https://github.com/0day-ci/linux/commits/Hugh-Dickins/mm-munlock-r=
ework-of-mlock-munlock-page-handling/20220215-104421
> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git ee28855a=
54493ce83bc2a3fbe30210be61b57bc7
> > patch link: https://lore.kernel.org/lkml/d39f6e4d-aa4f-731a-68ee-e77cdb=
f1d7bb(a)google.com
> > =

> > in testcase: stress-ng
> > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 C=
PU @ 2.60GHz with 128G memory
> > with following parameters:
> > =

> > 	nr_threads: 100%
> > 	testtime: 60s
> > 	class: memory
> > 	test: remap
> > 	cpufreq_governor: performance
> > 	ucode: 0xd000280
> > =

> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> > =

> > =

> > To reproduce:
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         sudo bin/lkp install job.yaml           # job file is attached =
in this email
> >         bin/lkp split-job --compatible job.yaml # generate the yaml fil=
e for lkp run
> >         sudo bin/lkp run generated-yaml-file
> > =

> >         # if come across any failure that blocks the test,
> >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/te=
st/testcase/testtime/ucode:
> >   memory/gcc-9/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-2020=
0603.cgz/lkp-icl-2sp6/remap/stress-ng/60s/0xd000280
> > =

> > commit: =

> >   c479426e09 ("mm/munlock: maintain page->mlock_count while unevictable=
")
> >   237b445401 ("mm/munlock: mlock_pte_range() when mlocking or munlockin=
g")
> > =

> > c479426e09c8088d 237b4454014d3759acc6459eb32 =

> > ---------------- --------------------------- =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >     109459           -62.5%      41003 =C2=B1  2%  stress-ng.remap.ops
> >       1823           -62.6%     682.54 =C2=B1  2%  stress-ng.remap.ops_=
per_sec
> >  2.242e+08           -62.5%   83989157 =C2=B1  2%  stress-ng.time.minor=
_page_faults
> >      30.00 =C2=B1  2%     -61.2%      11.65 =C2=B1  4%  stress-ng.time.=
user_time
> =

> Thanks a lot for trying it out, I did hope that you would find something.
> =

> However, IIUC, this by itself is not very interesting:
> the comparison is between c479426e09 (06/13) as base and 237b445401?
> 237b445401 is 07/13, "Fill in missing pieces", where the series gets
> to be correct again, after dropping the old implementation and piecing
> together the rest of the new implementation.  It's not a surprise that
> those tests which need what's added back in 07/13 will get much slower
> at this stage.  And later 10/13 brings in a pagevec to speed it up.

I probably did not understand correctly: I expect you did try the whole
series at first, found a regression, and then bisected to that commit.

> =

> What would be much more interesting is to treat the series of 13 as one,
> and compare the baseline before any of it against the end of the series:
> is that something that the 0day robot can easily do?

That would still be more interesting to me - though probably not
actionable (see below), so not worth you going to any effort.  But
I hope the bad result on this test did not curtail further testing.

> =

> But I'll look more closely at the numbers you've provided later today,
> numbers that I've snipped off here: there may still be useful things to
> learn from them; and maybe I'll try following the instructions you've
> supplied, though I probably won't do a good job of following them.

I did look more closely, didn't try lkp itself, but did observe
stress-ng --timeout 60 --times --verify --metrics-brief --remap 128
in the reproduce file, and followed that up (but with 8 not 128).
In my config, the series managed about half the ops as the baseline.

Comparison of unevictable_pgs in /proc/vmstat was instructive.
Baseline 5.17-rc:                    With mm/munlock series applied:
unevictable_pgs_culled 17            53097984
unevictable_pgs_rescued 17           53097984
unevictable_pgs_mlocked 97251331     53097984
unevictable_pgs_munlocked 97251331   53097984

I was very surprised by those low culled/rescued baseline numbers,
but a look at stress-remap-file-pages.c shows that each thread is
repetitively doing mlock of one page, remap_file_pages on that address
(with implicit munlock of old page and mlock of new), munlock of new.
Whereas usually, we don't munlock a range immediately after mlocking it.

The baseline's "if (!isolate_lru_page(page)) putback_lru_page(page);"
technique works very much in its favour on this test: the munlocking
isolates fail because mlock puts the page back on a pagevec, nothing
reaches the unevictable list; whereas the mm/munlock series under test
fastidiously moves each page to unevictable before bringing it back.

This certainly modifies my view of the role of the pagevec, and I
think it indicates that we *may* find a regression in some realistic
workload which demands a smarter approach.  I have experimented with
munlock_page() "cancelling" an mlock found earlier on its pagevec;
but I very much doubt that the experimental code is correct yet, it
worked well but not as well as hoped (there are various lru_add_drain()s
which are limiting it), and it's just not a complication I'd like to get
into: unless pushed to do so by a realistic workload.

stress-ng --remap is not that realistic workload (and does
not pretend to be).  I'm glad that it has highlighted the issue,
thanks to you, but I don't intend to propose any "fix" for this yet.

Hugh

--===============8256457317762455670==--

