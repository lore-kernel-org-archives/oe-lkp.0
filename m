Content-Type: multipart/mixed; boundary="===============2140658749826835492=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Thu, 16 Jun 2016 07:52:26 +0800
Message-ID: <877fdqxb5x.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160614143417.GC3571@node.shutemov.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============2140658749826835492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Kirill A. Shutemov" <kirill@shutemov.name> writes:

> On Tue, Jun 14, 2016 at 05:57:28PM +0900, Minchan Kim wrote:
>> On Wed, Jun 08, 2016 at 11:58:11AM +0300, Kirill A. Shutemov wrote:
>> > On Wed, Jun 08, 2016 at 04:41:37PM +0800, Huang, Ying wrote:
>> > > "Huang, Ying" <ying.huang@intel.com> writes:
>> > > =

>> > > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> writes:
>> > > >
>> > > >> On Mon, Jun 06, 2016 at 10:27:24AM +0800, kernel test robot wrote:
>> > > >>> =

>> > > >>> FYI, we noticed a -6.3% regression of unixbench.score due to com=
mit:
>> > > >>> =

>> > > >>> commit 5c0a85fad949212b3e059692deecdeed74ae7ec7 ("mm: make fault=
around produce old ptes")
>> > > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> > > >>> =

>> > > >>> in testcase: unixbench
>> > > >>> on test machine: lituya: 16 threads Haswell High-end Desktop (i7=
-5960X 3.0G) with 16G memory
>> > > >>> with following parameters: cpufreq_governor=3Dperformance/nr_tas=
k=3D1/test=3Dshell8
>> > > >>> =

>> > > >>> =

>> > > >>> Details are as below:
>> > > >>> ----------------------------------------------------------------=
---------------------------------->
>> > > >>> =

>> > > >>> =

>> > > >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > > >>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test=
/testcase:
>> > > >>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz=
/lituya/shell8/unixbench
>> > > >>> =

>> > > >>> commit: =

>> > > >>>   4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
>> > > >>>   5c0a85fad949212b3e059692deecdeed74ae7ec7
>> > > >>> =

>> > > >>> 4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

>> > > >>> ---------------- -------------------------- =

>> > > >>>        fail:runs  %reproduction    fail:runs
>> > > >>>            |             |             |    =

>> > > >>>           3:4          -75%            :4     kmsg.DHCP/BOOTP:Re=
ply_not_for_us,op[#]xid[#]
>> > > >>>          %stddev     %change         %stddev
>> > > >>>              \          |                \  =

>> > > >>>      14321 .  0%      -6.3%      13425 .  0%  unixbench.score
>> > > >>>    1996897 .  0%      -6.1%    1874635 .  0%  unixbench.time.inv=
oluntary_context_switches
>> > > >>>  1.721e+08 .  0%      -6.2%  1.613e+08 .  0%  unixbench.time.min=
or_page_faults
>> > > >>>     758.65 .  0%      -3.0%     735.86 .  0%  unixbench.time.sys=
tem_time
>> > > >>>     387.66 .  0%      +5.4%     408.49 .  0%  unixbench.time.use=
r_time
>> > > >>>    5950278 .  0%      -6.2%    5583456 .  0%  unixbench.time.vol=
untary_context_switches
>> > > >>
>> > > >> That's weird.
>> > > >>
>> > > >> I don't understand why the change would reduce number or minor fa=
ults.
>> > > >> It should stay the same on x86-64. Rise of user_time is puzzling =
too.
>> > > >
>> > > > unixbench runs in fixed time mode.  That is, the total time to run
>> > > > unixbench is fixed, but the work done varies.  So the minor_page_f=
aults
>> > > > change may reflect only the work done.
>> > > >
>> > > >> Hm. Is reproducible? Across reboot?
>> > > >
>> > > =

>> > > And FYI, there is no swap setup for test, all root file system inclu=
ding
>> > > benchmark files are in tmpfs, so no real page reclaim will be
>> > > triggered.  But it appears that active file cache reduced after the
>> > > commit.
>> > > =

>> > >     111331 .  1%     -13.3%      96503 .  0%  meminfo.Active
>> > >      27603 .  1%     -43.9%      15486 .  0%  meminfo.Active(file)
>> > > =

>> > > I think this is the expected behavior of the commit?
>> > =

>> > Yes, it's expected.
>> > =

>> > After the change faularound would produce old pte. It means there's mo=
re
>> > chance for these pages to be on inactive lru, unless somebody actually
>> > touch them and flip accessed bit.
>> =

>> Hmm, tmpfs pages should be in anonymous LRU list and VM shouldn't scan
>> anonymous LRU list on swapless system so I really wonder why active file
>> LRU is shrunk.
>
> Hm. Good point. I don't why we have anything on file lru if there's no
> filesystems except tmpfs.
>
> Ying, how do you get stuff to the tmpfs?

We put root file system and benchmark into a set of compressed cpio
archive, then concatenate them into one initrd, and finally kernel use
that initrd as initramfs.

Best Regards,
Huang, Ying

--===============2140658749826835492==--

