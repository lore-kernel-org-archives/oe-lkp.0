Content-Type: multipart/mixed; boundary="===============1554107094355053923=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Fri, 28 Aug 2015 13:09:29 +0200
Message-ID: <20150828110929.GI32206@pox.localdomain>
In-Reply-To: <1440757685-14241-2-git-send-email-phil@nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============1554107094355053923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/28/15 at 12:28pm, Phil Sutter wrote:
> After adding cond_resched() calls to threadfunc(), a surprisingly high
> rate of insert failures occurred probably due to table resizes getting a
> better chance to run in background. To not soften up the remaining
> tests, retry inserts until they either succeed or fail permanently.
> =

> Signed-off-by: Phil Sutter <phil@nwl.cc>
> ---
>  lib/test_rhashtable.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> =

> diff --git a/lib/test_rhashtable.c b/lib/test_rhashtable.c
> index 63654e3..093cf84 100644
> --- a/lib/test_rhashtable.c
> +++ b/lib/test_rhashtable.c
> @@ -244,7 +244,7 @@ static int thread_lookup_test(struct thread_data *tda=
ta)
>  =

>  static int threadfunc(void *data)
>  {
> -	int i, step, err =3D 0, insert_fails =3D 0;
> +	int i, step, err =3D 0, retries =3D 0;
>  	struct thread_data *tdata =3D data;
>  =

>  	up(&prestart_sem);
> @@ -253,21 +253,22 @@ static int threadfunc(void *data)
>  =

>  	for (i =3D 0; i < entries; i++) {
>  		tdata->objs[i].value =3D (tdata->id << 16) | i;
> +insert_retry:
>  		cond_resched();
>  		err =3D rhashtable_insert_fast(&ht, &tdata->objs[i].node,
>  		                             test_rht_params);
>  		if (err =3D=3D -ENOMEM || err =3D=3D -EBUSY) {
> -			tdata->objs[i].value =3D TEST_INSERT_FAIL;
> -			insert_fails++;
> +			retries++;
> +			goto insert_retry;

Is it safe to retry indefinitely on ENOMEM? Retrying on EBUSY is
definitely an improvement and we should do the same in the non
threaded test as well.

--===============1554107094355053923==--

