Content-Type: multipart/mixed; boundary="===============5475523400033609344=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 2f4305b19f: will-it-scale.per_thread_ops 23.3% improvement
Date: Mon, 29 Nov 2021 17:34:46 +0000
Message-ID: <6DA84620-E4D4-437A-A278-F733F0DE0DCC@vmware.com>
In-Reply-To: <20211129035943.GA7092@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5475523400033609344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Nov 28, 2021, at 7:59 PM, Carel Si <beibei.si@intel.com> wrote:
> =

> Hi Amit,
> =

> On Thu, Nov 25, 2021 at 01:02:22PM +0800, Carel Si wrote:
>> Hi Amit,
>> =

>> On Sun, Nov 07, 2021 at 09:47:46PM +0000, Nadav Amit wrote:
>>> =

>>> =

>>>> On Nov 7, 2021, at 6:28 AM, kernel test robot <oliver.sang@intel.com=
> wrote:
>>>> =

>>>> =

>>>> =

>>>> Greeting,
>>>> =

>>>> FYI, we noticed a 23.3% improvement of will-it-scale.per_thread_ops du=
e to commit:
>>>> =

>>>> =

>>>> commit: 2f4305b19fe6a2a261d76c21856c5598f7d878fe ("x86/mm/tlb: Privati=
ze cpu_tlbstate")
>>>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t.kernel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&amp;data=
=3D04%7C01%7Cnamit%40vmware.com%7C66184fcf4416445a679e08d9b2ece09d%7Cb39138=
ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637737552747072350%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000&amp;sdata=3D%2BtZiyqsG85NSpyBLjIEoJQqv%2Fsqvw4oEOi1hZfMI7kw%3D&amp;rese=
rved=3D0 master
>>>> =

>>>>                          will-it-scale.per_thread_ops                 =
        =

>>>> =

>>>> 4000 +----------------------------------------------------------------=
----+   =

>>>>      |                                                                =
    |   =

>>>> 3500 |-O   O   O O O O O O O O O O O O OO O O O O O O O O O O O O O O =
O O |   =

>>>> 3000 |-+                            .+.  .+.                          =
    |   =

>>>>      |.+.+.+.+.+.+   +.+.+.+.+.+.+.+   ++   +.+.+.+.+.+.+.+.+.+.+.+   =
    |   =

>>>> 2500 |-+         :   :                                                =
    |   =

>>>>      |           :   :                                                =
    |   =

>>>> 2000 |-+          : :                                                 =
    |   =

>>>>      |            : :                                                 =
    |   =

>>>> 1500 |-+          : :                                                 =
    |   =

>>>> 1000 |-+          : :                                                 =
    |   =

>>>>      |            : :                                                 =
    |   =

>>>>  500 |-+           :                                                  =
    |   =

>>>>      |             :                                                  =
    |   =

>>>>    0 +----------------------------------------------------------------=
----+   =

>>> =

>>> Am I to understand that the following commit somehow reverted the perfo=
rmance
>>> improvement of this patch? The graph shows it as a =E2=80=9Cspike=E2=80=
=9D, no?
> =

> After more tests, we think this performance improvement was not reverted =
in its
> following commit, the improvement was partly reverted (from +23% improvem=
ent to
> +4.3% improvement) in 2ad32cf09b ("ceph: fix memory leak on decode error =
in =

> ceph_handle_caps"), which was merged in v5.15-rc1. Thanks.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>  gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-2020060=
3.cgz/lkp-hsw-4ex1/tlb_flush3/will-it-scale/0x16
> =

> commit: =

>  4ce94eabac ("x86/mm/tlb: Flush remote and local TLBs concurrently")
>  2f4305b19f ("x86/mm/tlb: Privatize cpu_tlbstate")                   =

>  v5.13-rc1
>  v5.14       >>> 2ad32cf09b's parent
>  2ad32cf09b ("ceph: fix memory leak on decode error in ceph_handle_caps")
> =

> 4ce94eabac16b1d2 2f4305b19fe6a2a261d76c21856                   v5.13-rc1 =
                      v5.14 2ad32cf09bd28a21e6ad1595355 =

> ---------------- --------------------------- --------------------------- =
--------------------------- --------------------------- =

>         %stddev     %change         %stddev     %change         %stddev  =
   %change         %stddev     %change         %stddev
>             \          |                \          |                \    =
      |                \          |                \  =

>      2793           +23.4%       3448           +21.6%       3398        =
   +20.5%       3366            +4.3%       2913        will-it-scale.per_t=
hread_ops

Looking at the ceph patch you mentioned, this does not make any sense.

Can you ensure there is no source of non-determinism in your tests (e.g.,
affinity, KASLR)? I am sure you are fully aware of that.

Otherwise, can you send the rest of the counters? It is hard to make any
sense out of this info.
--===============5475523400033609344==--

