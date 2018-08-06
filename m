Content-Type: multipart/mixed; boundary="===============0203288994279682639=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, oom] c1e4c54f9c: BUG:KASAN:null-ptr-deref_in_d
Date: Mon, 06 Aug 2018 08:06:49 +0200
Message-ID: <20180806060649.GA19540@dhcp22.suse.cz>
In-Reply-To: <CAHCio2idn3oh55n7urkRPqkdyo+Y-0Qhg=Vc2VHXy2Wy2q1wiA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0203288994279682639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun 05-08-18 11:41:50, =E7=A6=B9=E8=88=9F=E9=94=AE wrote:
> Hi Michal and David,
> AFAICS, the null pointer is the task_struct of p in the dump_header.
> Why don't we just add a if before printing the victim task's
> informaiton.

See http://lkml.kernel.org/r/alpine.DEB.2.21.1807301854040.198273(a)chino.k=
ir.corp.google.com

> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -438,14 +438,6 @@ static void dump_header(struct oom_control *oc,
> struct task_struct *p)
> =

>         cpuset_print_current_mems_allowed();
>         mem_cgroup_print_oom_context(oc->memcg, p);
> -       pr_cont(",task=3D%s,pid=3D%d,uid=3D%d\n", p->comm, p->pid,
> -               from_kuid(&init_user_ns, task_uid(p)));
> +      if (p)
> +              pr_cont(",task=3D%s,pid=3D%d,uid=3D%d", p->comm, p->pid,
> +                      from_kuid(&init_user_ns, task_uid(p)));
> +     pr_cont("\n");
>         if (is_memcg_oom(oc))
>                 mem_cgroup_print_oom_meminfo(oc->memcg);
> =

> Thanks
> Zhoujian

-- =

Michal Hocko
SUSE Labs

--===============0203288994279682639==--

