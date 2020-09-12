Content-Type: multipart/mixed; boundary="===============3700860445086805310=="
MIME-Version: 1.0
From: Yi Zhang <yi.zhang@redhat.com>
To: lkp@lists.01.org
Subject: Re: [IB/srpt] c804af2c1d: last_state.test.blktests.exit_code.143
Date: Sat, 12 Sep 2020 12:46:33 +0800
Message-ID: <ba743253-5fc5-1fda-8d6e-d2d6e82ea13e@redhat.com>
In-Reply-To: <6c86453d-d7ae-a36b-d827-7812999abc96@acm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3700860445086805310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Tested-by: Yi Zhang <yi.zhang@redhat.com>


This patch fixed the issue I filed[1] which use rdma_rxe for nvme-rdma =

testing.

[1]
http://lists.infradead.org/pipermail/linux-nvme/2020-August/018988.html

Thanks
Yi

On 9/12/20 6:00 AM, Bart Van Assche wrote:
> On 2020-09-08 19:01, Bart Van Assche wrote:
>> The above patch didn't compile, but the patch below does and makes the h=
ang
>> disappear. So feel free to add the following to the patch below:
>>
>> Tested-by: Bart Van Assche <bvanassche@acm.org>
>>
>> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/=
device.c
>> index c36b4d2b61e0..23ee65a9185f 100644
>> --- a/drivers/infiniband/core/device.c
>> +++ b/drivers/infiniband/core/device.c
>> @@ -1285,6 +1285,8 @@ static void disable_device(struct ib_device *devic=
e)
>>   		remove_client_context(device, cid);
>>   	}
>>
>> +	ib_cq_pool_destroy(device);
>> +
>>   	/* Pairs with refcount_set in enable_device */
>>   	ib_device_put(device);
>>   	wait_for_completion(&device->unreg_completion);
>> @@ -1328,6 +1330,8 @@ static int enable_device_and_get(struct ib_device =
*device)
>>   			goto out;
>>   	}
>>
>> +	ib_cq_pool_init(device);
>> +
>>   	down_read(&clients_rwsem);
>>   	xa_for_each_marked (&clients, index, client, CLIENT_REGISTERED) {
>>   		ret =3D add_client_context(device, client);
>> @@ -1400,7 +1404,6 @@ int ib_register_device(struct ib_device *device, c=
onst char *name)
>>   		goto dev_cleanup;
>>   	}
>>
>> -	ib_cq_pool_init(device);
>>   	ret =3D enable_device_and_get(device);
>>   	dev_set_uevent_suppress(&device->dev, false);
>>   	/* Mark for userspace that device is ready */
>> @@ -1455,7 +1458,6 @@ static void __ib_unregister_device(struct ib_devic=
e *ib_dev)
>>   		goto out;
>>
>>   	disable_device(ib_dev);
>> -	ib_cq_pool_destroy(ib_dev);
>>
>>   	/* Expedite removing unregistered pointers from the hash table */
>>   	free_netdevs(ib_dev);
> Hi Jason,
>
> Please let me know how you want to proceed with this patch.
>
> Thanks,
>
> Bart.
>

--===============3700860445086805310==--

