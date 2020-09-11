Content-Type: multipart/mixed; boundary="===============0833203501291696609=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [IB/srpt] c804af2c1d: last_state.test.blktests.exit_code.143
Date: Fri, 11 Sep 2020 15:00:30 -0700
Message-ID: <6c86453d-d7ae-a36b-d827-7812999abc96@acm.org>
In-Reply-To: <e8a240aa-9e9b-3dca-062f-9130b787f29b@acm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0833203501291696609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-09-08 19:01, Bart Van Assche wrote:
> The above patch didn't compile, but the patch below does and makes the ha=
ng
> disappear. So feel free to add the following to the patch below:
> =

> Tested-by: Bart Van Assche <bvanassche@acm.org>
> =

> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/d=
evice.c
> index c36b4d2b61e0..23ee65a9185f 100644
> --- a/drivers/infiniband/core/device.c
> +++ b/drivers/infiniband/core/device.c
> @@ -1285,6 +1285,8 @@ static void disable_device(struct ib_device *device)
>  		remove_client_context(device, cid);
>  	}
> =

> +	ib_cq_pool_destroy(device);
> +
>  	/* Pairs with refcount_set in enable_device */
>  	ib_device_put(device);
>  	wait_for_completion(&device->unreg_completion);
> @@ -1328,6 +1330,8 @@ static int enable_device_and_get(struct ib_device *=
device)
>  			goto out;
>  	}
> =

> +	ib_cq_pool_init(device);
> +
>  	down_read(&clients_rwsem);
>  	xa_for_each_marked (&clients, index, client, CLIENT_REGISTERED) {
>  		ret =3D add_client_context(device, client);
> @@ -1400,7 +1404,6 @@ int ib_register_device(struct ib_device *device, co=
nst char *name)
>  		goto dev_cleanup;
>  	}
> =

> -	ib_cq_pool_init(device);
>  	ret =3D enable_device_and_get(device);
>  	dev_set_uevent_suppress(&device->dev, false);
>  	/* Mark for userspace that device is ready */
> @@ -1455,7 +1458,6 @@ static void __ib_unregister_device(struct ib_device=
 *ib_dev)
>  		goto out;
> =

>  	disable_device(ib_dev);
> -	ib_cq_pool_destroy(ib_dev);
> =

>  	/* Expedite removing unregistered pointers from the hash table */
>  	free_netdevs(ib_dev);

Hi Jason,

Please let me know how you want to proceed with this patch.

Thanks,

Bart.
--===============0833203501291696609==--

