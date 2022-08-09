Content-Type: multipart/mixed; boundary="===============3422721448193190765=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Tue, 09 Aug 2022 15:16:52 +0100
Message-ID: <16f03f81-a8c7-bacf-c74c-67231f7f7202@huawei.com>
In-Reply-To: <3451fa5a-6229-073f-ae18-0c232cd48ed5@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3422721448193190765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/08/2022 10:58, John Garry wrote:
>>>
>>> commit: 0568e6122574dcc1aded2979cd0245038efe22b6 ("ata: libata-scsi: =

>>> cap ata_device->max_sectors according to shost->max_sectors")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>> in testcase: stress-ng
>>> on test machine: 96 threads 2 sockets Ice Lake with 256G memory
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0nr_threads: 10%
>>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
>>> =C2=A0=C2=A0=C2=A0=C2=A0testtime: 60s
>>> =C2=A0=C2=A0=C2=A0=C2=A0fs: f2fs
>>> =C2=A0=C2=A0=C2=A0=C2=A0class: filesystem
>>> =C2=A0=C2=A0=C2=A0=C2=A0test: copy-file
>>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0xb000280
>>
>> Without knowing what the device adapter is, hard to say where the =

>> problem is. I
>> suspect that with the patch applied, we may be ending up with a small =

>> default
>> max_sectors value, causing overhead due to more commands than necessary.
>>
>> Will check what I see with my test rig.
> =

> As far as I can see, this patch should not make a difference unless the =

> ATA shost driver is setting the max_sectors value unnecessarily low.

For __ATA_BASE_SHT, we don't set max_sectors. As such, we default =

shost->max_sectors =3D SCSI_DEFAULT_MAX_SECTORS (=3D1024) in =

scsi_host_alloc(). I assume no shost dma mapping limit applied.

Then - for example - we could select dev->max_sectors =3D =

ATA_MAX_SECTORS_LBA48 (=3D65535) in ata_dev_configure().

So with commit 0568e6122574 we would have final max sectors =3D 1024, as =

opposed to 65535 previously. I guess that the problem is something like =

this.

If so, it seems that we would need to apply the shost dma mapping limit =

separately in ata_scsi_dev_config() and not use shost->max_sectors.

thanks,
John

--===============3422721448193190765==--

