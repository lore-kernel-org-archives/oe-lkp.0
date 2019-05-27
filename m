Content-Type: multipart/mixed; boundary="===============2335669039794656562=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 302167c50b: fio.write_bw_MBps -12.4% regression
Date: Mon, 27 May 2019 08:38:54 +0800
Message-ID: <87r28k91ep.fsf@yhuang-dev.intel.com>
In-Reply-To: <20190524143558.mem7gircjjmut54f@MacBook-Pro-91.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============2335669039794656562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Josef Bacik <josef@toxicpanda.com> writes:

> On Fri, May 24, 2019 at 03:46:17PM +0800, Huang, Ying wrote:
>> "Huang, Ying" <ying.huang@intel.com> writes:
>> =

>> > "Huang, Ying" <ying.huang@intel.com> writes:
>> >
>> >> Hi, Josef,
>> >>
>> >> kernel test robot <rong.a.chen@intel.com> writes:
>> >>
>> >>> Greeting,
>> >>>
>> >>> FYI, we noticed a -12.4% regression of fio.write_bw_MBps due to comm=
it:
>> >>>
>> >>>
>> >>> commit: 302167c50b32e7fccc98994a91d40ddbbab04e52 ("btrfs: don't end
>> >>> the transaction for delayed refs in throttle")
>> >>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git pen=
ding-fixes
>> >>>
>> >>> in testcase: fio-basic
>> >>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 64G memory
>> >>> with following parameters:
>> >>>
>> >>> 	runtime: 300s
>> >>> 	nr_task: 8t
>> >>> 	disk: 1SSD
>> >>> 	fs: btrfs
>> >>> 	rw: randwrite
>> >>> 	bs: 4k
>> >>> 	ioengine: sync
>> >>> 	test_size: 400g
>> >>> 	cpufreq_governor: performance
>> >>> 	ucode: 0xb00002e
>> >>>
>> >>> test-description: Fio is a tool that will spawn a number of threads
>> >>> or processes doing a particular type of I/O action as specified by
>> >>> the user.
>> >>> test-url: https://github.com/axboe/fio
>> >>>
>> >>>
>> >>
>> >> Do you have time to take a look at this regression?
>> >
>> > Ping
>> =

>> Ping again.
>> =

>
> This happens because now we rely more on on-demand flushing than the catc=
hup
> flushing that happened before.  This is just one case where it's slightly=
 worse,
> overall this change provides better latencies, and even in this result it
> provided better completion latencies because we're not randomly flushing =
at the
> end of a transaction.  It does appear to be costing writes in that they w=
ill
> spend more time flushing than before, so you get slightly lower throughpu=
t on
> pure small write workloads.  I can't actually see the slowdown locally.
>
> This patch is here to stay, it just shows we need to continue to refine t=
he
> flushing code to be less spikey/painful.  Thanks,

Thanks for detailed explanation.  We will ignore this regression.

Best Regards,
Huang, Ying

--===============2335669039794656562==--

