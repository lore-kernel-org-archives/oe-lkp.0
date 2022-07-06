Content-Type: multipart/mixed; boundary="===============4014184981104226405=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 2bd8eec68f: BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c
Date: Wed, 06 Jul 2022 22:25:30 +0800
Message-ID: <YsWbWsN2qPbWsNWZ@xsang-OptiPlex-9020>
In-Reply-To: <20220706095535.GD27531@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4014184981104226405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Mel Gorman,

On Wed, Jul 06, 2022 at 10:55:35AM +0100, Mel Gorman wrote:
> On Tue, Jul 05, 2022 at 09:51:25PM +0800, Oliver Sang wrote:
> > Hi Andrew Morton,
> > =

> > On Sun, Jul 03, 2022 at 01:22:09PM -0700, Andrew Morton wrote:
> > > On Sun, 3 Jul 2022 17:44:30 +0800 kernel test robot <oliver.sang@in=
tel.com> wrote:
> > > =

> > > > FYI, we noticed the following commit (built with gcc-11):
> > > > =

> > > > commit: 2bd8eec68f740608db5ea58ecff06965228764cb ("[PATCH 7/7] mm/p=
age_alloc: Replace local_lock with normal spinlock")
> > > > url: https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Drai=
n-remote-per-cpu-directly/20220613-230139
> > > > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.g=
it b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
> > > > patch link: https://lore.kernel.org/lkml/20220613125622.18628-8-mgo=
rman(a)techsingularity.net
> > > > =

> > > =

> > > Did this test include the followup patch
> > > mm-page_alloc-replace-local_lock-with-normal-spinlock-fix.patch?
> > =

> > no, we just fetched original patch set and test upon it.
> > =

> > now we applied the patch you pointed to us upon 2bd8eec68f and found th=
e issue
> > still exist.
> > (attached dmesg FYI)
> > =

> =

> Thanks Oliver.
> =

> The trace is odd in that it hits in GUP when the page allocator is no
> longer active and the context is a syscall. First, is this definitely
> the first patch the problem occurs?
> =

> Second, it's possible for IRQs to be enabled and an IRQ delivered before
> preemption is enabled. It's not clear why that would be a problem other
> than lacking symmetry or how it could result in the reported BUG but
> might as well rule it out. This is build tested only

do you want us test below patch?
if so, should we apply it upon the patch
"mm/page_alloc: Replace local_lock with normal spinlock"
or
"mm/page_alloc: replace local_lock with normal spinlock -fix"?

> =

> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 934d1b5a5449..d0141e51e613 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -192,14 +192,14 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
>  =

>  #define pcpu_spin_unlock(member, ptr)					\
>  ({									\
> -	spin_unlock(&ptr->member);					\
>  	pcpu_task_unpin();						\
> +	spin_unlock(&ptr->member);					\
>  })
>  =

>  #define pcpu_spin_unlock_irqrestore(member, ptr, flags)			\
>  ({									\
> -	spin_unlock_irqrestore(&ptr->member, flags);			\
>  	pcpu_task_unpin();						\
> +	spin_unlock_irqrestore(&ptr->member, flags);			\
>  })
>  =

>  /* struct per_cpu_pages specific helpers. */
>  =

> =

>=20
--===============4014184981104226405==--

