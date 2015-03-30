Content-Type: multipart/mixed; boundary="===============7887375442821546900=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/platform, acpi] 7486341a98f: genirq: Flags mismatch irq 8. 00000080 (mmc0) vs. 00000000 (rtc0)
Date: Mon, 30 Mar 2015 20:19:38 +0800
Message-ID: <55193F5A.1030001@linux.intel.com>
In-Reply-To: <55190B4E.7080708@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7887375442821546900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2015/3/30 16:37, Jiang Liu wrote:
> On 2015/3/30 16:28, Li, Aubrey wrote:
>> Ying,
>>
>> can you please try this patch to see if the problem is gone on your side?
> Hi Aubrey,
> 	I would be better if we could change RTC driver instead.

Hey Gerry,

IRQ8 for RTC is for history reason. If we dynamically assign IRQ to RTC,
it might be a mess for legacy machine. If we still use IRQ8 for RTC but
dynamically assign IRQ to other components, then there is a race IRQ8
being used before RTC driver is loaded.

So, statically assigning IRQ is the best choice in my mind, this also
matches the original IRQ assign policy.

Thanks,
-Aubrey

> Thanks!
> Gerry
>>
>> Thanks,
>> -Aubrey
>>
>>
>> On 2015/3/26 20:13, Li, Aubrey wrote:
>>> On 2015/3/25 15:22, Huang Ying wrote:
>>>> [   28.745155] genirq: Flags mismatch irq 8. 00000080 (mmc0) vs. 00000=
000 (rtc0)
>>>
>>> okay, I replicated this on my side now.
>>>
>>> Firstly, I don't think the patch did anything wrong. However, the patch
>>> exposes a few issues FWICT currently:
>>>
>>> - Should we enable RTC Alarm the kind of Fixed hardware event in
>>> hardware-reduced ACPI mode? I found RTC required registers in ACPI PM
>>> block are not valid(register address =3D 0)
>>>
>>> - I checked RTC device in ACPI table, there is no interrupt resource
>>> under RTC(firmware bug?), So irq 8 should be a hardcoded number. The
>>> question is, shouldn't we update bitmap of allocated_irqs here? Or we
>>> assume irq0~15 is reserved? If we assume IRQ0~15 is reserved, then
>>> requesting IRQ8 without updating bitmap of allocated_irqs is fine.
>>>
>>> - Because we don't update bitmap of allocated_irqs when RTC request
>>> IRQ8, so when MMC driver allocate irq resource, it's possible it gets
>>> irq8, so we saw "genirq: Flags mismatch irq 8. 00000080 (mmc0) vs.
>>> 00000000 (rtc0)". So here is another question, when we dynamically
>>> allocate irq from irq domain, shouldn't we start from IRQ16? Yes, if
>>> allocated_irqs bitmap is updated, then it should be fine if we start
>>> from IRQ1.
>>>
>>> What the patch does is, it changes the behavior of how we allocate irq
>>> from irq domain. Previously we have legacy IRQs so we statically assign
>>> IRQ numbers for IOAPICs to host legacy IRQs, and now we allocate every
>>> IRQ dynamically.
>>>
>>> For me I think I can deliver a patch against RTC driver to update
>>> allocated_irqs bitmap, also, we should free irq when we found RTC ACPI
>>> registers are not valid.
>>>
>>> Certainly I'm open to any suggestions.
>>>
>>> Thanks,
>>> -Aubrey
>>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> =

> =



--===============7887375442821546900==--

