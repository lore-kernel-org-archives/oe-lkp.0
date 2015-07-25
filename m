Content-Type: multipart/mixed; boundary="===============5303445354452081816=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [parport] BUG: unable to handle kernel paging request at 5f6f6969
Date: Sat, 25 Jul 2015 16:57:19 +0530
Message-ID: <20150725112719.GA10296@sudip-pc>
In-Reply-To: <20150725094742.GA19761@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5303445354452081816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2015 at 05:47:42PM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 23c405912b881e3ca516554efde852c2ad550b31
> Author:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> AuthorDate: Mon Jun 15 20:05:50 2015 +0530
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Wed Jul 22 21:15:49 2015 -0700
> =

>     parport: fix memory leak
Hi Fengguang,
Ying Huang's bot has reported it and I have already posted the patch to
revert it. And thanks for the script to reproduce the error.
The following patch has been posted:


>From 50fe69e0d7193e645628bb7dd66567b29a9542df Mon Sep 17 00:00:00 2001
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 25 Jul 2015 12:52:33 +0530
Subject: [PATCH] parport: Revert "parport: fix memory leak"

This reverts commit 23c405912b88 ("parport: fix memory leak")

par_dev->state was already being removed in parport_unregister_device().

Reported-by: Ying Huang <ying.huang@intel.com>
Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

But I am surprised at two points:
1) Why the error came while loading the gs_fpgaboot module?
	Maybe the double freeing has freed some memory which fpga was
	using.
2) Why the dmesg showed "panel: could not claim access to parport0. Abortin=
g."?
	Because of 50566ac87065 ("parport: check exclusive access before
	register") the panel driver should not even register and it
	should have failed at parport_register_dev_model().

 drivers/parport/share.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/parport/share.c b/drivers/parport/share.c
index c02b5f2..5ce5ef2 100644
--- a/drivers/parport/share.c
+++ b/drivers/parport/share.c
@@ -816,7 +816,6 @@ static void free_pardevice(struct device *dev)
 	struct pardevice *par_dev =3D to_pardevice(dev);
 =

 	kfree(par_dev->name);
-	kfree(par_dev->state);
 	kfree(par_dev);
 }
 =

-- =

1.9.1


regards
sudip

--===============5303445354452081816==--

