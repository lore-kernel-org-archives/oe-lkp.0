Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E737F
	for <oe-lkp@lists.linux.dev>; Wed,  1 Feb 2023 09:46:26 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4P6GpY1ZYxz4f3nTX
	for <oe-lkp@lists.linux.dev>; Wed,  1 Feb 2023 17:29:41 +0800 (CST)
Received: from [10.174.176.34] (unknown [10.174.176.34])
	by APP4 (Coremail) with SMTP id gCh0CgCH77IEMdpju0AzCw--.2703S3;
	Wed, 01 Feb 2023 17:29:42 +0800 (CST)
Subject: Re: [RFC PATCH 2/2] ext4: add journal cycled recording support
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-ext4@vger.kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.cz, yi.zhang@huawei.com,
 yukuai3@huawei.com
References: <202301301621.30292a65-yujie.liu@intel.com>
From: Zhang Yi <yi.zhang@huaweicloud.com>
Message-ID: <01625b14-a998-3c94-46dd-c13d1fc077dd@huaweicloud.com>
Date: Wed, 1 Feb 2023 17:29:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202301301621.30292a65-yujie.liu@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgCH77IEMdpju0AzCw--.2703S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr43ur4DuFWfKr18ZF4fZrb_yoW8tr45pa
	97Wr4YyrWvqw1xJr4q9a1rua48WwnYkF45Wwn2g343GayYvFy2qrs2qF4UXFy5ArZxWFya
	q3WkC3sIg3W2ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UWE__UUUUU=
X-CM-SenderInfo: d1lo6xhdqjqx5xdzvxpfor3voofrz/
X-CFilter-Loop: Reflected

Hello

On 2023/1/30 17:19, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed xfstests.ext4.053.fail due to commit (built with gcc-11):
> 
> commit: 8ed4c906ef9a43941026aad0360d84a9338e1c4c ("[RFC PATCH 2/2] ext4: add journal cycled recording support")
> url: https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/jbd2-cycled-record-log-on-clean-journal-logging-area/20230119-131055
> base: https://git.kernel.org/cgit/linux/kernel/git/tytso/ext4.git dev
> patch link: https://lore.kernel.org/all/20230119034600.3431194-3-yi.zhang@huaweicloud.com/
> patch subject: [RFC PATCH 2/2] ext4: add journal cycled recording support
> 
> in testcase: xfstests
> version: xfstests-x86_64-fb6575e-1_20230116
> with following parameters:
> 
> 	disk: 4HDD
> 	fs: ext2
> 	test: ext4-group-02
> 
> test-description: xfstests is a regression test suite for xfs and other files ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> 
> on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> QA output created by 053
> Silence is golden.
> mounting ext3 "noload" checking "norecovery" (going to remount options noload) (failed remount) FAILED
> mounting ext3 "noload" checking "noload" (going to remount options noload) (failed remount) FAILED
> mounting ext3 "data=journal" (failed mount) FAILED
> mounting ext3 "data=journal" (failed mount) FAILED
> mounting ext3 "data=ordered" (failed mount) FAILED
> mounting ext3 "data=ordered" (failed mount) FAILED
> mounting ext3 "data=writeback" (failed mount) FAILED
> mounting ext3 "data=writeback" (failed mount) FAILED
> mkfs failed - /usr/sbin/mkfs.ext4 -Fq -J device=/dev/loop0 /dev/sda4 1048576k /dev/sda4
> 
> 

This is a separate issue and could be fixed by "[PATCH] ext4: fix incorrect options show of original mount_opt and extend mount_opt2",
https://lore.kernel.org/linux-ext4/20230130111138.76tp6pij3yhh4brh@quack3/T/#m96a1cffd567bdd844233b3115a6635391ed0b45b

Thanks,
Yi.

