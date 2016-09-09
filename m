Content-Type: multipart/mixed; boundary="===============7627730384707871620=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [writeback] 8bc4ad9498: INFO: suspicious RCU usage. ]
Date: Fri, 09 Sep 2016 08:46:40 +0800
Message-ID: <20160909004640.GA7334@yexl-desktop>
In-Reply-To: <4cace953-b5b9-4840-f3f2-b21bd4f30095@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7627730384707871620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/08, Jens Axboe wrote:
>On 09/07/2016 08:04 PM, Ye Xiaolong wrote:
>>On 09/08, Fengguang Wu wrote:
>>>Hi Jens and Tejun,
>>>
>>>>The command line was in the original email:
>>>>
>>>>$ qemu-system-x86_64 -enable-kvm -cpu Westmere -m 512M
>>>>
>>>>And agree, in general it'd be nice if there was a link to the image as
>>>>well, so that folks can reproduce.
>>>
>>>Yes we have a reproduce script internally, however need to polish it
>>>up and make it general usable by kernel developers.
>>>
>>>CC Philip. It'd be helpful to give more priority to the "lkp qemu"
>>>reproduce command.
>>>
>>>For the warning here, it does not depend on any initrd, I just
>>>confirmed this simple script can reproduce the problem.
>>
>>Yes, just confirmed that v4.8-rc5 doesn't have this warning, while kernel
>>for the updated commit (fa0e2cb1af765691fabd329f03cad563a0eebf18) on bran=
ch
>>wb-buf-throttle could reproduce it.
>
>Anyone willing to try the below patch?

The warning log is gone with this patch.

Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>

Thanks,
Xiaolong

>
>diff --git a/block/cfq-iosched.c b/block/cfq-iosched.c
>index ef61bda76317..a7bb2e6bcaef 100644
>--- a/block/cfq-iosched.c
>+++ b/block/cfq-iosched.c
>@@ -3764,9 +3764,11 @@ static void check_blkcg_changed(struct
>cfq_io_cq *cic, struct bio *bio)
> 	struct cfq_data *cfqd =3D cic_to_cfqd(cic);
> 	struct cfq_queue *cfqq;
> 	uint64_t serial_nr;
>+	bool nonroot_cg;
>
> 	rcu_read_lock();
> 	serial_nr =3D bio_blkcg(bio)->css.serial_nr;
>+	nonroot_cg =3D bio_blkcg(bio) !=3D &blkcg_root;
> 	rcu_read_unlock();
>
> 	/*
>@@ -3781,7 +3783,7 @@ static void check_blkcg_changed(struct
>cfq_io_cq *cic, struct bio *bio)
> 	 * do proper throttling of writes. Turn off wbt for that
> 	 * case.
> 	 */
>-	if (bio_blkcg(bio) !=3D &blkcg_root) {
>+	if (nonroot_cg) {
> 		struct request_queue *q =3D cfqd->queue;
>
> 		if (q->rq_wb)
>
>-- =

>Jens Axboe
>

--===============7627730384707871620==--

