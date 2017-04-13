Content-Type: multipart/mixed; boundary="===============4008738076651830146=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [irq/affinity] 13c024422c: fsmark.files_per_sec -4.3% regression
Date: Thu, 13 Apr 2017 09:06:04 +0800
Message-ID: <20170413010604.GH31394@yexl-desktop>
In-Reply-To: <B58D82457FDA0744A320A2FC5AC253B93D8EC247@fmsmsx104.amr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4008738076651830146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/12, Busch, Keith wrote:
>Hi Xiaolong,
>
>Thanks for letting me know of the regression. This change wasn't supposed =
to affect anything outside the unbalanced numa case, so if it's indeed the =
culprit, I'll need to fix that.
>
>From the machine that demonstrates the regression, could you send me 'lscp=
u'? And the output from the following commands, both with and without the p=
atch applied?

Okay, when should I run the `lscpu` and below cmds, before, after or during=
 the test?

Thanks,
Xiaolong
>
># cat /proc/interrupts
># for i in $(grep nvme0q /proc/interrupts  | cut -d":" -f1 | sed "s/ //g")=
; do echo "irq $i smp affinity: `cat /proc/irq/$i/smp_affinity`"; done
>
>
>-----Original Message-----
>From: lkp-robot-request(a)eclists.intel.com [mailto:lkp-robot-request(a)ec=
lists.intel.com] On Behalf Of Ye, Xiaolong
>Sent: Tuesday, April 11, 2017 7:33 PM
>To: Busch, Keith <keith.busch@intel.com>
>Cc: Thomas Gleixner <tglx@linutronix.de>; linux-kernel(a)vger.kernel.org=
; linux-nvme(a)lists.infradead.org; Christoph Hellwig <hch@lst.de>; lkp(a=
)01.org
>Subject: [lkp-robot] [irq/affinity] 13c024422c: fsmark.files_per_sec -4.3%=
 regression
>
>
>Greeting,
>
>FYI, we noticed a -4.3% regression of fsmark.files_per_sec due to commit:
>
>
>commit: 13c024422cbb6dcc513667be9a2613b0f0de781a ("irq/affinity: Assign al=
l CPUs a vector")
>url: https://github.com/0day-ci/linux/commits/Keith-Busch/irq-affinity-Ass=
ign-all-CPUs-a-vector/20170401-035036
>
>
>in testcase: fsmark
>on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz with=
 128G memory
>with following parameters:
>
>	iterations: 8
>	disk: 1SSD
>	nr_threads: 4
>	fs: btrfs
>	filesize: 9B
>	test_size: 16G
>	sync_method: fsyncBeforeClose
>	nr_directories: 16d
>	nr_files_per_directory: 256fpd
>	cpufreq_governor: performance
>
>test-description: The fsmark is a file system benchmark to test synchronou=
s write workloads, for example, mail servers workload.
>test-url: https://sourceforge.net/projects/fsmark/
>
>
>Details are as below:
>--------------------------------------------------------------------------=
------------------------>
>
>
>To reproduce:
>
>        git clone https://github.com/01org/lkp-tests.git
>        cd lkp-tests
>        bin/lkp install job.yaml  # job file is attached in this email
>        bin/lkp run     job.yaml
>
>testcase/path_params/tbox_group/run: fsmark/8-1SSD-4-btrfs-9B-16G-fsyncBef=
oreClose-16d-256fpd-performance/lkp-hsw-ep4
>
>45e5202213ae6541  13c024422cbb6dcc513667be9a  =

>----------------  --------------------------  =

>         %stddev      change         %stddev
>             \          |                \  =

>     13888              -4%      13293        fsmark.files_per_sec
>       302               4%        315        fsmark.time.elapsed_time
>       302               4%        315        fsmark.time.elapsed_time.max
> 2.452e+08               3%  2.528e+08        fsmark.time.file_system_outp=
uts
>  20265209                    19926430        fsmark.time.voluntary_contex=
t_switches
>       206              -4%        198        fsmark.time.percent_of_cpu_t=
his_job_got
>    707811             -65%     246894        fsmark.time.involuntary_cont=
ext_switches
>    383249 =C2=B1 13%       -36%     246054        interrupts.CAL:Function=
_call_interrupts
>    149418              -5%     141286        vmstat.system.cs
>       190              -7%        178        turbostat.Avg_MHz
>      6.25              -5%       5.93        turbostat.%Busy
>      8994 =C2=B1  3%       199%      26910 =C2=B1 13%  perf-stat.cpu-migr=
ations
>  45475990                    44940538        perf-stat.context-switches
>      0.42              12%       0.48        perf-stat.dTLB-load-miss-rat=
e%
>      0.09              10%       0.09        perf-stat.dTLB-store-miss-ra=
te%
> 2.162e+08               7%  2.324e+08        perf-stat.dTLB-store-misses
>    674521               4%     703995        perf-stat.page-faults
>    674521               4%     703995        perf-stat.minor-faults
>      1.46               4%       1.52        perf-stat.branch-miss-rate%
> 1.445e+09               3%  1.494e+09        perf-stat.iTLB-loads
>
>
>
>                             fsmark.time.elapsed_time
>
>  400 ++------------------------------------------------------------------=
--+
>      |             O                                                     =
  |
>  350 ++                                                                  =
  |
>  300 O+O.O.O O.O.O.*.O..O.O.O O O.O.O.O O O.O.O.O.O.O.O.*.. .*.*.*.*. .*.=
*.*
>      |     *.*              *   :     *   :                *         *   =
  |
>  250 ++                     :   :     :   :                              =
  |
>      |                      :  :      :  :                               =
  |
>  200 ++                      : :       : :                               =
  |
>      |                       : :       : :                               =
  |
>  150 ++                      : :       : :                               =
  |
>  100 ++                      : :       : :                               =
  |
>      |                       : :       : :                               =
  |
>   50 ++                       :         :                                =
  |
>      |                        :         :                                =
  |
>    0 ++-----------------------*---------*--------------------------------=
--+
>
>
>                           fsmark.time.elapsed_time.max
>
>  400 ++------------------------------------------------------------------=
--+
>      |             O                                                     =
  |
>  350 ++                                                                  =
  |
>  300 O+O.O.O O.O.O.*.O..O.O.O O O.O.O.O O O.O.O.O.O.O.O.*.. .*.*.*.*. .*.=
*.*
>      |     *.*              *   :     *   :                *         *   =
  |
>  250 ++                     :   :     :   :                              =
  |
>      |                      :  :      :  :                               =
  |
>  200 ++                      : :       : :                               =
  |
>      |                       : :       : :                               =
  |
>  150 ++                      : :       : :                               =
  |
>  100 ++                      : :       : :                               =
  |
>      |                       : :       : :                               =
  |
>   50 ++                       :         :                                =
  |
>      |                        :         :                                =
  |
>    0 ++-----------------------*---------*--------------------------------=
--+
>
>
>                      fsmark.time.involuntary_context_switches
>
>  800000 ++---------------------------------------------------------------=
--+
>         *.*.*.*.*. .*.       .*      .*.*     .*.               .*. .*.  =
 .*
>  700000 ++        *   *.*.*.* :   *.*   :  *.*   *.*.*.*.*.*.*.*   *   *.=
* |
>         |                     :   :     :  :                             =
  |
>  600000 ++                    :   :     :  :                             =
  |
>  500000 ++                     :  :      : :                             =
  |
>         |                      : :       : :                             =
  |
>  400000 ++                     : :       : :                             =
  |
>         |             O        : :       : :                             =
  |
>  300000 ++                     : :       ::                              =
  |
>  200000 O+O O O O O O   O O O O:O:O O O O:OO O O O O O O                 =
  |
>         |                       ::        :                              =
  |
>  100000 ++                      :         :                              =
  |
>         |                       :         :                              =
  |
>       0 ++----------------------*---------*------------------------------=
--+
>
>
>                                fsmark.files_per_sec
>
>  16000 ++----------------------------------------------------------------=
--+
>        |                                                                 =
  |
>  14000 O+*.O.O.O.O.O.*.O.O.O.O O O.O.O.O O O.O.O.O.O.O.O.*.*.*.*.*.*.*.*.=
*.*
>  12000 ++O                   :   :     :   :                             =
  |
>        |             O       :   :     :   :                             =
  |
>  10000 ++                     :  :      :  :                             =
  |
>        |                      : :       : :                              =
  |
>   8000 ++                     : :       : :                              =
  |
>        |                      : :       : :                              =
  |
>   6000 ++                     : :       : :                              =
  |
>   4000 ++                     : :       : :                              =
  |
>        |                       ::        ::                              =
  |
>   2000 ++                      :         :                               =
  |
>        |                       :         :                               =
  |
>      0 ++----------------------*---------*-------------------------------=
--+
>
>  [*] bisect-good sample
>  [O] bisect-bad  sample
>
>
>Disclaimer:
>Results have been estimated based on internal Intel analysis and are provi=
ded
>for informational purposes only. Any difference in system hardware or soft=
ware
>design or configuration may affect actual performance.
>
>
>Thanks,
>Xiaolong

--===============4008738076651830146==--

