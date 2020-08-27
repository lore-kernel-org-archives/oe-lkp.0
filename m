Content-Type: multipart/mixed; boundary="===============7339565856871669410=="
MIME-Version: 1.0
From: Mike Kravetz <mike.kravetz@oracle.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 913ec479bb: vm-scalability.throughput 26.2% improvement
Date: Thu, 27 Aug 2020 07:56:26 -0700
Message-ID: <99c7683c-f428-378d-2b19-ef51270a5d8e@oracle.com>
In-Reply-To: <76926ade-15fb-75a3-17aa-a2b5a68471c8@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7339565856871669410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/27/20 2:16 AM, Thomas Zimmermann wrote:
> Hi
> =

> Am 26.08.20 um 10:58 schrieb kernel test robot:
>> Greeting,
>>
>> FYI, we noticed a 26.2% improvement of vm-scalability.throughput due to =
commit:
> =

> I guess this resolves the once-measured performance penalty of similar
> magnitude. But do we really understand these tests? When I sent out
> patches to resolve the problem, nothing changed. And suddenly the
> performance is back to normal.
> =

> Best regards
> Thomas
> =

>>
>>
>> commit: 913ec479bb5cc27f99f24d5fd111b3ef29a4deb9 ("drm/mgag200: Replace =
VRAM helpers with SHMEM helpers")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
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

Hello Thomas,

Did drm changes really impact anon-cow-seq-hugetlb performance?

My change c0d0381ade79 ("hugetlbfs: use i_mmap_rwsem for more pmd sharing
synchronization") caused a -33.4% regression of anon-cow-seq-hugetlb.  A
recent change 34ae204f185 (hugetlbfs: remove call to huge_pte_alloc without
i_mmap_rwsem) was tested by Zhengjun Xing and improved performance by 20
something percent.  That seems in line with this report/improvement.

Perhaps the tooling is not always accurate in determining the commit which
causes the performance changes?
Perhaps I am misreading information in the reports?
-- =

Mike Kravetz
--===============7339565856871669410==--

