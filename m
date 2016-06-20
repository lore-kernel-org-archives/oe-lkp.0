Content-Type: multipart/mixed; boundary="===============4251585602485018721=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Mon, 20 Jun 2016 09:06:06 +0900
Message-ID: <20160620000606.GB3194@blaptop>
In-Reply-To: <87y463hb0k.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4251585602485018721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 12:26:51PM -0700, Huang, Ying wrote:
> Minchan Kim <minchan@kernel.org> writes:
> =

> > On Thu, Jun 16, 2016 at 03:27:44PM -0700, Huang, Ying wrote:
> >> Minchan Kim <minchan@kernel.org> writes:
> >> =

> >> > On Thu, Jun 16, 2016 at 07:52:26AM +0800, Huang, Ying wrote:
> >> >> "Kirill A. Shutemov" <kirill@shutemov.name> writes:
> >> >> =

> >> >> > On Tue, Jun 14, 2016 at 05:57:28PM +0900, Minchan Kim wrote:
> >> >> >> On Wed, Jun 08, 2016 at 11:58:11AM +0300, Kirill A. Shutemov wro=
te:
> >> >> >> > On Wed, Jun 08, 2016 at 04:41:37PM +0800, Huang, Ying wrote:
> >> >> >> > > "Huang, Ying" <ying.huang@intel.com> writes:
> >> >> >> > > =

> >> >> >> > > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> w=
rites:
> >> >> >> > > >
> >> >> >> > > >> On Mon, Jun 06, 2016 at 10:27:24AM +0800, kernel test rob=
ot wrote:
> >> >> >> > > >>> =

> >> >> >> > > >>> FYI, we noticed a -6.3% regression of unixbench.score du=
e to commit:
> >> >> >> > > >>> =

> >> >> >> > > >>> commit 5c0a85fad949212b3e059692deecdeed74ae7ec7 ("mm: ma=
ke faultaround produce old ptes")
> >> >> >> > > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds=
/linux.git master
> >> >> >> > > >>> =

> >> >> >> > > >>> in testcase: unixbench
> >> >> >> > > >>> on test machine: lituya: 16 threads Haswell High-end Des=
ktop (i7-5960X 3.0G) with 16G memory
> >> >> >> > > >>> with following parameters: cpufreq_governor=3Dperformanc=
e/nr_task=3D1/test=3Dshell8
> >> >> >> > > >>> =

> >> >> >> > > >>> =

> >> >> >> > > >>> Details are as below:
> >> >> >> > > >>> --------------------------------------------------------=
------------------------------------------>
> >> >> >> > > >>> =

> >> >> >> > > >>> =

> >> >> >> > > >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> >> >> > > >>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_gr=
oup/test/testcase:
> >> >> >> > > >>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-0=
2-07.cgz/lituya/shell8/unixbench
> >> >> >> > > >>> =

> >> >> >> > > >>> commit: =

> >> >> >> > > >>>   4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
> >> >> >> > > >>>   5c0a85fad949212b3e059692deecdeed74ae7ec7
> >> >> >> > > >>> =

> >> >> >> > > >>> 4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

> >> >> >> > > >>> ---------------- -------------------------- =

> >> >> >> > > >>>        fail:runs  %reproduction    fail:runs
> >> >> >> > > >>>            |             |             |    =

> >> >> >> > > >>>           3:4          -75%            :4     kmsg.DHCP/=
BOOTP:Reply_not_for_us,op[#]xid[#]
> >> >> >> > > >>>          %stddev     %change         %stddev
> >> >> >> > > >>>              \          |                \  =

> >> >> >> > > >>>      14321 .  0%      -6.3%      13425 .  0%  unixbench.=
score
> >> >> >> > > >>>    1996897 .  0%      -6.1%    1874635 .  0%  unixbench.=
time.involuntary_context_switches
> >> >> >> > > >>>  1.721e+08 .  0%      -6.2%  1.613e+08 .  0%  unixbench.=
time.minor_page_faults
> >> >> >> > > >>>     758.65 .  0%      -3.0%     735.86 .  0%  unixbench.=
time.system_time
> >> >> >> > > >>>     387.66 .  0%      +5.4%     408.49 .  0%  unixbench.=
time.user_time
> >> >> >> > > >>>    5950278 .  0%      -6.2%    5583456 .  0%  unixbench.=
time.voluntary_context_switches
> >> >> >> > > >>
> >> >> >> > > >> That's weird.
> >> >> >> > > >>
> >> >> >> > > >> I don't understand why the change would reduce number or =
minor faults.
> >> >> >> > > >> It should stay the same on x86-64. Rise of user_time is p=
uzzling too.
> >> >> >> > > >
> >> >> >> > > > unixbench runs in fixed time mode.  That is, the total tim=
e to run
> >> >> >> > > > unixbench is fixed, but the work done varies.  So the mino=
r_page_faults
> >> >> >> > > > change may reflect only the work done.
> >> >> >> > > >
> >> >> >> > > >> Hm. Is reproducible? Across reboot?
> >> >> >> > > >
> >> >> >> > > =

> >> >> >> > > And FYI, there is no swap setup for test, all root file syst=
em including
> >> >> >> > > benchmark files are in tmpfs, so no real page reclaim will be
> >> >> >> > > triggered.  But it appears that active file cache reduced af=
ter the
> >> >> >> > > commit.
> >> >> >> > > =

> >> >> >> > >     111331 .  1%     -13.3%      96503 .  0%  meminfo.Active
> >> >> >> > >      27603 .  1%     -43.9%      15486 .  0%  meminfo.Active=
(file)
> >> >> >> > > =

> >> >> >> > > I think this is the expected behavior of the commit?
> >> >> >> > =

> >> >> >> > Yes, it's expected.
> >> >> >> > =

> >> >> >> > After the change faularound would produce old pte. It means th=
ere's more
> >> >> >> > chance for these pages to be on inactive lru, unless somebody =
actually
> >> >> >> > touch them and flip accessed bit.
> >> >> >> =

> >> >> >> Hmm, tmpfs pages should be in anonymous LRU list and VM shouldn'=
t scan
> >> >> >> anonymous LRU list on swapless system so I really wonder why act=
ive file
> >> >> >> LRU is shrunk.
> >> >> >
> >> >> > Hm. Good point. I don't why we have anything on file lru if there=
's no
> >> >> > filesystems except tmpfs.
> >> >> >
> >> >> > Ying, how do you get stuff to the tmpfs?
> >> >> =

> >> >> We put root file system and benchmark into a set of compressed cpio
> >> >> archive, then concatenate them into one initrd, and finally kernel =
use
> >> >> that initrd as initramfs.
> >> >
> >> > I see.
> >> >
> >> > Could you share your 4 full vmstat(/proc/vmstat) files?
> >> >
> >> > old:
> >> >
> >> > cat /proc/vmstat > before.old.vmstat
> >> > do benchmark
> >> > cat /proc/vmstat > after.old.vmstat
> >> >
> >> > new:
> >> >
> >> > cat /proc/vmstat > before.new.vmstat
> >> > do benchmark
> >> > cat /proc/vmstat > after.new.vmstat
> >> >
> >> > IOW, I want to see stats related to reclaim.
> >> =

> >> Hi,
> >> =

> >> The /proc/vmstat for the parent commit (parent-proc-vmstat.gz) and fir=
st
> >> bad commit (fbc-proc-vmstat.gz) are attached with the email.
> >> =

> >> The contents of the file is more than the vmstat before and after
> >> benchmark running, but are sampled every 1 seconds.  Every sample begin
> >> with "time: <time>".  You can check the first and last samples.  The
> >> first /proc/vmstat capturing is started at the same time of the
> >> benchmark, so it is not exactly the vmstat before the benchmark runnin=
g.
> >> =

> >
> > Thanks for the testing!
> >
> > nr_active_file was shrunk 48% but the vaule itself is not huge so
> > I don't think it affects performance a lot.
> >
> > There was no reclaim activity for testing. :(
> >
> > pgfault, 6% reduced. Given that, pgalloc/free reduced 6%, too
> > because unixbench was time fixed mode and 6% regressed so no
> > doubt.
> >
> > No interesting data.
> >
> > It seems you tested it with THP, maybe always mode?
> =

> Yes.  With following in kconfig.
> =

> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> =

> > I'm so sorry but could you test it with disabling CONFIG_TRANSPARENT_HU=
GEPAGE=3Dn
> > again? it might you already did.
> > Is it still 6% regressed with disabling THP?
> =

> Yes.  I disabled THP via
> =

> echo never > /sys/kernel/mm/transparent_hugepage/enabled
> echo never > /sys/kernel/mm/transparent_hugepage/defrag
> =

> The regression is the same as before.

Still, 6% user_time regression and there is no difference with previous
experiment which enabled THP so I agree the regression is caused by just
access bit setting from CPU side, which is rather surprising to me.

I don't know how unixbench shell scripts testing touch the memory
but it should be per-page overhead and 6% regression for that is too heavy.
Anyway, at least, it would be better to notice it to x86 maintainer.

Thanks for the test!

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase=
/thp_defrag/thp_enabled:
>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lituya/s=
hell8/unixbench/never/never
> =

> commit: =

>   4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
>   5c0a85fad949212b3e059692deecdeed74ae7ec7
> =

> 4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      14332 =C2=B1  0%      -6.2%      13438 =C2=B1  0%  unixbench.score
>    6662206 =C2=B1  0%      -6.2%    6252260 =C2=B1  0%  unixbench.time.in=
voluntary_context_switches
>  5.734e+08 =C2=B1  0%      -6.2%  5.376e+08 =C2=B1  0%  unixbench.time.mi=
nor_page_faults
>       2527 =C2=B1  0%      -3.2%       2446 =C2=B1  0%  unixbench.time.sy=
stem_time
>       1291 =C2=B1  0%      +5.4%       1361 =C2=B1  0%  unixbench.time.us=
er_time
>   19875455 =C2=B1  0%      -6.3%   18622488 =C2=B1  0%  unixbench.time.vo=
luntary_context_switches
>    6570355 =C2=B1  0%     -11.9%    5787517 =C2=B1  0%  cpuidle.C1-HSW.us=
age
>      17257 =C2=B1 34%     -59.1%       7055 =C2=B1  7%  latency_stats.sum=
.ep_poll.SyS_epoll_wait.entry_SYSCALL_64_fastpath
>       5976 =C2=B1  0%     -43.0%       3404 =C2=B1  0%  proc-vmstat.nr_ac=
tive_file
>      45729 =C2=B1  1%     -22.5%      35439 =C2=B1  1%  meminfo.Active
>      23905 =C2=B1  0%     -43.0%      13619 =C2=B1  0%  meminfo.Active(fi=
le)
>       8465 =C2=B1  3%     -29.8%       5940 =C2=B1  3%  slabinfo.pid.acti=
ve_objs
>       8476 =C2=B1  3%     -29.9%       5940 =C2=B1  3%  slabinfo.pid.num_=
objs
>       3.46 =C2=B1  0%     +12.5%       3.89 =C2=B1  0%  turbostat.CPU%c3
>      67.09 =C2=B1  0%      -2.1%      65.65 =C2=B1  0%  turbostat.PkgWatt
>      96090 =C2=B1  0%      -5.8%      90479 =C2=B1  0%  vmstat.system.cs
>       9083 =C2=B1  0%      -2.7%       8833 =C2=B1  0%  vmstat.system.in
>     467.35 =C2=B1 78%    +416.7%       2414 =C2=B1 45%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>       7477 =C2=B1 78%    +327.7%      31981 =C2=B1 39%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>       1810 =C2=B1 78%    +360.1%       8327 =C2=B1 40%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>     467.35 =C2=B1 78%    +416.7%       2414 =C2=B1 45%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>       7477 =C2=B1 78%    +327.7%      31981 =C2=B1 39%  sched_debug.cfs_r=
q:/.max_vruntime.max
>       1810 =C2=B1 78%    +360.1%       8327 =C2=B1 40%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>     -10724 =C2=B1 -7%     -12.0%      -9433 =C2=B1 -3%  sched_debug.cfs_r=
q:/.spread0.avg
>     -17721 =C2=B1 -4%      -9.8%     -15978 =C2=B1 -2%  sched_debug.cfs_r=
q:/.spread0.min
>      90355 =C2=B1  9%     +14.1%     103099 =C2=B1  5%  sched_debug.cpu.a=
vg_idle.min
>       0.12 =C2=B1 35%    +325.0%       0.52 =C2=B1 46%  sched_debug.cpu.c=
pu_load[0].min
>      21913 =C2=B1  2%     +29.1%      28288 =C2=B1 14%  sched_debug.cpu.c=
urr->pid.avg
>      49953 =C2=B1  3%     +30.2%      65038 =C2=B1  0%  sched_debug.cpu.c=
urr->pid.max
>      23062 =C2=B1  2%     +30.1%      29996 =C2=B1  4%  sched_debug.cpu.c=
urr->pid.stddev
>     274.39 =C2=B1  5%     -10.2%     246.27 =C2=B1  3%  sched_debug.cpu.n=
r_uninterruptible.max
>     242.73 =C2=B1  4%     -13.5%     209.90 =C2=B1  2%  sched_debug.cpu.n=
r_uninterruptible.stddev
> =

> Best Regards,
> Huang, Ying

--===============4251585602485018721==--

