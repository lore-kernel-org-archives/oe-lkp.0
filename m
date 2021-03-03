Content-Type: multipart/mixed; boundary="===============8855069342180187695=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] b360fb5e59: stress-ng.vm-segv.ops_per_sec -13.9% regression
Date: Wed, 03 Mar 2021 18:34:13 +0000
Message-ID: <jhjy2f46q8q.mognet@arm.com>
In-Reply-To: <jhjim6jhsfp.mognet@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8855069342180187695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 23/02/21 12:36, Valentin Schneider wrote:
> On 23/02/21 10:30, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -13.9% regression of stress-ng.vm-segv.ops_per_sec due=
 to commit:
>>
>>
>> commit: b360fb5e5954a8a440ef95bf11257e2e7ea90340 ("[PATCH v2 1/7] sched/=
fair: Ignore percpu threads for imbalance pulls")
>> url: https://github.com/0day-ci/linux/commits/Valentin-Schneider/sched-f=
air-misfit-task-load-balance-tweaks/20210219-211028
>> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git c5e6fc08f=
eb2b88dc5dac2f3c817e1c2a4cafda4
>>
>> in testcase: stress-ng
>> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz wit=
h 512G memory
>> with following parameters:
>>
>>      nr_threads: 10%
>>      disk: 1HDD
>>      testtime: 60s
>>      fs: ext4
>>      class: vm
>>      test: vm-segv
>>      cpufreq_governor: performance
>>      ucode: 0x5003003
>>

So I've been running this on my 32 CPU arm64 desktop with:
  nr_threads: 10%
  nr_threads: 50%
  (20 iterations each)

In the 50% case I see a ~2% improvement, in the 10% a -0.3%
regression (another batch showed -0.08%)... Still far off from the reported
-14%. If it's really required I can go find an x86 box to test this on, but
so far it looks like a fluke.
--===============8855069342180187695==--

