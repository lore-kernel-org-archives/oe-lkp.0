Content-Type: multipart/mixed; boundary="===============6827808142835494641=="
MIME-Version: 1.0
From: Alison Schofield <amsfield22@gmail.com>
To: lkp@lists.01.org
Subject: drivers/iio & kbuild test robot
Date: Tue, 26 Jul 2016 15:49:19 -0700
Message-ID: <20160726224911.GA16097@d830.WORKGROUP>
List-Id: <oe-lkp.lists.linux.dev>

--===============6827808142835494641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

I recently submitted a patch that adds Kconfig options required
to build a few drivers in IIO.  The kbuild robot did not find
these. =


You can see the patch here:
http://git.kernel.org/cgit/linux/kernel/git/jic23/iio.git/commit/?h=3Dfixes=
-togreg-post-rc1&id=3D9b1425b1698cca01887ad154b631b59666882fb5

I'd like to get a general understanding of the build testing the robot
provides the iio subsystem, and then specifically see if these types of test
cases can be added.

I'm up for digging into this if you'll point me in the right direction.

First off, I hope this is the correct email list - lkp(a)list.01.org
I didn't want to get lost in all the robo messages in kbuild-all.

Thanks,
alisons


--===============6827808142835494641==--

