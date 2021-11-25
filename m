Content-Type: multipart/mixed; boundary="===============9138920132208475712=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 2f4305b19f: will-it-scale.per_thread_ops 23.3% improvement
Date: Thu, 25 Nov 2021 13:02:22 +0800
Message-ID: <20211125050221.GA26741@linux.intel.com>
In-Reply-To: <7030ECD9-B2A8-4483-AEC1-549C14D5558B@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9138920132208475712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Amit,

On Sun, Nov 07, 2021 at 09:47:46PM +0000, Nadav Amit wrote:
> =

> =

> > On Nov 7, 2021, at 6:28 AM, kernel test robot <oliver.sang@intel.com>=
 wrote:
> > =

> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a 23.3% improvement of will-it-scale.per_thread_ops due=
 to commit:
> > =

> > =

> > commit: 2f4305b19fe6a2a261d76c21856c5598f7d878fe ("x86/mm/tlb: Privatiz=
e cpu_tlbstate")
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.kernel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&amp;data=
=3D04%7C01%7Cnamit%40vmware.com%7Cfb2bd9a47e794ec3898508d9a1faf794%7Cb39138=
ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637718921590793957%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3Dcw6sFeT6qAQSSaG7nCIWm19Yi9RPZqyr2bQPwSBuzzs%3D&amp;reserved=
=3D0 master
> > =

> >                           will-it-scale.per_thread_ops                 =
        =

> > =

> >  4000 +----------------------------------------------------------------=
----+   =

> >       |                                                                =
    |   =

> >  3500 |-O   O   O O O O O O O O O O O O OO O O O O O O O O O O O O O O =
O O |   =

> >  3000 |-+                            .+.  .+.                          =
    |   =

> >       |.+.+.+.+.+.+   +.+.+.+.+.+.+.+   ++   +.+.+.+.+.+.+.+.+.+.+.+   =
    |   =

> >  2500 |-+         :   :                                                =
    |   =

> >       |           :   :                                                =
    |   =

> >  2000 |-+          : :                                                 =
    |   =

> >       |            : :                                                 =
    |   =

> >  1500 |-+          : :                                                 =
    |   =

> >  1000 |-+          : :                                                 =
    |   =

> >       |            : :                                                 =
    |   =

> >   500 |-+           :                                                  =
    |   =

> >       |             :                                                  =
    |   =

> >     0 +----------------------------------------------------------------=
----+   =

> =

> Am I to understand that the following commit somehow reverted the perform=
ance
> improvement of this patch? The graph shows it as a =E2=80=9Cspike=E2=80=
=9D, no?

The performance improvement is exists in 635de956a7 ("Merge tag =

'x86-mm-2021-04-29' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/ti=
p"),
in which the fbc has been merged, and v5.13-rc1, in which the fbc has been =

merged in mainline, and v5.14.

We found the improvement has reverted between v5.15-rc5 and v5.14, has trig=
gered
bisection for it. Thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-20200603=
.cgz/lkp-hsw-4ex1/tlb_flush3/will-it-scale/0x16

commit: =

  4ce94eabac ("x86/mm/tlb: Flush remote and local TLBs concurrently") >> pa=
rent
  2f4305b19f ("x86/mm/tlb: Privatize cpu_tlbstate")                   >> fbc
  635de956a7                                          >> fbc merged
  v5.13-rc1                                           >> fbc merged to main=
line
  v5.14
  v5.15-rc5

4ce94eabac16b1d2 2f4305b19fe6a2a261d76c21856 635de956a7f5a6ffcb04f29d706   =
                v5.13-rc1                       v5.14                   v5.=
15-rc5 =

---------------- --------------------------- --------------------------- --=
------------------------- --------------------------- ---------------------=
------ =

         %stddev     %change         %stddev     %change         %stddev   =
  %change         %stddev     %change         %stddev     %change         %=
stddev
             \          |                \          |                \     =
     |                \          |                \          |             =
   \  =

      2796           +23.3%       3448           +21.0%       3382         =
  +21.4%       3393           +20.4%       3366           +10.0%       3075=
 =C2=B1  9%  will-it-scale.per_thread_ops


*   635de956a7f5a6 Merge tag 'x86-mm-2021-04-29' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/tip/tip
|\  =

| *   a500fc918f7b8d Merge branch 'locking/core' into x86/mm, to resolve co=
nflict
| |\  =

| * | d43f17a1da2537 smp: Micro-optimize smp_call_function_many_cond()
| * | a5aa5ce3005972 smp: Inline on_each_cpu_cond() and on_each_cpu()
| * | 1608e4cf31b88c x86/mm/tlb: Remove unnecessary uses of the inline keyw=
ord
| * | 291c4011dd7ac0 cpumask: Mark functions as pure
| * | 09c5272e48614a x86/mm/tlb: Do not make is_lazy dirty for no reason
| * | 2f4305b19fe6a2 x86/mm/tlb: Privatize cpu_tlbstate                  >>=
> fbc
| * | 4ce94eabac16b1 x86/mm/tlb: Flush remote and local TLBs concurrently

> =

> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============9138920132208475712==--

