Content-Type: multipart/mixed; boundary="===============4218238302119988488=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 2c83362734: pft.faults_per_sec_per_cpu -41.4% regression
Date: Sat, 02 Mar 2019 16:15:19 +0800
Message-ID: <87wolhn148.fsf@yhuang-dev.intel.com>
In-Reply-To: <20190228111023.GC9565@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4218238302119988488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mel Gorman <mgorman@techsingularity.net> writes:

> On Thu, Feb 28, 2019 at 03:17:51PM +0800, kernel test robot wrote:
>> Greeting,
>> =

>> FYI, we noticed a -41.4% regression of pft.faults_per_sec_per_cpu due to=
 commit:
>> =

>> =

>> commit: 2c83362734dad8e48ccc0710b5cd2436a0323893 ("sched/fair: Consider =
SD_NUMA when selecting the most idle group to schedule on")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>> in testcase: pft
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 64G memory
>> with following parameters:
>> =

>> 	runtime: 300s
>> 	nr_task: 50%
>> 	cpufreq_governor: performance
>> 	ucode: 0xb00002e
>> =

>
> The headline regression looks high but it's also a known consequence for
> some microbenchmarks, particularly those that are short-lived and consist
> of non-communicating tasks.
>
> The impact of the patch is to favour starting a new task on the local
> node unless the socket is saturated. This is to avoid a pattern where a
> task that clones a helper that it communicates with starts on a remote
> node. Starting remote negatively impacts basis workloads like
> shellscripts, client/server workloads or pipelined tasks. The workloads
> that benefit from spreading early are parallelised tasks that do not
> communicate until end of the task.
>
> PFT is an example of the latter. If spread early, it maximises the total
> memory bandwidth of the machine early in the lifetime of the machine. It
> would quickly recover if it run long enough, the early measurements are
> low as it saturates the bandwidth of the local node. This configuration
> is at 50% and the machine is likely to be 2-socket so it has half the
> bandwidth in all likelihood and hence the 41.4% regression (very close
> to half so some tasks probably got load-balanced).
>
> On to the other examples;
>
>> test-description: Pft is the page fault test micro benchmark.
>> test-url: https://github.com/gormanm/pft
>> =

>> In addition to that, the commit also has significant impact on the follo=
wing tests:
>> =

>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | stream:                                            =
                      |
>> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 128G memory    |
>> | test parameters  | array_size=3D10000000                              =
                        |
>> |                  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_threads=3D25%                                   =
                        |
>> |                  | omp=3Dtrue                                         =
                        |
>> |                  | ucode=3D0xb00002e                                  =
                        |
>
> STREAM is typically short-lived. Again, it benefits from spreading early
> to maximise memory bandwidth. 25% of threads would fit in one node. For
> parallelised stream tests it's usually the case that OMP is used to bind 1
> thread per memory channel using the openmp directives to measure the total
> machine memory bandwidth rather than using it as a scaling tests. I'm
> guessing this machine didn't have 22 memory channels that would make
> nr_thread=3D25% a sensible configuration.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | reaim: reaim.jobs_per_min 1.3% improvement         =
                      |
>> | test machine     | 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GH=
z with 256G memory    |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_job=3D3000                                      =
                        |
>> |                  | nr_task=3D100%                                     =
                        |
>> |                  | runtime=3D300s                                     =
                        |
>> |                  | test=3Dcustom                                      =
                        |
>> |                  | ucode=3D0x3d                                       =
                        |
>
> reaim is generally a mess so in this case it's unclear. The load is a
> mix of task creation, IO operations, signal and others. It might have
> benefitted slightly from running local. One reason I don't particularly
> like reaim is that historically it was dominated by sending/receiving
> signals. In my own tests, signal is typically removed as well as it's
> tendency to sync the entire filesystem at high frequency.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | stream: stream.add_bandwidth_MBps -32.0% regression=
                      |
>> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 128G memory    |
>> | test parameters  | array_size=3D10000000                              =
                        |
>> |                  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_threads=3D50%                                   =
                        |
>> |                  | omp=3Dtrue                                         =
                        |
>> |                  | ucode=3D0xb00002e                                  =
                        |
>
> STREAM covered already other than noting that it's unlikely it has 44
> memory channels to work with so any imbalance in the task distribution
> should show up as a regression. Again, the patch favours using local node
> first which would saturate the local memory channel earlier.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | plzip:                                             =
                      |
>> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 128G memory    |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_threads=3D100%                                  =
                        |
>> |                  | ucode=3D0xb00002e                                  =
                        |
>
> Doesn't state what change happened be it positive or negative.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | reaim: reaim.jobs_per_min -11.9% regression        =
                      |
>> | test machine     | 192 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20G=
Hz with 512G memory   |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_task=3D100%                                     =
                        |
>> |                  | runtime=3D300s                                     =
                        |
>> |                  | test=3Dall_utime                                   =
                        |
>> |                  | ucode=3D0xb00002e                                  =
                        |
>
> This is completely user-space bound running basic math operations. Not
> clear why it would suffer *but* if hyperthreading is enabled, the patch
> might mean that hyperthread siblings were used early due to favouring
> the local node.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | hackbench: hackbench.throughput -7.3% regression   =
                      |
>> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 64G memory     |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | ipc=3Dpipe                                         =
                        |
>> |                  | mode=3Dprocess                                     =
                        |
>> |                  | nr_threads=3D1600%                                 =
                        |
>> |                  | ucode=3D0xb00002e                                  =
                        |
>
> Hackbench very short-lived but the workload is also heavily saturating the
> machine to an extent where it would be hard to tell from this report if
> the 7.3% is statically significant or not. The patch might mean a socket
> is severely over-saturated in the very early phases of the workload.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | reaim: reaim.std_dev_percent 11.4% undefined       =
                      |
>> | test machine     | 104 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.=
10GHz with 64G memory |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_task=3D100%                                     =
                        |
>> |                  | runtime=3D300s                                     =
                        |
>> |                  | test=3Dcustom                                      =
                        |
>> |                  | ucode=3D0x200004d                                  =
                        |
>
> Not sure what the change is saying. Possibly that it's less variable.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | reaim: boot-time.boot 95.3% regression             =
                      |
>> | test machine     | 104 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.=
10GHz with 64G memory |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_task=3D100%                                     =
                        |
>> |                  | runtime=3D300s                                     =
                        |
>> |                  | test=3Dalltests                                    =
                        |
>> |                  | ucode=3D0x200004d                                  =
                        |
>
> boot-time.boot?
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | pft: pft.faults_per_sec_per_cpu -42.7% regression  =
                      |
>> | test machine     | 104 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.=
10GHz with 64G memory |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_task=3D50%                                      =
                        |
>> |                  | runtime=3D300s                                     =
                        |
>> |                  | ucode=3D0x200004d                                  =
                        |
>
> PFT already discussed.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | stream: stream.add_bandwidth_MBps -28.8% regression=
                      |
>> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 128G memory    |
>> | test parameters  | array_size=3D50000000                              =
                        |
>> |                  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_threads=3D50%                                   =
                        |
>> |                  | omp=3Dtrue                                         =
                        |
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | stream: stream.add_bandwidth_MBps -30.6% regression=
                      |
>> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 128G memory    |
>> | test parameters  | array_size=3D10000000                              =
                        |
>> |                  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_threads=3D50%                                   =
                        |
>> |                  | omp=3Dtrue                                         =
                        |
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | pft: pft.faults_per_sec_per_cpu -42.5% regression  =
                      |
>> | test machine     | 104 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.=
10GHz with 64G memory |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_task=3D50%                                      =
                        |
>> |                  | runtime=3D300s                                     =
                        |
>
> Already discussed.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | reaim: reaim.child_systime -1.4% undefined         =
                      |
>> | test machine     | 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50G=
Hz with 512G memory   |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | iterations=3D30                                    =
                        |
>> |                  | nr_task=3D1600%                                    =
                        |
>> |                  | test=3Dcompute                                     =
                        |
>
> 1.4% change in system time could be overhead in the fork phase as it
> looks for local idle cores then remote idle cores early but the
> difference is tiny.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | stress-ng: stress-ng.fifo.ops_per_sec 76.2% improve=
ment                  |
>> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 128G memory    |
>> | test parameters  | class=3Dpipe                                       =
                        |
>> |                  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_threads=3D100%                                  =
                        |
>> |                  | testtime=3D1s                                      =
                        |
>
> A case where short-lived communicating tasks benefit by starting local.
>
>> +------------------+----------------------------------------------------=
----------------------+
>> | testcase: change | stress-ng: stress-ng.tsearch.ops_per_sec -17.1% reg=
ression               |
>> | test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GH=
z with 128G memory    |
>> | test parameters  | class=3Dcpu                                        =
                        |
>> |                  | cpufreq_governor=3Dperformance                     =
                        |
>> |                  | nr_threads=3D100%                                  =
                        |
>> |                  | testtime=3D1s                                      =
                        |
>> +------------------+----------------------------------------------------=
----------------------+
>> =

>
> Given full machine utilisation and a 1 second duration, it's a case
> where saturating the local node early was sub-optimal and 1 second is
> too long for load balancing or other factors to correct it.
>
> Bottom line, the patch is a trade off but from a range of tests, I found
> that on balance we benefit more from having tasks start local until
> there is evidence that the kernel is justified to spread the load to
> remote nodes.

Thanks a lot for detailed explanation!

Best Regards,
Huang, Ying

--===============4218238302119988488==--

