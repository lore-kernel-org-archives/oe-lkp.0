Content-Type: multipart/mixed; boundary="===============5542426020955381917=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Thu, 18 Aug 2022 10:06:48 +0800
Message-ID: <Yv2euLFLjl8bEaeI@xsang-OptiPlex-9020>
In-Reply-To: <743867a6-b266-58e4-a8a6-542757916f0a@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5542426020955381917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi John,

On Wed, Aug 17, 2022 at 03:04:06PM +0100, John Garry wrote:
> On 17/08/2022 14:51, Oliver Sang wrote:
> =

> Hi Oliver,
> =

> > > v5.19 + 0568e61225 : 512/512
> > > v5.19 + 0568e61225 + 4cbfca5f77 : 512/512
> > > v5.19: 1280/32767
> > > =

> > > They are want makes sense to me, at least.
> > > =

> > > Oliver, can you confirm this? Thanks!
> > I confirm below two:
> > v5.19 + 0568e61225 : 512/512
> > v5.19: 1280/32767 (as last already reported)
> =

> ack
> =

> > =

> > but below failed to build:
> > v5.19 + 0568e61225 + 4cbfca5f77
> > =

> > build_errors:
> >    - "drivers/scsi/scsi_transport_sas.c:242:33: error: implicit declara=
tion of function 'dma_opt_mapping_size'; did you mean 'dma_max_mapping_size=
'? [-Werror=3Dimplicit-function-declaration]"
> >    - "drivers/scsi/scsi_transport_sas.c:241:24: error: 'struct Scsi_Hos=
t' has no member named 'opt_sectors'; did you mean 'max_sectors'?"
> > =

> > not sure if I understand this correctly?
> > for this, I just cherry-pick 0568e61225 upon v5.19,
> > then cherry-pick 4cbfca5f77 again.
> > so my branch looks like:
> > =

> > a11d8b97c3ecb8 v5.19 + 0568e61225 + 4cbfca5f77
> > 1b59440cf71f99 v5.19 + 0568e61225
> > 3d7cb6b04c3f31 (tag: v5.19,
> > =

> > did I do the right thing?
> =

> Sorry but I was not really interested in 4cbfca5f77 and I see where that
> build error is coming, but don't be concerned with it. However, for
> avoidance of doubt, if you have results for vanilla v6.0-rc1 then that wo=
uld
> be appreciated.

for v6.0-rc1, it's still 512/512

> =

> I will also send a separate patch for testing if you don't mind.

sure! we are very glad that we could help.

> =

> thanks,
> John
>=20
--===============5542426020955381917==--

