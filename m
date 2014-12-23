Content-Type: multipart/mixed; boundary="===============7001343539651486633=="
MIME-Version: 1.0
From: Rusty Russell <rusty@rustcorp.com.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/5] hwrng: core - Fix current_rng init/cleanup race yet again
Date: Wed, 24 Dec 2014 09:56:36 +1030
Message-ID: <87ppbagd77.fsf@rustcorp.com.au>
In-Reply-To: <E1Y3ICg-0007cq-Kj@gondolin.me.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============7001343539651486633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Herbert Xu <herbert@gondor.apana.org.au> writes:
> The kref solution is still buggy because we were only focusing
> on the register/unregister race.  The same race affects the
> setting of current_rng through sysfs.
>
> This patch fixes it by using kref_get_unless_zero.
>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

This patch scares me a little!

I'll have to pull the tree to review it properly, but the theory was
that the reference count was counting users of the rng.  Now I don't
know what it's counting:

>  static inline int hwrng_init(struct hwrng *rng)
>  {
> +	if (kref_get_unless_zero(&rng->ref))
> +		goto skip_init;
> +
>  	if (rng->init) {
>  		int ret;

OK, so this skip_init branch is triggered when the rng is being
shut down as it's no longer current_rng?

> +
> +	kref_init(&rng->ref);
> +	reinit_completion(&rng->cleanup_done);
> +
> +skip_init:
>  	add_early_randomness(rng);

Then we use it to add randomness?

>  =

>  	current_quality =3D rng->quality ? : default_quality;
> @@ -467,6 +474,9 @@ int hwrng_register(struct hwrng *rng)
>  			goto out_unlock;
>  	}
>  =

> +	init_completion(&rng->cleanup_done);
> +	complete(&rng->cleanup_done);
> +

This code smells very bad.

Cheers,
Rusty.

--===============7001343539651486633==--

