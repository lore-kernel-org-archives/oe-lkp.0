Content-Type: multipart/mixed; boundary="===============1252259273046855370=="
MIME-Version: 1.0
From: Nadav Amit <nadav.amit@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 7674270022: will-it-scale.per_process_ops -19.3% regression
Date: Mon, 07 Aug 2017 22:51:00 -0700
Message-ID: <970B5DC5-BFC2-461E-AC46-F71B3691D301@gmail.com>
In-Reply-To: <93CA4B47-95C2-43A2-8E92-B142CAB1DAF7@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1252259273046855370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nadav Amit <nadav.amit@gmail.com> wrote:

> Minchan Kim <minchan@kernel.org> wrote:
> =

>> Hi,
>> =

>> On Tue, Aug 08, 2017 at 09:19:23AM +0800, kernel test robot wrote:
>>> Greeting,
>>> =

>>> FYI, we noticed a -19.3% regression of will-it-scale.per_process_ops du=
e to commit:
>>> =

>>> =

>>> commit: 76742700225cad9df49f05399381ac3f1ec3dc60 ("mm: fix MADV_[FREE|D=
ONTNEED] TLB flush miss problem")
>>> url: https://github.com/0day-ci/linux/commits/Nadav-Amit/mm-migrate-pre=
vent-racy-access-to-tlb_flush_pending/20170802-205715
>>> =

>>> =

>>> in testcase: will-it-scale
>>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz w=
ith 64G memory
>>> with following parameters:
>>> =

>>> 	nr_task: 16
>>> 	mode: process
>>> 	test: brk1
>>> 	cpufreq_governor: performance
>>> =

>>> test-description: Will It Scale takes a testcase and runs it from 1 thr=
ough to n parallel copies to see if the testcase will scale. It builds both=
 a process and threads based test in order to see any differences between t=
he two.
>>> test-url: https://github.com/antonblanchard/will-it-scale
>> =

>> Thanks for the report.
>> Could you explain what kinds of workload you are testing?
>> =

>> Does it calls frequently madvise(MADV_DONTNEED) in parallel on multiple
>> threads?
> =

> According to the description it is "testcase:brk increase/decrease of one
> page=E2=80=9D. According to the mode it spawns multiple processes, not th=
reads.
> =

> Since a single page is unmapped each time, and the iTLB-loads increase
> dramatically, I would suspect that for some reason a full TLB flush is
> caused during do_munmap().
> =

> If I find some free time, I=E2=80=99ll try to profile the workload - but =
feel free
> to beat me to it.

The root-cause appears to be that tlb_finish_mmu() does not call
dec_tlb_flush_pending() - as it should. Any chance you can take care of it?

Having said that it appears that cpumask_any_but() is really inefficient
since it does not have an optimization for the case in which
small_const_nbits(nbits)=3D=3Dtrue. When I find some free time, I=E2=80=99l=
l try to deal
with it.

Thanks,
Nadav
--===============1252259273046855370==--

