Content-Type: multipart/mixed; boundary="===============0509868657115363459=="
MIME-Version: 1.0
From: Alex Shi <alex.shi@linaro.org>
To: lkp@lists.01.org
Subject: Re: [x86/tlb] ff9b625d26: stderr.Run:"Process_Creation":Fork_failed_at_iteration in unixbench test
Date: Fri, 18 Mar 2016 22:27:52 +0800
Message-ID: <56EC1068.6020405@linaro.org>
In-Reply-To: <20160317060037.GD1670@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0509868657115363459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi Xiaolong,

I tried this benchmark on my native haswell box, but it works. and get
unstable/better performance value.
This patch may be has some problem when it run in guest OS.
Did you run the case on a guest OS or a native OS?

Any other benchmark did you test on any other machine? If so, what's the
result you get?

Regards
Alex

On 03/17/2016 02:00 PM, kernel test robot wrote:
> FYI, we noticed stderr.Run:"Process_Creation":Fork_failed_at_iteration in=
 unixbench test on
> =

> https://github.com/alexshi/power-scheduling.git x86-tlb
> commit ff9b625d26ba7750745d235dc6f1792fb36fea48 ("x86/tlb: just do tlb fl=
ush on one of siblings of SMT")
> =

> 2016-03-17 06:04:39 ./Run spawn -c 1
> =

>    #    #  #    #  #  #    #          #####   ######  #    #   ####   #  =
  #
>    #    #  ##   #  #   #  #           #    #  #       ##   #  #    #  #  =
  #
>    #    #  # #  #  #    ##            #####   #####   # #  #  #       ###=
###
>    #    #  #  # #  #    ##            #    #  #       #  # #  #       #  =
  #
>    #    #  #   ##  #   #  #           #    #  #       #   ##  #    #  #  =
  #
>     ####   #    #  #  #    #          #####   ######  #    #   ####   #  =
  #
> =

>    Version 5.1.3                      Based on the Byte Magazine Unix Ben=
chmark
> =

>    Multi-CPU version                  Version 5 revisions by Ian Smith,
>                                       Sunnyvale, CA, USA
>    January 13, 2011                   johantheghost at yahoo period com
> =

> =

> 1 x Process Creation  1
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-=
d02/spawn/unixbench
> =

> commit: =

>   v4.5
>   ff9b625d26ba7750745d235dc6f1792fb36fea48
> =

>             v4.5 ff9b625d26ba7750745d235dc6 =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4          100%           4:4     last_state.failed
>            :4          100%           4:4     last_state.is_incomplete_run
>            :4          100%           4:4     last_state.unixbench.exit_c=
ode.1
>            :4          100%           4:4     stderr.********************=
**************************
>            :4           50%           2:4     stderr.Reason:Success;abort=
ing
>            :4          100%           4:4     stderr.Run:"Process_Creatio=
n":Fork_failed_at_iteration
>            :4           50%           2:4     stderr.Segmentation_fault;a=
borting
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-=
d04/spawn/unixbench
> =

> commit: =

>   v4.5
>   ff9b625d26ba7750745d235dc6f1792fb36fea48
> =

>             v4.5 ff9b625d26ba7750745d235dc6 =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :8          100%           8:8     last_state.failed
>            :8          100%           8:8     last_state.is_incomplete_run
>            :8          100%           8:8     last_state.unixbench.exit_c=
ode.1
>            :8          100%           8:8     stderr.********************=
**************************
>            :8           12%           1:8     stderr.Aborted;aborting
>            :8           62%           5:8     stderr.Reason:Success;abort=
ing
>            :8           75%           6:8     stderr.Run:"Process_Creatio=
n":Fork_failed_at_iteration
>            :8           12%           1:8     stderr.Run:"Process_Creatio=
n":Segmentation_fault;aborting
>            :8           12%           1:8     stderr.Run:"Process_Creatio=
n":spawn:../nptl/sysdeps/unix/sysv/linux/x86_64/../fork.c:#:__libc_fork:Ass=
ertion`({__typeof(({struct_pthread*__self;asm("mov%%fs:%c1,%#":"=3Dr"(__sel=
f):"i"(__builtin_offsetof(struct_pthread,header.self)));__self;})->tid)__va=
lue;if(sizeof(__value)=3D=3D#)asm_volatile("movb%%fs:%P2,%b0":"=3Dq"(__valu=
e):"#"(#),"i"(__builtin_offsetof(struct_pthread,tid)));else_if(sizeof(__val=
ue)=3D=3D#)asm_volatile("movl%%fs:%P1,%#":"=3Dr"(__value):"i"(__builtin_off=
setof(struct_pthread,tid)));else{if(sizeof(__value)!=3D#)abort();asm_volati=
le("movq%%fs:%P1,%q0":"=3Dr"(__value):"i"(__builtin_offsetof(struct_pthread=
,tid)));}__value;})=3D=3Dppid'failed
>            :8           12%           1:8     stderr.Segmentation_fault;a=
borting
> =

> lkp-ivb-d02: Ivy Bridge
> Memory: 8G
> =

> lkp-ivb-d04: Ivy Bridge
> Memory: 4G
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Xiaolong Ye
>=20

--===============0509868657115363459==--

