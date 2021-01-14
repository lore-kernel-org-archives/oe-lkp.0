Content-Type: multipart/mixed; boundary="===============1647821007717060229=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] e076ab2a2c: fio.write_iops -18.3% regression
Date: Thu, 14 Jan 2021 23:50:28 +0100
Message-ID: <20210114225028.GF6430@twin.jikos.cz>
In-Reply-To: <979aee28-c603-a187-e03f-29957c7b94d6@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1647821007717060229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 01:58:18PM +0800, Xing Zhengjun wrote:
> =

> =

> On 1/12/2021 11:45 PM, David Sterba wrote:
> > On Tue, Jan 12, 2021 at 11:36:14PM +0800, kernel test robot wrote:
> >> Greeting,
> >>
> >> FYI, we noticed a -18.3% regression of fio.write_iops due to commit:
> >>
> >>
> >> commit: e076ab2a2ca70a0270232067cd49f76cd92efe64 ("btrfs: shrink delal=
loc pages instead of full inodes")
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >>
> >>
> >> in testcase: fio-basic
> >> on test machine: 192 threads Intel(R) Xeon(R) CPU @ 2.20GHz with 192G =
memory
> >> with following parameters:
> >>
> >> 	disk: 1SSD
> >> 	fs: btrfs
> >> 	runtime: 300s
> >> 	nr_task: 8
> >> 	rw: randwrite
> >> 	bs: 4k
> >> 	ioengine: sync
> >> 	test_size: 256g
> > Though I do a similar test (emulating bit torrent workload), it's a bit
> > extreme as it's 4k synchronous on a huge file. It always takes a lot of
> > time but could point out some concurrency issues namely on faster
> > devices. There are 8 threads possibly competing for the same inode lock
> > or other locks related to it.
> >
> > The mentioned commit fixed another perf regression on a much more common
> > workload (untgrring files), so at this point drop in this fio workload
> > is inevitable.
> =

> Do you have a plan to fix it? Thanks.

My plan is to find somebody who will fix it. Thanks.
--===============1647821007717060229==--

