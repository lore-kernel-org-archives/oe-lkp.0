Content-Type: multipart/mixed; boundary="===============6866265112877161293=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [shmem] 85766f621c: vm-scalability.throughput -15.5% regression
Date: Tue, 31 Jul 2018 16:05:06 +0800
Message-ID: <20180731080506.GD22500@yexl-desktop>
In-Reply-To: <20180710132458.GA17016@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6866265112877161293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 07/10, Matthew Wilcox wrote:
>On Tue, Jul 10, 2018 at 09:19:47AM +0800, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> FYI, we noticed a -15.5% regression of vm-scalability.throughput due to =
commit:
>> =

>> =

>> commit: 85766f621c492a9aa7904050ad2f80893ab2a8fd ("shmem: Convert shmem_=
add_to_page_cache to XArray")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>> =

>> in testcase: vm-scalability
>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with =
8G memory
>> with following parameters:
>> =

>> 	runtime: 300s
>> 	size: 16G
>> 	test: shm-xread-rand
>> 	cpufreq_governor: performance
>
>I believe this (and the other reported regression with vm-scalability) is
>now fixed with f63145ae97486dfd391797a3d65e72ca21f72d76.  Can you please
>re-run this test with today's tree (next-20180710) which includes this fix?
>Thanks!

Just confirmed the performance is recovered back in next-20180716 which also
contains your fix ("shmem: Convert shmem_add_to_page_cache to XArray").


Thanks,
Xiaolong
>

--===============6866265112877161293==--

