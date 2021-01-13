Content-Type: multipart/mixed; boundary="===============7689014064653572318=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] e076ab2a2c: fio.write_iops -18.3% regression
Date: Wed, 13 Jan 2021 13:58:18 +0800
Message-ID: <979aee28-c603-a187-e03f-29957c7b94d6@linux.intel.com>
In-Reply-To: <20210112154529.GT6430@twin.jikos.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7689014064653572318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/12/2021 11:45 PM, David Sterba wrote:
> On Tue, Jan 12, 2021 at 11:36:14PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -18.3% regression of fio.write_iops due to commit:
>>
>>
>> commit: e076ab2a2ca70a0270232067cd49f76cd92efe64 ("btrfs: shrink delallo=
c pages instead of full inodes")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>>
>> in testcase: fio-basic
>> on test machine: 192 threads Intel(R) Xeon(R) CPU @ 2.20GHz with 192G me=
mory
>> with following parameters:
>>
>> 	disk: 1SSD
>> 	fs: btrfs
>> 	runtime: 300s
>> 	nr_task: 8
>> 	rw: randwrite
>> 	bs: 4k
>> 	ioengine: sync
>> 	test_size: 256g
> Though I do a similar test (emulating bit torrent workload), it's a bit
> extreme as it's 4k synchronous on a huge file. It always takes a lot of
> time but could point out some concurrency issues namely on faster
> devices. There are 8 threads possibly competing for the same inode lock
> or other locks related to it.
>
> The mentioned commit fixed another perf regression on a much more common
> workload (untgrring files), so at this point drop in this fio workload
> is inevitable.

Do you have a plan to fix it? Thanks.
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing

--===============7689014064653572318==--

