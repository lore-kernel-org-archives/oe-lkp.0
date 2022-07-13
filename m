Content-Type: multipart/mixed; boundary="===============7989082479496429034=="
MIME-Version: 1.0
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: lkp@lists.01.org
Subject: [PATCH v2] can: slcan: do not sleep with a spin lock held
Date: Wed, 13 Jul 2022 17:44:58 +0200
Message-ID: <20220713154458.253076-1-dario.binacchi@amarulasolutions.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7989082479496429034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We can't call close_candev() with a spin lock held, so release the lock
before calling it.

Fixes: c4e54b063f42f ("can: slcan: use CAN network device driver API")
Reported-by: kernel test robot <oliver.sang@intel.com>
Link: https://lore.kernel.org/linux-kernel/Ysrf1Yc5DaRGN1WE(a)xsang-OptiPle=
x-9020/
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Release the lock just before calling the close_candev().

 drivers/net/can/slcan/slcan-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/slcan/slcan-core.c b/drivers/net/can/slcan/slc=
an-core.c
index 54d29a410ad5..5214421dedf3 100644
--- a/drivers/net/can/slcan/slcan-core.c
+++ b/drivers/net/can/slcan/slcan-core.c
@@ -689,6 +689,7 @@ static int slc_close(struct net_device *dev)
 		clear_bit(TTY_DO_WRITE_WAKEUP, &sl->tty->flags);
 	}
 	netif_stop_queue(dev);
+	spin_unlock_bh(&sl->lock);
 	close_candev(dev);
 	sl->can.state =3D CAN_STATE_STOPPED;
 	if (sl->can.bittiming.bitrate =3D=3D CAN_BITRATE_UNKNOWN)
@@ -696,7 +697,6 @@ static int slc_close(struct net_device *dev)
 =

 	sl->rcount   =3D 0;
 	sl->xleft    =3D 0;
-	spin_unlock_bh(&sl->lock);
 =

 	return 0;
 }
-- =

2.32.0

--===============7989082479496429034==--

