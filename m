Content-Type: multipart/mixed; boundary="===============4101881787970390557=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [IB/srpt] c804af2c1d: last_state.test.blktests.exit_code.143
Date: Sun, 23 Aug 2020 14:18:41 -0700
Message-ID: <128192ad-05ff-fa8e-14fc-479a115311e0@acm.org>
In-Reply-To: <0c42aeb4-23a5-b9d5-bc17-ef58a04db8e8@grimberg.me>
List-Id: <oe-lkp.lists.linux.dev>

--===============4101881787970390557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-08-03 00:27, Sagi Grimberg wrote:
> =

>>>> Greeting,
>>>>
>>>> FYI, we noticed the following commit (built with gcc-9):
>>>>
>>>> commit: c804af2c1d3152c0cf877eeb50d60c2d49ac0cf0 ("IB/srpt: use new sh=
ared CQ mechanism")
>>>> https://git.kernel.org/cgit/linux/kernel/git/rdma/rdma.git for-next
>>>>
>>>>
>>>> in testcase: blktests
>>>> with following parameters:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0test: srp-group1
>>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x21
>>>>
>>>>
>>>>
>>>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz wit=
h 4G memory
>>>>
>>>> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
>>>>
>>>>
>>>>
>>>>
>>>> If you fix the issue, kindly add following tag
>>>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>>>
>>>>
>>>> user=C2=A0 :notice: [=C2=A0=C2=A0 44.688140] 2020-08-01 16:10:22 ./che=
ck srp/001 srp/002 srp/003 srp/004 srp/005 srp/006 srp/007 srp/008 srp/009 =
srp/010 srp/011 srp/012 srp/013 srp/015
>>>> user=C2=A0 :notice: [=C2=A0=C2=A0 44.706657] srp/001 (Create and remov=
e LUNs)
>>>> user=C2=A0 :notice: [=C2=A0=C2=A0 44.718405] srp/001 (Create and remov=
e LUNs)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 [passed]
>>>> user=C2=A0 :notice: [=C2=A0=C2=A0 44.729902]=C2=A0=C2=A0=C2=A0=C2=A0 r=
untime=C2=A0 ...=C2=A0 1.972s
>>>> user=C2=A0 :notice: [=C2=A0=C2=A0 99.038748] IPMI BMC is not supported=
 on this machine, skip bmc-watchdog setup!
>>>> user=C2=A0 :notice: [ 3699.039790] Sat Aug=C2=A0 1 17:11:22 UTC 2020 d=
etected soft_timeout
>>>> user=C2=A0 :notice: [ 3699.060341] kill 960 /usr/bin/time -v -o /tmp/l=
kp/blktests.time /lkp/lkp/src/tests/blktests
>>> Yamin and Max, can you take a look at this? The SRP tests from the
>>> blktests repository pass reliably with kernel version v5.7 and before.
>>> With label next-20200731 from linux-next however that test triggers the
>>> following hang:
>>
>> I will look into it.
> =

> FWIW, I ran into this as well with nvme-rdma, but it also reproduces
> when I revert the shared CQ patch from nvme-rdma. Another data point
> is that my tests passes with siw.

Hi Jason,

The patch below is sufficient to unbreak blktests. I think that the
deadlock while unloading rdma_rxe happens because the RDMA core waits for
all ib_dev references to be dropped before dealloc_driver is called.
The rdma_rxe dealloc_driver implementation drops an ib_dev reference. The
dealloc_driver callback was introduced by commit d0899892edd0
("RDMA/device: Provide APIs from the core code to help unregistration").
Do you agree that this regression has been introduced by commits
d0899892edd0 and c367074b6c37 ("RDMA/rxe: Use driver_unregister and new
unregistration API")?

Thanks,

Bart.

---
 drivers/infiniband/core/device.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/dev=
ice.c
index dca2842a7872..5192f305b253 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -1287,13 +1287,8 @@ static void disable_device(struct ib_device *device)

 	/* Pairs with refcount_set in enable_device */
 	ib_device_put(device);
-	wait_for_completion(&device->unreg_completion);

-	/*
-	 * compat devices must be removed after device refcount drops to zero.
-	 * Otherwise init_net() may add more compatdevs after removing compat
-	 * devices and before device is disabled.
-	 */
+	/* To do: prevent init_net() to add more compat_devs. */
 	remove_compat_devs(device);
 }


--===============4101881787970390557==--

