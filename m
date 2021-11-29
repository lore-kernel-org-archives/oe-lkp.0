Content-Type: multipart/mixed; boundary="===============8046721694151354381=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 2f4305b19f: will-it-scale.per_thread_ops 23.3% improvement
Date: Mon, 29 Nov 2021 11:59:45 +0800
Message-ID: <20211129035943.GA7092@linux.intel.com>
In-Reply-To: <20211125050221.GA26741@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8046721694151354381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Amit,

On Thu, Nov 25, 2021 at 01:02:22PM +0800, Carel Si wrote:
> Hi Amit,
> =

> On Sun, Nov 07, 2021 at 09:47:46PM +0000, Nadav Amit wrote:
> > =

> > =

> > > On Nov 7, 2021, at 6:28 AM, kernel test robot <oliver.sang@intel.co=
m> wrote:
> > > =

> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a 23.3% improvement of will-it-scale.per_thread_ops d=
ue to commit:
> > > =

> > > =

> > > commit: 2f4305b19fe6a2a261d76c21856c5598f7d878fe ("x86/mm/tlb: Privat=
ize cpu_tlbstate")
> > > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
it.kernel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&amp;data=
=3D04%7C01%7Cnamit%40vmware.com%7Cfb2bd9a47e794ec3898508d9a1faf794%7Cb39138=
ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637718921590793957%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3Dcw6sFeT6qAQSSaG7nCIWm19Yi9RPZqyr2bQPwSBuzzs%3D&amp;reserved=
=3D0 master
> > > =

> > >                           will-it-scale.per_thread_ops               =
          =

> > > =

> > >  4000 +--------------------------------------------------------------=
------+   =

> > >       |                                                              =
      |   =

> > >  3500 |-O   O   O O O O O O O O O O O O OO O O O O O O O O O O O O O =
O O O |   =

> > >  3000 |-+                            .+.  .+.                        =
      |   =

> > >       |.+.+.+.+.+.+   +.+.+.+.+.+.+.+   ++   +.+.+.+.+.+.+.+.+.+.+.+ =
      |   =

> > >  2500 |-+         :   :                                              =
      |   =

> > >       |           :   :                                              =
      |   =

> > >  2000 |-+          : :                                               =
      |   =

> > >       |            : :                                               =
      |   =

> > >  1500 |-+          : :                                               =
      |   =

> > >  1000 |-+          : :                                               =
      |   =

> > >       |            : :                                               =
      |   =

> > >   500 |-+           :                                                =
      |   =

> > >       |             :                                                =
      |   =

> > >     0 +--------------------------------------------------------------=
------+   =

> > =

> > Am I to understand that the following commit somehow reverted the perfo=
rmance
> > improvement of this patch? The graph shows it as a =E2=80=9Cspike=E2=80=
=9D, no?

After more tests, we think this performance improvement was not reverted in=
 its
following commit, the improvement was partly reverted (from +23% improvemen=
t to
+4.3% improvement) in 2ad32cf09b ("ceph: fix memory leak on decode error in =

ceph_handle_caps"), which was merged in v5.15-rc1. Thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-20200603=
.cgz/lkp-hsw-4ex1/tlb_flush3/will-it-scale/0x16

commit: =

  4ce94eabac ("x86/mm/tlb: Flush remote and local TLBs concurrently")
  2f4305b19f ("x86/mm/tlb: Privatize cpu_tlbstate")                   =

  v5.13-rc1
  v5.14       >>> 2ad32cf09b's parent
  2ad32cf09b ("ceph: fix memory leak on decode error in ceph_handle_caps")

4ce94eabac16b1d2 2f4305b19fe6a2a261d76c21856                   v5.13-rc1   =
                    v5.14 2ad32cf09bd28a21e6ad1595355 =

---------------- --------------------------- --------------------------- --=
------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev   =
  %change         %stddev     %change         %stddev
             \          |                \          |                \     =
     |                \          |                \  =

      2793           +23.4%       3448           +21.6%       3398         =
  +20.5%       3366            +4.3%       2913        will-it-scale.per_th=
read_ops

> =

> The performance improvement is exists in 635de956a7 ("Merge tag =

> 'x86-mm-2021-04-29' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/=
tip"),
> in which the fbc has been merged, and v5.13-rc1, in which the fbc has bee=
n =

> merged in mainline, and v5.14.
> =

> We found the improvement has reverted between v5.15-rc5 and v5.14, has tr=
iggered
> bisection for it. Thanks.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-202006=
03.cgz/lkp-hsw-4ex1/tlb_flush3/will-it-scale/0x16
> =

> commit: =

>   4ce94eabac ("x86/mm/tlb: Flush remote and local TLBs concurrently") >> =
parent
>   2f4305b19f ("x86/mm/tlb: Privatize cpu_tlbstate")                   >> =
fbc
>   635de956a7                                          >> fbc merged
>   v5.13-rc1                                           >> fbc merged to ma=
inline
>   v5.14
>   v5.15-rc5
> =

> 4ce94eabac16b1d2 2f4305b19fe6a2a261d76c21856 635de956a7f5a6ffcb04f29d706 =
                  v5.13-rc1                       v5.14                   v=
5.15-rc5 =

> ---------------- --------------------------- --------------------------- =
--------------------------- --------------------------- -------------------=
-------- =

>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev     %change         %stddev     %change        =
 %stddev
>              \          |                \          |                \   =
       |                \          |                \          |           =
     \  =

>       2796           +23.3%       3448           +21.0%       3382       =
    +21.4%       3393           +20.4%       3366           +10.0%       30=
75 =C2=B1  9%  will-it-scale.per_thread_ops
> =

> =

> *   635de956a7f5a6 Merge tag 'x86-mm-2021-04-29' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tip/tip
> |\  =

> | *   a500fc918f7b8d Merge branch 'locking/core' into x86/mm, to resolve =
conflict
> | |\  =

> | * | d43f17a1da2537 smp: Micro-optimize smp_call_function_many_cond()
> | * | a5aa5ce3005972 smp: Inline on_each_cpu_cond() and on_each_cpu()
> | * | 1608e4cf31b88c x86/mm/tlb: Remove unnecessary uses of the inline ke=
yword
> | * | 291c4011dd7ac0 cpumask: Mark functions as pure
> | * | 09c5272e48614a x86/mm/tlb: Do not make is_lazy dirty for no reason
> | * | 2f4305b19fe6a2 x86/mm/tlb: Privatize cpu_tlbstate                  =
>>> fbc
> | * | 4ce94eabac16b1 x86/mm/tlb: Flush remote and local TLBs concurrently
> =

> > =

> > =

> > _______________________________________________
> > LKP mailing list -- lkp(a)lists.01.org
> > To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============8046721694151354381==--

