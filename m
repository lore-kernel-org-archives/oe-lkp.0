Content-Type: multipart/mixed; boundary="===============6556450704591083672=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 9e52fc2b50: will-it-scale.per_thread_ops -16% regression
Date: Fri, 29 Sep 2017 14:24:03 +0200
Message-ID: <87d169zo9o.fsf@vitty.brq.redhat.com>
In-Reply-To: <20170927055914.GO17200@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6556450704591083672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <xiaolong.ye@intel.com> writes:

> Greeting,
>
> FYI, we noticed a -16% regression of will-it-scale.per_thread_ops due to =
commit:
>
> commit: 9e52fc2b50de3a1c08b44f94c610fbe998c0031a ("x86/mm: Enable RCU bas=
ed page table freeing (CONFIG_HAVE_RCU_TABLE_FREE=3Dy)")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: will-it-scale
> on test machine: 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz with=
 64G memory
> with following parameters:
>
> 	test: malloc1
> 	cpufreq_governor: performance
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> testcase/path_params/tbox_group/run: will-it-scale/malloc1-performance/lk=
p-sb03
>
> 39e48d9b128abbd2  9e52fc2b50de3a1c08b44f94c6  =

> ----------------  --------------------------  =

>          %stddev      change         %stddev
>              \          |                \  =

>      52686 =C2=B1  4%       -16%      44404        will-it-scale.per_thre=
ad_ops
>       2351             216%       7432 =C2=B1  9%  will-it-scale.time.inv=
oluntary_context_switches

[snip]

Thank you for the report,

I tried reproducing this on a smaller system (16 threads E5-2640, 32 Gb
RAM) but I'm not seeing this:

4.14-rc2 with 9e52fc2b50de3a1c08b44f94c6 included:

time ./runtest.py malloc1
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
1,282785,93.75,253402,93.74,282785
2,453749,87.50,123048,92.69,565570
3,654495,81.25,121974,91.04,848355
4,821504,75.01,120409,90.16,1131140
5,958374,68.76,133752,90.18,1413925
6,1078434,62.53,138999,90.37,1696710
7,1165645,56.27,134086,90.45,1979495
8,1257750,50.03,139918,90.39,2262280
9,870393,43.78,120765,89.20,2545065
10,695333,37.54,125554,87.90,2827850
11,533409,31.28,121283,87.57,3110635
12,458691,25.06,119839,87.23,3393420
13,432307,18.79,121203,86.22,3676205
14,428379,12.58,122107,86.16,3958990
15,424319,6.32,121789,86.34,4241775
16,426072,0.12,121244,86.44,4524560

real    5m52.363s
user    0m18.204s
sys     5m7.249s

4.14-rc2 with 9e52fc2b50de3a1c08b44f94c6 reverted:

time ./runtest.py malloc1
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
1,290971,93.78,316790,93.76,316790
2,478501,87.48,122081,93.11,633580
3,722748,81.25,117410,92.28,950370
4,945460,75.01,123084,91.30,1267160
5,1145372,68.76,128113,91.71,1583950
6,1332411,62.51,132994,92.08,1900740
7,1479931,56.27,129479,92.24,2217530
8,1579569,50.03,133241,91.68,2534320
9,1272772,43.79,131393,89.87,2851110
10,1105981,37.54,126218,88.76,3167900
11,892427,31.29,127651,87.48,3484690
12,703695,25.06,125056,86.97,3801480
13,642629,18.82,123492,86.68,4118270
14,625952,12.58,121581,87.02,4435060
15,617222,6.34,121273,87.47,4751850
16,611371,0.11,125548,86.74,5068640

real    5m52.406s
user    0m27.973s
sys     5m8.169s

I have a couple of guesses why we may be seeing significantly increased
number of context switches in some very specific workloads:

1) In case the system is under extreme memory pressure and
__get_free_page() is failing in tlb_remove_table() we'll be doing
smp_call_function() for _each_ call (avoiding batching). We may want to
have a pre-allocated pool.

2) The default MAX_TABLE_BATCH is static (it is equal to the number of
pointer we can fit into one page - sizeof(struct mmu_table_batch) =3D=3D
509), we may want to adjust it for very big systems.

I'd love to work on these but with a good reproducible case I'm afraid
I'm stuck :-(

-- =

  Vitaly

--===============6556450704591083672==--

