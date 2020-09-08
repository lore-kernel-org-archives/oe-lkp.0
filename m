Content-Type: multipart/mixed; boundary="===============2965333659704068575=="
MIME-Version: 1.0
From: Jason Gunthorpe <jgg@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [IB/srpt] c804af2c1d: last_state.test.blktests.exit_code.143
Date: Tue, 08 Sep 2020 15:22:32 -0300
Message-ID: <20200908182232.GP9166@nvidia.com>
In-Reply-To: <2a2ff3a5-f58e-8246-fd09-87029b562347@acm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2965333659704068575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2020 at 07:58:12PM -0700, Bart Van Assche wrote:

> The following appeared:
> =

> WARNING: CPU: 5 PID: 1760 at drivers/infiniband/core/device.c:335 ib_devi=
ce_put+0xf2/0x100 [ib_core]
> =

> Call Trace:
>  rxe_elem_release+0x76/0x90 [rdma_rxe]
>  rxe_destroy_cq+0x4f/0x70 [rdma_rxe]
>  ib_free_cq_user+0x12b/0x2b0 [ib_core]
>  ib_cq_pool_destroy+0xa8/0x140 [ib_core]
>  __ib_unregister_device+0x9c/0x1c0 [ib_core]
>  ib_unregister_driver+0x181/0x1a0 [ib_core]
>  rxe_module_exit+0x31/0x50 [rdma_rxe]
>  __x64_sys_delete_module+0x22a/0x310
>  do_syscall_64+0x36/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Oh interesting..

> Do you agree that the above proves that the hang-on-unload is a
> regression that has been introduced by the cq-pool patches? Is the patch
> below a good way to fix this?

> +++ b/drivers/infiniband/core/device.c
> @@ -1454,8 +1454,8 @@ static void __ib_unregister_device(struct ib_device=
 *ib_dev)
>  	if (!refcount_read(&ib_dev->refcount))
>  		goto out;
> =

> -	disable_device(ib_dev);
>  	ib_cq_pool_destroy(ib_dev);
> +	disable_device(ib_dev);
> =

>  	/* Expedite removing unregistered pointers from the hash table */
>  	free_netdevs(ib_dev);

Hum. Not quite..

disable_device() ensures that all ib_clients have disconnected from
the device, up until the clients have disconnected the cq_pool must
remain operational.

It is reasonable to consider the cq_pool as a built-in client, so I
would suggest moving it to right around the time the dynamic clients
are handled. Something like this:

diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/dev=
ice.c
index c36b4d2b61e0c0..e3651dacad1da6 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -1285,6 +1285,8 @@ static void disable_device(struct ib_device *device)
 		remove_client_context(device, cid);
 	}
 =

+	ib_cq_pool_destroy(ib_dev);
+
 	/* Pairs with refcount_set in enable_device */
 	ib_device_put(device);
 	wait_for_completion(&device->unreg_completion);
@@ -1328,6 +1330,8 @@ static int enable_device_and_get(struct ib_device *de=
vice)
 			goto out;
 	}
 =

+	ib_cq_pool_init(device);
+
 	down_read(&clients_rwsem);
 	xa_for_each_marked (&clients, index, client, CLIENT_REGISTERED) {
 		ret =3D add_client_context(device, client);
@@ -1400,7 +1404,6 @@ int ib_register_device(struct ib_device *device, cons=
t char *name)
 		goto dev_cleanup;
 	}
 =

-	ib_cq_pool_init(device);
 	ret =3D enable_device_and_get(device);
 	dev_set_uevent_suppress(&device->dev, false);
 	/* Mark for userspace that device is ready */
@@ -1455,7 +1458,6 @@ static void __ib_unregister_device(struct ib_device *=
ib_dev)
 		goto out;
 =

 	disable_device(ib_dev);
-	ib_cq_pool_destroy(ib_dev);
 =

 	/* Expedite removing unregistered pointers from the hash table */
 	free_netdevs(ib_dev);
--===============2965333659704068575==--

