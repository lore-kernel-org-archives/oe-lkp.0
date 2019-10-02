Content-Type: multipart/mixed; boundary="===============8597357005080554910=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lruvec] 3145e78472: vm-scalability.median -18.4% regression
Date: Wed, 02 Oct 2019 14:35:32 +0000
Message-ID: <35efd618-f2d1-1d1c-428b-101982553d4d@intel.com>
In-Reply-To: <178e0066-88a6-b757-6695-ecc49795f1e1@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8597357005080554910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alex,

One possible reason is that the struct layout changed causes the =

regression.
I will check the issue after the holiday ASAP.

Thanks,
Rong Chen

On 10/1/2019 8:50 PM, Alex Shi wrote:
> Hi Rong,
>
> Thanks a lot!
> But this patch only add a unused flags which is unlikely to be effect or =
cause cache miss.
>
> Could you like to double this issue?
>
> Thanks a lot!
> Alex
>
>
> commit 66108d0a0177aabc62a98a939a39ad23914115a3
> Author: Alex Shi <alex.shi@linux.alibaba.com>
> Date:   Wed Sep 18 19:56:41 2019 +0800
>
>      mm/lruvec: add irqsave flags into lruvec struct
>
>      We need a flags vaiable to save state when do irqsave action, declar=
e it
>      here would make code more clear/clean.
>
>      Originally-from: Hugh Dickins <hughd@google.com>
>      Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
>      Cc: Andrew Morton <akpm@linux-foundation.org>
>      Cc: Vlastimil Babka <vbabka@suse.cz>
>      Cc: Dan Williams <dan.j.williams@intel.com>
>      Cc: Michal Hocko <mhocko@suse.com>
>      Cc: Mel Gorman <mgorman@techsingularity.net>
>      Cc: Wei Yang <richard.weiyang@gmail.com>
>      Cc: Johannes Weiner <hannes@cmpxchg.org>
>      Cc: Arun KS <arunks@codeaurora.org>
>      Cc: Tejun Heo <tj@kernel.org>
>      Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
>      Cc: cgroups(a)vger.kernel.org
>      Cc: linux-mm(a)kvack.org
>      Cc: linux-kernel(a)vger.kernel.org
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 55d0152dce4d..3c5198898126 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -298,6 +298,9 @@ struct lruvec {
>          struct list_head                lists[NR_LRU_LISTS];
>          /* per lruvec lru_lock for memcg */
>          spinlock_t                      lru_lock;
> +       /* flags for irqsave */
> +       unsigned long                   flags;
> +
>          struct zone_reclaim_stat        reclaim_stat;
>          /* Evictions & activations on the inactive file list */
>          atomic_long_t                   inactive_age;
>
> =E5=9C=A8 2019/9/30 =E4=B8=8B=E5=8D=884:47, kernel test robot =E5=86=99=
=E9=81=93:
>> Greeting,
>>
>> FYI, we noticed a -18.4% regression of vm-scalability.median due to comm=
it:
>>
>>
>> commit: 3145e78472f7ad746e15180092a9a60e34e5455b ("mm/lruvec: add irqsav=
e flags into lruvec struct")
>> https://github.com/alexshi/linux.git lru_lock
>>
>> in testcase: vm-scalability
>> on test machine: 104 threads Skylake with 192G memory
>> with following parameters:
>>
>> 	runtime: 300s
>> 	test: lru-file-readtwice
>> 	cpufreq_governor: performance

--===============8597357005080554910==--

