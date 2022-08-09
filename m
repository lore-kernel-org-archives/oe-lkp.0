Content-Type: multipart/mixed; boundary="===============4437029128400470577=="
MIME-Version: 1.0
From: David Laight <David.Laight@ACULAB.COM>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Tue, 09 Aug 2022 15:16:26 +0000
Message-ID: <c4b45c0e06af473abe17e3471e1bb948@AcuMS.aculab.com>
In-Reply-To: <e4106ffa-3842-45c0-9756-5226cfcfa17d@opensource.wdc.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4437029128400470577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

...
> >> Without knowing what the device adapter is, hard to say where the prob=
lem is. I
> >> suspect that with the patch applied, we may be ending up with a small =
default
> >> max_sectors value, causing overhead due to more commands than necessar=
y.
> >>
> >> Will check what I see with my test rig.
> >
> > As far as I can see, this patch should not make a difference unless the
> > ATA shost driver is setting the max_sectors value unnecessarily low.
> =

> That is my hunch too, hence my question about which host driver is being =
used
> for this test... That is not apparent from the problem report.

No one's fallen over the old problem and managed to limit
the number of sectors in a read to the number of sectors
in (IIRC) a 'multi sector' read that uses a single DMA burst?

Was always a good way of killing disk performance.

IIRC the maximum number of sectors for an ATA disk transfer is 255.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

--===============4437029128400470577==--

