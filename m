Content-Type: multipart/mixed; boundary="===============4392824998623983715=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [setsockopt] WARNING: CPU: 0 PID: 1444 at kernel/sched/core.c:7088 __might_sleep+0x51/0x16f()
Date: Thu, 07 Aug 2014 19:25:14 +0200
Message-ID: <20140807172514.GY9918@twins.programming.kicks-ass.net>
In-Reply-To: <20140807125948.2b7f1472@thirdoffive.cmf.nrl.navy.mil>
List-Id: <oe-lkp.lists.linux.dev>

--===============4392824998623983715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 12:59:48PM -0400, chas williams - CONTRACTOR wrote:
> On Thu, 7 Aug 2014 17:17:41 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> =

> > Subject: atm: Fix blocking in wait loop
> > =

> > One should not call blocking primitives inside a wait loop, since both
> > require task_struct::state to sleep, so the inner will destroy the outer
> > state.
> > =

> > In this instance sigd_enq() will possible sleep for alloc_skb(), now if
> > I understand the code right, we do not actually need to call sigd_enq()
> > after the initial prepare_to_wait(), because we test the termination
> > condition before schedule() anyhow.
> > =

> > So we can simply move it up a bit and avoid the entire confusion.
> > =

> > Signed-off-by: Peter Zijlstra <peterz@infradead.org>
> > ---
> >  net/atm/svc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/net/atm/svc.c b/net/atm/svc.c
> > index d8e5d0c2ebbc..445ac238b69b 100644
> > --- a/net/atm/svc.c
> > +++ b/net/atm/svc.c
> > @@ -297,8 +297,8 @@ static int svc_listen(struct socket *sock, int back=
log)
> >  		goto out;
> >  	}
> >  	set_bit(ATM_VF_WAITING, &vcc->flags);
> > -	prepare_to_wait(sk_sleep(sk), &wait, TASK_UNINTERRUPTIBLE);
> >  	sigd_enq(vcc, as_listen, NULL, NULL, &vcc->local);
> > +	prepare_to_wait(sk_sleep(sk), &wait, TASK_UNINTERRUPTIBLE);
> >  	while (test_bit(ATM_VF_WAITING, &vcc->flags) && sigd) {
> >  		schedule();
> >  		prepare_to_wait(sk_sleep(sk), &wait, TASK_UNINTERRUPTIBLE);
> =

> =

> This isn't the only place that we queue a message for the signalling
> daemon after a prepare_to_wait() uninterruptibly so this patch would
> be incomplete as is.

I'm not sure I follow, this is the only place you do so while then going
to sleep. All other sites don't sleep while they're enqueued on the
waitqueue.

> What bothers me is the TASK_UNINTERRUPTIBLE -- I don't have a good
> reason why any of these should be sleeping uninterruptibly.

That's a whole different story, there's tons of ugly in there, but its
all ancient code.

--===============4392824998623983715==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDQ3WjZBQW9KRUhaSDRhUkx3T1M2eTZJUUFLMXhoblA1
dEhoMkN1eEZybnZuTlV6agoxWU5rOTVFc0thUm82NmtLNGlBakF0MGoxYzhRUmlMV2E3QWtKUlQ4
U3hMTC9yOG9HUk5VSXNEMFZmcFZOUHBVClEvTGNHWU1xSVQ5UGNyOGdhQTV6RzBwb1VqNFM3WGMw
bTJhR2d1NlZMNElub2pqUThRQWJzZkZPZjlhWXhSVSsKMzU4ZjZYUE8vN3JzYXJwd2h5WnBBNmM2
RmJFSkdBRkxzU1ZxK0dnYWNqTC8xTXdqcXovTXgrOEM0bXVLK3Rtdwp2Z2NQT0F3c0c5eVR4cHU4
Z1pneWY0NEZRVzlSb09ML3pxWmNyUEN5aGtNZnBvMnZ6ZitESmRXR0pCSVZ0cXVpCjZhNVBZVFdW
bnNWZnJXT2hZY2Z1enRHZEI5VmVFQ2NDWmx4T3BRdnQzRDNtdi8yTEpnNklZR3h5RmxvbXRkNGcK
ZTJGN29vZDd3ZCsyNW0yT0I2OU5lNDZka2NoVkZNOFA4b0pINE5LMG9YclNXYWRzY0VLUnRuOWlK
Z3VVTlgyRApQenpyMHpycTlrVVNscmppSWtlTkgzNzk4eWxzREVHZXVGdGZMK1FRSDdtUlRxQVNV
MGN4QkQ1clBqc1F5emRECk1qaWdQREhWVnJLYVN5bjBmM2MyYVh5eUw5bmRkczY2aWxRcmxFOW45
Tk1KeFBPeXMyMytNU21rVmQrZmpEOHcKS3NrcnhYNHU2RkVmTTE0VU9oYWkxMjdIZGVOdWFxcGpI
ZEJjRldPUVVYcGJPK3VldW5vTVdOeDBQUzgzVVBqSwppN2c2NGl5ait3anl1dnBJd1lxdDNkUEt2
LzEzSHFIQlppVGxuTjFGb1dmUVNPT0RqMElKQkcrWCtWV0lWSmRkCmd4QTMwY2xmZWlOek8vTW56
ekUxCj1EYkZzCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4392824998623983715==--

