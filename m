Content-Type: multipart/mixed; boundary="===============3494896499578800025=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 834ffca6f7e: WARNING: CPU: 3 PID: 23390 at fs/xfs/xfs_file.c:700 xfs_file_dio_aio_write+0x27c/0x2e0()
Date: Fri, 27 Mar 2015 08:32:23 +0800
Message-ID: <1427416343.17170.58.camel@linux.intel.com>
In-Reply-To: <20150326212237.GE28129@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============3494896499578800025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-03-27 at 08:22 +1100, Dave Chinner wrote:
> On Thu, Mar 26, 2015 at 02:45:19PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > commit 834ffca6f7e345a79f6f2e2d131b0dfba8a4b67a ("xfs: don't zero parti=
al page cache pages during O_DIRECT writes")
> =

> Doing what test, exactly?

Sorry, should include that information.  We were running xfstests.

generic/068 generic/100 generic/117 generic/120 generic/125 generic/130
generic/192 generic/209 generic/223 generic/225 generic/226 generic/230
generic/247 generic/256 generic/275

Warning were shown during testing as above.

Best Regards,
Huang, Ying


> > [  354.728419] XFS (vda): Unmounting Filesystem
> > [  355.133977] XFS (vda): Mounting V4 Filesystem
> > [  355.174239] XFS (vda): Ending clean mount
> > [  362.820417] WARNING: CPU: 3 PID: 23390 at fs/xfs/xfs_file.c:700 xfs_=
file_dio_aio_write+0x27c/0x2e0()
> > [  362.822109] Modules linked in: ipmi_watchdog ipmi_msghandler sg sr_m=
od cdrom ata_generic pata_acpi cirrus syscopyarea sysfillrect sysimgblt ppd=
ev ttm ata_piix snd_pcm snd_timer drm_kms_helper libata snd microcode drm s=
oundcore pcspkr floppy serio_raw i2c_piix4 parport_pc parport acpi_cpufreq
> > [  362.828207] CPU: 3 PID: 23390 Comm: dd Not tainted 4.0.0-rc3-next-20=
150311 #1
> > [  362.829908] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.7.5-20140531_083030-gandalf 04/01/2014
> > [  362.831853]  ffffffff81bb5940 ffff88007d5c3d08 ffffffff818b19e6 ffff=
880077f901f8
> > [  362.833873]  0000000000000000 ffff88007d5c3d48 ffffffff8107294a ffff=
ea00010cc240
> > [  362.835646]  ffff8800570f7400 ffff8800570f75d0 0000000000000000 ffff=
8800570f7720
> > [  362.837330] Call Trace:
> > [  362.838593]  [<ffffffff818b19e6>] dump_stack+0x4c/0x65
> > [  362.840023]  [<ffffffff8107294a>] warn_slowpath_common+0x8a/0xc0
> > [  362.841652]  [<ffffffff81072a3a>] warn_slowpath_null+0x1a/0x20
> > [  362.843125]  [<ffffffff8134b75c>] xfs_file_dio_aio_write+0x27c/0x2e0
> > [  362.844694]  [<ffffffff8134bb20>] xfs_file_write_iter+0x110/0x130
> > [  362.846229]  [<ffffffff811e8861>] new_sync_write+0x81/0xb0
> > [  362.847670]  [<ffffffff811e9057>] vfs_write+0xb7/0x1f0
> > [  362.849152]  [<ffffffff811e9b6e>] ? vfs_read+0x11e/0x140
> > [  362.850573]  [<ffffffff811e9c86>] SyS_write+0x46/0xb0
> > [  362.852055]  [<ffffffff818b9e50>] system_call_fastpath+0x12/0x17
> > [  362.853576] ---[ end trace 002c13cd5d358e1d ]---
> =

> That's warning about a failure to invalidate the page cache across
> the region of a direct IO which is a potential data corruption
> event. The open(2) man page warns that applications should not do
> this....
> =

> Also the commit you point out as being problematic was introduced in
> 3.17-rc3 as part of a series to reduce data corruption problems when
> mixing concurrent O_DIRECT and buffered/mmap IO to the same file.
> That warning was put there on purpose to tell us that there's a
> well known reason the user is reporting data corruption....
> =

> Cheers,
> =

> Dave.



--===============3494896499578800025==--

