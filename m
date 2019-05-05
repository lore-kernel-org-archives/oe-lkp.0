Content-Type: multipart/mixed; boundary="===============1026673866845918395=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] 345c0dbf3a: xfstests.ext4.303.fail
Date: Sun, 05 May 2019 17:12:21 +0800
Message-ID: <e2f687d1-2386-05d3-dc79-67ac1ba81a0e@intel.com>
In-Reply-To: <20190426162810.GA9835@mit.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============1026673866845918395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 4/27/19 12:28 AM, Theodore Ts'o wrote:
> On Fri, Apr 26, 2019 at 05:47:09PM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 345c0dbf3a30872d9b204db96b5857cd00808cae ("ext4: protect journal=
 inode's blocks using block_validity")
>> https://git.kernel.org/cgit/linux/kernel/git/tytso/ext4.git dev
>>
>> in testcase: xfstests
>> with following parameters:
>>
>> 	disk: 4HDD
>> 	fs: ext4
>> 	test: ext4-run
> Hi, I'm not able to reproduce this.


Thanks for your input, we found the test result of ext4/303 is not =

stable on this commit, but it's no problem on v5.1-rc7.


>
> TESTRUNID: tytso-20190426093752
> KERNEL:    kernel 5.1.0-rc3-xfstests-00007-g345c0dbf3a30 #921 SMP Fri Apr=
 26 09:36:55 EDT 2019 x86_64
> CMDLINE:   -c 4k -g auto
> CPUS:      2
> MEM:       7680
>
> ext4/4k: 462 tests, 43 skipped, 4271 seconds
> Totals: 419 tests, 43 skipped, 0 failures, 0 errors, 4249s
>
> Ran: ext4/001 ext4/002 ext4/003 ext4/004 ext4/005 ext4/020 ext4/021 ext4/=
022 ext4/023 ext4/024 ext4/025 ext4/026 ext4/027 ext4/028 ext4/029 ext4/030=
 ext4/031 ext4/032 ext4/033 ext4/034 ext4/271 ext4/301 ext4/302 ext4/303 ex=
t4/305 ext4/306 ext4/307 ext4/308 generic/001 generic/002 generic/003 ....
>
> Given some of the failures, especially this one:


Yes, it's our fault, we have fixed it.

Best Regards,
Rong Chen


>
>> ext4/307	- output mismatch (see /lkp/benchmarks/xfstests/results//ext4/3=
07.out.bad)
>>      --- tests/ext4/307.out	2019-04-25 09:04:55.000000000 +0800
>>      +++ /lkp/benchmarks/xfstests/results//ext4/307.out.bad	2019-04-26 1=
3:15:02.522490198 +0800
>>      @@ -1,6 +1,7 @@
>>       QA output created by 307
>>       =

>>       Run fsstress
>>      +./tests/ext4/307: line 34: gawk: command not found
>>       Allocate donor file
>>       Perform compacting
>>       Check data
>>      ...
>>      (Run 'diff -u /lkp/benchmarks/xfstests/tests/ext4/307.out /lkp/benc=
hmarks/xfstests/results//ext4/307.out.bad'  to see the entire diff)
> I'm very much wondering whether your VM has gotten corrupted or hasn't
> been correctly set up?
>
> 					- Ted

--===============1026673866845918395==--

