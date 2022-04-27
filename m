Content-Type: multipart/mixed; boundary="===============5751589358864596084=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] a8c49af3be: hackbench.throughput -13.7% regression
Date: Tue, 26 Apr 2022 22:02:28 -0700
Message-ID: <CALvZod4_vNWYxzGR3BksZYgoti-9hOioMGwF2UVRnwcAGpFqXA@mail.gmail.com>
In-Reply-To: <43598597-72e1-6750-9bee-031fd463fc3b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5751589358864596084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yin,

On Tue, Apr 26, 2022 at 7:53 PM Yin Fengwei <fengwei.yin@intel.com> wrote:
>
[...]
>
> If I comment out one line added by the commit <a8c49af3be> :
> static void memcg_account_kmem(struct mem_cgroup *memcg, int nr_pages)
> {
>         /* mod_memcg_state(memcg, MEMCG_KMEM, nr_pages); */  <--- comment=
 out this line.

Can you to comment out the following block instead of the above line
and see if there is any impact?

>         if (!cgroup_subsys_on_dfl(memory_cgrp_subsys)) {
>                 if (nr_pages > 0)
>                         page_counter_charge(&memcg->kmem, nr_pages);
>                 else
>                         page_counter_uncharge(&memcg->kmem, -nr_pages);
>         }
> }
>
--===============5751589358864596084==--

