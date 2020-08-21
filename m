Content-Type: multipart/mixed; boundary="===============2159475731873767121=="
MIME-Version: 1.0
From: Mike Kravetz <mike.kravetz@oracle.com>
To: lkp@lists.01.org
Subject: Re: [hugetlbfs] c0d0381ade: vm-scalability.throughput -33.4% regression
Date: Fri, 21 Aug 2020 14:02:36 -0700
Message-ID: <691152ef-6787-9598-4445-fd2a0164f70f@oracle.com>
In-Reply-To: <d945497d-0edb-f540-33e1-8b1ba1e20f62@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2159475731873767121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/21/20 1:39 AM, Xing Zhengjun wrote:
> =

> =

> On 6/26/2020 5:33 AM, Mike Kravetz wrote:
>> On 6/22/20 3:01 PM, Mike Kravetz wrote:
>>> On 6/21/20 5:55 PM, kernel test robot wrote:
>>>> Greeting,
>>>>
>>>> FYI, we noticed a -33.4% regression of vm-scalability.throughput due t=
o commit:
>>>>
>>>>
>>>> commit: c0d0381ade79885c04a04c303284b040616b116e ("hugetlbfs: use i_mm=
ap_rwsem for more pmd sharing synchronization")
>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>>
>>>> in testcase: vm-scalability
>>>> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz =
with 80G memory
>>>> with following parameters:
>>>>
>>>>     runtime: 300s
>>>>     size: 8T
>>>>     test: anon-cow-seq-hugetlb
>>>>     cpufreq_governor: performance
>>>>     ucode: 0x11
>>>>
>>>
>>> Some performance regression is not surprising as the change includes ac=
quiring
>>> and holding the i_mmap_rwsem (in read mode) during hugetlb page faults.=
  33.4%
>>> seems a bit high.  But, the test is primarily exercising the hugetlb pa=
ge
>>> fault path and little else.
>>>
>>> The reason for taking the i_mmap_rwsem is to prevent PMD unsharing from
>>> invalidating the pmd we are operating on.  This specific test case is o=
perating
>>> on anonymous private mappings.  So, PMD sharing is not possible and we =
can
>>> eliminate acquiring the mutex in this case.  In fact, we should check a=
ll
>>> mappings (even sharable) for the possibly of PMD sharing and only take =
the
>>> mutex if necessary.  It will make the code a bit uglier, but will take =
care
>>> of some of these regressions.  We still need to take the mutex in the c=
ase
>>> of PMD sharing.  I'm afraid a regression is unavoidable in that case.
>>>
>>> I'll put together a patch.
>>
>> Not acquiring the mutex on faults when sharing is not possible is quite
>> straight forward.  We can even use the existing routine vma_shareable()
>> to easily check.  However, the next patch in the series 87bf91d39bb5
>> "hugetlbfs: Use i_mmap_rwsem to address page fault/truncate race" depends
>> on always acquiring the mutex.  If we break this assumption, then the
>> code to back out hugetlb reservations needs to be written.  A high level
>> view of what needs to be done is in the commit message for 87bf91d39bb5.
>>
>> I'm working on the code to back out reservations.
>>
> =

> I find that 34ae204f18519f0920bd50a644abd6fefc8dbfcf(hugetlbfs: remove ca=
ll to huge_pte_alloc without i_mmap_rwsem) fixed this regression, I test wi=
th the patch, the regression reduced to 10.1%, do you have plan to continue=
 to improve it? Thanks.

Thank you for testing!

Commit 34ae204f1851 was not created to address performance.  Rather it was
created more for the sake of correctness.

IIRC, this test is going to stress the page fault path by continuing to pro=
duce
faults for the duration of the test.  Commit 34ae204f1851 removed an unneed=
ed,
somewhat dangerous and redundant call to huge_pte_alloc in the fault path.
Your testing showed that removing this call helped address a good amount of=
 the
performance regression.  The series proposed in this thread attempts to
eliminate more potentially unnecessary code in the hugetlb fault path.
Specifically, it will only acquire the i_mmap_rwsem when necessary.

Would you be willing to test this series on top of 34ae204f1851?  I will ne=
ed
to rebase the series to take the changes made by 34ae204f1851 into account.

BTW - I believe that shared hugetlb mappings are the most common use case.
In the shared case, acquiring i_mmap_rwsem is necessary if pmd sharing is
possible.  There is little we can do to eliminate this.  The test suite does
not appear to test shared mappings.
-- =

Mike Kravetz
--===============2159475731873767121==--

