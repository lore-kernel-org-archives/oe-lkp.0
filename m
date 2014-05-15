Content-Type: multipart/mixed; boundary="===============1371500387909024869=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [cgroup] a0f9ec1f181: -4.3% will-it-scale.per_thread_ops
Date: Thu, 15 May 2014 00:55:17 -0400
Message-ID: <20140515045517.GC3825@htj.dyndns.org>
In-Reply-To: <5374479F.3050507@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1371500387909024869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 15, 2014 at 12:50:39PM +0800, Jet Chen wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git review-kill-t=
ree_mutex
> commit a0f9ec1f181534694cb5bf40b7b56515b8cabef9 ("cgroup: use cgroup_kn_l=
ock_live() in other cgroup kernfs methods")
> =

> Test case : lkp-nex05/will-it-scale/writeseek
> =

> 2074b6e38668e62  a0f9ec1f181534694cb5bf40b
> ---------------  -------------------------
>    1027273 ~ 0%      -4.3%     982732 ~ 0%  TOTAL will-it-scale.per_threa=
d_ops
>        136 ~ 3%     -43.1%         77 ~43%  TOTAL proc-vmstat.nr_dirtied
>       0.51 ~ 3%     +98.0%       1.01 ~ 4%  TOTAL perf-profile.cpu-cycles=
.shmem_write_end.generic_perform_write.__generic_file_aio_write.generic_fil=
e_aio_write.do_sync_write
>       1078 ~ 9%     -16.3%        903 ~11%  TOTAL numa-meminfo.node0.Unev=
ictable
>        269 ~ 9%     -16.2%        225 ~11%  TOTAL numa-vmstat.node0.nr_un=
evictable
>       1.64 ~ 1%     -14.3%       1.41 ~ 4%  TOTAL perf-profile.cpu-cycles=
.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.generic_perform_write.=
__generic_file_aio_write
>       1.62 ~ 2%     +14.1%       1.84 ~ 1%  TOTAL perf-profile.cpu-cycles=
.lseek64

I have no idea how to read the above.  Which direction is plus and
which is minus?  Are they counting cpu cycles?  Which files is the
test seeking?

Thanks.

-- =

tejun

--===============1371500387909024869==--

