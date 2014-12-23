Content-Type: multipart/mixed; boundary="===============6434622732464243902=="
MIME-Version: 1.0
From: Rusty Russell <rusty@rustcorp.com.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/5] hwrng: core - Use struct completion for cleanup_done
Date: Wed, 24 Dec 2014 09:49:10 +1030
Message-ID: <87tx0mgdjl.fsf@rustcorp.com.au>
In-Reply-To: <E1Y3ICf-0007cX-B9@gondolin.me.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============6434622732464243902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Herbert Xu <herbert@gondor.apana.org.au> writes:
> There is no point in doing a manual completion for cleanup_done
> when struct completion fits in perfectly.
>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Indeed.

Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Thanks,
Rusty.

> ---
>
>  drivers/char/hw_random/core.c |   12 +++---------
>  include/linux/hw_random.h     |    3 ++-
>  2 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_random/core.c
> index 6ec4225..3dba2cf 100644
> --- a/drivers/char/hw_random/core.c
> +++ b/drivers/char/hw_random/core.c
> @@ -60,7 +60,6 @@ static DEFINE_MUTEX(rng_mutex);
>  static DEFINE_MUTEX(reading_mutex);
>  static int data_avail;
>  static u8 *rng_buffer, *rng_fillbuf;
> -static DECLARE_WAIT_QUEUE_HEAD(rng_done);
>  static unsigned short current_quality;
>  static unsigned short default_quality; /* =3D 0; default to "off" */
>  =

> @@ -100,10 +99,7 @@ static inline void cleanup_rng(struct kref *kref)
>  	if (rng->cleanup)
>  		rng->cleanup(rng);
>  =

> -	/* cleanup_done should be updated after cleanup finishes */
> -	smp_wmb();
> -	rng->cleanup_done =3D true;
> -	wake_up_all(&rng_done);
> +	complete(&rng->cleanup_done);
>  }
>  =

>  static void set_current_rng(struct hwrng *rng)
> @@ -498,7 +494,7 @@ int hwrng_register(struct hwrng *rng)
>  		add_early_randomness(rng);
>  	}
>  =

> -	rng->cleanup_done =3D false;
> +	init_completion(&rng->cleanup_done);
>  =

>  out_unlock:
>  	mutex_unlock(&rng_mutex);
> @@ -532,9 +528,7 @@ void hwrng_unregister(struct hwrng *rng)
>  	} else
>  		mutex_unlock(&rng_mutex);
>  =

> -	/* Just in case rng is reading right now, wait. */
> -	wait_event(rng_done, rng->cleanup_done &&
> -		   atomic_read(&rng->ref.refcount) =3D=3D 0);
> +	wait_for_completion(&rng->cleanup_done);
>  }
>  EXPORT_SYMBOL_GPL(hwrng_unregister);
>  =

> diff --git a/include/linux/hw_random.h b/include/linux/hw_random.h
> index 7832e50..eb7b414 100644
> --- a/include/linux/hw_random.h
> +++ b/include/linux/hw_random.h
> @@ -12,6 +12,7 @@
>  #ifndef LINUX_HWRANDOM_H_
>  #define LINUX_HWRANDOM_H_
>  =

> +#include <linux/completion.h>
>  #include <linux/types.h>
>  #include <linux/list.h>
>  #include <linux/kref.h>
> @@ -46,7 +47,7 @@ struct hwrng {
>  	/* internal. */
>  	struct list_head list;
>  	struct kref ref;
> -	bool cleanup_done;
> +	struct completion cleanup_done;
>  };
>  =

>  /** Register a new Hardware Random Number Generator driver. */

--===============6434622732464243902==--

