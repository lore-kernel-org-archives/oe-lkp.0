Content-Type: multipart/mixed; boundary="===============3276982023160336470=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Tue, 25 Feb 2020 10:57:48 +0800
Message-ID: <20200225025748.GB63065@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=wgbR4ocHAOiaj7x+V7dVoYr-mD2N7Y_MRPJ+Q+GohDYeg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3276982023160336470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 12:47:14PM -0800, Linus Torvalds wrote:
> [ Adding a few more people that tend to be involved in signal
> handling. Just in case - even if they probably don't care ]
> =

> On Mon, Feb 24, 2020 at 12:09 PM Linus Torvalds
> =

> I've tested it, and the profiles on the silly microbenchmark look much
> nicer. Now it's just the sigpending update shows up, the refcount case
> clearly still occasionally happens, but it's now in the noise.
> =

> I made slight changes to the __sigqueue_alloc() case to generate
> better code: since we now use that atomic_inc_return() anyway, we
> might as well then use the value that is returned for the
> RLIMIT_SIGPENDING check too, instead of reading it again.
> =

> That might avoid another potential cacheline bounce, plus the
> generated code just looks better.
> =

> Updated (and now slightly tested!) patch attached.
> It would be interesting if this is noticeable on your benchmark
> numbers. I didn't actually _time_ anything, I just looked at profiles.
> =

> But my setup clearly isn't going to see the horrible contention case
> anyway, so my timing numbers wouldn't be all that interesting.

Thanks for the optimization patch for signal!

It makes a big difference, that the performance score is tripled!
bump from original 17000 to 54000. Also the gap between 5.0-rc6 and
5.0-rc6+Jiri's patch is reduced to around 2%.

The test I run is inserting your patch right before 5.0-rc6, then
run the test for 5.0-rc6 and 5.0-rc6+Jiri's patch. Sorry it took
quite some time, as the test platform is not local but inside
0day's framework, which takes some time for scheduling, kbuilding
and testing.

Thanks,
Feng

 =

>              Linus

>  kernel/signal.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> =

> diff --git a/kernel/signal.c b/kernel/signal.c
> index 9ad8dea93dbb..5b2396350dd1 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -413,27 +413,32 @@ __sigqueue_alloc(int sig, struct task_struct *t, gf=
p_t flags, int override_rlimi
>  {
>  	struct sigqueue *q =3D NULL;
>  	struct user_struct *user;
> +	int sigpending;
>  =

>  	/*
>  	 * Protect access to @t credentials. This can go away when all
>  	 * callers hold rcu read lock.
> +	 *
> +	 * NOTE! A pending signal will hold on to the user refcount,
> +	 * and we get/put the refcount only when the sigpending count
> +	 * changes from/to zero.
>  	 */
>  	rcu_read_lock();
> -	user =3D get_uid(__task_cred(t)->user);
> -	atomic_inc(&user->sigpending);
> +	user =3D __task_cred(t)->user;
> +	sigpending =3D atomic_inc_return(&user->sigpending);
> +	if (sigpending =3D=3D 1)
> +		get_uid(user);
>  	rcu_read_unlock();
>  =

> -	if (override_rlimit ||
> -	    atomic_read(&user->sigpending) <=3D
> -			task_rlimit(t, RLIMIT_SIGPENDING)) {
> +	if (override_rlimit || likely(sigpending <=3D task_rlimit(t, RLIMIT_SIG=
PENDING))) {
>  		q =3D kmem_cache_alloc(sigqueue_cachep, flags);
>  	} else {
>  		print_dropped_signal(sig);
>  	}
>  =

>  	if (unlikely(q =3D=3D NULL)) {
> -		atomic_dec(&user->sigpending);
> -		free_uid(user);
> +		if (atomic_dec_and_test(&user->sigpending))
> +			free_uid(user);
>  	} else {
>  		INIT_LIST_HEAD(&q->list);
>  		q->flags =3D 0;
> @@ -447,8 +452,8 @@ static void __sigqueue_free(struct sigqueue *q)
>  {
>  	if (q->flags & SIGQUEUE_PREALLOC)
>  		return;
> -	atomic_dec(&q->user->sigpending);
> -	free_uid(q->user);
> +	if (atomic_dec_and_test(&q->user->sigpending))
> +		free_uid(q->user);
>  	kmem_cache_free(sigqueue_cachep, q);
>  }
> =20

--===============3276982023160336470==--

