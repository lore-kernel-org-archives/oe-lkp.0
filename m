Content-Type: multipart/mixed; boundary="===============0074096356470513645=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [iversion] c0cef30e4f: aim7.jobs-per-min -18.0% regression
Date: Tue, 27 Feb 2018 08:29:09 -0500
Message-ID: <1519738149.4300.45.camel@redhat.com>
In-Reply-To: <8b48844f-7f9a-a9d7-b5bc-3bc403e0fa78@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0074096356470513645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-02-27 at 15:42 +0800, kemi wrote:
> =

> On 2018=E5=B9=B402=E6=9C=8826=E6=97=A5 20:33, Jeff Layton wrote:
> > On Mon, 2018-02-26 at 06:43 -0500, Jeff Layton wrote:
> > > On Mon, 2018-02-26 at 16:38 +0800, Ye Xiaolong wrote:
> > > > On 02/25, Jeff Layton wrote:
> > > > > On Sun, 2018-02-25 at 23:05 +0800, kernel test robot wrote:
> > > > > > Greeting,
> > > > > > =

> > > > > > FYI, we noticed a -18.0% regression of aim7.jobs-per-min due to=
 commit:
> > > > > > =

> > > > > > =

> > > > > > commit: c0cef30e4ff0dc025f4a1660b8f0ba43ed58426e ("iversion: ma=
ke inode_cmp_iversion{+raw} return bool instead of s64")
> > > > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=
 master
> > > > > > =

> > > > > > in testcase: aim7
> > > > > > on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3=
.00GHz with 384G memory
> > > > > > with following parameters:
> > > > > > =

> > > > > > 	disk: 4BRD_12G
> > > > > > 	md: RAID0
> > > > > > 	fs: xfs
> > > > > > 	test: disk_src
> > > > > > 	load: 3000
> > > > > > 	cpufreq_governor: performance
> > > > > > =

> > > > > > test-description: AIM7 is a traditional UNIX system level bench=
mark suite which is used to test and measure the performance of multiuser s=
ystem.
> > > > > > test-url: https://sourceforge.net/projects/aimbench/files/aim-s=
uite7/
> > > > > > =

> > > > > > =

> > > > > =

> > > > > I'm a bit suspicious of this result.
> > > > > =

> > > > > This patch only changes inode_cmp_iversion{+raw} (since renamed to
> > > > > inode_eq_iversion{+raw}), and that neither should ever be called =
from
> > > > > xfs. The patch is fairly trivial too, and I wouldn't expect a big
> > > > > performance hit.
> > > > =

> > > > I tried to queue 4 more times test for both commit c0cef30e4f and i=
ts parent,
> > > > the result seems quite stable.
> > > > =

> > > > c0cef30e4ff0dc025f4a1660b8f0ba43ed58426e:
> > > >  "aim7.jobs-per-min": [
> > > >     32964.01,
> > > >     32938.68,
> > > >     33068.18,
> > > >     32886.32,
> > > >     32843.72,
> > > >     32798.83,
> > > >     32898.34,
> > > >     32952.55
> > > >   ],
> > > > =

> > > > 3da90b159b146672f830bcd2489dd3a1f4e9e089:
> > > >   "aim7.jobs-per-min": [
> > > >     40239.65,
> > > >     40163.33,
> > > >     40353.32,
> > > >     39976.9,
> > > >     40185.75,
> > > >     40411.3,
> > > >     40213.58,
> > > >     39900.69
> > > >   ],
> > > > =

> > > > Any other test data you may need?
> > > > =

> > > > > =

> > > > > Is IMA involved here at all? I didn't see any evidence of it, but=
 the
> > > > > kernel config did have it enabled.
> > > > > =

> > > > =

> > > > Sorry, not quite familiar with IMA, could you tell more about how t=
o check it?
> > > > =

> > > =

> > > Thanks for retesting it, but I'm at a loss for why we're seeing this:
> > > =

> > > IMA is the the integrity management subsystem. It will use the iversi=
on
> > > field to determine whether to remeasure files during remeasurement.  =
It
> > > looks like the kernel config has it enabled, but it doesn't look like
> > > it's in use, based on the info in the initial report.
> > > =

> > > This patch only affects two inlined functions inode_cmp_iversion and
> > > inode_cmp_iversion_raw. The patch is pretty trivial (as Linus points
> > > out). These functions are only called from IMA and fs-specific code
> > > (usually in readdir implementations to detect directory changes).
> > > =

> > > XFS does not call either of these functions however, so I'm a little
> > > unclear on how this patch could slow anything down on this test. The
> > > only thing I can think to do here would be to profile this and see wh=
at
> > > stands out.
> > > =

> > > Note that we do need to keep this in perspective too. This 18%
> > > regression on this test follows around a ~230% improvement that occur=
red
> > > when we merged the bulk of these patches. It's should still be quite a
> > > bit faster than the v4.15 in this regard.
> > > =

> > > Still, it'd be good to understand what's going on here.
> > > =

> > > =

> > =

> > Could we see the dmesg from this boot? It'd be good to confirm that IMA
> > is not involved here, as that's the only place that I can see that would
> > call into this code at all here.
> > =

> =

> See attachment for info on dmesg/perf-profile/compare_result.
> Feel free to let Xiaolong or me know if anything else you would like to c=
heck.
> =


Many thanks,

Only one caller of the functions touched by this patch shows up in the
profiles: ima_file_free. That calls ima_check_last_writer, which calls
inode_cmp_iversion. The lines from the profiles show:

3da90b159b146672f830bcd2489dd3a1f4e9e089:
     0.00%     0.00%  [kernel.kallsyms]   [k] ima_file_free

c0cef30e4ff0dc025f4a1660b8f0ba43ed58426e:
     0.01%     0.01%  [kernel.kallsyms]   [k] ima_file_free

Seems pretty insignificant, but perhaps that is somehow accounting for
the difference. This is called when a file is freed so there could be an
effect I guess if we're closing a lot of files for write.

Looking at the disassembly from the builds on my box there is some
slight difference, since we did  alter the implementation.
inode->iversion is 0x150 bytes into the struct on my builds:

3da90b159b146672f830bcd2489dd3a1f4e9e089:

   0xffffffff813ae858 <+136>:	je     0xffffffff813ae871 <ima_file_free+161>
   0xffffffff813ae85a <+138>:	mov    0x150(%rbp),%rsi
   0xffffffff813ae861 <+145>:	mov    0x20(%rax),%rcx
   0xffffffff813ae865 <+149>:	and    $0xfffffffffffffffe,%rsi
   0xffffffff813ae869 <+153>:	add    %rcx,%rcx
   0xffffffff813ae86c <+156>:	cmp    %rcx,%rsi
   0xffffffff813ae86f <+159>:	je     0xffffffff813ae899 <ima_file_free+201>

c0cef30e4ff0dc025f4a1660b8f0ba43ed58426e:

   0xffffffff813ae828 <+136>:	je     0xffffffff813ae83a <ima_file_free+154>
   0xffffffff813ae82a <+138>:	mov    0x150(%rbp),%rcx
   0xffffffff813ae831 <+145>:	shr    %rcx
   0xffffffff813ae834 <+148>:	cmp    %rcx,0x20(%rax)
   0xffffffff813ae838 <+152>:	je     0xffffffff813ae862 <ima_file_free+194>

The patched one looks like it ought to be more efficient. It's certainly
fewer instructions and it doesn't touch %rsi now. Are shifts more
expensive?

In any case, what might be good at this point as a sanity check is to
turn off CONFIG_IMA and recheck this. That should tell us whether we're
on the right track here. With that disabled, this patch should have no
effect on anything at all.

Thanks,
-- =

Jeff Layton <jlayton@redhat.com>

--===============0074096356470513645==--

