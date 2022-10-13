Content-Type: multipart/mixed; boundary="===============0569505833702938922=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [blk] 8c5035dfbb: fio.read_iops -10.6% regression
Date: Thu, 13 Oct 2022 15:42:00 +0800
Message-ID: <Y0fBSDv96boXmfB4@feng-clx>
In-Reply-To: <e81ea0fe-dcd2-1e5d-9b78-3c79751b3097@huaweicloud.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0569505833702938922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 05:32:34PM +0800, Yu Kuai wrote:
> Hi,
> =

> =E5=9C=A8 2022/10/09 16:43, Ming Lei =E5=86=99=E9=81=93:
> > On Sat, Oct 08, 2022 at 04:00:10PM +0800, Yu Kuai wrote:
> >> Hi,
> >>
> >> =E5=9C=A8 2022/10/08 10:50, kernel test robot =E5=86=99=E9=81=93:
> >>> Greeting,
> >>>
> >>> FYI, we noticed a -10.6% regression of fio.read_iops due to commit:
> >>
> >> I don't know how this is working but I'm *sure* this commit won't affe=
ct
> > =

> > Looks it is wrong to move
> > =

> > 	wbt_set_write_cache(q, test_bit(QUEUE_FLAG_WC, &q->queue_flags));
> > =

> > before rq_qos_add() in wbt_init().
> > =

> > Without adding wbt rq_qos, wbt_set_write_cache is just a nop.
> =

> Yes, I got it now, I'm being foolish here.
> =

> I missed that "rwb->wc" is got by rq_qos in wbt_set_write_cache(), which
> is NULL before rq_qos_add(). By the way, it's interesting that how read
> performance is affected, I still don't know why yet...

Indeed, we are confused too. So we did some further check, and found
it could be related with the less calls of wake_up_all(), due to the
'rwb->wc' value changed. =


I'm not familiar with the block layer and VFS, and just checked the
'blk-wbt.c'. Before commit 8c5035dfbb, the 'rwb->wc' is 0 in 0Day's
test env, while it's 1 after the commit.

Inside wbt_rqw_done(), 'rwb->wc' be used to judge whether to wakeup
other waiters in system, so we add some debug code to check the
wakeup and skip-wakeup counter:

  ----------------------------------------------------------------
  @@ -130,6 +130,8 @@ static void wbt_rqw_done(struct rq_wb *rwb, struct rq=
_wait *rqw,
   	/*
   	 * Don't wake anyone up if we are above the normal limit.
   	 */
  -	if (inflight && inflight >=3D limit)
  +	if (inflight && inflight >=3D limit) {
  +		skip_wakeup++;
   		return;
  +	}
   =

   	if (wq_has_sleeper(&rqw->wait)) {
   		int diff =3D limit - inflight;
   =

  -		if (!inflight || diff >=3D rwb->wb_background / 2)
  +		if (!inflight || diff >=3D rwb->wb_background / 2) {
  +			wakeup++;
   			wake_up_all(&rqw->wait);
  +		}
  ----------------------------------------------------------------

And after the fio task, the 'skip_wakeup' number is much bigger
after the patch:
  =

  before patch:
      422.274394: wbt_rqw_done: wakeup_skip=3D19408 wakup_all=3D1944759
  =

  after patch:
      433.753345: wbt_rqw_done: wakeup_skip=3D2090585 wakup_all=3D13630

Hope this can help the root causing.

Thanks,
Feng
--===============0569505833702938922==--

