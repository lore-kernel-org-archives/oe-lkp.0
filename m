Content-Type: multipart/mixed; boundary="===============3032679588965893164=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] b72fd1470c9: -41.7% perf-profile.cpu-cycles.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.pagecache_get_page
Date: Thu, 31 Jul 2014 09:48:32 +0100
Message-ID: <20140731084832.GP10819@suse.de>
In-Reply-To: <20140731055035.GB19742@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3032679588965893164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 01:50:35PM +0800, Aaron Lu wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit b72fd1470c9735f53485d089aa918dc327a86077 ("mm: rearrange zone fiel=
ds into read-only, page alloc, statistics and page reclaim lines")
> =

> test case: lkp-st02/dd-write/5m-11HDD-JBOD-cfq-xfs-10dd
> =

> e28c951ff01a805  b72fd1470c9735f53485d089a  =

> ---------------  -------------------------  =

>       1.06 ~ 6%     -41.7%       0.62 ~ 3%  TOTAL perf-profile.cpu-cycles=
.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__page_c=
ache_alloc.pagecache_get_page
>       1.34 ~ 2%     -19.8%       1.07 ~ 2%  TOTAL perf-profile.cpu-cycles=
.__block_write_begin.xfs_vm_write_begin.generic_perform_write.xfs_file_buff=
ered_aio_write.xfs_file_write_iter
>       1.19 ~ 5%     -12.1%       1.05 ~ 4%  TOTAL perf-profile.cpu-cycles=
.copy_from_user_atomic_iovec.iov_iter_copy_from_user_atomic.generic_perform=
_write.xfs_file_buffered_aio_write.xfs_file_write_iter
>       2.78 ~ 1%     -16.3%       2.32 ~ 4%  TOTAL perf-profile.cpu-cycles=
.__clear_user.read_zero.read_zero.vfs_read.sys_read
>   2.96e+09 ~ 4%      -5.2%  2.806e+09 ~ 0%  TOTAL perf-stat.cache-misses
>   3.86e+12 ~ 5%      -5.2%  3.658e+12 ~ 1%  TOTAL perf-stat.ref-cycles
> =

> Legend:
> 	~XX%    - stddev percent
> 	[+-]XX% - change percent
> =


I'm not exactly sure what I'm reading here. I think it is reporting on cpu
cycles and cache misses used in various kernel functions. It's not clear wh=
at
the units are but it looks like percentages of overall cycles spent in the
reported functions. That may or may not be good depending on whether there
is a higher cost elsewhere pushing the percentages down but that detail
is not in the report. It looks like this is reporting that fewer clock
cycles are being spent and incurring fewer cache misses. What is the proble=
m?

-- =

Mel Gorman
SUSE Labs

--===============3032679588965893164==--

