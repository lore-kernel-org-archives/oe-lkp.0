Content-Type: multipart/mixed; boundary="===============6055556658986728983=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] e076ab2a2c: fio.write_iops -18.3% regression
Date: Tue, 12 Jan 2021 16:45:29 +0100
Message-ID: <20210112154529.GT6430@twin.jikos.cz>
In-Reply-To: <20210112153614.GA2015@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6055556658986728983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 11:36:14PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -18.3% regression of fio.write_iops due to commit:
> =

> =

> commit: e076ab2a2ca70a0270232067cd49f76cd92efe64 ("btrfs: shrink delalloc=
 pages instead of full inodes")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: fio-basic
> on test machine: 192 threads Intel(R) Xeon(R) CPU @ 2.20GHz with 192G mem=
ory
> with following parameters:
> =

> 	disk: 1SSD
> 	fs: btrfs
> 	runtime: 300s
> 	nr_task: 8
> 	rw: randwrite
> 	bs: 4k
> 	ioengine: sync
> 	test_size: 256g

Though I do a similar test (emulating bit torrent workload), it's a bit
extreme as it's 4k synchronous on a huge file. It always takes a lot of
time but could point out some concurrency issues namely on faster
devices. There are 8 threads possibly competing for the same inode lock
or other locks related to it.

The mentioned commit fixed another perf regression on a much more common
workload (untgrring files), so at this point drop in this fio workload
is inevitable.
--===============6055556658986728983==--

