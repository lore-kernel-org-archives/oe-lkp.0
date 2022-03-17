Content-Type: multipart/mixed; boundary="===============1851276679516731978=="
MIME-Version: 1.0
From: Muchun Song <songmuchun@bytedance.com>
To: lkp@lists.01.org
Subject: Re: [mm] f886cdb769: kernel_BUG_at_include/linux/swapops.h
Date: Fri, 18 Mar 2022 00:50:58 +0800
Message-ID: <CAMZfGtUg8ApCyyCUNC6MC344aH2nNwWvp1U+F0dRcnf0hAOXxQ@mail.gmail.com>
In-Reply-To: <20220317080504.GC735@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1851276679516731978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 4:05 PM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: f886cdb76920131b030ffae13e752d8d0ff440f0 ("mm: pvmw: add support =
for walking devmap pages")
> url: https://github.com/0day-ci/linux/commits/Petr-Mladek/kthread-Make-it=
-clear-that-kthread_create_on_node-might-be-terminated-by-any-fatal-signal/=
20220315-182614
>
> in testcase: will-it-scale
> version: will-it-scale-x86_64-a34a85c-1_20220312
> with following parameters:
>
>         nr_task: 100%
>         mode: process
>         test: lock1
>         cpufreq_governor: performance
>         ucode: 0x2006c0a
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
>
>
> on test machine: 104 threads 2 sockets Skylake with 192G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>

Thanks for your report. I knew the reason. Because pmd_devmap() is
only reliable when pmd_present() returns true and  pmd_devmap() could
returns tue for pmd swap entry.  I should test pmd_present() before
pmd_devmap().  Will be fixed in the next version.

Thanks.
--===============1851276679516731978==--

