Content-Type: multipart/mixed; boundary="===============7447717519339181597=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Thu, 18 Aug 2022 10:28:30 +0100
Message-ID: <d1b1d434-059d-4d76-5fc6-092ab9ba6e16@huawei.com>
In-Reply-To: <Yv2euLFLjl8bEaeI@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7447717519339181597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18/08/2022 03:06, Oliver Sang wrote:

Hi Oliver,

>>> did I do the right thing?
>> Sorry but I was not really interested in 4cbfca5f77 and I see where that
>> build error is coming, but don't be concerned with it. However, for
>> avoidance of doubt, if you have results for vanilla v6.0-rc1 then that w=
ould
>> be appreciated.
> for v6.0-rc1, it's still 512/512
> =

>> I will also send a separate patch for testing if you don't mind.
> sure! we are very glad that we could help.

As you probably saw, I sent "[RFT PATCH] ata: libata: Set __ATA_BASE_SHT =

max_sectors" for testing on top of v6.0-rc1, and I hope that then we can =

get same performance as v5.19

Thanks,
John
--===============7447717519339181597==--

