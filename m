Content-Type: multipart/mixed; boundary="===============2542398828987898150=="
MIME-Version: 1.0
From: Jiang Liu <jiang.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/MSI] 52f518a3a7c: -30.5% netperf.Throughput_tps
Date: Tue, 16 Jun 2015 10:09:29 +0800
Message-ID: <557F8559.4040105@linux.intel.com>
In-Reply-To: <alpine.DEB.2.11.1506151943000.4120@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============2542398828987898150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2015/6/16 1:52, Thomas Gleixner wrote:
> On Mon, 15 Jun 2015, Huang Ying wrote:
> =

>> FYI, we noticed the below changes on
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> commit 52f518a3a7c2f80551a38d38be28bc9f335e713c ("x86/MSI: Use hierarchi=
cal irqdomains to manage MSI interrupts")
>>
> =

> I really appreciate this testing effort, but the information provided
> is not really helpful.
> =

> I asked this before. Can you pretty please, upload ALL relevant
> information (.config, full dmesg, below stats, /proc/interrupts ...)
> to some place where everyone interested can download them?
> =

> Then themail contains a useful link instead of 200k waste of network band=
width.

Hi Ying and Thomas,
	I guess this report discloses a regression in hierarchy
irqdomain, and which should have been fixed by the patch posted at:
lkml.org/lkml/2015/6/1/80
	The root cause is that, with hierarchy irqdomain enabled,
there are multiple irq_data associated with one irq. And function
irq_move_irq() on x86 uses a wrong copy of irq_data to check
whether there's pending irq migration operation. So all irq migration
/set_affinity operations will get pending for ever. This may
affect network performance due to interrupt load balance issue.
And the patch set posted at
www.gossamer-threads.com/lists/linux/kernel/2185533
should have solved all such regressions.

Thanks!
Gerry

> =

> Thanks,
> =

> 	tglx =

>=20

--===============2542398828987898150==--

