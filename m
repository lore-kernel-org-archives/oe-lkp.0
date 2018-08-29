Content-Type: multipart/mixed; boundary="===============5981796486375904589=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 9092c71bb7: blogbench.write_score -12.3% regression
Date: Wed, 29 Aug 2018 14:55:56 +0800
Message-ID: <875zztacg3.fsf@yhuang-dev.intel.com>
In-Reply-To: <871sbf7tcf.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5981796486375904589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Huang, Ying" <ying.huang@intel.com> writes:

> Josef Bacik <josef@toxicpanda.com> writes:
>
>> On Thu, Aug 02, 2018 at 01:55:23PM +0800, Huang, Ying wrote:
>>> "Huang, Ying" <ying.huang@intel.com> writes:
>>> =

>>> > Hi, Chris,
>>> >
>>> > Chris Mason <clm@fb.com> writes:
>>> >
>>> >> On 19 Jun 2018, at 23:51, Huang, Ying wrote:
>>> >>>>> "Huang, Ying" <ying.huang@intel.com> writes:
>>> >>>>>
>>> >>>>>> Hi, Josef,
>>> >>>>>>
>>> >>>>>> Do you have time to take a look at the regression?
>>> >>>>>>
>>> >>>>>> kernel test robot <xiaolong.ye@intel.com> writes:
>>> >>>>>>
>>> >>>>>>> Greeting,
>>> >>>>>>>
>>> >>>>>>> FYI, we noticed a -12.3% regression of blogbench.write_score and
>>> >>>>>>> a +9.6% improvement
>>> >>>>>>> of blogbench.read_score due to commit:
>>> >>>>>>>
>>> >>>>>>>
>>> >>>>>>> commit: 9092c71bb724dba2ecba849eae69e5c9d39bd3d2 ("mm: use
>>> >>>>>>> sc->priority for slab shrink targets")
>>> >>>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
>>> >>>>>>> master
>>> >>>>>>>
>>> >>>>>>> in testcase: blogbench
>>> >>>>>>> on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @
>>> >>>>>>> 2.10GHz with 8G memory
>>> >>>>>>> with following parameters:
>>> >>>>>>>
>>> >>>>>>> 	disk: 1SSD
>>> >>>>>>> 	fs: btrfs
>>> >>>>>>> 	cpufreq_governor: performance
>>> >>>>>>>
>>> >>>>>>> test-description: Blogbench is a portable filesystem benchmark
>>> >>>>>>> that tries to reproduce the load of a real-world busy file
>>> >>>>>>> server.
>>> >>>>>>> test-url:
>>> >>
>>> >> I'm surprised, this patch is a big win in production here at FB.  I'=
ll
>>> >> have to reproduce these results to better understand what is going o=
n.
>>> >> My first guess is that since we have fewer inodes in slab, we're
>>> >> reading more inodes from disk in order to do the writes.
>>> >>
>>> >> But that should also make our read scores lower.
>>> >
>>> > Any update on this?
>>> =

>>> Ping.
>>> =

>>
>> I can't reproduce this, and what's more it appears that blogbench doesn'=
t use
>> much memory at all.  I have the slab shrinking tracepoints on and we nev=
er go
>> into this code at all, so I'm pretty sure these results are bogus.  How =
are you
>> running blogbench?  I'm doing blogbench -d /whatever, if I need to be do=
ing
>> something else let me know.  But from what I can tell this thing uses le=
ss than
>> 100m of memory, and on an 8gig of ram box we're never going to trip over=
 this
>> code.  Thanks,
>
> Thanks for looking at this.  In my testing, blogbench will eat up system
> memory.  Please check the vmstat result attached.  The SSD disk size is
> about 745GB.

Hi, Josef,

Do you need more information?

Best Regards,
Huang, Ying

> Best Regards,
> Huang, Ying

--===============5981796486375904589==--

