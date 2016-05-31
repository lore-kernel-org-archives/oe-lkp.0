Content-Type: multipart/mixed; boundary="===============7163420815936906033=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, oom_adj] 9954f89181: INFO: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected ]
Date: Tue, 31 May 2016 09:55:45 +0200
Message-ID: <20160531075545.GF26128@dhcp22.suse.cz>
In-Reply-To: <574c9c97.F/FfSVgxrdCJGrju%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7163420815936906033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 31-05-16 04:03:35, kernel test robot wrote:
> =

> =

> FYI, we noticed the following commit:
> =

> https://github.com/0day-ci/linux Michal-Hocko/Handle-oom-bypass-more-grac=
efully/20160530-210927
> commit 9954f891814d3f23e10036d2b6404cc80aaa461b ("mm, oom_adj: make sure =
processes sharing mm have same view of oom_score_adj")

JFTR this patch the underlying code has changed and sighand lock has
been removed. See the current state in
attempts/process-share-mm-oom-sanitization branch at
git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git

> (md-udevd)/256 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
> (md-udevd)/256 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
>  ( (&(&p->alloc_lock)->rlock&(&p->alloc_lock)->rlock){+.+...}){+.+...}, a=
t: , at: [<ffffffff811d1008>] find_lock_task_mm+0x98/0x1b0
> [<ffffffff811d1008>] find_lock_task_mm+0x98/0x1b0
-- =

Michal Hocko
SUSE Labs

--===============7163420815936906033==--

