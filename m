Content-Type: multipart/mixed; boundary="===============5720884632108767116=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [PATCH] atm/svc: Fix blocking in wait loop
Date: Tue, 12 Aug 2014 15:02:25 -0700
Message-ID: <20140812.150225.33325749199708788.davem@davemloft.net>
In-Reply-To: <20140812081226.0fb0534e@thirdoffive.cmf.nrl.navy.mil>
List-Id: <oe-lkp.lists.linux.dev>

--===============5720884632108767116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: chas williams - CONTRACTOR <chas@cmf.nrl.navy.mil>
Date: Tue, 12 Aug 2014 08:12:26 -0400

> One should not call blocking primitives inside a wait loop, since both
> require task_struct::state to sleep, so the inner will destroy the
> outer state.
> =

> sigd_enq() will possibly sleep for alloc_skb().  Move sigd_enq() before
> prepare_to_wait() to avoid sleeping while waiting interruptibly.  You do
> not actually need to call sigd_enq() after the initial prepare_to_wait()
> because we test the termination condition before calling schedule().
> =

> Based on suggestions from Peter Zijlstra.
> =

> Signed-off-by: Chas Williams <chas@cmf.n4rl.navy.mil>
> Acked-by: Peter Zijlstra <peterz@infradead.org>

Applied.

--===============5720884632108767116==--

