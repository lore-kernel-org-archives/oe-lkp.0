Content-Type: multipart/mixed; boundary="===============7003577047238468985=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] fbcc025613: -5.6% fsmark.files_per_sec
Date: Fri, 19 Feb 2016 17:49:32 +1100
Message-ID: <20160219064932.GX14668@dastard>
In-Reply-To: <87vb5lqunb.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7003577047238468985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2016 at 10:52:08AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit fbcc025613590d7b1d15521555dcc6393a148a6b ("xfs: Introduce writebac=
k context for writepages")
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/md/nr_threa=
ds/rootfs/sync_method/tbox_group/test_size/testcase:
>   gcc-4.9/performance/8BRD_12G/4M/xfs/1x/x86_64-rhel/RAID0/1t/debian-x86_=
64-2015-02-07.cgz/fsyncBeforeClose/lkp-hsx02/60G/fsmark
> =

> commit: =

>   150d5be09ce49a9bed6feb7b7dc4e5ae188778ec
>   fbcc025613590d7b1d15521555dcc6393a148a6b
> =

> 150d5be09ce49a9b fbcc025613590d7b1d15521555 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      36122 =C2=B1  0%     -57.4%      15404 =C2=B1  0%  fsmark.time.invol=
untary_context_switches
>      95.30 =C2=B1  0%      +1.8%      97.00 =C2=B1  0%  fsmark.time.perce=
nt_of_cpu_this_job_got
>      25339 =C2=B1 32%   +5756.0%    1483901 =C2=B1  1%  fsmark.time.volun=
tary_context_switches
>     881.80 =C2=B1 45%  +14258.5%     126613 =C2=B1 10%  latency_stats.hit=
s.wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filema=
p_write_and_wait_range.xfs_file_fsync.vfs_fsync_range.do_fsync.SyS_fsync.en=
try_SYSCALL_64_fastpath
>       3548 =C2=B1 48%  +11967.4%     428200 =C2=B1  7%  latency_stats.sum=
.wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap=
_write_and_wait_range.xfs_file_fsync.vfs_fsync_range.do_fsync.SyS_fsync.ent=
ry_SYSCALL_64_fastpath
.....
> 2016-02-17 22:08:15 mount -t xfs -o nobarrier,inode64 /dev/ram0 /fs/ram0
> 2016-02-17 22:08:16 ./fs_mark -d /fs/ram0/1 -n 10240 -L 1 -S 1 -s 4194304

Ok, so 10k x 4MB files, fsync after each. Let me go look.

So the problem above appears to be that fsync is waiting on 125,000
more pages to complete IO, causing a major increase in context
switches during fsync. With only 10000 files being created, that
mores than 10 pages per file that is being waited on.

That doesn't really seem right. The writeback should be done as a
single ioend, with a single completion, with a single setsize
transaction, adn then all the pages are marked clean sequentially.
The above behaviour implies we are ending up doing something like:

fsync proc		io completion
wait on page 0
			end page 0 writeback
			wake up page 0
wait on page 1
			end page 1 writeback
			wake up page 1
wait on page 2
			end page 2 writeback
			wake up page 2

Though in slightly larger batches than a single page (10 wakeups a
file, so batches of around 100 pages per wakeup?). i.e. the fsync
IO wait appears to be racing with IO completion marking pages as
done. I simply cannot see how the above change would cause that, as
it was simply a change in the IO submission code that doesn't affect
overall size or shape of the IOs being submitted.

This is a patch in the middle of a larger patch set - if any of the
patches in that series should affect behaviour, it's the commit a
couple further that removed the XFS page clustering code - that
changes the size and shape of the ioends and bios we build and
submit and so if anything is perturbing Io completion behaviour I'd
expect those to be the culprit....

Does this same problem context switch problem still exist when the
entire set of patches in the XFs series has been applied? I can't
reproduce it here locally with the entire series applied, but I have
only tested on 16p with 48GB RAM. The context switch rate does not
go above 3,000/s, regardless of whether I use a ramdisk or high
throughput SSDs. Tracing also clearly indicates a single 4MB ioend
is being build and submitted by the new code and so that implies
that the io completions that are occuring before and after this
patchset are identical, and so therefore the way pages are moving
from dirty -> writeback -> clean is identical before and after the
patch series.

So, like I said - this makes no sense to me from the perspective of
the change that you've bisected it down to. This smells to me of a
scheduler change in the linux-next tree, espcially as I can't
reproduce the behaviour with just the XFS commits in isolation on a
4.5-rc3 tree.

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============7003577047238468985==--

