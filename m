Content-Type: multipart/mixed; boundary="===============8504719638043023489=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 913ec479bb: vm-scalability.throughput 26.2% improvement
Date: Mon, 31 Aug 2020 14:11:26 +0800
Message-ID: <20200831061126.GC65971@shbuild999.sh.intel.com>
In-Reply-To: <f9664139-e28c-ba8e-b4e4-d505baf9069a@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8504719638043023489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2020 at 08:06:04PM +0200, Thomas Zimmermann wrote:
> > Hello Thomas,
> > =

> > Did drm changes really impact anon-cow-seq-hugetlb performance?
> >
> > My change c0d0381ade79 ("hugetlbfs: use i_mmap_rwsem for more pmd shari=
ng
> > synchronization") caused a -33.4% regression of anon-cow-seq-hugetlb.  A
> > recent change 34ae204f185 (hugetlbfs: remove call to huge_pte_alloc wit=
hout
> > i_mmap_rwsem) was tested by Zhengjun Xing and improved performance by 20
> > something percent.  That seems in line with this report/improvement.
> =

> Some of DRM's memory management might be affected by hugetable changes.
> While I cannot really point to a specific location, it's not impossible
> that there's a connection.
> =

> > =

> > Perhaps the tooling is not always accurate in determining the commit wh=
ich
> > causes the performance changes?
> > Perhaps I am misreading information in the reports?
> > =

> =

> From what I remember, some of these tests print to the console, which
> has always been slow, and has generally been a bad idea for performance
> tests. I guess these tests are not very accurate.

Yes, I also think that's the reason for this improvement. The test box is
using mgag200 driver, while the vm-scalability test case itself will print
many messages to the gfx console. If commit 913ec479bb "drm/mgag200: Replace
VRAM helpers with SHMEM helpers" improves the console handling, then it
will impact the final score of the test case.

Last time we met similar case that a console write slowdown triggers a
regression is discussed here:  =

https://lore.kernel.org/lkml/20190729095155.GP22106(a)shao2-debian/

Thanks,
Feng

> Best regards
> Thomas
--===============8504719638043023489==--

