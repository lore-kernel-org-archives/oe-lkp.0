Content-Type: multipart/mixed; boundary="===============9198962647212573576=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] f3344adf38: fxmark.hdd_btrfs_DWAL_63_bufferedio.works/sec -52.4% regression
Date: Fri, 19 Mar 2021 11:21:44 +0800
Message-ID: <20210319032144.GA69344@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=wi1KcOZo4JeRDgJCU0gB5v16q6GJsFtF365MSfM8hH3zA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9198962647212573576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Mar 15, 2021 at 01:42:50PM -0700, Linus Torvalds wrote:
> On Sun, Mar 14, 2021 at 11:30 PM kernel test robot
> <oliver.sang@intel.com> wrote:
> >
> > FYI, we noticed a -52.4% regression of fxmark.hdd_btrfs_DWAL_63_buffere=
dio.works/sec
> =

> That's quite the huge regression.
> =

> But:
> =

> > due to commit: f3344adf38bd ("mm: memcontrol: optimize per-lruvec stats=
 counter memory usage")
> =

> That's _literally_ just changing a dynamically allocated per-cpu array
> of "long[]" to an array of "s32[]" and in the process shrinking it
> from 304 bytes to 152 bytes.
> =

> > in testcase: fxmark
> > on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory
> =

> I think this must be some really random memory layout issue that
> causes some false sharing or similar.
> =

> And it's not even that some fundamental data structure gets a
> different layout, it literally is just either:
> =

>  (a) the (now smaller) array is allocated from a differently chunk,
> and that then causes random cache effects with something else
> =

>  (b) the (old, and bigger) array was more spread out, and as a result
> had different fields in different cachelines and less false sharing
> =

> Normally I'd say that (b) is the obvious case, except for the fact
> that this is a __percpu array.
> =

> So in the common case there shouldn't be any cache contention _within_
> the array itself. Any cache contention should be with something else
> very hot that the change now randomly makes be in the same cache way
> or whatever.
> =

> Afaik, only the flushing of the vmstats batches does access the percpu
> arrays from other CPUs, so (b) is not _entirely_ impossible if
> memcg_flush_percpu_vmstats() were to be very very very hot.
> =

> But the profile data doesn't show anything remotely like that.
> =

> In fact, the actual report seems to show things improving, ie things
> like elapsed time going down:
> =

> >       1361            -9.5%       1232        fxmark.time.elapsed_time
> >       1361            -9.5%       1232        fxmark.time.elapsed_time.=
max
> >      25.67            +9.1%      28.00        fxmark.time.percent_of_cp=
u_this_job_got
> >     343.68            -2.0%     336.76        fxmark.time.system_time
> >      23.66            +2.5       26.12        mpstat.cpu.all.sys%
> =

> but I don't know what the benchmark actually does, so maybe it just
> repeats things until it hits a certain confidence interval, and thus
> "elapsed time" is immaterial.

I just checked the benchmark, seems it benchmarks the filesystem's
scalability by doing file/inode opertions with different task numbers
(from 1 to nr_cpus).

The benchmark has preparation and cleanup steps before/after every
run, and for the 100 less seconds of 'fxmark.time.elapsed_time' you
found, it is due to the newer kernel spends 100 seconds more in the
cleanup step after run ( a point worth checking) =


> Honestly, normally if I were to get a report about "52% regression"
> for a commit that is supposed to optimize something, I'd just revert
> the commit as a case of "ok, that optimization clearly didn't work".
> =

> But there is absolutely no sign that this commit is actually the
> culprit, or explanation for why that should be, and what could be
> going on.
> =

> So I'm going to treat this as a "bisection failure, possibly due to
> random code or data layout changes". Particularly since this seems to
> be a 4-socket Xeon Phi machine, which I think is likely a very very
> fragile system if there is some odd cache layout issue.

Oliver retested it and made it run 12 times in total, and the data
is consistent. We tried some other test:
* run other sub cases of this 'fxmark' which sees no regression
* change 'btrfs' to 'ext4' of this case, and no regression
* test  on Cascadelake platform, no regression

So the bitsection seems to be stable, though can't be explained yet. =


We checked the System map of the 2 kernels, and didn't find obvious
code/data alignment change, which is expected, as the commit changes
data structure which is usually dynamically allocated. =


Anyway, we will keep checking this and report back when there is
new data.

> If somebody can actually figure out what happened there, that would be
> good, but for now it goes into my "archived as a random outlier"
> folder.

Agreed. We shouldn't take actions before this change is root caused. =


Thanks,
Feng

>                  Linus
--===============9198962647212573576==--

