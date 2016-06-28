Content-Type: multipart/mixed; boundary="===============7189227792650891721=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0329dacce8: pigz.throughput 95.9% improvement
Date: Tue, 28 Jun 2016 09:08:43 -0700
Message-ID: <87shvx47p0.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160628065756.GT30921@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7189227792650891721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Peter Zijlstra <peterz@infradead.org> writes:

> On Tue, Jun 28, 2016 at 09:53:11AM +0800, kernel test robot wrote:
>> =

>> FYI, we noticed a 95.9% improvement of pigz.throughput due to commit:
>> =

>> commit 0329dacce87d6741b391d73cab1ec831a3262d6b ("sched/fair: Fix effect=
ive_load()")
>> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/u=
rgent
>> =

>> in testcase: pigz
>> on test machine: Sandy Bridge-EP with 32G memory
>> with following parameters: blocksize=3D128K/cpufreq_governor=3Dperforman=
ce/nr_threads=3D100%
>
> Ok, so where and what is pigz ? There doesn't seem to be anything useful
> included in this email to give clue.

We are working on the better description of testcase in report email
now.

For pigz, here is the home page: http://zlib.net/pigz/

Best Regards,
Huang, Ying

--===============7189227792650891721==--

