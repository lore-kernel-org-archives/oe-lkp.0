Content-Type: multipart/mixed; boundary="===============4581281860872541688=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [hugetlbfs] a4a118f2ee: will-it-scale.per_thread_ops -14.9% regression
Date: Sat, 04 Dec 2021 07:40:51 +0000
Message-ID: <0E0E1D43-4C8F-4581-B156-AEB4A1754A72@vmware.com>
In-Reply-To: <20211203020952.GB5881@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4581281860872541688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On Dec 2, 2021, at 6:09 PM, kernel test robot <oliver.sang@intel.com> w=
rote:
> =

> =

> =

> Greeting,
> =

> FYI, we noticed a -14.9% regression of will-it-scale.per_thread_ops due t=
o commit:
> =

> =

> commit: a4a118f2eead1d6c49e00765de89878288d4b890 ("hugetlbfs: flush TLBs =
correctly after huge_pmd_unshare=E2=80=9D)

This could have been expected.

To have a better solution (batching), we need a different way to
determine whether PMDs are shared, instead of the page-count of
the PMD.


--===============4581281860872541688==--

