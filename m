Content-Type: multipart/mixed; boundary="===============4385919712043012230=="
MIME-Version: 1.0
From: Mike Kravetz <mike.kravetz@oracle.com>
To: lkp@lists.01.org
Subject: Re: [hugetlbfs] c0d0381ade: vm-scalability.throughput -33.4% regression
Date: Thu, 25 Jun 2020 14:33:28 -0700
Message-ID: <718e1653-b273-096b-0ee3-f720cf794612@oracle.com>
In-Reply-To: <e140ec78-1fbd-73e2-7a11-7db3b714874d@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4385919712043012230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/22/20 3:01 PM, Mike Kravetz wrote:
> On 6/21/20 5:55 PM, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -33.4% regression of vm-scalability.throughput due to =
commit:
>>
>>
>> commit: c0d0381ade79885c04a04c303284b040616b116e ("hugetlbfs: use i_mmap=
_rwsem for more pmd sharing synchronization")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: vm-scalability
>> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz wi=
th 80G memory
>> with following parameters:
>>
>> 	runtime: 300s
>> 	size: 8T
>> 	test: anon-cow-seq-hugetlb
>> 	cpufreq_governor: performance
>> 	ucode: 0x11
>>
> =

> Some performance regression is not surprising as the change includes acqu=
iring
> and holding the i_mmap_rwsem (in read mode) during hugetlb page faults.  =
33.4%
> seems a bit high.  But, the test is primarily exercising the hugetlb page
> fault path and little else.
> =

> The reason for taking the i_mmap_rwsem is to prevent PMD unsharing from
> invalidating the pmd we are operating on.  This specific test case is ope=
rating
> on anonymous private mappings.  So, PMD sharing is not possible and we can
> eliminate acquiring the mutex in this case.  In fact, we should check all
> mappings (even sharable) for the possibly of PMD sharing and only take the
> mutex if necessary.  It will make the code a bit uglier, but will take ca=
re
> of some of these regressions.  We still need to take the mutex in the case
> of PMD sharing.  I'm afraid a regression is unavoidable in that case.
> =

> I'll put together a patch.

Not acquiring the mutex on faults when sharing is not possible is quite
straight forward.  We can even use the existing routine vma_shareable()
to easily check.  However, the next patch in the series 87bf91d39bb5
"hugetlbfs: Use i_mmap_rwsem to address page fault/truncate race" depends
on always acquiring the mutex.  If we break this assumption, then the
code to back out hugetlb reservations needs to be written.  A high level
view of what needs to be done is in the commit message for 87bf91d39bb5.

I'm working on the code to back out reservations.
-- =

Mike Kravetz
--===============4385919712043012230==--

