Content-Type: multipart/mixed; boundary="===============1373572754866453634=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Wed, 08 Jun 2016 11:58:11 +0300
Message-ID: <20160608085811.GB12655@black.fi.intel.com>
In-Reply-To: <8760tk5aym.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1373572754866453634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2016 at 04:41:37PM +0800, Huang, Ying wrote:
> "Huang, Ying" <ying.huang@intel.com> writes:
> =

> > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> writes:
> >
> >> On Mon, Jun 06, 2016 at 10:27:24AM +0800, kernel test robot wrote:
> >>> =

> >>> FYI, we noticed a -6.3% regression of unixbench.score due to commit:
> >>> =

> >>> commit 5c0a85fad949212b3e059692deecdeed74ae7ec7 ("mm: make faultaroun=
d produce old ptes")
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
> >>> =

> >>> in testcase: unixbench
> >>> on test machine: lituya: 16 threads Haswell High-end Desktop (i7-5960=
X 3.0G) with 16G memory
> >>> with following parameters: cpufreq_governor=3Dperformance/nr_task=3D1=
/test=3Dshell8
> >>> =

> >>> =

> >>> Details are as below:
> >>> ---------------------------------------------------------------------=
----------------------------->
> >>> =

> >>> =

> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/test=
case:
> >>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/litu=
ya/shell8/unixbench
> >>> =

> >>> commit: =

> >>>   4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
> >>>   5c0a85fad949212b3e059692deecdeed74ae7ec7
> >>> =

> >>> 4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

> >>> ---------------- -------------------------- =

> >>>        fail:runs  %reproduction    fail:runs
> >>>            |             |             |    =

> >>>           3:4          -75%            :4     kmsg.DHCP/BOOTP:Reply_n=
ot_for_us,op[#]xid[#]
> >>>          %stddev     %change         %stddev
> >>>              \          |                \  =

> >>>      14321 .  0%      -6.3%      13425 .  0%  unixbench.score
> >>>    1996897 .  0%      -6.1%    1874635 .  0%  unixbench.time.involunt=
ary_context_switches
> >>>  1.721e+08 .  0%      -6.2%  1.613e+08 .  0%  unixbench.time.minor_pa=
ge_faults
> >>>     758.65 .  0%      -3.0%     735.86 .  0%  unixbench.time.system_t=
ime
> >>>     387.66 .  0%      +5.4%     408.49 .  0%  unixbench.time.user_time
> >>>    5950278 .  0%      -6.2%    5583456 .  0%  unixbench.time.voluntar=
y_context_switches
> >>
> >> That's weird.
> >>
> >> I don't understand why the change would reduce number or minor faults.
> >> It should stay the same on x86-64. Rise of user_time is puzzling too.
> >
> > unixbench runs in fixed time mode.  That is, the total time to run
> > unixbench is fixed, but the work done varies.  So the minor_page_faults
> > change may reflect only the work done.
> >
> >> Hm. Is reproducible? Across reboot?
> >
> =

> And FYI, there is no swap setup for test, all root file system including
> benchmark files are in tmpfs, so no real page reclaim will be
> triggered.  But it appears that active file cache reduced after the
> commit.
> =

>     111331 =C2=B1  1%     -13.3%      96503 =C2=B1  0%  meminfo.Active
>      27603 =C2=B1  1%     -43.9%      15486 =C2=B1  0%  meminfo.Active(fi=
le)
> =

> I think this is the expected behavior of the commit?

Yes, it's expected.

After the change faularound would produce old pte. It means there's more
chance for these pages to be on inactive lru, unless somebody actually
touch them and flip accessed bit.

I wounder if this regression can attributed to cost of setting accessed
bit. It looks too high, but who knows.

I don't have time to do testing myself right now. I will put this on todo
list.

-- =

 Kirill A. Shutemov

--===============1373572754866453634==--

