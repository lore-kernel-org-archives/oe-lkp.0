Content-Type: multipart/mixed; boundary="===============5527303764706041881=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf] 3215929f8f: n f[d 29 [ 4:22:177.]092021] EIP is at SyS_perf_event_open+0x757/0xb86
Date: Thu, 17 Sep 2015 11:09:04 +0200
Message-ID: <20150917090904.GJ3816@twins.programming.kicks-ass.net>
In-Reply-To: <20150917090639.GA8019@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5527303764706041881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2015 at 05:06:39PM +0800, Fengguang Wu wrote:
> > How can I get the actual patch? I don't have this commit. (It could be a
> > previous version, I had a bug like that, but not having the actual patch
> > I cannot check if its the same or not).
> =

> Here is the patch:

Thanks!

> +	gctx =3D group_leader->ctx;
> +	if (move_group)
> +		mutex_lock_double(&gctx->mutex, &ctx->mutex);
> +	else
> +		mutex_lock(&ctx->mutex);

Yep, this is the buggy one. The current one looks like:

        if (move_group) {
                gctx =3D group_leader->ctx;
+               mutex_lock_double(&gctx->mutex, &ctx->mutex);
+       } else {
+               mutex_lock(&ctx->mutex);
+       }

--===============5527303764706041881==--

