Content-Type: multipart/mixed; boundary="===============4086500918808808796=="
MIME-Version: 1.0
From: Murali Karicheri <m-karicheri2@ti.com>
To: lkp@lists.01.org
Subject: Re: [PCI] BUG: unable to handle kernel
Date: Fri, 06 Mar 2015 12:50:44 -0500
Message-ID: <54F9E8F4.4070106@ti.com>
In-Reply-To: <20150306165504.GA30094@roeck-us.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4086500918808808796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/06/2015 11:55 AM, Guenter Roeck wrote:
> On Fri, Mar 06, 2015 at 10:48:59AM -0500, Murali Karicheri wrote:
> [ ... ]
>
>> > From 098b4f5e4ab9407fbdbfcca3a91785c17e25cf03 Mon Sep 17 00:00:00 2001
>> From: Murali Karicheri<m-karicheri2@ti.com>
>> Date: Fri, 6 Mar 2015 10:23:08 -0500
>> Subject: [PATCH] pci: of : fix kernel crash
>>
>> This is a debug patch to root cause the kernel crash
>>
>> 	commit 0b2af171520e5d5e7d5b5f479b90a6a5014d9df6
>>
>> 	PCI: Update DMA configuration from DT
>>
>> Signed-off-by: Murali Karicheri<m-karicheri2@ti.com>
>> ---
>>   drivers/of/of_pci.c       |    8 ++++++++
>>   drivers/pci/host-bridge.c |    5 +++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
>> index 86d3c38..5a59fb8 100644
>> --- a/drivers/of/of_pci.c
>> +++ b/drivers/of/of_pci.c
>> @@ -129,6 +129,14 @@ void of_pci_dma_configure(struct pci_dev *pci_dev)
>>   	struct device *dev =3D&pci_dev->dev;
>>   	struct device *bridge =3D pci_get_host_bridge_device(pci_dev);
>>
>> +	if (!bridge || !bridge->parent) {
>> +		if (!bridge)
>> +			pr_err("PCI bridge not found\n");
>> +		if (!bridge->parent)
>> +			pr_err("PCI bridge parent not found\n");
>
> You'll see a crash here if bridge is NULL. Maybe add an else before the s=
econd
> if statement ? Also, dev_err might be a bit more useful and would be avai=
lable.
>
Yes. Sorry, my bad. I will fix it and re-send

Murali
> Thanks,
> Guenter
>
>> +		return;
>> +	}
>> +
>>   	of_dma_configure(dev, bridge->parent->of_node);
>>   	pci_put_host_bridge_device(bridge);
>>   }
>> diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
>> index 3e5bbf9..ef2ab51 100644
>> --- a/drivers/pci/host-bridge.c
>> +++ b/drivers/pci/host-bridge.c
>> @@ -28,6 +28,11 @@ struct device *pci_get_host_bridge_device(struct pci_=
dev *dev)
>>   	struct pci_bus *root_bus =3D find_pci_root_bus(dev->bus);
>>   	struct device *bridge =3D root_bus->bridge;
>>
>> +	if (!bridge) {
>> +		pr_err("PCI: bridge not found\n");
>> +		return NULL;
>> +	}
>> +
>>   	kobject_get(&bridge->kobj);
>>   	return bridge;
>>   }
>> --
>> 1.7.9.5
>>
>


-- =

Murali Karicheri
Linux Kernel, Texas Instruments

--===============4086500918808808796==--

