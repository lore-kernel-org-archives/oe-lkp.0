Content-Type: multipart/mixed; boundary="===============3650807227272558731=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/hugetlb] c77c0a8ac4: will-it-scale.per_process_ops 15.9% improvement
Date: Fri, 17 Jan 2020 09:05:27 -0500
Message-ID: <48f750d3-92b4-98d3-5cab-531304bf9fa1@redhat.com>
In-Reply-To: <20200117065628.GC86012@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3650807227272558731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/17/20 1:56 AM, Feng Tang wrote:
> Hi Waiman and Michal,
>
> On Tue, Jan 14, 2020 at 09:57:14AM -0500, Waiman Long wrote:
>> On 1/14/20 4:12 AM, Michal Hocko wrote:
>>> On Tue 14-01-20 16:56:37, kernel test robot wrote:
>>>> Greeting,
>>>>
>>>> FYI, we noticed a 15.9% improvement of will-it-scale.per_process_ops d=
ue to commit:
>>>>
>>>>
>>>> commit: c77c0a8ac4c522638a8242fcb9de9496e3cdbb2d ("mm/hugetlb: defer f=
reeing of huge pages if in non-task context")
>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>> This is more than surprising because the patch has only changed the
>>> behavior for hugetlb pages freed from the (soft)interrupt context and
>>> that should be a very rare event. Does the test really generate a lot of
>>> those?
>>>
>> Yes, I have the same question. I was not expecting to see any
>> performance impact.
> We have the same question and did some further check.
>
> This is the "pagefault3" test case of will-it-scale, and is  =

> mmap/get_page/munmap test. The source code is: =

> https://github.com/antonblanchard/will-it-scale/blob/master/tests/page_fa=
ult3.c =

>
> And its running on LKP does NOT involve any hugetlb actions, as
> could be checking HugePages_* in /proc/meminfo.
>
> We also did another check, reverted c77c0a8ac4c5 and simply added
> some printk inside free_huge_page(), which can also bring 15%
> improvement.
>
> So one possible reason could be the commit changes the cache
> alignment of other kernel codes in final bzImage, which happens
> to hugely affect this test case.
>
> Thanks,
> Feng
>
That sounds reasonable to me. Thanks for the investigation.

Cheers,
Longman

--===============3650807227272558731==--

