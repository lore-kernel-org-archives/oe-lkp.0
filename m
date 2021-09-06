Content-Type: multipart/mixed; boundary="===============8176651371194091871=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/migrate] 9eeb73028c: stress-ng.memhotplug.ops_per_sec -53.8% regression
Date: Mon, 06 Sep 2021 16:31:41 +0800
Message-ID: <874kayhzpu.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <20210906060908.GA17483@chenyu5-mobl1>
List-Id: <oe-lkp.lists.linux.dev>

--===============8176651371194091871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Chen Yu <yu.c.chen@intel.com> writes:

> On Mon, Sep 06, 2021 at 01:57:56PM +0800, Huang, Ying wrote:
>> Dave Hansen <dave.hansen@intel.com> writes:
>> =

>> > On 9/5/21 6:53 PM, Huang, Ying wrote:
>> >>> in testcase: stress-ng
>> >>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU=
 @ 2.10GHz with 192G memory
>> >>> with following parameters:
>> >>>
>> >>> 	nr_threads: 10%
>> >>> 	disk: 1HDD
>> >>> 	testtime: 60s
>> >>> 	fs: ext4
>> >>> 	class: os
>> >>> 	test: memhotplug
>> >>> 	cpufreq_governor: performance
>> >>> 	ucode: 0x5003006
>> >>>
>> >> Because we added some operations during online/offline CPU, it's
>> >> expected that the performance of online/offline CPU will decrease.  In
>> >> most cases, the performance of CPU hotplug isn't a big problem.  But
>> >> then I remembers that the performance of the CPU hotplug may influence
>> >> suspend/resume performance :-(
>> >> =

>> >> It appears that it is easy and reasonable to enclose the added
>> >> operations inside #ifdef CONFIG_NUMA.  Is this sufficient to restore =
the
>> >> performance of suspend/resume?
>> >
>> > It's "memhotplug", not CPUs, right?
>> =

>> Yes.  Thanks for pointing that out!
>> =

>> We will update node_demotion[] in CPU hotplug too.  Because the status
>> that whether a node has CPU may change after CPU hotplug.  And CPU
>> online/offline performance may be relevant for suspend/resume.
>>
> Rui and I took a look at the default kernel config, it seems that CONFIG_=
NUMA is
> enabled on laptops on some distributions. Maybe a runtime detecting flag =
indicating
> that whether this system has enabled NUMA (static key eg) would be an opt=
ion too, so as
> not to enable node_demotion[] on non-NUMA laptops/desktops.

Got it!  Thanks for your information.  Maybe we can try Dave's method
firstly and check whether that's OK for suspend/resume.

Best Regards,
Huang, Ying
--===============8176651371194091871==--

