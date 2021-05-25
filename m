Content-Type: multipart/mixed; boundary="===============8125118293503460838=="
MIME-Version: 1.0
From: Chris Goldsworthy <cgoldswo@codeaurora.org>
To: lkp@lists.01.org
Subject: Re: [mm] 8cc621d2f4: fio.write_iops -21.8% regression
Date: Tue, 25 May 2021 09:53:49 -0700
Message-ID: <48d281469120cbed8aa58cd5f108ed47@codeaurora.org>
In-Reply-To: <YK0Us01mBTRWOQIw@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8125118293503460838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-05-25 08:16, Minchan Kim wrote:
> On Mon, May 24, 2021 at 10:37:49AM -0700, Chris Goldsworthy wrote:
>> Hi Minchan,
>> =

>> This looks good to me, I just have some minor feedback.
>> =

>> Thanks,
> =

> Hi Chris,
> =

> Thanks for the review. Please see below.
> =

>> =

>> Chris.
>> =

>> On 2021-05-20 11:36, Minchan Kim wrote:
>> > On Thu, May 20, 2021 at 04:31:44PM +0800, kernel test robot wrote:
>> > >
>> > >
>> > > Greeting,
>> > >
>> > > FYI, we noticed a -21.8% regression of fio.write_iops due to commit:
>> > >
>> > >
>> > > commit: 8cc621d2f45ddd3dc664024a647ee7adf48d79a5 ("mm: fs:
>> > > invalidate BH LRU during page migration")
>> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mast=
er
>> > >
>> > >
>> > > in testcase: fio-basic
>> > > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU
>> > > @ 2.10GHz with 256G memory
>> > > with following parameters:
>> > >
>> > > 	disk: 2pmem
>> > > 	fs: ext4
>> > > 	runtime: 200s
>> > > 	nr_task: 50%
>> > > 	time_based: tb
>> > > 	rw: randwrite
>> > > 	bs: 4k
>> > > 	ioengine: libaio
>> > > 	test_size: 200G
>> > > 	cpufreq_governor: performance
>> > > 	ucode: 0x5003006
>> > >
>> > > test-description: Fio is a tool that will spawn a number of threads
>> > > or processes doing a particular type of I/O action as specified by
>> > > the user.
>> > > test-url: https://github.com/axboe/fio
>> > >
>> > >
>> > >
>> > > If you fix the issue, kindly add following tag
>> > > Reported-by: kernel test robot <oliver.sang@intel.com>
>> > >
>> > >
>> > > Details are as below:
>> > > --------------------------------------------------------------------=
------------------------------>
>> > >
>> > >
>> > > To reproduce:
>> > >
>> > >         git clone https://github.com/intel/lkp-tests.git
>> > >         cd lkp-tests
>> > >         bin/lkp install                job.yaml  # job file is
>> > > attached in this email
>> > >         bin/lkp split-job --compatible job.yaml  # generate the yaml
>> > > file for lkp run
>> > >         bin/lkp run                    generated-yaml-file
>> >
>> > Hi,
>> >
>> > I tried to insall the lkp-test in my machine by following above guide
>> > but failed
>> > due to package problems(I guess it's my problem since I use something
>> > particular
>> > environement). However, I guess it comes from increased miss ratio of
>> > bh_lrus
>> > since the patch caused more frequent invalidation of the bh_lrus calls
>> > compared
>> > to old. For example, lru_add_drain could be called from several hot
>> > places(e.g.,
>> > unmap and pagevec_release from several path) and it could keeps
>> > invalidating
>> > bh_lrus.
>> >
>> > IMO, we should move the overhead from such hot path to cold one. How
>> > about this?
>> >
>> > From ebf4ede1cf32fb14d85f0015a3693cb8e1b8dbfe Mon Sep 17 00:00:00 2001
>> > From: Minchan Kim <minchan@kernel.org>
>> > Date: Thu, 20 May 2021 11:17:56 -0700
>> > Subject: [PATCH] invalidate bh_lrus only at lru_add_drain_all
>> >
>> > Not-Yet-Signed-off-by: Minchan Kim <minchan@kernel.org>
>> > ---
>> >  mm/swap.c | 15 +++++++++++++--
>> >  1 file changed, 13 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/mm/swap.c b/mm/swap.c
>> > index dfb48cf9c2c9..d6168449e28c 100644
>> > --- a/mm/swap.c
>> > +++ b/mm/swap.c
>> > @@ -642,7 +642,6 @@ void lru_add_drain_cpu(int cpu)
>> >  		pagevec_lru_move_fn(pvec, lru_lazyfree_fn);
>> >
>> >  	activate_page_drain(cpu);
>> > -	invalidate_bh_lrus_cpu(cpu);
>> >  }
>> >
>> >  /**
>> > @@ -725,6 +724,17 @@ void lru_add_drain(void)
>> >  	local_unlock(&lru_pvecs.lock);
>> >  }
>> >
>> > +void lru_and_bh_lrus_drain(void)
>> > +{
>> > +	int cpu;
>> > +
>> > +	local_lock(&lru_pvecs.lock);
>> > +	cpu =3D smp_processor_id();
>> > +	lru_add_drain_cpu(cpu);
>> > +	local_unlock(&lru_pvecs.lock);
>> > +	invalidate_bh_lrus_cpu(cpu);
>> > +}
>> > +
>> =

>> Nit: drop int cpu?
> =

> Do you mean to suggest using smp_processor_id at both places
> instead of local varaible? Since the invalidate_bh_lrus_cpu
> is called out of the lru_pvecs.lock, I wanted to express
> the draining happens at the same CPU via storing the CPU.

Ah, got it.

>> =

>> >  void lru_add_drain_cpu_zone(struct zone *zone)
>> >  {
>> >  	local_lock(&lru_pvecs.lock);
>> > @@ -739,7 +749,7 @@ static DEFINE_PER_CPU(struct work_struct,
>> > lru_add_drain_work);
>> >
>> >  static void lru_add_drain_per_cpu(struct work_struct *dummy)
>> >  {
>> > -	lru_add_drain();
>> > +	lru_and_bh_lrus_drain();
>> >  }
>> >
>> >  /*
>> > @@ -881,6 +891,7 @@ void lru_cache_disable(void)
>> >  	__lru_add_drain_all(true);
>> >  #else
>> >  	lru_add_drain();
>> > +	invalidate_bh_lrus_cpu(smp_processor_id());
>> >  #endif
>> >  }
>> =

>> Can't we replace the call to lru_add_drain() and
>> invalidate_bh_lrus_cpu(smp_processor_id()) with a single call to
>> lru_and_bh_lrus_drain()?
> =

> Good idea.
> =

> Thanks!

-- =

The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora =

Forum,
a Linux Foundation Collaborative Project
--===============8125118293503460838==--

