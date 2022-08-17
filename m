Content-Type: multipart/mixed; boundary="===============7207352579129604711=="
MIME-Version: 1.0
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Wed, 17 Aug 2022 08:55:00 -0700
Message-ID: <e46c8627-3444-1dd1-8fd9-a10b7f3f3851@opensource.wdc.com>
In-Reply-To: <c93e529d-b688-9910-50c4-779c2f85fbc3@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7207352579129604711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/08/16 13:44, John Garry wrote:
> On 16/08/2022 21:02, Damien Le Moal wrote:
>>> ou confirm this? Thanks!
>>>
>>> On this basis, it appears that max_hw_sectors_kb is getting capped from
>>> scsi default @ 1024 sectors by commit 0568e61225. If it were getting
>>> capped by swiotlb mapping limit then that would give us 512 sectors -
>>> this value is fixed.
>>>
>>> So for my SHT change proposal I am just trying to revert to previous
>>> behaviour in 5.19 - make max_hw_sectors_kb crazy big again.
>> I reread the entire thing and I think I got things reverted here. The pe=
rf
>> regression happens with the 512/512 settings, while the original 1280/32=
767
>> before your patches was OK.
> =

> Right, that's as I read it. It would be useful for Oliver to confirm the =

> results.
> =

>> So is your patch defining the optimal mapping size
>> cause the reduction to 512/512.
> =

> The optimal mapping size only affects specifically sas controllers, so I =

> think that we can ignore that one for now. The reduction to 512/512 =

> comes from the change in ata_scsi_dev_config().
> =

>> It would mean that for ATA, we need a sane
>> default mapping instead of SCSI default 1024 sectors.
> =

> Right
> =

>> Now I understand your
>> proposed change using ATA_MAX_SECTORS_LBA48.
>>
>> However, that would be correct only for LBA48 capable drives.
>> ata_dev_configure() already sets dev->max_sectors correctly according to=
 the
>> drive type, capabilities and eventual quirks. So the problem comes from =
the
>> libata-scsi change:
>>
>> dev->max_sectors =3D min(dev->max_sectors, sdev->host->max_sectors);
>>
>> when sdev->host->max_sectors is 0 (not initialized).
> =

> That cannot happen. If sht->max_sectors is 0, then we set =

> shost->max_sectors at SCSI default 1024 sectors in scsi_host_alloc()
> =

> For my proposed change, dev->max_sectors would still be initialized in =

> ata_dev_configure() according to drive type, etc. And it should be <=3D =

> LBA48 max sectors (=3D65535).
> =

> So then in ata_scsi_dev_config():
> =

> dev->max_sectors =3D min(dev->max_sectors, sdev->host->max_sectors)
> =

> this only has an impact for ahci controllers if sdev->host->max_sectors =

> was capped according to host dma dev max mapping size.

Got it. I think your fix is fine then. It brings everything the defaults to=
 what
they were before the dma max mapping patches.

> =

> I will admit that this is not ideal. An alt approach is to change =

> ata_scsi_dev_config() to cap the dev max_sectors only according to shost =

> dma dev mapping limit (similar to scsi_add_host_with_dma()), but that =

> would not work for a controller like ipr, which does have a geniune =

> max_sectors limit (which we should respect).
> =

> Thanks,
> John
> =

> =

>> So maybe simply changing
>> this line to:
>>
>> dev->max_sectors =3D min_not_zero(dev->max_sectors, sdev->host->max_sect=
ors);
>>
>> would do the trick ? Any particular adapter driver that needs a mapping =
cap on
>> the adpter max mapping size can still set sdev->host->max_sectors as nee=
ded, and
>> we keep the same defaults as before when it is not set. Thoughts ? Or am=
 I
>> missing something else ?
>>
>>
>>>> The regression may come not from commands becoming tiny, but from the =
fact that
>>>> after the patch, max_sectors_kb is too large,
>>> I don't think it is, but need confirmation.
>>>
>>>> causing a lot of overhead with
>>>> qemu swiotlb mapping and slowing down IO processing.
>>>> Above, it can be seen that we ed up with max_sectors_kb being 1280, wh=
ich is the
>>>> default for most scsi disks (including ATA drives). That is normal. Bu=
t before
>>>> that, it was 512, which likely better fits qemu swiotlb and does not g=
enerate
>>> Again, I don't think this this is the case. Need confirmation.
>>>
>>>> overhead. So the above fix will not change anything I think...
> =



-- =

Damien Le Moal
Western Digital Research
--===============7207352579129604711==--

