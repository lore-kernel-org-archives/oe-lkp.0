Content-Type: multipart/mixed; boundary="===============5105173791183489945=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Fri, 19 Aug 2022 14:24:03 +0800
Message-ID: <Yv8sg3J8PLD56osY@xsang-OptiPlex-9020>
In-Reply-To: <d1b1d434-059d-4d76-5fc6-092ab9ba6e16@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5105173791183489945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 10:28:30AM +0100, John Garry wrote:
> On 18/08/2022 03:06, Oliver Sang wrote:
> =

> Hi Oliver,
> =

> > > > did I do the right thing?
> > > Sorry but I was not really interested in 4cbfca5f77 and I see where t=
hat
> > > build error is coming, but don't be concerned with it. However, for
> > > avoidance of doubt, if you have results for vanilla v6.0-rc1 then tha=
t would
> > > be appreciated.
> > for v6.0-rc1, it's still 512/512
> > =

> > > I will also send a separate patch for testing if you don't mind.
> > sure! we are very glad that we could help.
> =

> As you probably saw, I sent "[RFT PATCH] ata: libata: Set __ATA_BASE_SHT
> max_sectors" for testing on top of v6.0-rc1, and I hope that then we can =
get
> same performance as v5.19

yeah, our test confirmed your expectation:

stress-ng.copy-file.ops_per_sec
v5.19                 - 26.85
v6.0-rc1              - 23.03
v6.0-rc1 + your patch - 26.94

> =

> Thanks,
> John
--===============5105173791183489945==--

