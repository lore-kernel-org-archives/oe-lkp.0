Content-Type: multipart/mixed; boundary="===============0178672048102259759=="
MIME-Version: 1.0
From: Filipe Manana <fdmanana@suse.com>
To: lkp@lists.01.org
Subject: Re: [Btrfs] 3a8b36f3780: -62.6% fileio.requests_per_sec
Date: Wed, 01 Apr 2015 10:56:38 +0100
Message-ID: <551BC0D6.6060504@suse.com>
In-Reply-To: <1427864347.17170.105.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0178672048102259759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/01/2015 05:59 AM, Huang Ying wrote:
> On Tue, 2015-03-31 at 15:59 +0100, Filipe Manana wrote:
> =

> [snip]
> =

>> From: Filipe Manana <fdmanana@suse.com>
>> Date: Tue, 31 Mar 2015 14:16:52 +0100
>> Subject: [PATCH] Btrfs: avoid syncing log in the fast fsync path when not
>>  necessary
>>
>> Commit 3a8b36f37806 ("Btrfs: fix data loss in the fast fsync path") added
>> a performance regression for that causes an unnecessary sync of the log
>> trees (fs/subvol and root log trees) when 2 consecutive fsyncs are done
>> against a file, without no writes or any metadata updates to the inode in
>> between them and if a transaction is committed before the second fsync is
>> called.
>>
>> Huang Ying reported this to lkml after a test sysbench test that measured
>> a -62% decrease of file io requests for that tests' workload.
>>
>> The test is:
>>
>>   echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_govern=
or
>>   echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_govern=
or
>>   echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_govern=
or
>>   echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_govern=
or
>>   mkfs -t btrfs /dev/sda2
>>   mount -t btrfs /dev/sda2 /fs/sda2
>>   cd /fs/sda2
>>   for ((i =3D 0; i < 1024; i++)); do fallocate -l 67108864 testfile.$i; =
done
>>   sysbench --test=3Dfileio --max-requests=3D0 --num-threads=3D4 --max-ti=
me=3D600 \
>>     --file-test-mode=3Drndwr --file-total-size=3D68719476736 --file-io-m=
ode=3Dsync \
>>     --file-num=3D1024 run
>>
>> A test on kvm guest, running a debug kernel gave me the following result=
s:
>>
>> Without 3a8b36f378060d:             16.01 reqs/sec
>> With 3a8b36f378060d:                 3.39 reqs/sec
>> With 3a8b36f378060d and this patch: 16.04 reqs/sec
>>
>> Reported-by: Huang Ying <ying.huang@intel.com>
> =

> I have tested your patch, the regression restored in our test.  Thanks!
> =

> Tested-by: Huang, Ying <ying.huang@intel.com>

Thank you very much for testing it and the report.
I'll now send the exact same patch, with your Tested-by tag, to the
btrfs mailing list, so that Chris can pick it from patchwork and can
more easily be noticed by the btrfs community (for review, test, etc).

regards,
Filipe Manana

> =

> Best Regards,
> Huang, Ying
> =

> [snip]
> =

> =

>=20

--===============0178672048102259759==--

