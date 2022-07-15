Content-Type: multipart/mixed; boundary="===============9152708044387223256=="
MIME-Version: 1.0
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: lkp@lists.01.org
Subject: [PATCH v3] can: slcan: do not sleep with a spin lock held
Date: Fri, 15 Jul 2022 09:29:51 +0200
Message-ID: <20220715072951.859586-1-dario.binacchi@amarulasolutions.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9152708044387223256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We can't call close_candev() with a spin lock held, so release the lock
before calling it. After calling close_candev(), we can update the
fields of the private `struct can_priv' without having to acquire the
lock.

Fixes: c4e54b063f42f ("can: slcan: use CAN network device driver API")
Reported-by: kernel test robot <oliver.sang@intel.com>
Link: https://lore.kernel.org/linux-kernel/Ysrf1Yc5DaRGN1WE(a)xsang-OptiPle=
x-9020/
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Update the commit message.
- Reset sl->rcount and sl->xleft before releasing the spin lock.

Changes in v2:
- Release the lock just before calling the close_candev().

 drivers/net/can/slcan/slcan-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/slcan/slcan-core.c b/drivers/net/can/slcan/slc=
an-core.c
index 54d29a410ad5..d40ddc596596 100644
--- a/drivers/net/can/slcan/slcan-core.c
+++ b/drivers/net/can/slcan/slcan-core.c
@@ -689,15 +689,14 @@ static int slc_close(struct net_device *dev)
 		clear_bit(TTY_DO_WRITE_WAKEUP, &sl->tty->flags);
 	}
 	netif_stop_queue(dev);
+	sl->rcount   =3D 0;
+	sl->xleft    =3D 0;
+	spin_unlock_bh(&sl->lock);
 	close_candev(dev);
 	sl->can.state =3D CAN_STATE_STOPPED;
 	if (sl->can.bittiming.bitrate =3D=3D CAN_BITRATE_UNKNOWN)
 		sl->can.bittiming.bitrate =3D CAN_BITRATE_UNSET;
 =

-	sl->rcount   =3D 0;
-	sl->xleft    =3D 0;
-	spin_unlock_bh(&sl->lock);
-
 	return 0;
 }
 =

-- =

2.32.0

--===============9152708044387223256==--

