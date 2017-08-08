Content-Type: multipart/mixed; boundary="===============2159863420219005107=="
MIME-Version: 1.0
From: Nadav Amit <nadav.amit@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 7674270022: will-it-scale.per_process_ops -19.3% regression
Date: Mon, 07 Aug 2017 21:23:34 -0700
Message-ID: <93CA4B47-95C2-43A2-8E92-B142CAB1DAF7@gmail.com>
In-Reply-To: <20170808022830.GA28570@bbox>
List-Id: <oe-lkp.lists.linux.dev>

--===============2159863420219005107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Minchan Kim <minchan@kernel.org> wrote:

> Hi,
> =

> On Tue, Aug 08, 2017 at 09:19:23AM +0800, kernel test robot wrote:
>> Greeting,
>> =

>> FYI, we noticed a -19.3% regression of will-it-scale.per_process_ops due=
 to commit:
>> =

>> =

>> commit: 76742700225cad9df49f05399381ac3f1ec3dc60 ("mm: fix MADV_[FREE|DO=
NTNEED] TLB flush miss problem")
>> url: https://github.com/0day-ci/linux/commits/Nadav-Amit/mm-migrate-prev=
ent-racy-access-to-tlb_flush_pending/20170802-205715
>> =

>> =

>> in testcase: will-it-scale
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 64G memory
>> with following parameters:
>> =

>> 	nr_task: 16
>> 	mode: process
>> 	test: brk1
>> 	cpufreq_governor: performance
>> =

>> test-description: Will It Scale takes a testcase and runs it from 1 thro=
ugh to n parallel copies to see if the testcase will scale. It builds both =
a process and threads based test in order to see any differences between th=
e two.
>> test-url: https://github.com/antonblanchard/will-it-scale
> =

> Thanks for the report.
> Could you explain what kinds of workload you are testing?
> =

> Does it calls frequently madvise(MADV_DONTNEED) in parallel on multiple
> threads?

According to the description it is "testcase:brk increase/decrease of one
page=E2=80=9D. According to the mode it spawns multiple processes, not thre=
ads.

Since a single page is unmapped each time, and the iTLB-loads increase
dramatically, I would suspect that for some reason a full TLB flush is
caused during do_munmap().

If I find some free time, I=E2=80=99ll try to profile the workload - but fe=
el free
to beat me to it.

Nadav =



--===============2159863420219005107==--

