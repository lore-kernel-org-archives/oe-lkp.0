Content-Type: multipart/mixed; boundary="===============3364664305358915482=="
MIME-Version: 1.0
From: Michael S. Tsirkin <mst@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH] vdpa_sim: init iommu lock
Date: Mon, 10 Aug 2020 08:48:39 -0400
Message-ID: <20200810124813.1555677-1-mst@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3364664305358915482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The patch adding the iommu lock did not initialize it.
The struct is zero-initialized so this is mostly a problem
when using lockdep.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Cc: Max Gurtovoy <maxg@mellanox.com>
Fixes: 0ea9ee430e74 ("vdpasim: protect concurrent access to iommu iotlb")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_=
sim.c
index df3224b138ee..604d9d25ca47 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -358,6 +358,7 @@ static struct vdpasim *vdpasim_create(void)
 =

 	INIT_WORK(&vdpasim->work, vdpasim_work);
 	spin_lock_init(&vdpasim->lock);
+	spin_lock_init(&vdpasim->iommu_lock);
 =

 	dev =3D &vdpasim->vdpa.dev;
 	dev->coherent_dma_mask =3D DMA_BIT_MASK(64);
-- =

MST

--===============3364664305358915482==--

