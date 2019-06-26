Content-Type: multipart/mixed; boundary="===============4006463321315225153=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] c8eaeac7b7: aim7.jobs-per-min -11.7% regression
Date: Wed, 26 Jun 2019 10:39:36 +0800
Message-ID: <a80ab85b-635f-90fe-24da-5f746c613811@intel.com>
In-Reply-To: <20190625142242.oxltqbj2veuckoxo@MacBook-Pro-91.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============4006463321315225153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/25/19 10:22 PM, Josef Bacik wrote:
> On Fri, Jun 21, 2019 at 08:48:03AM +0800, Huang, Ying wrote:
>> "Huang, Ying" <ying.huang@intel.com> writes:
>>
>>> "Huang, Ying" <ying.huang@intel.com> writes:
>>>
>>>> Hi, Josef,
>>>>
>>>> kernel test robot <rong.a.chen@intel.com> writes:
>>>>
>>>>> Greeting,
>>>>>
>>>>> FYI, we noticed a -11.7% regression of aim7.jobs-per-min due to commi=
t:
>>>>>
>>>>>
>>>>> commit: c8eaeac7b734347c3afba7008b7af62f37b9c140 ("btrfs: reserve
>>>>> delalloc metadata differently")
>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>>>
>>>>> in testcase: aim7
>>>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz=
 with 384G memory
>>>>> with following parameters:
>>>>>
>>>>> 	disk: 4BRD_12G
>>>>> 	md: RAID0
>>>>> 	fs: btrfs
>>>>> 	test: disk_rr
>>>>> 	load: 1500
>>>>> 	cpufreq_governor: performance
>>>>>
>>>>> test-description: AIM7 is a traditional UNIX system level benchmark
>>>>> suite which is used to test and measure the performance of multiuser
>>>>> system.
>>>>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>>>> Here's another regression, do you have time to take a look at this?
>>> Ping
>> Ping again ...
>>
> Finally got time to look at this but I can't get the reproducer to work
>
> root(a)destiny ~/lkp-tests# bin/lkp run ~/job-aim.yaml
> Traceback (most recent call last):
>          11: from /root/lkp-tests/bin/run-local:18:in `<main>'
>          10: from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb=
:54:in `require'
>           9: from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb=
:54:in `require'
>           8: from /root/lkp-tests/lib/yaml.rb:5:in `<top (required)>'
>           7: from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb=
:54:in `require'
>           6: from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb=
:54:in `require'
>           5: from /root/lkp-tests/lib/common.rb:9:in `<top (required)>'
>           4: from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb=
:54:in `require'
>           3: from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb=
:54:in `require'
>           2: from /root/lkp-tests/lib/array_ext.rb:3:in `<top (required)>'
>           1: from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb=
:54:in `require'
> /usr/share/rubygems/rubygems/core_ext/kernel_require.rb:54:in `require': =
cannot load such file -- active_support/core_ext/enumerable (LoadError)

Hi Josef,

I tried the latest lkp-tests, and didn't have the problem. Could you =

please update the lkp-tests repo and run "lkp install" again?

Thanks,
Rong Chen


>
> I can't even figure out from the job file or anything how I'm supposed to=
 run
> AIM7 itself.  This is on a Fedora 30 box, so it's relatively recent.  Tha=
nks,
>
> Josef

--===============4006463321315225153==--

