Content-Type: multipart/mixed; boundary="===============4679700272766942661=="
MIME-Version: 1.0
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Tue, 16 Aug 2022 08:42:42 -0700
Message-ID: <43eaa104-5b09-072c-56aa-6289569b0015@opensource.wdc.com>
In-Reply-To: <aabf7ed8-8d4d-dc68-1b8b-c91653701def@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4679700272766942661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/08/16 3:35, John Garry wrote:
> On 16/08/2022 07:57, Oliver Sang wrote:
>>>> For me, a complete kernel log may help.
>>> and since only 1HDD, the output of the following would be helpful:
>>>
>>> /sys/block/sda/queue/max_sectors_kb
>>> /sys/block/sda/queue/max_hw_sectors_kb
>>>
>>> And for 5.19, if possible.
>> for commit
>> 0568e61225 ("ata: libata-scsi: cap ata_device->max_sectors according to =
shost->max_sectors")
>>
>> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
>> 512
>> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
>> 512
>>
>> for both commit
>> 4cbfca5f77 ("scsi: scsi_transport_sas: cap shost opt_sectors according t=
o DMA optimal limit")
>> and v5.19
>>
>> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
>> 1280
>> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
>> 32767
>>
> =

> thanks, I appreciate this.
> =

>  From the dmesg, I see 2x SATA disks - I was under the impression that =

> the system only has 1x.
> =

> Anyway, both drives show LBA48, which means the large max hw sectors at =

> 32767KB:
> [   31.129629][ T1146] ata6.00: 1562824368 sectors, multi 1: LBA48 NCQ =

> (depth 32)
> =

> So this is what I suspected: we are capped from the default shost max =

> sectors (1024 sectors).
> =

> This seems like the simplest fix for you:
> =

> --- a/include/linux/libata.h
> +++ b/include/linux/libata.h
> @@ -1382,7 +1382,8 @@ extern const struct attribute_group =

> *ata_common_sdev_groups[];
>         .proc_name              =3D drv_name,                     \
>         .slave_destroy          =3D ata_scsi_slave_destroy,       \
>         .bios_param             =3D ata_std_bios_param,           \
> -       .unlock_native_capacity =3D ata_scsi_unlock_native_capacity
> +       .unlock_native_capacity =3D ata_scsi_unlock_native_capacity,\
> +       .max_sectors =3D ATA_MAX_SECTORS_LBA48

This is crazy large (65535 x 512 B sectors) and never result in that being
exposed as the actual max_sectors_kb since other limits will apply first
(mapping size).

The regression may come not from commands becoming tiny, but from the fact =
that
after the patch, max_sectors_kb is too large, causing a lot of overhead with
qemu swiotlb mapping and slowing down IO processing.

Above, it can be seen that we ed up with max_sectors_kb being 1280, which i=
s the
default for most scsi disks (including ATA drives). That is normal. But bef=
ore
that, it was 512, which likely better fits qemu swiotlb and does not genera=
te
overhead. So the above fix will not change anything I think...

> A concern is that other drivers which use libata may have similar =

> issues, as they use default in SCSI_DEFAULT_MAX_SECTORS for max_sectors:
> hisi_sas
> pm8001
> aic9xxx
> mvsas
> isci
> =

> So they may be needlessly hobbled for some SATA disks. However I have a =

> system with hisi_sas controller and attached LBA48 disk. I tested =

> performance for v5.19 vs 6.0 and it was about the same for fio rw=3Dread =
@ =

> ~120K IOPS. I can test this further.
> =

> Thanks,
> John


-- =

Damien Le Moal
Western Digital Research
--===============4679700272766942661==--

