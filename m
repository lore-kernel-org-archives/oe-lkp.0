Content-Type: multipart/mixed; boundary="===============5229025483059091350=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [blk] 394534b2c5: fsmark.files_per_sec -44.7% regression
Date: Thu, 04 Feb 2021 10:45:05 +0100
Message-ID: <20210204094505.is2cjiyykvtkda6p@linutronix.de>
In-Reply-To: <20210204084625.GG17757@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5229025483059091350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-02-04 16:46:25 [+0800], kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -44.7% regression of fsmark.files_per_sec due to commit:
> =

> =

> commit: 394534b2c5302585358c1007a8038e6e6efc465b ("blk-mq: Use llist_head=
 for blk_cpu_done")
> https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git blk

I updated the patches, they were slightly outdated. But this means there
is a performance regression, right?

> in testcase: fsmark
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 512G memory
> with following parameters:
> =

> 	iterations: 1x
> 	nr_threads: 32t
> 	disk: 1SSD
> 	fs: f2fs
> 	filesize: 9B
> 	test_size: 400M
> 	sync_method: fsyncBeforeClose
> 	nr_directories: 16d
> 	nr_files_per_directory: 256fpd
> 	cpufreq_governor: performance
> 	ucode: 0x5003003

What kind of ssd is this? It is a SSD not NVME. It has one block queue,
one interrupt. The hardware has 96 threads and the application,
performing the test, has 32 threads. With 96 threads my guess is that it
is a two way NUMA. And the application is spread accross the two NUMA
nodes.

Sebastian
--===============5229025483059091350==--

