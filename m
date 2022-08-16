Content-Type: multipart/mixed; boundary="===============1539681600038150008=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Tue, 16 Aug 2022 14:57:07 +0800
Message-ID: <Yvs/w93KUkgD9f7/@xsang-OptiPlex-9020>
In-Reply-To: <f1c3d717-339d-ba2b-9775-fc0e00f57ae3@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1539681600038150008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi John,

On Fri, Aug 12, 2022 at 03:58:14PM +0100, John Garry wrote:
> On 12/08/2022 12:13, John Garry wrote:
> > > On Tue, Aug 09, 2022 at 07:55:53AM -0700, Damien Le Moal wrote:
> > > > On 2022/08/09 2:58, John Garry wrote:
> > > > > On 08/08/2022 15:52, Damien Le Moal wrote:
> > > > > > On 2022/08/05 1:05, kernel test robot wrote:
> > > > > > > =

> > > > > > > =

> > > > > > > Greeting,
> > > > > > > =

> > > > > > > FYI, we noticed a -15.0% regression of
> > > > > > > stress-ng.copy-file.ops_per_sec due to commit:
> > > > > > > =

> > > > > > > =

> > > > > > > commit: 0568e6122574dcc1aded2979cd0245038efe22b6
> > > > > > > ("ata: libata-scsi: cap ata_device->max_sectors
> > > > > > > according to shost->max_sectors")
> > > > > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.=
git
> > > > > > > master
> > > > > > > =

> > > > > > > in testcase: stress-ng
> > > > > > > on test machine: 96 threads 2 sockets Ice Lake with 256G memo=
ry
> > > > > > > with following parameters:
> > > > > > > =

> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0nr_threads: 10%
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0testtime: 60s
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0fs: f2fs
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0class: filesystem
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0test: copy-file
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0xb000280
> > > > > > =

> > > > > > Without knowing what the device adapter is, hard to say
> > > > > > where the problem is. I
> > > > > > suspect that with the patch applied, we may be ending up
> > > > > > with a small default
> > > > > > max_sectors value, causing overhead due to more commands
> > > > > > than necessary.
> > > > > > =

> > > > > > Will check what I see with my test rig.
> > > > > =

> > > > > As far as I can see, this patch should not make a difference unle=
ss the
> > > > > ATA shost driver is setting the max_sectors value unnecessarily l=
ow.
> > > > =

> > > > That is my hunch too, hence my question about which host driver
> > > > is being used
> > > > for this test... That is not apparent from the problem report.
> > > =

> > > we noticed the commit is already in mainline now, and in our tests,
> > > there is
> > > still similar regression and also on other platforms.
> > > could you guide us how to check "which host driver is being used for =
this
> > > test"? hope to supply some useful information.
> > > =

> > =

> > For me, a complete kernel log may help.
> =

> and since only 1HDD, the output of the following would be helpful:
> =

> /sys/block/sda/queue/max_sectors_kb
> /sys/block/sda/queue/max_hw_sectors_kb
> =

> And for 5.19, if possible.

for commit
0568e61225 ("ata: libata-scsi: cap ata_device->max_sectors according to sho=
st->max_sectors")

root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
512
root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
512

for both commit
4cbfca5f77 ("scsi: scsi_transport_sas: cap shost opt_sectors according to D=
MA optimal limit")
and v5.19

root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_sectors_kb
1280
root(a)lkp-icl-2sp1 ~# cat /sys/block/sda/queue/max_hw_sectors_kb
32767

> =

> Thanks!
> =

> > =

> > > > =

> > > > > =

>=20
--===============1539681600038150008==--

