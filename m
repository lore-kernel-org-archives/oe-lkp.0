Content-Type: multipart/mixed; boundary="===============2912812213856939424=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 08:51:30 -0700
Message-ID: <20210414155130.GU3762101@tassilo.jf.intel.com>
In-Reply-To: <CAOUHufafMcaG8sOS=1YMy2P_6p0R1FzP16bCwpUau7g1-PybBQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2912812213856939424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>    2) It will not scan PTE tables under non-leaf PMD entries that do not
>    =C2=A0 =C2=A0have the accessed bit set, when
>    =C2=A0 =C2=A0CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.

This assumes  that workloads have reasonable locality. Could there
be a worst case where only one or two pages in each PTE are used,
so this PTE skipping trick doesn't work?

-Andi
--===============2912812213856939424==--

