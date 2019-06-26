Content-Type: multipart/mixed; boundary="===============0981020423813043844=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] c8eaeac7b7: aim7.jobs-per-min -11.7% regression
Date: Wed, 26 Jun 2019 11:31:36 +0800
Message-ID: <a8cd42e0-339d-f8a7-40f7-bc0cd4fe9bff@intel.com>
In-Reply-To: <20190626031726.dd457kxc3zyuekyf@MacBook-Pro-91.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============0981020423813043844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/26/19 11:17 AM, Josef Bacik wrote:
> On Wed, Jun 26, 2019 at 10:39:36AM +0800, Rong Chen wrote:
>> On 6/25/19 10:22 PM, Josef Bacik wrote:
>>> On Fri, Jun 21, 2019 at 08:48:03AM +0800, Huang, Ying wrote:
>>>> "Huang, Ying" <ying.huang@intel.com> writes:
>>>>
>>>>> "Huang, Ying" <ying.huang@intel.com> writes:
>>>>>
>>>>>> Hi, Josef,
>>>>>>
>>>>>> kernel test robot <rong.a.chen@intel.com> writes:
>>>>>>
>>>>>>> Greeting,
>>>>>>>
>>>>>>> FYI, we noticed a -11.7% regression of aim7.jobs-per-min due to com=
mit:
>>>>>>>
>>>>>>>
>>>>>>> commit: c8eaeac7b734347c3afba7008b7af62f37b9c140 ("btrfs: reserve
>>>>>>> delalloc metadata differently")
>>>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
>>>>>>>
>>>>>>> in testcase: aim7
>>>>>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00G=
Hz with 384G memory
>>>>>>> with following parameters:
>>>>>>>
>>>>>>> 	disk: 4BRD_12G
>>>>>>> 	md: RAID0
>>>>>>> 	fs: btrfs
>>>>>>> 	test: disk_rr
>>>>>>> 	load: 1500
>>>>>>> 	cpufreq_governor: performance
>>>>>>>
>>>>>>> test-description: AIM7 is a traditional UNIX system level benchmark
>>>>>>> suite which is used to test and measure the performance of multiuser
>>>>>>> system.
>>>>>>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite=
7/
>>>>>> Here's another regression, do you have time to take a look at this?
>>>>> Ping
>>>> Ping again ...
>>>>
>>> Finally got time to look at this but I can't get the reproducer to work
>>>
>>> root(a)destiny ~/lkp-tests# bin/lkp run ~/job-aim.yaml
>>> Traceback (most recent call last):
>>>           11: from /root/lkp-tests/bin/run-local:18:in `<main>'
>>>           10: from /usr/share/rubygems/rubygems/core_ext/kernel_require=
.rb:54:in `require'
>>>            9: from /usr/share/rubygems/rubygems/core_ext/kernel_require=
.rb:54:in `require'
>>>            8: from /root/lkp-tests/lib/yaml.rb:5:in `<top (required)>'
>>>            7: from /usr/share/rubygems/rubygems/core_ext/kernel_require=
.rb:54:in `require'
>>>            6: from /usr/share/rubygems/rubygems/core_ext/kernel_require=
.rb:54:in `require'
>>>            5: from /root/lkp-tests/lib/common.rb:9:in `<top (required)>'
>>>            4: from /usr/share/rubygems/rubygems/core_ext/kernel_require=
.rb:54:in `require'
>>>            3: from /usr/share/rubygems/rubygems/core_ext/kernel_require=
.rb:54:in `require'
>>>            2: from /root/lkp-tests/lib/array_ext.rb:3:in `<top (require=
d)>'
>>>            1: from /usr/share/rubygems/rubygems/core_ext/kernel_require=
.rb:54:in `require'
>>> /usr/share/rubygems/rubygems/core_ext/kernel_require.rb:54:in `require'=
: cannot load such file -- active_support/core_ext/enumerable (LoadError)
>> Hi Josef,
>>
>> I tried the latest lkp-tests, and didn't have the problem. Could you ple=
ase
>> update the lkp-tests repo and run "lkp install" again?
>>
> I updated it this morning, and I just updated it now, my tree is on
>
> 2c5b1a95b08dbe81bba64419c482a877a3b424ac
>
> lkp install says everything is installed except
>
> No match for argument: libipc-run-perl

I've just fixed it. could you add "libipc-run-perl: perl-IPC-Run" to the =

end of distro/adaptation/fedora?

Thanks,
Rong Chen


>
> and it still doesn't run properly.  Thanks,
>
> Josef

--===============0981020423813043844==--

