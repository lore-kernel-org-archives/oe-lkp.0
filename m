Content-Type: multipart/mixed; boundary="===============0982769892550671871=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 10 Aug 2016 17:23:59 -0700
Message-ID: <CA+55aFyQ6cjKOQZKEuQV9ch+aerW1Q6uGdv+pCS81rX0yjyR6w@mail.gmail.com>
In-Reply-To: <87a8gk17x7.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0982769892550671871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 5:11 PM, Huang, Ying <ying.huang@intel.com> wrote:
>
> Here is the comparison result with perf-profile data.

Heh. The diff is actually harder to read than just showing A/B
state.The fact that the call chain shows up as part of the symbol
makes it even more so.

For example:

>       0.00 =C2=B1 -1%      +Inf%       1.68 =C2=B1  1%  perf-profile.cycl=
es-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_get_page.g=
rab_cache_page_write_begin.iomap_write_begin
>       1.80 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_get_page.g=
rab_cache_page_write_begin.xfs_vm_write_begin

Ok, so it went from 1.8% to 1.68%, and isn't actually that big of a
change, but it shows up as a big change because the caller changed
from xfs_vm_write_begin to iomap_write_begin.

There's a few other cases of that too.

So I think it would actually be easier to just see "what 20 functions
were the hottest" (or maybe 50) before and after separately (just
sorted by cycles), without the diff part. Because the diff is really
hard to read.

                 Linus

--===============0982769892550671871==--

