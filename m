Content-Type: multipart/mixed; boundary="===============2506948962347316604=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/munlock] 237b445401: stress-ng.remap.ops_per_sec -62.6% regression
Date: Thu, 24 Feb 2022 16:37:02 +0800
Message-ID: <20220224083702.GA17607@xsang-OptiPlex-9020>
In-Reply-To: <a733e937-987e-921-8152-28d48fd89ed7@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2506948962347316604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Hugh,

On Sun, Feb 20, 2022 at 10:32:28PM -0800, Hugh Dickins wrote:
> On Fri, 18 Feb 2022, Hugh Dickins wrote:
> > On Fri, 18 Feb 2022, kernel test robot wrote:
> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -62.6% regression of stress-ng.remap.ops_per_sec du=
e to commit:
> > > =

> > > =

> > > commit: 237b4454014d3759acc6459eb329c5e3d55113ed ("[PATCH v2 07/13] m=
m/munlock: mlock_pte_range() when mlocking or munlocking")
> > > url: https://github.com/0day-ci/linux/commits/Hugh-Dickins/mm-munlock=
-rework-of-mlock-munlock-page-handling/20220215-104421
> > > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git ee2885=
5a54493ce83bc2a3fbe30210be61b57bc7
> > > patch link: https://lore.kernel.org/lkml/d39f6e4d-aa4f-731a-68ee-e77c=
dbf1d7bb(a)google.com
> > > =

> > > in testcase: stress-ng
> > > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz with 128G memory
> > > with following parameters:
> > > =

> > > 	nr_threads: 100%
> > > 	testtime: 60s
> > > 	class: memory
> > > 	test: remap
> > > 	cpufreq_governor: performance
> > > 	ucode: 0xd000280
> > > =

> > > =

> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > =

> > > Details are as below:
> > > ---------------------------------------------------------------------=
----------------------------->
> > > =

> > > =

> > > To reproduce:
> > > =

> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         sudo bin/lkp install job.yaml           # job file is attache=
d in this email
> > >         bin/lkp split-job --compatible job.yaml # generate the yaml f=
ile for lkp run
> > >         sudo bin/lkp run generated-yaml-file
> > > =

> > >         # if come across any failure that blocks the test,
> > >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > > =

> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/=
test/testcase/testtime/ucode:
> > >   memory/gcc-9/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-20=
200603.cgz/lkp-icl-2sp6/remap/stress-ng/60s/0xd000280
> > > =

> > > commit: =

> > >   c479426e09 ("mm/munlock: maintain page->mlock_count while unevictab=
le")
> > >   237b445401 ("mm/munlock: mlock_pte_range() when mlocking or munlock=
ing")
> > > =

> > > c479426e09c8088d 237b4454014d3759acc6459eb32 =

> > > ---------------- --------------------------- =

> > >          %stddev     %change         %stddev
> > >              \          |                \  =

> > >     109459           -62.5%      41003 =C2=B1  2%  stress-ng.remap.ops
> > >       1823           -62.6%     682.54 =C2=B1  2%  stress-ng.remap.op=
s_per_sec
> > >  2.242e+08           -62.5%   83989157 =C2=B1  2%  stress-ng.time.min=
or_page_faults
> > >      30.00 =C2=B1  2%     -61.2%      11.65 =C2=B1  4%  stress-ng.tim=
e.user_time
> > =

> > Thanks a lot for trying it out, I did hope that you would find somethin=
g.
> > =

> > However, IIUC, this by itself is not very interesting:
> > the comparison is between c479426e09 (06/13) as base and 237b445401?
> > 237b445401 is 07/13, "Fill in missing pieces", where the series gets
> > to be correct again, after dropping the old implementation and piecing
> > together the rest of the new implementation.  It's not a surprise that
> > those tests which need what's added back in 07/13 will get much slower
> > at this stage.  And later 10/13 brings in a pagevec to speed it up.
> =

> I probably did not understand correctly: I expect you did try the whole
> series at first, found a regression, and then bisected to that commit.

yes, that is kind of what we did. we applied your patch series as a new bra=
nch:

* 173fe0fca5b75 (linux-review/Hugh-Dickins/mm-munlock-rework-of-mlock-munlo=
ck-page-handling/20220215-104421) mm/thp: shrink_page_list() avoid splittin=
g VM_LOCKED THP
* b98339dee777f mm/thp: collapse_file() do try_to_unmap(TTU_BATCH_FLUSH)
* cfe816e96f7fe mm/munlock: page migration needs mlock pagevec drained
* 9e15831f5ebd1 mm/munlock: mlock_page() munlock_page() batch by pagevec
* 351471e7c8eaa mm/munlock: delete smp_mb() from __pagevec_lru_add_fn()
* 84b82ccebbb3c mm/migrate: __unmap_and_move() push good newpage to LRU
* 237b4454014d3 mm/munlock: mlock_pte_range() when mlocking or munlocking
* c479426e09c80 mm/munlock: maintain page->mlock_count while unevictable
* 4165ea7156fc5 mm/munlock: replace clear_page_mlock() by final clearance
* 9208010d4509e mm/munlock: rmap call mlock_vma_page() munlock_vma_page()
* 9886e4a451624 mm/munlock: delete munlock_vma_pages_all(), allow oomreap
* 963d7e1d5ec62 mm/munlock: delete FOLL_MLOCK and FOLL_POPULATE
* b99933d467204 mm/munlock: delete page_mlock() and all its works
* ee28855a54493 perf/x86/intel: Increase max number of the fixed counters
* 0144ba0c5bd31 KVM: x86: use the KVM side max supported fixed counter
* 2145e77fecfb3 perf/x86/intel: Enable PEBS format 5
* 58b2ff2c18b1e perf/core: Allow kernel address filter when not filtering t=
he kernel
* e5524bf1047eb perf/x86/intel/pt: Fix address filter config for 32-bit ker=
nel
* d680ff24e9e14 perf/core: Fix address filter parser for multiple filters
* 1fb85d06ad675 x86: Share definition of __is_canonical_address()
* c243cecb58e39 perf/x86/intel/pt: Relax address filter validation
* 26291c54e111f (tag: v5.17-rc2,

but we actually don't test upon the HEAD of this branch directly. we have s=
ome
hourly kernel which contains this branch, then we found regression, and the
bisection finally pointed to 237b4454014d3.

below is some results on this branch:

173fe0fca5b75 mm/thp: shrink_page_list() avoid splitting VM_LOCKED THP		545=
.56 547.77 562.23 528.83 547.67 550.75
237b4454014d3 mm/munlock: mlock_pte_range() when mlocking or munlocking		68=
1.04 685.94 704.17 647.75 684.73 691.63
c479426e09c80 mm/munlock: maintain page->mlock_count while unevictable		184=
2.83 1819.69 1875.71 1811.48 1818.57 1772.87
4165ea7156fc5 mm/munlock: replace clear_page_mlock() by final clearance		13=
24.93 1303.7 1303.47
9208010d4509e mm/munlock: rmap call mlock_vma_page() munlock_vma_page()		12=
72.6 1301.53 1354.12
963d7e1d5ec62 mm/munlock: delete FOLL_MLOCK and FOLL_POPULATE			16323.56 15=
509.96 16488.65
26291c54e111f Linux 5.17-rc2							874.04 890.31 849.84

our auto-bisect would check branch HEAD, and in this case, it's still low,
so we made out the report.


> =

> > =

> > What would be much more interesting is to treat the series of 13 as one,
> > and compare the baseline before any of it against the end of the series:
> > is that something that the 0day robot can easily do?
> =

> That would still be more interesting to me - though probably not
> actionable (see below), so not worth you going to any effort.  But
> I hope the bad result on this test did not curtail further testing.

it it kind of difficult for us to treat series as one, but we're considering
how to fulfill this. Thanks a lot for suggestions!

and the bad result is not a problem for us :)

> =

> > =

> > But I'll look more closely at the numbers you've provided later today,
> > numbers that I've snipped off here: there may still be useful things to
> > learn from them; and maybe I'll try following the instructions you've
> > supplied, though I probably won't do a good job of following them.
> =

> I did look more closely, didn't try lkp itself, but did observe
> stress-ng --timeout 60 --times --verify --metrics-brief --remap 128
> in the reproduce file, and followed that up (but with 8 not 128).
> In my config, the series managed about half the ops as the baseline.
> =

> Comparison of unevictable_pgs in /proc/vmstat was instructive.
> Baseline 5.17-rc:                    With mm/munlock series applied:
> unevictable_pgs_culled 17            53097984
> unevictable_pgs_rescued 17           53097984
> unevictable_pgs_mlocked 97251331     53097984
> unevictable_pgs_munlocked 97251331   53097984
> =

> I was very surprised by those low culled/rescued baseline numbers,
> but a look at stress-remap-file-pages.c shows that each thread is
> repetitively doing mlock of one page, remap_file_pages on that address
> (with implicit munlock of old page and mlock of new), munlock of new.
> Whereas usually, we don't munlock a range immediately after mlocking it.
> =

> The baseline's "if (!isolate_lru_page(page)) putback_lru_page(page);"
> technique works very much in its favour on this test: the munlocking
> isolates fail because mlock puts the page back on a pagevec, nothing
> reaches the unevictable list; whereas the mm/munlock series under test
> fastidiously moves each page to unevictable before bringing it back.
> =

> This certainly modifies my view of the role of the pagevec, and I
> think it indicates that we *may* find a regression in some realistic
> workload which demands a smarter approach.  I have experimented with
> munlock_page() "cancelling" an mlock found earlier on its pagevec;
> but I very much doubt that the experimental code is correct yet, it
> worked well but not as well as hoped (there are various lru_add_drain()s
> which are limiting it), and it's just not a complication I'd like to get
> into: unless pushed to do so by a realistic workload.
> =

> stress-ng --remap is not that realistic workload (and does
> not pretend to be).  I'm glad that it has highlighted the issue,
> thanks to you, but I don't intend to propose any "fix" for this yet.

Thanks a lot for these details!
not sure if above data on that branch any help?

> =

> Hugh

--===============2506948962347316604==--

