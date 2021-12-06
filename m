Content-Type: multipart/mixed; boundary="===============4084246625458214545=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 2f4305b19f: will-it-scale.per_thread_ops 23.3% improvement
Date: Mon, 06 Dec 2021 21:45:13 +0800
Message-ID: <20211206134511.GA32727@linux.intel.com>
In-Reply-To: <6DA84620-E4D4-437A-A278-F733F0DE0DCC@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4084246625458214545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Amit,

On Mon, Nov 29, 2021 at 05:34:46PM +0000, Nadav Amit wrote:
> =

> =

> > On Nov 28, 2021, at 7:59 PM, Carel Si <beibei.si@intel.com> wrote:
> > =

> > Hi Amit,
> > =

> > On Thu, Nov 25, 2021 at 01:02:22PM +0800, Carel Si wrote:
> >> Hi Amit,
> >> =

> >> On Sun, Nov 07, 2021 at 09:47:46PM +0000, Nadav Amit wrote:
> >>> =

> >>> =

> >>>> On Nov 7, 2021, at 6:28 AM, kernel test robot <oliver.sang@intel.c=
om> wrote:
> >>>> =

> >>>> =

> >>>> =

> >>>> Greeting,
> >>>> =

> >>>> FYI, we noticed a 23.3% improvement of will-it-scale.per_thread_ops =
due to commit:
> >>>> =

> >>>> =

> >>>> commit: 2f4305b19fe6a2a261d76c21856c5598f7d878fe ("x86/mm/tlb: Priva=
tize cpu_tlbstate")
> >>>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
git.kernel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&amp;dat=
a=3D04%7C01%7Cnamit%40vmware.com%7C66184fcf4416445a679e08d9b2ece09d%7Cb3913=
8ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637737552747072350%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000&amp;sdata=3D%2BtZiyqsG85NSpyBLjIEoJQqv%2Fsqvw4oEOi1hZfMI7kw%3D&amp;res=
erved=3D0 master
> >>>> =

> >>>>                          will-it-scale.per_thread_ops               =
          =

> >>>> =

> >>>> 4000 +--------------------------------------------------------------=
------+   =

> >>>>      |                                                              =
      |   =

> >>>> 3500 |-O   O   O O O O O O O O O O O O OO O O O O O O O O O O O O O =
O O O |   =

> >>>> 3000 |-+                            .+.  .+.                        =
      |   =

> >>>>      |.+.+.+.+.+.+   +.+.+.+.+.+.+.+   ++   +.+.+.+.+.+.+.+.+.+.+.+ =
      |   =

> >>>> 2500 |-+         :   :                                              =
      |   =

> >>>>      |           :   :                                              =
      |   =

> >>>> 2000 |-+          : :                                               =
      |   =

> >>>>      |            : :                                               =
      |   =

> >>>> 1500 |-+          : :                                               =
      |   =

> >>>> 1000 |-+          : :                                               =
      |   =

> >>>>      |            : :                                               =
      |   =

> >>>>  500 |-+           :                                                =
      |   =

> >>>>      |             :                                                =
      |   =

> >>>>    0 +--------------------------------------------------------------=
------+   =

> >>> =

> >>> Am I to understand that the following commit somehow reverted the per=
formance
> >>> improvement of this patch? The graph shows it as a =E2=80=9Cspike=E2=
=80=9D, no?
> > =

> > After more tests, we think this performance improvement was not reverte=
d in its
> > following commit, the improvement was partly reverted (from +23% improv=
ement to
> > +4.3% improvement) in 2ad32cf09b ("ceph: fix memory leak on decode erro=
r in =

> > ceph_handle_caps"), which was merged in v5.15-rc1. Thanks.
> > =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/t=
estcase/ucode:
> >  gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-20200=
603.cgz/lkp-hsw-4ex1/tlb_flush3/will-it-scale/0x16
> > =

> > commit: =

> >  4ce94eabac ("x86/mm/tlb: Flush remote and local TLBs concurrently")
> >  2f4305b19f ("x86/mm/tlb: Privatize cpu_tlbstate")                   =

> >  v5.13-rc1
> >  v5.14       >>> 2ad32cf09b's parent
> >  2ad32cf09b ("ceph: fix memory leak on decode error in ceph_handle_caps=
")
> > =

> > 4ce94eabac16b1d2 2f4305b19fe6a2a261d76c21856                   v5.13-rc=
1                       v5.14 2ad32cf09bd28a21e6ad1595355 =

> > ---------------- --------------------------- --------------------------=
- --------------------------- --------------------------- =

> >         %stddev     %change         %stddev     %change         %stddev=
     %change         %stddev     %change         %stddev
> >             \          |                \          |                \  =
        |                \          |                \  =

> >      2793           +23.4%       3448           +21.6%       3398      =
     +20.5%       3366            +4.3%       2913        will-it-scale.per=
_thread_ops
> =

> Looking at the ceph patch you mentioned, this does not make any sense.
> =

> Can you ensure there is no source of non-determinism in your tests (e.g.,
> affinity, KASLR)? I am sure you are fully aware of that.
> =

> Otherwise, can you send the rest of the counters? It is hard to make any
> sense out of this info.

After retest, there's no significant difference between 2ad32cf09b ("ceph: =
fix =

memory leak on decode error in ceph_handle_caps") and it's parent v5.14, so=
rry =

we missed the config difference, we will pay more attention in the future, =

thanks for your reminder.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-20200603=
.cgz/lkp-hsw-4ex1/tlb_flush3/will-it-scale/0x16

commit: =

  v5.14
  2ad32cf09b ("ceph: fix memory leak on decode error in ceph_handle_caps")

           v5.14 2ad32cf09bd28a21e6ad1595355 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2922            +0.3%       2932        will-it-scale.per_thread_ops



And for your previous question:


                          will-it-scale.per_thread_ops                     =
    =

 =

 4000 +--------------------------------------------------------------------=
+   =

      |                                                                    =
|   =

 3500 |-O   O   O O O O O O O O O O O O OO O O O O O O O O O O O O O O O O =
|   =

 3000 |-+                            .+.  .+.                              =
|   =

      |.+.+.+.+.+.+   +.+.+.+.+.+.+.+   ++   +.+.+.+.+.+.+.+.+.+.+.+       =
|   =

 2500 |-+         :   :                                                    =
|   =

      |           :   :                                                    =
|   =

 2000 |-+          : :                                                     =
|   =

      |            : :                                                     =
|   =

 1500 |-+          : :                                                     =
|   =

 1000 |-+          : :                                                     =
|   =

      |            : :                                                     =
|   =

  500 |-+           :                                                      =
|   =

      |             :                                                      =
|   =

    0 +--------------------------------------------------------------------=
+   =

 =

 "Am I to understand that the following commit somehow reverted the perform=
ance
 improvement of this patch? The graph shows it as a =E2=80=9Cspike=E2=80=9D=
, no?"


Sorry about the confusion, but it's not a "spike" in above graph, based on =
our =

previous test, the test results are stable and reproducible, thus the =

performance improvement is credible.

Thanks again for your attention. If there's any other misleading graph or d=
ata, =

pls feel free to point out.
=20
--===============4084246625458214545==--

