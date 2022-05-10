Content-Type: multipart/mixed; boundary="===============2361756866978011718=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 23e12fc477: UBSAN:shift-out-of-bounds_in_mm/page_isolation.c
Date: Tue, 10 May 2022 14:19:04 -0700
Message-ID: <20220510141904.242d9301d109d413ea10e978@linux-foundation.org>
In-Reply-To: <20220510095824.GB3969@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2361756866978011718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 10 May 2022 17:58:24 +0800 kernel test robot <oliver.sang@intel.c=
om> wrote:

> commit: 23e12fc477f1c2729af51c427087e777d6e63803 ("mm: make alloc_contig_=
range work at pageblock granularity")
> https://github.com/hnaz/linux-mm master

That tree is no longer being updated.  Please switch to

	git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

Either the mm-unstable branch (hotfixes and MM) or the mm-everything
branch (mm-unstable plus non-MM patches).

mm-unstable includes
https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patche=
s/mm-make-alloc_contig_range-work-at-pageblock-granularity-fix.patch,
which quite possibly fixes the issue you have detected.

Thanks.
--===============2361756866978011718==--

