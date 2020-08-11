Content-Type: multipart/mixed; boundary="===============1079029088290896642=="
MIME-Version: 1.0
From: Jason Wang <jasowang@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] vdpa_sim: init iommu lock
Date: Tue, 11 Aug 2020 10:55:03 +0800
Message-ID: <e96ec466-0852-ffc8-0e26-118cc4118707@redhat.com>
In-Reply-To: <20200810124813.1555677-1-mst@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1079029088290896642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2020/8/10 =E4=B8=8B=E5=8D=888:48, Michael S. Tsirkin wrote:
> The patch adding the iommu lock did not initialize it.
> The struct is zero-initialized so this is mostly a problem
> when using lockdep.
>
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Cc: Max Gurtovoy <maxg@mellanox.com>
> Fixes: 0ea9ee430e74 ("vdpasim: protect concurrent access to iommu iotlb")
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   drivers/vdpa/vdpa_sim/vdpa_sim.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdp=
a_sim.c
> index df3224b138ee..604d9d25ca47 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> @@ -358,6 +358,7 @@ static struct vdpasim *vdpasim_create(void)
>   =

>   	INIT_WORK(&vdpasim->work, vdpasim_work);
>   	spin_lock_init(&vdpasim->lock);
> +	spin_lock_init(&vdpasim->iommu_lock);
>   =

>   	dev =3D &vdpasim->vdpa.dev;
>   	dev->coherent_dma_mask =3D DMA_BIT_MASK(64);

--===============1079029088290896642==--

