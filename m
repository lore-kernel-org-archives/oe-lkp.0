Content-Type: multipart/mixed; boundary="===============7989661824174964379=="
MIME-Version: 1.0
From: Mike Kravetz <mike.kravetz@oracle.com>
To: lkp@lists.01.org
Subject: Re: [hugetlbfs] 9c83282117: vm-scalability.throughput -4.3% regression
Date: Wed, 02 Jan 2019 08:54:07 -0800
Message-ID: <21117eab-862e-562b-0c86-ec2ccc1f68e4@oracle.com>
In-Reply-To: <20181228142608.GA17624@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7989661824174964379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/28/18 6:26 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -4.3% regression of vm-scalability.throughput due to co=
mmit:
> =

> =

> commit: 9c83282117778856d647ffc461c4aede2abb6742 ("[PATCH v3 1/2] hugetlb=
fs: use i_mmap_rwsem for more pmd sharing synchronization")
> url: https://github.com/0day-ci/linux/commits/Mike-Kravetz/hugetlbfs-use-=
i_mmap_rwsem-for-better-synchronization/20181223-095226
> =

> =

> in testcase: vm-scalability
> on test machine: 104 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.10GHz=
 with 64G memory
> with following parameters:
> =

> 	runtime: 300s
> 	size: 8T
> 	test: anon-cow-seq-hugetlb
> 	cpufreq_governor: performance
> 	ucode: 0x200004d

I'll take a closer look.

The patch does introduce longer i_mmap_rwsem hold times for the sake of
correctness.  Need to more fully understand the test and results to determi=
ne
if this is expected.

-- =

Mike Kravetz

--===============7989661824174964379==--

