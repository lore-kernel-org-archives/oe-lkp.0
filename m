Content-Type: multipart/mixed; boundary="===============2988119626700560804=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Thu, 16 Jun 2016 09:13:23 +0900
Message-ID: <20160616001323.GL17127@bbox>
In-Reply-To: <877fdqxb5x.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2988119626700560804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2016 at 07:52:26AM +0800, Huang, Ying wrote:
> "Kirill A. Shutemov" <kirill@shutemov.name> writes:
> =

> > On Tue, Jun 14, 2016 at 05:57:28PM +0900, Minchan Kim wrote:
> >> On Wed, Jun 08, 2016 at 11:58:11AM +0300, Kirill A. Shutemov wrote:
> >> > On Wed, Jun 08, 2016 at 04:41:37PM +0800, Huang, Ying wrote:
> >> > > "Huang, Ying" <ying.huang@intel.com> writes:
> >> > > =

> >> > > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> writes:
> >> > > >
> >> > > >> On Mon, Jun 06, 2016 at 10:27:24AM +0800, kernel test robot wro=
te:
> >> > > >>> =

> >> > > >>> FYI, we noticed a -6.3% regression of unixbench.score due to c=
ommit:
> >> > > >>> =

> >> > > >>> commit 5c0a85fad949212b3e059692deecdeed74ae7ec7 ("mm: make fau=
ltaround produce old ptes")
> >> > > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git master
> >> > > >>> =

> >> > > >>> in testcase: unixbench
> >> > > >>> on test machine: lituya: 16 threads Haswell High-end Desktop (=
i7-5960X 3.0G) with 16G memory
> >> > > >>> with following parameters: cpufreq_governor=3Dperformance/nr_t=
ask=3D1/test=3Dshell8
> >> > > >>> =

> >> > > >>> =

> >> > > >>> Details are as below:
> >> > > >>> --------------------------------------------------------------=
------------------------------------>
> >> > > >>> =

> >> > > >>> =

> >> > > >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> > > >>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/te=
st/testcase:
> >> > > >>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.c=
gz/lituya/shell8/unixbench
> >> > > >>> =

> >> > > >>> commit: =

> >> > > >>>   4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
> >> > > >>>   5c0a85fad949212b3e059692deecdeed74ae7ec7
> >> > > >>> =

> >> > > >>> 4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

> >> > > >>> ---------------- -------------------------- =

> >> > > >>>        fail:runs  %reproduction    fail:runs
> >> > > >>>            |             |             |    =

> >> > > >>>           3:4          -75%            :4     kmsg.DHCP/BOOTP:=
Reply_not_for_us,op[#]xid[#]
> >> > > >>>          %stddev     %change         %stddev
> >> > > >>>              \          |                \  =

> >> > > >>>      14321 .  0%      -6.3%      13425 .  0%  unixbench.score
> >> > > >>>    1996897 .  0%      -6.1%    1874635 .  0%  unixbench.time.i=
nvoluntary_context_switches
> >> > > >>>  1.721e+08 .  0%      -6.2%  1.613e+08 .  0%  unixbench.time.m=
inor_page_faults
> >> > > >>>     758.65 .  0%      -3.0%     735.86 .  0%  unixbench.time.s=
ystem_time
> >> > > >>>     387.66 .  0%      +5.4%     408.49 .  0%  unixbench.time.u=
ser_time
> >> > > >>>    5950278 .  0%      -6.2%    5583456 .  0%  unixbench.time.v=
oluntary_context_switches
> >> > > >>
> >> > > >> That's weird.
> >> > > >>
> >> > > >> I don't understand why the change would reduce number or minor =
faults.
> >> > > >> It should stay the same on x86-64. Rise of user_time is puzzlin=
g too.
> >> > > >
> >> > > > unixbench runs in fixed time mode.  That is, the total time to r=
un
> >> > > > unixbench is fixed, but the work done varies.  So the minor_page=
_faults
> >> > > > change may reflect only the work done.
> >> > > >
> >> > > >> Hm. Is reproducible? Across reboot?
> >> > > >
> >> > > =

> >> > > And FYI, there is no swap setup for test, all root file system inc=
luding
> >> > > benchmark files are in tmpfs, so no real page reclaim will be
> >> > > triggered.  But it appears that active file cache reduced after the
> >> > > commit.
> >> > > =

> >> > >     111331 .  1%     -13.3%      96503 .  0%  meminfo.Active
> >> > >      27603 .  1%     -43.9%      15486 .  0%  meminfo.Active(file)
> >> > > =

> >> > > I think this is the expected behavior of the commit?
> >> > =

> >> > Yes, it's expected.
> >> > =

> >> > After the change faularound would produce old pte. It means there's =
more
> >> > chance for these pages to be on inactive lru, unless somebody actual=
ly
> >> > touch them and flip accessed bit.
> >> =

> >> Hmm, tmpfs pages should be in anonymous LRU list and VM shouldn't scan
> >> anonymous LRU list on swapless system so I really wonder why active fi=
le
> >> LRU is shrunk.
> >
> > Hm. Good point. I don't why we have anything on file lru if there's no
> > filesystems except tmpfs.
> >
> > Ying, how do you get stuff to the tmpfs?
> =

> We put root file system and benchmark into a set of compressed cpio
> archive, then concatenate them into one initrd, and finally kernel use
> that initrd as initramfs.

I see.

Could you share your 4 full vmstat(/proc/vmstat) files?

old:

cat /proc/vmstat > before.old.vmstat
do benchmark
cat /proc/vmstat > after.old.vmstat

new:

cat /proc/vmstat > before.new.vmstat
do benchmark
cat /proc/vmstat > after.new.vmstat

IOW, I want to see stats related to reclaim.

Thanks.

--===============2988119626700560804==--

