Content-Type: multipart/mixed; boundary="===============2267372209017764841=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [IB/srpt] c804af2c1d: last_state.test.blktests.exit_code.143
Date: Sun, 06 Sep 2020 19:58:12 -0700
Message-ID: <2a2ff3a5-f58e-8246-fd09-87029b562347@acm.org>
In-Reply-To: <20200824133019.GH1152540@nvidia.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2267372209017764841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-08-24 06:30, Jason Gunthorpe wrote:
> On Sun, Aug 23, 2020 at 02:18:41PM -0700, Bart Van Assche wrote:>  =

>> The patch below is sufficient to unbreak blktests. I think that the
>> deadlock while unloading rdma_rxe happens because the RDMA core waits for
>> all ib_dev references to be dropped before dealloc_driver is called.
> =

> Which is required, yes
> =

>> The rdma_rxe dealloc_driver implementation drops an ib_dev
>> reference. =

> =

> Where does it do that? I didn't notice it?

That last statement was wrong.

Anyway, with the following debugging patch applied:

diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/dev=
ice.c
index c36b4d2b61e0..b976dd30f727 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -332,6 +332,8 @@ struct ib_device *ib_device_get_by_index(const struct n=
et *net, u32 index)
  */
 void ib_device_put(struct ib_device *device)
 {
+	WARN(device->warn_on_refcount_drop, "%s refcnt =3D %d\n",
+	     dev_name(&device->dev), refcount_read(&device->refcount));
 	if (refcount_dec_and_test(&device->refcount))
 		complete(&device->unreg_completion);
 }
@@ -1287,7 +1289,10 @@ static void disable_device(struct ib_device *device)

 	/* Pairs with refcount_set in enable_device */
 	ib_device_put(device);
+	device->warn_on_refcount_drop =3D true;
+#if 0
 	wait_for_completion(&device->unreg_completion);
+#endif

 	/*
 	 * compat devices must be removed after device refcount drops to zero.
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index c868609a4ffa..2d050e3ee55a 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -2704,6 +2704,7 @@ struct ib_device {
 	 * registered and cannot be unregistered.
 	 */
 	refcount_t refcount;
+	bool		warn_on_refcount_drop;
 	struct completion unreg_completion;
 	struct work_struct unregistration_work;

The following appeared:

WARNING: CPU: 5 PID: 1760 at drivers/infiniband/core/device.c:335 ib_device=
_put+0xf2/0x100 [ib_core]

Call Trace:
 rxe_elem_release+0x76/0x90 [rdma_rxe]
 rxe_destroy_cq+0x4f/0x70 [rdma_rxe]
 ib_free_cq_user+0x12b/0x2b0 [ib_core]
 ib_cq_pool_destroy+0xa8/0x140 [ib_core]
 __ib_unregister_device+0x9c/0x1c0 [ib_core]
 ib_unregister_driver+0x181/0x1a0 [ib_core]
 rxe_module_exit+0x31/0x50 [rdma_rxe]
 __x64_sys_delete_module+0x22a/0x310
 do_syscall_64+0x36/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Do you agree that the above proves that the hang-on-unload is a
regression that has been introduced by the cq-pool patches? Is the patch
below a good way to fix this?

--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -1454,8 +1454,8 @@ static void __ib_unregister_device(struct ib_device *=
ib_dev)
 	if (!refcount_read(&ib_dev->refcount))
 		goto out;

-	disable_device(ib_dev);
 	ib_cq_pool_destroy(ib_dev);
+	disable_device(ib_dev);

 	/* Expedite removing unregistered pointers from the hash table */
 	free_netdevs(ib_dev);

Thanks,

Bart.
--===============2267372209017764841==--

