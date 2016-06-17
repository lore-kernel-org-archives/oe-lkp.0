Content-Type: multipart/mixed; boundary="===============1107355051189918289=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Fri, 17 Jun 2016 14:41:56 +0900
Message-ID: <20160617054156.GB2374@bbox>
In-Reply-To: <87a8ikkbvj.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1107355051189918289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2016 at 03:27:44PM -0700, Huang, Ying wrote:
> Minchan Kim <minchan@kernel.org> writes:
> =

> > On Thu, Jun 16, 2016 at 07:52:26AM +0800, Huang, Ying wrote:
> >> "Kirill A. Shutemov" <kirill@shutemov.name> writes:
> >> =

> >> > On Tue, Jun 14, 2016 at 05:57:28PM +0900, Minchan Kim wrote:
> >> >> On Wed, Jun 08, 2016 at 11:58:11AM +0300, Kirill A. Shutemov wrote:
> >> >> > On Wed, Jun 08, 2016 at 04:41:37PM +0800, Huang, Ying wrote:
> >> >> > > "Huang, Ying" <ying.huang@intel.com> writes:
> >> >> > > =

> >> >> > > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> writ=
es:
> >> >> > > >
> >> >> > > >> On Mon, Jun 06, 2016 at 10:27:24AM +0800, kernel test robot =
wrote:
> >> >> > > >>> =

> >> >> > > >>> FYI, we noticed a -6.3% regression of unixbench.score due t=
o commit:
> >> >> > > >>> =

> >> >> > > >>> commit 5c0a85fad949212b3e059692deecdeed74ae7ec7 ("mm: make =
faultaround produce old ptes")
> >> >> > > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> >> >> > > >>> =

> >> >> > > >>> in testcase: unixbench
> >> >> > > >>> on test machine: lituya: 16 threads Haswell High-end Deskto=
p (i7-5960X 3.0G) with 16G memory
> >> >> > > >>> with following parameters: cpufreq_governor=3Dperformance/n=
r_task=3D1/test=3Dshell8
> >> >> > > >>> =

> >> >> > > >>> =

> >> >> > > >>> Details are as below:
> >> >> > > >>> -----------------------------------------------------------=
--------------------------------------->
> >> >> > > >>> =

> >> >> > > >>> =

> >> >> > > >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> >> > > >>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group=
/test/testcase:
> >> >> > > >>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-0=
7.cgz/lituya/shell8/unixbench
> >> >> > > >>> =

> >> >> > > >>> commit: =

> >> >> > > >>>   4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
> >> >> > > >>>   5c0a85fad949212b3e059692deecdeed74ae7ec7
> >> >> > > >>> =

> >> >> > > >>> 4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

> >> >> > > >>> ---------------- -------------------------- =

> >> >> > > >>>        fail:runs  %reproduction    fail:runs
> >> >> > > >>>            |             |             |    =

> >> >> > > >>>           3:4          -75%            :4     kmsg.DHCP/BOO=
TP:Reply_not_for_us,op[#]xid[#]
> >> >> > > >>>          %stddev     %change         %stddev
> >> >> > > >>>              \          |                \  =

> >> >> > > >>>      14321 .  0%      -6.3%      13425 .  0%  unixbench.sco=
re
> >> >> > > >>>    1996897 .  0%      -6.1%    1874635 .  0%  unixbench.tim=
e.involuntary_context_switches
> >> >> > > >>>  1.721e+08 .  0%      -6.2%  1.613e+08 .  0%  unixbench.tim=
e.minor_page_faults
> >> >> > > >>>     758.65 .  0%      -3.0%     735.86 .  0%  unixbench.tim=
e.system_time
> >> >> > > >>>     387.66 .  0%      +5.4%     408.49 .  0%  unixbench.tim=
e.user_time
> >> >> > > >>>    5950278 .  0%      -6.2%    5583456 .  0%  unixbench.tim=
e.voluntary_context_switches
> >> >> > > >>
> >> >> > > >> That's weird.
> >> >> > > >>
> >> >> > > >> I don't understand why the change would reduce number or min=
or faults.
> >> >> > > >> It should stay the same on x86-64. Rise of user_time is puzz=
ling too.
> >> >> > > >
> >> >> > > > unixbench runs in fixed time mode.  That is, the total time t=
o run
> >> >> > > > unixbench is fixed, but the work done varies.  So the minor_p=
age_faults
> >> >> > > > change may reflect only the work done.
> >> >> > > >
> >> >> > > >> Hm. Is reproducible? Across reboot?
> >> >> > > >
> >> >> > > =

> >> >> > > And FYI, there is no swap setup for test, all root file system =
including
> >> >> > > benchmark files are in tmpfs, so no real page reclaim will be
> >> >> > > triggered.  But it appears that active file cache reduced after=
 the
> >> >> > > commit.
> >> >> > > =

> >> >> > >     111331 .  1%     -13.3%      96503 .  0%  meminfo.Active
> >> >> > >      27603 .  1%     -43.9%      15486 .  0%  meminfo.Active(fi=
le)
> >> >> > > =

> >> >> > > I think this is the expected behavior of the commit?
> >> >> > =

> >> >> > Yes, it's expected.
> >> >> > =

> >> >> > After the change faularound would produce old pte. It means there=
's more
> >> >> > chance for these pages to be on inactive lru, unless somebody act=
ually
> >> >> > touch them and flip accessed bit.
> >> >> =

> >> >> Hmm, tmpfs pages should be in anonymous LRU list and VM shouldn't s=
can
> >> >> anonymous LRU list on swapless system so I really wonder why active=
 file
> >> >> LRU is shrunk.
> >> >
> >> > Hm. Good point. I don't why we have anything on file lru if there's =
no
> >> > filesystems except tmpfs.
> >> >
> >> > Ying, how do you get stuff to the tmpfs?
> >> =

> >> We put root file system and benchmark into a set of compressed cpio
> >> archive, then concatenate them into one initrd, and finally kernel use
> >> that initrd as initramfs.
> >
> > I see.
> >
> > Could you share your 4 full vmstat(/proc/vmstat) files?
> >
> > old:
> >
> > cat /proc/vmstat > before.old.vmstat
> > do benchmark
> > cat /proc/vmstat > after.old.vmstat
> >
> > new:
> >
> > cat /proc/vmstat > before.new.vmstat
> > do benchmark
> > cat /proc/vmstat > after.new.vmstat
> >
> > IOW, I want to see stats related to reclaim.
> =

> Hi,
> =

> The /proc/vmstat for the parent commit (parent-proc-vmstat.gz) and first
> bad commit (fbc-proc-vmstat.gz) are attached with the email.
> =

> The contents of the file is more than the vmstat before and after
> benchmark running, but are sampled every 1 seconds.  Every sample begin
> with "time: <time>".  You can check the first and last samples.  The
> first /proc/vmstat capturing is started at the same time of the
> benchmark, so it is not exactly the vmstat before the benchmark running.
> =


Thanks for the testing!

nr_active_file was shrunk 48% but the vaule itself is not huge so
I don't think it affects performance a lot.

There was no reclaim activity for testing. :(

pgfault, 6% reduced. Given that, pgalloc/free reduced 6%, too
because unixbench was time fixed mode and 6% regressed so no
doubt.

No interesting data.

It seems you tested it with THP, maybe always mode?
I'm so sorry but could you test it with disabling CONFIG_TRANSPARENT_HUGEPA=
GE=3Dn
again? it might you already did.
Is it still 6% regressed with disabling THP?

                 nr_free_pages      -6663      -6461    96.97%
                nr_alloc_batch       2594       4013   154.70%
              nr_inactive_anon        112        112   100.00%
                nr_active_anon       2536       2159    85.13%
              nr_inactive_file       -567       -227    40.04%
                nr_active_file        648        315    48.61%
                nr_unevictable          0          0     0.00%
                      nr_mlock          0          0     0.00%
                 nr_anon_pages       2634       2161    82.04%
                     nr_mapped        511        530   103.72%
                 nr_file_pages        207        215   103.86%
                      nr_dirty         -7         -6    85.71%
                  nr_writeback          0          0     0.00%
           nr_slab_reclaimable        158        328   207.59%
         nr_slab_unreclaimable       2208       2115    95.79%
           nr_page_table_pages        268        247    92.16%
               nr_kernel_stack        143         80    55.94%
                   nr_unstable          1          1   100.00%
                     nr_bounce          0          0     0.00%
               nr_vmscan_write          0          0     0.00%
   nr_vmscan_immediate_reclaim          0          0     0.00%
             nr_writeback_temp          0          0     0.00%
              nr_isolated_anon          0          0     0.00%
              nr_isolated_file          0          0     0.00%
                      nr_shmem        131        131   100.00%
                    nr_dirtied         67         78   116.42%
                    nr_written         74         84   113.51%
              nr_pages_scanned          0          0     0.00%
                      numa_hit  483752446  453696304    93.79%
                     numa_miss          0          0     0.00%
                  numa_foreign          0          0     0.00%
               numa_interleave          0          0     0.00%
                    numa_local  483752445  453696304    93.79%
                    numa_other          1          0     0.00%
            workingset_refault          0          0     0.00%
           workingset_activate          0          0     0.00%
        workingset_nodereclaim          0          0     0.00%
 nr_anon_transparent_hugepages          1          0     0.00%
                   nr_free_cma          0          0     0.00%
            nr_dirty_threshold      -1316      -1274    96.81%
 nr_dirty_background_threshold       -658       -637    96.81%
                        pgpgin          0          0     0.00%
                       pgpgout          0          0     0.00%
                        pswpin          0          0     0.00%
                       pswpout          0          0     0.00%
                   pgalloc_dma          0          0     0.00%
                 pgalloc_dma32   60130977   56323630    93.67%
                pgalloc_normal  457203182  428863437    93.80%
               pgalloc_movable          0          0     0.00%
                        pgfree  517327743  485181251    93.79%
                    pgactivate    2059556    1930950    93.76%
                  pgdeactivate          0          0     0.00%
                       pgfault  572723351  537107146    93.78%
                    pgmajfault          0          0     0.00%
                   pglazyfreed          0          0     0.00%
                  pgrefill_dma          0          0     0.00%
                pgrefill_dma32          0          0     0.00%
               pgrefill_normal          0          0     0.00%
              pgrefill_movable          0          0     0.00%
            pgsteal_kswapd_dma          0          0     0.00%
          pgsteal_kswapd_dma32          0          0     0.00%
         pgsteal_kswapd_normal          0          0     0.00%
        pgsteal_kswapd_movable          0          0     0.00%
            pgsteal_direct_dma          0          0     0.00%
          pgsteal_direct_dma32          0          0     0.00%
         pgsteal_direct_normal          0          0     0.00%
        pgsteal_direct_movable          0          0     0.00%
             pgscan_kswapd_dma          0          0     0.00%
           pgscan_kswapd_dma32          0          0     0.00%
          pgscan_kswapd_normal          0          0     0.00%
         pgscan_kswapd_movable          0          0     0.00%
             pgscan_direct_dma          0          0     0.00%
           pgscan_direct_dma32          0          0     0.00%
          pgscan_direct_normal          0          0     0.00%
         pgscan_direct_movable          0          0     0.00%
        pgscan_direct_throttle          0          0     0.00%
           zone_reclaim_failed          0          0     0.00%
                  pginodesteal          0          0     0.00%
                 slabs_scanned          0          0     0.00%
             kswapd_inodesteal          0          0     0.00%
  kswapd_low_wmark_hit_quickly          0          0     0.00%
 kswapd_high_wmark_hit_quickly          0          0     0.00%
                    pageoutrun          0          0     0.00%
                    allocstall          0          0     0.00%
                     pgrotated          0          0     0.00%
                drop_pagecache          0          0     0.00%
                     drop_slab          0          0     0.00%
              numa_pte_updates          0          0     0.00%
         numa_huge_pte_updates          0          0     0.00%
              numa_hint_faults          0          0     0.00%
        numa_hint_faults_local          0          0     0.00%
           numa_pages_migrated          0          0     0.00%
             pgmigrate_success          0          0     0.00%
                pgmigrate_fail          0          0     0.00%
       compact_migrate_scanned          0          0     0.00%
          compact_free_scanned          0          0     0.00%
              compact_isolated          0          0     0.00%
                 compact_stall          0          0     0.00%
                  compact_fail          0          0     0.00%
               compact_success          0          0     0.00%
           compact_daemon_wake          0          0     0.00%
      htlb_buddy_alloc_success          0          0     0.00%
         htlb_buddy_alloc_fail          0          0     0.00%
        unevictable_pgs_culled          0          0     0.00%
       unevictable_pgs_scanned          0          0     0.00%
       unevictable_pgs_rescued          0          0     0.00%
       unevictable_pgs_mlocked          0          0     0.00%
     unevictable_pgs_munlocked          0          0     0.00%
       unevictable_pgs_cleared          0          0     0.00%
      unevictable_pgs_stranded          0          0     0.00%
               thp_fault_alloc      22731      21604    95.04%
            thp_fault_fallback          0          0     0.00%
            thp_collapse_alloc          1          0     0.00%
     thp_collapse_alloc_failed          0          0     0.00%
                thp_split_page          0          0     0.00%
         thp_split_page_failed          0          0     0.00%
       thp_deferred_split_page      22731      21604    95.04%
                 thp_split_pmd          0          0     0.00%
           thp_zero_page_alloc          0          0     0.00%
    thp_zero_page_alloc_failed          0          0     0.00%
               balloon_inflate          0          0     0.00%
               balloon_deflate          0          0     0.00%
               balloon_migrate          0          0     0.00%

--===============1107355051189918289==--

