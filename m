Content-Type: multipart/mixed; boundary="===============3075330799806508473=="
MIME-Version: 1.0
From: James Bottomley <jejb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [bdi_unregister] 165a5e22fa INFO: task swapper:1 blocked for more than 120 seconds.
Date: Mon, 06 Mar 2017 06:35:21 -0800
Message-ID: <1488810921.16832.6.camel@linux.vnet.ibm.com>
In-Reply-To: <20170306120123.GD14932@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3075330799806508473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-03-06 at 13:01 +0100, Jan Kara wrote:
> On Mon 06-03-17 11:27:33, Jan Kara wrote:
> > Hi,
> > =

> > On Sun 05-03-17 10:21:11, Wu Fengguang wrote:
> > > FYI next-20170303 is good while mainline is bad with this error.
> > > The attached reproduce-* may help reproduce the issue.
> > =

> > Thanks for report! So from the stacktrace we are in the path =

> > testing removal of a device immediately after it has been probed =

> > and for some reason bdi_unregister() hangs - likely waiting for =

> > cgroup-writeback references to drop. Given how early this happens =

> > my guess is we fail to initialize something but for now I don't see =

> > how my patch could make a difference. I'm trying to reproduce this =

> > to be able to debug more...
> =

> OK, so after some debugging I think this is yet another problem in =

> SCSI initialization / destruction code which my patch only makes =

> visible (added relevant maintainers).
> =

> I can reproduce the problem reliably with enabling:
> =

> CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy
> CONFIG_SCSI_DEBUG=3Dm
> CONFIG_BLK_CGROUP=3Dy
> CONFIG_MEMCG=3Dy
> (and thus CONFIG_CGROUP_WRITEBACK=3Dy)
> =

> then 'modprobe scsi_debug' is all it takes to reproduce hang. =

> Relevant kernel messages with some of my debugging added (attached is =

> a patch that adds those debug messages):

This looks to be precisely the same problem Dan Williams was debugging
for us.

> [   58.721765] scsi host0: scsi_debug: version 1.86 [20160430]
> [   58.721765]   dev_size_mb=3D8, opts=3D0x0, submit_queues=3D1,
> statistics=3D0
> [   58.728946] CGWB init ffff88007fbb2000
> [   58.730095] Created sdev ffff880078e1a000
> [   58.731611] scsi 0:0:0:0: Direct-Access     Linux    scsi_debug
> 0186 PQ : 0 ANSI: 7
> [   58.782246] sd 0:0:0:0: [sda] 16384 512-byte logical blocks: (8.39
> MB/8.00 MiB)
> [   58.789687] sd 0:0:0:0: [sda] Write Protect is off
> [   58.791140] sd 0:0:0:0: [sda] Mode Sense: 73 00 10 08
> [   58.800879] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
> enabled, supports DPO and FUA
> [   58.893738] sd 0:0:0:0: [sda] Attached SCSI disk
> [   58.896808] Unreg1
> [   58.897960] Unreg2
> [   58.898637] Unreg3
> [   58.899100] CGWB ffff88007fbb2000 usage_cnt: 0
> [   58.900004] Unreg4
> [   58.904976] sd 0:0:0:0: [sda] Synchronizing SCSI cache

OK, can you put a WARN_ON trace in sd_shutdown and tell us where this
is coming from.  For the device to be reused after this we have to be
calling sd_shutdown() without going into SDEV_DEL.

Thanks,

James


--===============3075330799806508473==--

