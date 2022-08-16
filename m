Content-Type: multipart/mixed; boundary="===============9217945253140754577=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Tue, 16 Aug 2022 11:35:11 +0100
Message-ID: <aabf7ed8-8d4d-dc68-1b8b-c91653701def@huawei.com>
In-Reply-To: <Yvs/w93KUkgD9f7/@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9217945253140754577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16/08/2022 07:57, Oliver Sang wrote:
>>> For me, a complete kernel log may help.
>> and since only 1HDD, the output of the following would be helpful:
>>
>> /sys/block/sda/queue/max_sectors_kb
>> /sys/block/sda/queue/max_hw_sectors_kb
>>
>> And for 5.19, if possible.
> for commit
> 0568e61225 ("ata: libata-scsi: cap ata_device->max_sectors according to s=
host->max_sectors")
> =

> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
> 512
> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
> 512
> =

> for both commit
> 4cbfca5f77 ("scsi: scsi_transport_sas: cap shost opt_sectors according to=
 DMA optimal limit")
> and v5.19
> =

> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
> 1280
> root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
> 32767
> =


thanks, I appreciate this.

 From the dmesg, I see 2x SATA disks - I was under the impression that =

the system only has 1x.

Anyway, both drives show LBA48, which means the large max hw sectors at =

32767KB:
[   31.129629][ T1146] ata6.00: 1562824368 sectors, multi 1: LBA48 NCQ =

(depth 32)

So this is what I suspected: we are capped from the default shost max =

sectors (1024 sectors).

This seems like the simplest fix for you:

--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1382,7 +1382,8 @@ extern const struct attribute_group =

*ata_common_sdev_groups[];
        .proc_name              =3D drv_name,                     \
        .slave_destroy          =3D ata_scsi_slave_destroy,       \
        .bios_param             =3D ata_std_bios_param,           \
-       .unlock_native_capacity =3D ata_scsi_unlock_native_capacity
+       .unlock_native_capacity =3D ata_scsi_unlock_native_capacity,\
+       .max_sectors =3D ATA_MAX_SECTORS_LBA48


A concern is that other drivers which use libata may have similar =

issues, as they use default in SCSI_DEFAULT_MAX_SECTORS for max_sectors:
hisi_sas
pm8001
aic9xxx
mvsas
isci

So they may be needlessly hobbled for some SATA disks. However I have a =

system with hisi_sas controller and attached LBA48 disk. I tested =

performance for v5.19 vs 6.0 and it was about the same for fio rw=3Dread @ =

~120K IOPS. I can test this further.

Thanks,
John
--===============9217945253140754577==--

