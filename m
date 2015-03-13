Content-Type: multipart/mixed; boundary="===============5399731417804785081=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [[SCSI] sd] 984f1733fce: [sdx] No Caching mode page found
Date: Fri, 13 Mar 2015 14:12:25 +0800
Message-ID: <1426227145.6711.232.camel@intel.com>
In-Reply-To: <1426215766.6711.226.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5399731417804785081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry, please ignore this report, the commit is too old.  I think that
should be fixed already.

Best Regards,
Huang, Ying

On Fri, 2015-03-13 at 11:02 +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 984f1733fcee3fbc78d47e26c5096921c5d9946a ("[SCSI] sd: Fix potentia=
l out-of-bounds access")
> =

> In the following dmesgs, something new appears:
> =

> [sdx] No Caching mode page found
> =

> <5>[   40.078433] scsi 6:1:0:0: Direct-Access     LSI      Logical Volume=
   3000 PQ: 0 ANSI: 6
> <6>[   40.088275] scsi 6:1:0:0: RAID0: handle(0x011e), wwid(0x0f7d60fc0e7=
69932), pd_count(2), type(SSP)
> <6>[   40.098612] scsi 6:1:0:0: qdepth(254), tagged(1), simple(0), ordere=
d(0), scsi_level(7), cmd_que(1)
> <5>[   40.110662] scsi 6:0:0:0: Direct-Access     SEAGATE  ST9300653SS   =
   0004 PQ: 0 ANSI: 6
> <6>[   40.120334] scsi 6:0:0:0: SSP: handle(0x0009), sas_addr(0x5000c5006=
7b45a75), phy(2), device_name(0x5000c50067b45a74)
> <6>[   40.121307] scsi 6:0:0:0: SSP: enclosure_logical_id(0x500605b005c36=
e40), slot(1)
> <6>[   40.141187] scsi 6:0:0:0: qdepth(254), tagged(1), simple(0), ordere=
d(0), scsi_level(7), cmd_que(1)
> <5>[   40.153522] scsi 6:0:1:0: Direct-Access     SEAGATE  ST9300653SS   =
   0004 PQ: 0 ANSI: 6
> <6>[   40.163213] scsi 6:0:1:0: SSP: handle(0x000a), sas_addr(0x5000c5006=
7bdf9c1), phy(3), device_name(0x5000c50067bdf9c0)
> <6>[   40.164187] scsi 6:0:1:0: SSP: enclosure_logical_id(0x500605b005c36=
e40), slot(0)
> <6>[   40.184055] scsi 6:0:1:0: qdepth(254), tagged(1), simple(0), ordere=
d(0), scsi_level(7), cmd_que(1)
> <5>[   40.197240] scsi 4:0:0:0: CD-ROM            TEAC     DV-W28S-W     =
   1.0A PQ: 0 ANSI: 5
> <4>[   40.245498] sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/f=
orm2 cdda tray
> <6>[   40.254414] cdrom: Uniform CD-ROM driver Revision: 3.20
> <7>[   40.261303] sr 4:0:0:0: Attached scsi CD-ROM sr0
> <5>[   40.267295] sd 6:1:0:0: [sda] 1167966208 512-byte logical blocks: (=
597 GB/556 GiB)
> <5>[   40.276349] sd 6:1:0:0: [sda] 4096-byte physical blocks
> <5>[   40.282810] sd 6:1:0:0: [sda] Write Protect is off
> <7>[   40.288646] sd 6:1:0:0: [sda] Mode Sense: 03 00 00 08
> <3>[   40.294722] sd 6:1:0:0: [sda] No Caching mode page found
> <3>[   40.301040] sd 6:1:0:0: [sda] Assuming drive cache: write through
> <5>[   40.301450] sd 6:1:0:0: Attached scsi generic sg0 type 0
> <5>[   40.301665] scsi 6:0:0:0: Attached scsi generic sg1 type 0
> <5>[   40.301820] scsi 6:0:1:0: Attached scsi generic sg2 type 0
> <5>[   40.301974] sr 4:0:0:0: Attached scsi generic sg3 type 5
> <3>[   40.334030] sd 6:1:0:0: [sda] No Caching mode page found
> <3>[   40.340268] sd 6:1:0:0: [sda] Assuming drive cache: write through
> <6>[   40.355146]  sda: sda1 sda2 sda3
> <3>[   40.360105] sd 6:1:0:0: [sda] No Caching mode page found
> <3>[   40.366335] sd 6:1:0:0: [sda] Assuming drive cache: write through
> <5>[   40.373550] sd 6:1:0:0: [sda] Attached SCSI disk
> =

> Thanks,
> Ying Huang
> =

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> _______________________________________________ LKP mailing list LKP(a)li=
sts.01.org https://lists.01.org/mailman/listinfo/lkp



--===============5399731417804785081==--

