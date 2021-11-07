Content-Type: multipart/mixed; boundary="===============8108455400074691137=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 2f4305b19f: will-it-scale.per_thread_ops 23.3% improvement
Date: Sun, 07 Nov 2021 21:47:46 +0000
Message-ID: <7030ECD9-B2A8-4483-AEC1-549C14D5558B@vmware.com>
In-Reply-To: <20211107142859.GB13541@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8108455400074691137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Nov 7, 2021, at 6:28 AM, kernel test robot <oliver.sang@intel.com> w=
rote:
> =

> =

> =

> Greeting,
> =

> FYI, we noticed a 23.3% improvement of will-it-scale.per_thread_ops due t=
o commit:
> =

> =

> commit: 2f4305b19fe6a2a261d76c21856c5598f7d878fe ("x86/mm/tlb: Privatize =
cpu_tlbstate")
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&amp;data=3D0=
4%7C01%7Cnamit%40vmware.com%7Cfb2bd9a47e794ec3898508d9a1faf794%7Cb39138ca3c=
ee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637718921590793957%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Dcw6sFeT6qAQSSaG7nCIWm19Yi9RPZqyr2bQPwSBuzzs%3D&amp;reserved=3D0=
 master
> =

>                           will-it-scale.per_thread_ops                   =
      =

> =

>  4000 +------------------------------------------------------------------=
--+   =

>       |                                                                  =
  |   =

>  3500 |-O   O   O O O O O O O O O O O O OO O O O O O O O O O O O O O O O =
O |   =

>  3000 |-+                            .+.  .+.                            =
  |   =

>       |.+.+.+.+.+.+   +.+.+.+.+.+.+.+   ++   +.+.+.+.+.+.+.+.+.+.+.+     =
  |   =

>  2500 |-+         :   :                                                  =
  |   =

>       |           :   :                                                  =
  |   =

>  2000 |-+          : :                                                   =
  |   =

>       |            : :                                                   =
  |   =

>  1500 |-+          : :                                                   =
  |   =

>  1000 |-+          : :                                                   =
  |   =

>       |            : :                                                   =
  |   =

>   500 |-+           :                                                    =
  |   =

>       |             :                                                    =
  |   =

>     0 +------------------------------------------------------------------=
--+   =


Am I to understand that the following commit somehow reverted the performan=
ce
improvement of this patch? The graph shows it as a =E2=80=9Cspike=E2=80=9D,=
 no?



--===============8108455400074691137==--

