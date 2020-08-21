Content-Type: multipart/mixed; boundary="===============0592905456436640208=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [hugetlbfs] c0d0381ade: vm-scalability.throughput -33.4% regression
Date: Fri, 21 Aug 2020 16:39:11 +0800
Message-ID: <d945497d-0edb-f540-33e1-8b1ba1e20f62@linux.intel.com>
In-Reply-To: <718e1653-b273-096b-0ee3-f720cf794612@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0592905456436640208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/26/2020 5:33 AM, Mike Kravetz wrote:
> On 6/22/20 3:01 PM, Mike Kravetz wrote:
>> On 6/21/20 5:55 PM, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -33.4% regression of vm-scalability.throughput due to=
 commit:
>>>
>>>
>>> commit: c0d0381ade79885c04a04c303284b040616b116e ("hugetlbfs: use i_mma=
p_rwsem for more pmd sharing synchronization")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>> in testcase: vm-scalability
>>> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory
>>> with following parameters:
>>>
>>> 	runtime: 300s
>>> 	size: 8T
>>> 	test: anon-cow-seq-hugetlb
>>> 	cpufreq_governor: performance
>>> 	ucode: 0x11
>>>
>>
>> Some performance regression is not surprising as the change includes acq=
uiring
>> and holding the i_mmap_rwsem (in read mode) during hugetlb page faults. =
 33.4%
>> seems a bit high.  But, the test is primarily exercising the hugetlb page
>> fault path and little else.
>>
>> The reason for taking the i_mmap_rwsem is to prevent PMD unsharing from
>> invalidating the pmd we are operating on.  This specific test case is op=
erating
>> on anonymous private mappings.  So, PMD sharing is not possible and we c=
an
>> eliminate acquiring the mutex in this case.  In fact, we should check all
>> mappings (even sharable) for the possibly of PMD sharing and only take t=
he
>> mutex if necessary.  It will make the code a bit uglier, but will take c=
are
>> of some of these regressions.  We still need to take the mutex in the ca=
se
>> of PMD sharing.  I'm afraid a regression is unavoidable in that case.
>>
>> I'll put together a patch.
> =

> Not acquiring the mutex on faults when sharing is not possible is quite
> straight forward.  We can even use the existing routine vma_shareable()
> to easily check.  However, the next patch in the series 87bf91d39bb5
> "hugetlbfs: Use i_mmap_rwsem to address page fault/truncate race" depends
> on always acquiring the mutex.  If we break this assumption, then the
> code to back out hugetlb reservations needs to be written.  A high level
> view of what needs to be done is in the commit message for 87bf91d39bb5.
> =

> I'm working on the code to back out reservations.
> =


I find that 34ae204f18519f0920bd50a644abd6fefc8dbfcf(hugetlbfs: remove =

call to huge_pte_alloc without i_mmap_rwsem) fixed this regression, I =

test with the patch, the regression reduced to 10.1%, do you have plan =

to continue to improve it? Thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/runtime/size/test/cpufreq_gover=
nor/ucode:
 =

lkp-knm01/vm-scalability/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/3=
00s/8T/anon-cow-seq-hugetlb/performance/0x11

commit:
   49aef7175cc6eb703a9280a7b830e675fe8f2704
   c0d0381ade79885c04a04c303284b040616b116e
   v5.8
   34ae204f18519f0920bd50a644abd6fefc8dbfcf
   v5.9-rc1

49aef7175cc6eb70 c0d0381ade79885c04a04c30328                        v5.8 =

34ae204f18519f0920bd50a644a                    v5.9-rc1
---------------- --------------------------- --------------------------- =

--------------------------- ---------------------------
          %stddev     %change         %stddev     %change =

%stddev     %change         %stddev     %change         %stddev
              \          |                \          |                \ =

         |                \          |                \
      38084           -31.1%      26231 =C2=B1  2%     -26.6%      27944 =
=C2=B1 =

5%      -7.0%      35405            -7.5%      35244 =

vm-scalability.median
       9.92 =C2=B1  9%     +12.0       21.95 =C2=B1  4%      +3.9       13.=
87 =C2=B1 =

30%      -5.3        4.66 =C2=B1  9%      -6.6        3.36 =C2=B1  7% =

vm-scalability.median_stddev%
   12827311           -35.0%    8340256 =C2=B1  2%     -30.9%    8865669 =
=C2=B1 =

5%     -10.1%   11532087           -10.2%   11513595 =C2=B1  2% =

vm-scalability.throughput
  2.507e+09           -22.7%  1.938e+09           -15.3%  2.122e+09 =C2=B1 =

6%      +8.0%  2.707e+09            +8.0%  2.707e+09 =C2=B1  2% =

vm-scalability.workload



-- =

Zhengjun Xing
--===============0592905456436640208==--

