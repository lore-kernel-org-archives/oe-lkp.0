Content-Type: multipart/mixed; boundary="===============4878315860925234326=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Sat, 13 Aug 2022 08:23:36 +0100
Message-ID: <2b900d3b-9b52-5bc3-4ba8-24249f3c2e42@huawei.com>
In-Reply-To: <840a5f98-a53c-ce08-2833-f41d8c9a015b@opensource.wdc.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4878315860925234326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/08/2022 19:27, Damien Le Moal wrote:
>> Interestingly ata dev max_sectors kb also gets capped from 32MB (LBA48)
>> -> 256KB due to swiotlb max mapping size. (It would be capped by shost
>> default max sectors 512KB without that swiotlb limit). I assume capping
>> due to swiotlb limit is not occuring on Oliver's machine.
> Yes, I was suspecting that we may be seeing a difference for anything tha=
t is
> not AHCI, e.g. with other drivers.
> =

> But that seems to be the correct thing to do, no ? =

Yes, this should be the correct thing to do.

 > How was this working before
 > without applying the swiotlb limit ?
 >
Not sure. I would need to check the libata code for how it handles DMA =

mapping errors, which I assume would occur for when we exceed the =

swiotlb limit.

Having said this, from limited testing, whenever I check megaraid sas or =

mpt3sas for performance, the length of request data never/rarely comes =

close to max sectors. That why I am surprised with the regression which =

Oliver reports.

Thanks,
John

--===============4878315860925234326==--

