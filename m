Content-Type: multipart/mixed; boundary="===============7025995555467049837=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Tue, 16 Aug 2022 17:38:43 +0100
Message-ID: <28d6e48b-f52f-9467-8260-262504a1a1ff@huawei.com>
In-Reply-To: <43eaa104-5b09-072c-56aa-6289569b0015@opensource.wdc.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7025995555467049837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16/08/2022 16:42, Damien Le Moal wrote:
> On 2022/08/16 3:35, John Garry wrote:
>> On 16/08/2022 07:57, Oliver Sang wrote:
>>>>> For me, a complete kernel log may help.
>>>> and since only 1HDD, the output of the following would be helpful:
>>>>
>>>> /sys/block/sda/queue/max_sectors_kb
>>>> /sys/block/sda/queue/max_hw_sectors_kb
>>>>
>>>> And for 5.19, if possible.
>>> for commit
>>> 0568e61225 ("ata: libata-scsi: cap ata_device->max_sectors according to=
 shost->max_sectors")
>>>
>>> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
>>> 512
>>> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
>>> 512
>>>
>>> for both commit
>>> 4cbfca5f77 ("scsi: scsi_transport_sas: cap shost opt_sectors according =
to DMA optimal limit")
>>> and v5.19
>>>
>>> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
>>> 1280
>>> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
>>> 32767
>>>
>>
>> thanks, I appreciate this.
>>
>>   From the dmesg, I see 2x SATA disks - I was under the impression that
>> the system only has 1x.
>>
>> Anyway, both drives show LBA48, which means the large max hw sectors at
>> 32767KB:
>> [   31.129629][ T1146] ata6.00: 1562824368 sectors, multi 1: LBA48 NCQ
>> (depth 32)
>>
>> So this is what I suspected: we are capped from the default shost max
>> sectors (1024 sectors).
>>
>> This seems like the simplest fix for you:
>>
>> --- a/include/linux/libata.h
>> +++ b/include/linux/libata.h
>> @@ -1382,7 +1382,8 @@ extern const struct attribute_group
>> *ata_common_sdev_groups[];
>>          .proc_name              =3D drv_name,                     \
>>          .slave_destroy          =3D ata_scsi_slave_destroy,       \
>>          .bios_param             =3D ata_std_bios_param,           \
>> -       .unlock_native_capacity =3D ata_scsi_unlock_native_capacity
>> +       .unlock_native_capacity =3D ata_scsi_unlock_native_capacity,\
>> +       .max_sectors =3D ATA_MAX_SECTORS_LBA48
> =

> This is crazy large (65535 x 512 B sectors) and never result in that being
> exposed as the actual max_sectors_kb since other limits will apply first
> (mapping size).

Here is how I read values from above for max_sectors_kb and =

max_hw_sectors_kb:

v5.19 + 0568e61225 : 512/512
v5.19 + 0568e61225 + 4cbfca5f77 : 512/512
v5.19: 1280/32767

They are want makes sense to me, at least.

Oliver, can you confirm this? Thanks!

On this basis, it appears that max_hw_sectors_kb is getting capped from =

scsi default @ 1024 sectors by commit 0568e61225. If it were getting =

capped by swiotlb mapping limit then that would give us 512 sectors - =

this value is fixed.

So for my SHT change proposal I am just trying to revert to previous =

behaviour in 5.19 - make max_hw_sectors_kb crazy big again.

> =

> The regression may come not from commands becoming tiny, but from the fac=
t that
> after the patch, max_sectors_kb is too large, =


I don't think it is, but need confirmation.

>causing a lot of overhead with
> qemu swiotlb mapping and slowing down IO processing.

> =

> Above, it can be seen that we ed up with max_sectors_kb being 1280, which=
 is the
> default for most scsi disks (including ATA drives). That is normal. But b=
efore
> that, it was 512, which likely better fits qemu swiotlb and does not gene=
rate

Again, I don't think this this is the case. Need confirmation.

> overhead. So the above fix will not change anything I think...


Thanks,
John
--===============7025995555467049837==--

