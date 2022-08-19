Content-Type: multipart/mixed; boundary="===============1636674506091930401=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Fri, 19 Aug 2022 08:54:42 +0100
Message-ID: <4014a51d-0925-c0dc-70dc-1a465dd278e7@huawei.com>
In-Reply-To: <Yv8sg3J8PLD56osY@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1636674506091930401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19/08/2022 07:24, Oliver Sang wrote:
>> As you probably saw, I sent "[RFT PATCH] ata: libata: Set __ATA_BASE_SHT
>> max_sectors" for testing on top of v6.0-rc1, and I hope that then we can=
 get

Based on result below, I wonder if SAS HBAs (which use libata) should =

not use default SCSI max_sectors also. Any libsas HBA driver does today, =

IIRC.

>> same performance as v5.19
> yeah, our test confirmed your expectation:
> =

> stress-ng.copy-file.ops_per_sec
> v5.19                 - 26.85
> v6.0-rc1              - 23.03
> v6.0-rc1 + your patch - 26.94
> =


great, thanks

Thanks,
John
--===============1636674506091930401==--

