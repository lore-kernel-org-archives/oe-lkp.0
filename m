Content-Type: multipart/mixed; boundary="===============3732624896651361377=="
MIME-Version: 1.0
From: Jiang Liu <jiang.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/MSI] 52f518a3a7c: -30.5% netperf.Throughput_tps
Date: Tue, 16 Jun 2015 13:51:28 +0800
Message-ID: <557FB960.9080202@linux.intel.com>
In-Reply-To: <1434433270.18774.203.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3732624896651361377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2015/6/16 13:41, Huang Ying wrote:
> Hi, Gerry,
> =

> On Tue, 2015-06-16 at 10:09 +0800, Jiang Liu wrote:
>> On 2015/6/16 1:52, Thomas Gleixner wrote:
>>> On Mon, 15 Jun 2015, Huang Ying wrote:
>> lkml.org/lkml/2015/6/1/80
>> 	The root cause is that, with hierarchy irqdomain enabled,
>> there are multiple irq_data associated with one irq. And function
>> irq_move_irq() on x86 uses a wrong copy of irq_data to check
>> whether there's pending irq migration operation. So all irq migration
>> /set_affinity operations will get pending for ever. This may
>> affect network performance due to interrupt load balance issue.
>> And the patch set posted at
>> www.gossamer-threads.com/lists/linux/kernel/2185533
>> should have solved all such regressions.
> =

> Thanks for your information.  Do you have a git tree for this patchset?

Hi Ying,
	You may access the branch at:
https://github.com/jiangliu/linux test/irq_data_v3
or view at url:
https://github.com/jiangliu/linux/tree/test/irq_data_v3
Thanks!
Gerry

> =

> Best Regards,
> Huang, Ying
> =

>=20

--===============3732624896651361377==--

