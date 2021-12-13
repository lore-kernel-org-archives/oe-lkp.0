Content-Type: multipart/mixed; boundary="===============6300784293597935760=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 2/2] ucounts: Move rlimit max values from ucounts max
Date: Mon, 13 Dec 2021 09:50:45 -0600
Message-ID: <87tufc1p2i.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <24c87e225c7950bf2ea1ff4b4a8f237348808241.1638218242.git.legion@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6300784293597935760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Alexey Gladkov <legion@kernel.org> writes:

> Since the semantics of maximum rlimit values are different, they need to
> be separated from ucount_max. This will prevent the error of using
> inc_count/dec_ucount for rlimit parameters.
>
> This patch also renames the functions to emphasize the lack of
> connection between rlimit_max and ucount_max.
>
> v2:
> - Fix the array-index-out-of-bounds that was found by the lkp project.

Just looking at this I wonder if it things would come out cleaner if we
had a separate "enum ucount_rlimit_type" and a separate array in "struct
ucount" for the rlimits.

Just so that people don't accidentally mix the two.

>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>  include/linux/user_namespace.h | 17 ++++++++++++-----
>  kernel/fork.c                  | 10 +++++-----
>  kernel/ucount.c                | 10 +++-------
>  kernel/user_namespace.c        | 10 +++++-----
>  4 files changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/include/linux/user_namespace.h b/include/linux/user_namespac=
e.h
> index 33a4240e6a6f..812b6935f4a3 100644
> --- a/include/linux/user_namespace.h
> +++ b/include/linux/user_namespace.h
> @@ -58,10 +58,11 @@ enum ucount_type {
>  	UCOUNT_RLIMIT_MSGQUEUE,
>  	UCOUNT_RLIMIT_SIGPENDING,
>  	UCOUNT_RLIMIT_MEMLOCK,
> -	UCOUNT_COUNTS,
> +	UCOUNT_ALL_COUNTS,
>  };
>  =

> -#define MAX_PER_NAMESPACE_UCOUNTS UCOUNT_RLIMIT_NPROC
> +#define UCOUNT_COUNTS UCOUNT_RLIMIT_NPROC
> +#define RLIMIT_COUNTS UCOUNT_ALL_COUNTS - UCOUNT_COUNTS + 1
>  =

>  struct user_namespace {
>  	struct uid_gid_map	uid_map;
> @@ -99,6 +100,7 @@ struct user_namespace {
>  #endif
>  	struct ucounts		*ucounts;
>  	long ucount_max[UCOUNT_COUNTS];
> +	long rlimit_max[RLIMIT_COUNTS];
>  } __randomize_layout;
>  =

>  struct ucounts {
> @@ -106,7 +108,7 @@ struct ucounts {
>  	struct user_namespace *ns;
>  	kuid_t uid;
>  	atomic_t count;
> -	atomic_long_t ucount[UCOUNT_COUNTS];
> +	atomic_long_t ucount[UCOUNT_ALL_COUNTS];
>  };
>  =

>  extern struct user_namespace init_user_ns;
> @@ -131,10 +133,15 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts=
, enum ucount_type type);
>  void dec_rlimit_put_ucounts(struct ucounts *ucounts, enum ucount_type ty=
pe);
>  bool is_ucounts_overlimit(struct ucounts *ucounts, enum ucount_type type=
, unsigned long max);
>  =

> -static inline void set_rlimit_ucount_max(struct user_namespace *ns,
> +static inline long get_userns_rlimit_max(struct user_namespace *ns, enum=
 ucount_type type)
> +{
> +	return READ_ONCE(ns->rlimit_max[type - UCOUNT_COUNTS]);
> +}
> +
> +static inline void set_userns_rlimit_max(struct user_namespace *ns,
>  		enum ucount_type type, unsigned long max)
>  {
> -	ns->ucount_max[type] =3D max <=3D LONG_MAX ? max : LONG_MAX;
> +	ns->rlimit_max[type - UCOUNT_COUNTS] =3D max <=3D LONG_MAX ? max : LONG=
_MAX;
>  }
>  =

>  #ifdef CONFIG_USER_NS
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 3244cc56b697..365819458030 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -836,13 +836,13 @@ void __init fork_init(void)
>  	init_task.signal->rlim[RLIMIT_SIGPENDING] =3D
>  		init_task.signal->rlim[RLIMIT_NPROC];
>  =

> -	for (i =3D 0; i < MAX_PER_NAMESPACE_UCOUNTS; i++)
> +	for (i =3D 0; i < UCOUNT_COUNTS; i++)
>  		init_user_ns.ucount_max[i] =3D max_threads/2;
>  =

> -	set_rlimit_ucount_max(&init_user_ns, UCOUNT_RLIMIT_NPROC,      RLIM_INF=
INITY);
> -	set_rlimit_ucount_max(&init_user_ns, UCOUNT_RLIMIT_MSGQUEUE,   RLIM_INF=
INITY);
> -	set_rlimit_ucount_max(&init_user_ns, UCOUNT_RLIMIT_SIGPENDING, RLIM_INF=
INITY);
> -	set_rlimit_ucount_max(&init_user_ns, UCOUNT_RLIMIT_MEMLOCK,    RLIM_INF=
INITY);
> +	set_userns_rlimit_max(&init_user_ns, UCOUNT_RLIMIT_NPROC,      RLIM_INF=
INITY);
> +	set_userns_rlimit_max(&init_user_ns, UCOUNT_RLIMIT_MSGQUEUE,   RLIM_INF=
INITY);
> +	set_userns_rlimit_max(&init_user_ns, UCOUNT_RLIMIT_SIGPENDING, RLIM_INF=
INITY);
> +	set_userns_rlimit_max(&init_user_ns, UCOUNT_RLIMIT_MEMLOCK,    RLIM_INF=
INITY);
>  =

>  #ifdef CONFIG_VMAP_STACK
>  	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "fork:vm_stack_cache",
> diff --git a/kernel/ucount.c b/kernel/ucount.c
> index 7b32c356ebc5..ffffcfae8474 100644
> --- a/kernel/ucount.c
> +++ b/kernel/ucount.c
> @@ -87,10 +87,6 @@ static struct ctl_table user_table[] =3D {
>  	UCOUNT_ENTRY("max_fanotify_groups"),
>  	UCOUNT_ENTRY("max_fanotify_marks"),
>  #endif
> -	{ },
> -	{ },
> -	{ },
> -	{ },
>  	{ }
>  };
>  #endif /* CONFIG_SYSCTL */
> @@ -273,7 +269,7 @@ long inc_rlimit_ucounts(struct ucounts *ucounts, enum=
 ucount_type type, long v)
>  			ret =3D LONG_MAX;
>  		else if (iter =3D=3D ucounts)
>  			ret =3D new;
> -		max =3D READ_ONCE(iter->ns->ucount_max[type]);
> +		max =3D get_userns_rlimit_max(iter->ns, type);
>  	}
>  	return ret;
>  }
> @@ -322,7 +318,7 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts, =
enum ucount_type type)
>  			goto unwind;
>  		if (iter =3D=3D ucounts)
>  			ret =3D new;
> -		max =3D READ_ONCE(iter->ns->ucount_max[type]);
> +		max =3D get_userns_rlimit_max(iter->ns, type);
>  		/*
>  		 * Grab an extra ucount reference for the caller when
>  		 * the rlimit count was previously 0.
> @@ -350,7 +346,7 @@ bool is_ucounts_overlimit(struct ucounts *ucounts, en=
um ucount_type type, unsign
>  	for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
>  		if (get_ucounts_value(iter, type) > max)
>  			return true;
> -		max =3D READ_ONCE(iter->ns->ucount_max[type]);
> +		max =3D get_userns_rlimit_max(iter->ns, type);
>  	}
>  	return false;
>  }
> diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> index 6b2e3ca7ee99..b9f6729b4e5f 100644
> --- a/kernel/user_namespace.c
> +++ b/kernel/user_namespace.c
> @@ -119,13 +119,13 @@ int create_user_ns(struct cred *new)
>  	ns->owner =3D owner;
>  	ns->group =3D group;
>  	INIT_WORK(&ns->work, free_user_ns);
> -	for (i =3D 0; i < MAX_PER_NAMESPACE_UCOUNTS; i++) {
> +	for (i =3D 0; i < UCOUNT_COUNTS; i++) {
>  		ns->ucount_max[i] =3D INT_MAX;
>  	}
> -	set_rlimit_ucount_max(ns, UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC));
> -	set_rlimit_ucount_max(ns, UCOUNT_RLIMIT_MSGQUEUE, rlimit(RLIMIT_MSGQUEU=
E));
> -	set_rlimit_ucount_max(ns, UCOUNT_RLIMIT_SIGPENDING, rlimit(RLIMIT_SIGPE=
NDING));
> -	set_rlimit_ucount_max(ns, UCOUNT_RLIMIT_MEMLOCK, rlimit(RLIMIT_MEMLOCK)=
);
> +	set_userns_rlimit_max(ns, UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC));
> +	set_userns_rlimit_max(ns, UCOUNT_RLIMIT_MSGQUEUE, rlimit(RLIMIT_MSGQUEU=
E));
> +	set_userns_rlimit_max(ns, UCOUNT_RLIMIT_SIGPENDING, rlimit(RLIMIT_SIGPE=
NDING));
> +	set_userns_rlimit_max(ns, UCOUNT_RLIMIT_MEMLOCK, rlimit(RLIMIT_MEMLOCK)=
);
>  	ns->ucounts =3D ucounts;
>  =

>  	/* Inherit USERNS_SETGROUPS_ALLOWED from our parent */
--===============6300784293597935760==--

