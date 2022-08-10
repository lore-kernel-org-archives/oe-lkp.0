Content-Type: multipart/mixed; boundary="===============8684200031658705991=="
MIME-Version: 1.0
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Wed, 10 Aug 2022 06:52:03 -0700
Message-ID: <b3ce0a28-0f94-6d2a-3f88-998da8f870b4@opensource.wdc.com>
In-Reply-To: <82dbf4d6-2d43-20ff-22a7-857f9f11a5ce@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8684200031658705991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/08/10 1:33, John Garry wrote:
> On 09/08/2022 15:57, Damien Le Moal wrote:
>>>> As far as I can see, this patch should not make a difference unless the
>>>> ATA shost driver is setting the max_sectors value unnecessarily low.
>>> For __ATA_BASE_SHT, we don't set max_sectors. As such, we default
>>> shost->max_sectors =3D SCSI_DEFAULT_MAX_SECTORS (=3D1024) in
>>> scsi_host_alloc(). I assume no shost dma mapping limit applied.
>>>
>>> Then - for example - we could select dev->max_sectors =3D
>>> ATA_MAX_SECTORS_LBA48 (=3D65535) in ata_dev_configure().
>>>
>>> So with commit 0568e6122574 we would have final max sectors =3D 1024, as
>>> opposed to 65535 previously. I guess that the problem is something like
>>> this.
>>>
>>> If so, it seems that we would need to apply the shost dma mapping limit
>>> separately in ata_scsi_dev_config() and not use shost->max_sectors.
>> OK. Will have a look at that.
>>
> =

> We may need to introduce something like shost->max_hw_sectors, which is =

> set according to sht max sectors and dma mapping limits. That could be =

> also used in USB scsiglue slave_configure()
> =

> Or else set max_sectors value for __ATA_BASE_SHT, but I don't know a =

> sane value there considering ATA_MAX_SECTORS_LBA48 gives max_sectors of =

> 65535.
> =

> Damien, please let me know if you need help now. I am just waiting for =

> you to test to prove this theory about dev->max_sectors being capped. I =

> don't have an AHCI setup readily-available for testing - just SAS cards =

> or QEMU.

I am on it.

> =

> Thanks,
> John


-- =

Damien Le Moal
Western Digital Research
--===============8684200031658705991==--

