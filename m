Content-Type: multipart/mixed; boundary="===============1691476031459042386=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/migrate] 9eeb73028c: stress-ng.memhotplug.ops_per_sec -53.8% regression
Date: Mon, 06 Sep 2021 13:57:56 +0800
Message-ID: <87lf4ai6u3.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <ee55e83e-d8bd-2888-3159-154706aa5173@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1691476031459042386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dave Hansen <dave.hansen@intel.com> writes:

> On 9/5/21 6:53 PM, Huang, Ying wrote:
>>> in testcase: stress-ng
>>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ =
2.10GHz with 192G memory
>>> with following parameters:
>>>
>>> 	nr_threads: 10%
>>> 	disk: 1HDD
>>> 	testtime: 60s
>>> 	fs: ext4
>>> 	class: os
>>> 	test: memhotplug
>>> 	cpufreq_governor: performance
>>> 	ucode: 0x5003006
>>>
>> Because we added some operations during online/offline CPU, it's
>> expected that the performance of online/offline CPU will decrease.  In
>> most cases, the performance of CPU hotplug isn't a big problem.  But
>> then I remembers that the performance of the CPU hotplug may influence
>> suspend/resume performance :-(
>> =

>> It appears that it is easy and reasonable to enclose the added
>> operations inside #ifdef CONFIG_NUMA.  Is this sufficient to restore the
>> performance of suspend/resume?
>
> It's "memhotplug", not CPUs, right?

Yes.  Thanks for pointing that out!

We will update node_demotion[] in CPU hotplug too.  Because the status
that whether a node has CPU may change after CPU hotplug.  And CPU
online/offline performance may be relevant for suspend/resume.

> I didn't do was to actively go out and look for changes that would
> affect the migration order.  The code just does regenerates and writes
> the order blindly when it sees any memory hotplug event.  I have the
> feeling the synchronize_rcu()s are what's killing us.
>
> It would be pretty easy to go and generate the order, but only do the
> update and the RCU bits when the order changes from what was there.
>
> I guess we have a motivation now.

I don't know whether the performance of memory hotplug is important or
not.  But it should be welcome not to make it too bad.  You proposal
sounds good.

Best Regards,
Huang, Ying
--===============1691476031459042386==--

