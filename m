Content-Type: multipart/mixed; boundary="===============8324627502503569869=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Wed, 17 Aug 2022 21:51:32 +0800
Message-ID: <YvzyZJUblfqN6Xj3@xsang-OptiPlex-9020>
In-Reply-To: <28d6e48b-f52f-9467-8260-262504a1a1ff@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8324627502503569869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi John,

On Tue, Aug 16, 2022 at 05:38:43PM +0100, John Garry wrote:
> On 16/08/2022 16:42, Damien Le Moal wrote:
> > On 2022/08/16 3:35, John Garry wrote:
> > > On 16/08/2022 07:57, Oliver Sang wrote:
> > > > > > For me, a complete kernel log may help.
> > > > > and since only 1HDD, the output of the following would be helpful:
> > > > > =

> > > > > /sys/block/sda/queue/max_sectors_kb
> > > > > /sys/block/sda/queue/max_hw_sectors_kb
> > > > > =

> > > > > And for 5.19, if possible.
> > > > for commit
> > > > 0568e61225 ("ata: libata-scsi: cap ata_device->max_sectors accordin=
g to shost->max_sectors")
> > > > =

> > > > root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
> > > > 512
> > > > root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
> > > > 512
> > > > =

> > > > for both commit
> > > > 4cbfca5f77 ("scsi: scsi_transport_sas: cap shost opt_sectors accord=
ing to DMA optimal limit")
> > > > and v5.19
> > > > =

> > > > root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
> > > > 1280
> > > > root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
> > > > 32767
> > > > =

> > > =

> > > thanks, I appreciate this.
> > > =

> > >   From the dmesg, I see 2x SATA disks - I was under the impression th=
at
> > > the system only has 1x.
> > > =

> > > Anyway, both drives show LBA48, which means the large max hw sectors =
at
> > > 32767KB:
> > > [   31.129629][ T1146] ata6.00: 1562824368 sectors, multi 1: LBA48 NCQ
> > > (depth 32)
> > > =

> > > So this is what I suspected: we are capped from the default shost max
> > > sectors (1024 sectors).
> > > =

> > > This seems like the simplest fix for you:
> > > =

> > > --- a/include/linux/libata.h
> > > +++ b/include/linux/libata.h
> > > @@ -1382,7 +1382,8 @@ extern const struct attribute_group
> > > *ata_common_sdev_groups[];
> > >          .proc_name              =3D drv_name,                     \
> > >          .slave_destroy          =3D ata_scsi_slave_destroy,       \
> > >          .bios_param             =3D ata_std_bios_param,           \
> > > -       .unlock_native_capacity =3D ata_scsi_unlock_native_capacity
> > > +       .unlock_native_capacity =3D ata_scsi_unlock_native_capacity,\
> > > +       .max_sectors =3D ATA_MAX_SECTORS_LBA48
> > =

> > This is crazy large (65535 x 512 B sectors) and never result in that be=
ing
> > exposed as the actual max_sectors_kb since other limits will apply first
> > (mapping size).
> =

> Here is how I read values from above for max_sectors_kb and
> max_hw_sectors_kb:
> =

> v5.19 + 0568e61225 : 512/512
> v5.19 + 0568e61225 + 4cbfca5f77 : 512/512
> v5.19: 1280/32767
> =

> They are want makes sense to me, at least.
> =

> Oliver, can you confirm this? Thanks!

I confirm below two:
v5.19 + 0568e61225 : 512/512
v5.19: 1280/32767 (as last already reported)

but below failed to build:
v5.19 + 0568e61225 + 4cbfca5f77

build_errors:
  - "drivers/scsi/scsi_transport_sas.c:242:33: error: implicit declaration =
of function 'dma_opt_mapping_size'; did you mean 'dma_max_mapping_size'? [-=
Werror=3Dimplicit-function-declaration]"
  - "drivers/scsi/scsi_transport_sas.c:241:24: error: 'struct Scsi_Host' ha=
s no member named 'opt_sectors'; did you mean 'max_sectors'?"

not sure if I understand this correctly?
for this, I just cherry-pick 0568e61225 upon v5.19,
then cherry-pick 4cbfca5f77 again.
so my branch looks like:

a11d8b97c3ecb8 v5.19 + 0568e61225 + 4cbfca5f77
1b59440cf71f99 v5.19 + 0568e61225
3d7cb6b04c3f31 (tag: v5.19,

did I do the right thing?


> =

> On this basis, it appears that max_hw_sectors_kb is getting capped from s=
csi
> default @ 1024 sectors by commit 0568e61225. If it were getting capped by
> swiotlb mapping limit then that would give us 512 sectors - this value is
> fixed.
> =

> So for my SHT change proposal I am just trying to revert to previous
> behaviour in 5.19 - make max_hw_sectors_kb crazy big again.
> =

> > =

> > The regression may come not from commands becoming tiny, but from the f=
act that
> > after the patch, max_sectors_kb is too large,
> =

> I don't think it is, but need confirmation.
> =

> > causing a lot of overhead with
> > qemu swiotlb mapping and slowing down IO processing.
> =

> > =

> > Above, it can be seen that we ed up with max_sectors_kb being 1280, whi=
ch is the
> > default for most scsi disks (including ATA drives). That is normal. But=
 before
> > that, it was 512, which likely better fits qemu swiotlb and does not ge=
nerate
> =

> Again, I don't think this this is the case. Need confirmation.
> =

> > overhead. So the above fix will not change anything I think...
> =

> =

> Thanks,
> John
--===============8324627502503569869==--

