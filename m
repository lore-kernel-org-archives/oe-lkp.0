Content-Type: multipart/mixed; boundary="===============7886070001320831818=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: 9ff4452912 ("mm/mremap: use pmd_addr_end to calculate next in .."): [ 70.987730] BUG: Bad rss-counter state mm:01f5c40b type:MM_SHMEMPAGES val:15
Date: Fri, 31 Jan 2020 17:21:40 -0800
Message-ID: <20200131172140.150c045553bbcab839038d3e@linux-foundation.org>
In-Reply-To: <20200131130707.GG12867@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7886070001320831818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 31 Jan 2020 21:07:07 +0800 kernel test robot <lkp@intel.com> wrot=
e:

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 9ff4452912d63fe076ed01324bc651d51d807d5c
> Author:     Wei Yang <richardw.yang@linux.intel.com>
> AuthorDate: Fri Jan 24 16:17:30 2020 +1100
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Fri Jan 24 16:17:30 2020 +1100
> =

>     mm/mremap: use pmd_addr_end to calculate next in move_page_tables()

Thanks.  I dropped that one on Jan 26.
--===============7886070001320831818==--

