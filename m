Content-Type: multipart/mixed; boundary="===============7148179175571214772=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Fri, 12 Aug 2022 18:17:39 +0100
Message-ID: <fd2b1dbe-8482-cb89-2568-4909db1239b0@huawei.com>
In-Reply-To: <4642848c-a386-d6a0-6255-8b16800e0548@opensource.wdc.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7148179175571214772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/08/2022 16:41, Damien Le Moal wrote:
>>> we noticed the commit is already in mainline now, and in our tests, the=
re is
>>> still similar regression and also on other platforms.
>>> could you guide us how to check "which host driver is being used for th=
is
>>> test"? hope to supply some useful information.
>>>
>> For me, a complete kernel log may help.
> I had a look yesterday with my test rig. I did not see any difference in =
the
> default max_sectors_kb values for various drives between 5.18 and 5.19 (c=
urrent
> linus tree). The test machine has 2 AHCI adapters: Intel and Marvell. Bot=
h use
> the regular AHCI driver. I have another rig with different ATA adapters b=
ut it
> is powered down and I am traveling... So cannot test that right now.
> =


FWIW, on QEMU I get a difference for IDE disk for ata_piix host.

Interestingly ata dev max_sectors kb also gets capped from 32MB (LBA48) =

-> 256KB due to swiotlb max mapping size. (It would be capped by shost =

default max sectors 512KB without that swiotlb limit). I assume capping =

due to swiotlb limit is not occuring on Oliver's machine.

thanks,
John

[    1.497233] ata7: found unknown device (class 0)
[    1.498341] ata7.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
[    1.499030] ata7.00: 209716 sectors, multi 16: LBA48
[    1.623795] ata2: SATA link down (SStatus 0 SControl 300)
[    1.624633] ata1: SATA link down (SStatus 0 SControl 300)
[    1.633395] ata6: SATA link down (SStatus 0 SControl 300)
[    1.634200] ata5: SATA link down (SStatus 0 SControl 300)
[    1.635094] ata4: SATA link down (SStatus 0 SControl 300)
[    1.635887] ata3: SATA link down (SStatus 0 SControl 300)
[    1.636748] scsi 6:0:0:0: Direct-Access     ATA      QEMU HARDDISK =

  2.5+ PQ: 0 ANSI: 5
[    1.641298] sd 6:0:0:0: [sda] 209716 512-byte logical blocks: (107 =

MB/102 MiB)
[    1.642188] sd 6:0:0:0: [sda] Write Protect is off
[    1.642770] sd 6:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.642783] sd 6:0:0:0: [sda] Write cache: enabled, read cache: =

enabled, doesn't support DPO or FUA
[    1.644149] sd 6:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    1.645142] sd 6:0:0:0: Attached scsi generic sg0 type 0
[    1.655145] sd 6:0:0:0: [sda] Attached SCSI disk
--===============7148179175571214772==--

