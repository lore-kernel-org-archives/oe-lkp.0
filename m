Content-Type: multipart/mixed; boundary="===============9178574911637833301=="
MIME-Version: 1.0
From: Mike Kravetz <mike.kravetz@oracle.com>
To: lkp@lists.01.org
Subject: Re: [hugetlbfs] c0d0381ade: vm-scalability.throughput -33.4% regression
Date: Mon, 22 Jun 2020 15:01:38 -0700
Message-ID: <e140ec78-1fbd-73e2-7a11-7db3b714874d@oracle.com>
In-Reply-To: <20200622005551.GK5535@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============9178574911637833301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/21/20 5:55 PM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -33.4% regression of vm-scalability.throughput due to c=
ommit:
> =

> =

> commit: c0d0381ade79885c04a04c303284b040616b116e ("hugetlbfs: use i_mmap_=
rwsem for more pmd sharing synchronization")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: vm-scalability
> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz wit=
h 80G memory
> with following parameters:
> =

> 	runtime: 300s
> 	size: 8T
> 	test: anon-cow-seq-hugetlb
> 	cpufreq_governor: performance
> 	ucode: 0x11
> =


Some performance regression is not surprising as the change includes acquir=
ing
and holding the i_mmap_rwsem (in read mode) during hugetlb page faults.  33=
.4%
seems a bit high.  But, the test is primarily exercising the hugetlb page
fault path and little else.

The reason for taking the i_mmap_rwsem is to prevent PMD unsharing from
invalidating the pmd we are operating on.  This specific test case is opera=
ting
on anonymous private mappings.  So, PMD sharing is not possible and we can
eliminate acquiring the mutex in this case.  In fact, we should check all
mappings (even sharable) for the possibly of PMD sharing and only take the
mutex if necessary.  It will make the code a bit uglier, but will take care
of some of these regressions.  We still need to take the mutex in the case
of PMD sharing.  I'm afraid a regression is unavoidable in that case.

I'll put together a patch.
-- =

Mike Kravetz
--===============9178574911637833301==--

