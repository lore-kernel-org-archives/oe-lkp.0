Content-Type: multipart/mixed; boundary="===============6698068810075715847=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm/64] 37c58d3e96: [No primary change] will-it-scale.time.user_time +148%
Date: Tue, 21 Nov 2017 19:39:31 -0800
Message-ID: <CALCETrVo+r9N30nZai8G3k7rrHZ9zN0PXh0=zZB35EooN_rSyQ@mail.gmail.com>
In-Reply-To: <20171121031559.GC25541@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6698068810075715847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm not terribly surprised, and it's going to be *much* worse once the
dust settles.  What we need is a way to turn this thing on and off.

On Mon, Nov 20, 2017 at 7:15 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> Greeting,
>
> There is no primary kpi change in this test, below is the data collected =
through multiple monitors running background just for your information.
>
>
> commit: 37c58d3e96a94a7e1dd0f8f4cd33a6493ebf957a ("x86/asm/64: Return to =
userspace from the trampoline stack")
> https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git x86/entry_sta=
ck.wip
>
> in testcase: will-it-scale
> on test machine: 256 threads Phi with 96G memory
> with following parameters:
>
>         nr_task: 100%
>         mode: thread
>         test: lseek1
>         cpufreq_governor: performance
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> testcase/path_params/tbox_group/run: will-it-scale/100%-thread-lseek1-per=
formance/lkp-knl-f1
>
> 7b1f0050e4538756  37c58d3e96a94a7e1dd0f8f4cd
> ----------------  --------------------------
>          %stddev      change         %stddev
>              \          |                \
>      10299             148%      25535 =C4=85  5%  will-it-scale.time.use=
r_time
>       1177               5%       1236        will-it-scale.time.voluntar=
y_context_switches
>      66494             -23%      51266        will-it-scale.time.system_t=
ime
>     592014               6%     626500        interrupts.CAL:Function_cal=
l_interrupts
>      21308              15%      24569        perf-stat.cpu-migrations
>     671828               4%     697696        perf-stat.minor-faults
>     671934               4%     697629        perf-stat.page-faults
>     100.26                      102.37        perf-stat.instructions-per-=
iTLB-miss
>       0.99                        0.97        perf-stat.iTLB-load-miss-ra=
te%
>  1.554e+11                   1.521e+11        perf-stat.iTLB-load-misses
>
>
>
>                             will-it-scale.time.user_time
>
>   30000 +-+-------------------------------O------------------------------=
---+
>         O     O            O        O  O           O                     =
   |
>         |                                    O           O      O     O  =
O  |
>   25000 +-+O     O  O  O                                           O     =
   O
>         |                                       O                        =
   |
>         |                     O  O                                       =
   |
>   20000 +-+                                                              =
   |
>         |                                                                =
   |
>   15000 +-+                                           O      O           =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>   10000 +-+                              .+..+..+..+..+..+...+..+..+..+..=
+..|
>         |..+..+..+..+..+...+..+..+..+..+.                                =
   |
>         |                                                                =
   |
>    5000 +-+--------------------------------------------------------------=
---+
>
> [*] bisect-good sample
> [O] bisect-bad  sample
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Xiaolong

--===============6698068810075715847==--

