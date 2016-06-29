Content-Type: multipart/mixed; boundary="===============1041447377740887534=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] kthread: to_live_kthread() needs try_get_task_stack()
Date: Wed, 29 Jun 2016 20:44:27 +0200
Message-ID: <20160629184427.GA3928@redhat.com>
In-Reply-To: <201606300245.vASQFf80%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1041447377740887534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/30, kbuild test robot wrote:
>
> Hi,
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.7-rc5 next-20160629]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]

Yes, please ignore this, the patch is based on Andy's x86/vmap_stack
tree.


> url:    https://github.com/0day-ci/linux/commits/Oleg-Nesterov/kthread-to=
_live_kthread-needs-try_get_task_stack/20160630-020824
> config: i386-tinyconfig (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Di386 =

> =

> All errors (new ones prefixed by >>):
> =

>    kernel/kthread.c: In function 'to_live_kthread':
> >> kernel/kthread.c:67:23: error: implicit declaration of function 'try_g=
et_task_stack' [-Werror=3Dimplicit-function-declaration]
>      if (likely(vfork) && try_get_task_stack(k))
>                           ^~~~~~~~~~~~~~~~~~
>    kernel/kthread.c: In function 'kthread_unpark':
> >> kernel/kthread.c:430:3: error: implicit declaration of function 'put_t=
ask_stack' [-Werror=3Dimplicit-function-declaration]
>       put_task_stack(k);
>       ^~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> =

> vim +/try_get_task_stack +67 kernel/kthread.c
> =

>     61		return __to_kthread(k->vfork_done);
>     62	}
>     63	=

>     64	static struct kthread *to_live_kthread(struct task_struct *k)
>     65	{
>     66		struct completion *vfork =3D ACCESS_ONCE(k->vfork_done);
>   > 67		if (likely(vfork) && try_get_task_stack(k))
>     68			return __to_kthread(vfork);
>     69		return NULL;
>     70	}
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion




--===============1041447377740887534==--

