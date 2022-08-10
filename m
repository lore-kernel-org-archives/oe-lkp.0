Content-Type: multipart/mixed; boundary="===============4374239729956100772=="
MIME-Version: 1.0
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Wed, 10 Aug 2022 06:57:55 -0700
Message-ID: <b082ed3f-e2de-450f-acc6-9508d7689290@opensource.wdc.com>
In-Reply-To: <c4b45c0e06af473abe17e3471e1bb948@AcuMS.aculab.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4374239729956100772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/08/09 8:16, David Laight wrote:
> ...
>>>> Without knowing what the device adapter is, hard to say where the prob=
lem is. I
>>>> suspect that with the patch applied, we may be ending up with a small =
default
>>>> max_sectors value, causing overhead due to more commands than necessar=
y.
>>>>
>>>> Will check what I see with my test rig.
>>>
>>> As far as I can see, this patch should not make a difference unless the
>>> ATA shost driver is setting the max_sectors value unnecessarily low.
>>
>> That is my hunch too, hence my question about which host driver is being=
 used
>> for this test... That is not apparent from the problem report.
> =

> No one's fallen over the old problem and managed to limit
> the number of sectors in a read to the number of sectors
> in (IIRC) a 'multi sector' read that uses a single DMA burst?
> =

> Was always a good way of killing disk performance.
> =

> IIRC the maximum number of sectors for an ATA disk transfer is 255.

That is for super old pata/ide devices. Modern SATA/AHCI disks can do a lot=
 more
than that with NCQ/DMA. The default max_sectors_kb for AHCI connected devic=
es is
1280 KB =3D 2560 sectors, max_segments =3D 168 and max_segment_size =3D 655=
36 B, which
gives a reliable command size of at least 168 * 4096 =3D 688128 B (1344 sec=
tors)
with 4KB page size architectures.

> =

> 	David
> =

> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)


-- =

Damien Le Moal
Western Digital Research
--===============4374239729956100772==--

