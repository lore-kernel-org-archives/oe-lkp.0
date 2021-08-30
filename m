Content-Type: multipart/mixed; boundary="===============4857042518931183291=="
MIME-Version: 1.0
From: Michal Koutný <mkoutny@suse.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Mon, 30 Aug 2021 16:51:04 +0200
Message-ID: <YSzwWIeapkzNElwV@blackbook>
In-Reply-To: <20210818023004.GA17956@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4857042518931183291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Feng.

On Wed, Aug 18, 2021 at 10:30:04AM +0800, Feng Tang <feng.tang@intel.com>=
 wrote:
> As Shakeel also mentioned, this 0day's vm-scalability doesn't involve
> any explicit mem_cgroup configurations.

If it all happens inside root memcg, there should be no accesses to the
0x10 offset since the root memcg is excluded from refcounting. (Unless
the modified cacheline is a =CE=BCarch artifact. Actually, for the lack of
other ideas, I was thinking about similar cause even for non-root memcgs
since the percpu refcounting is implemented via a segment register.)

Is this still relevant? (You refer to it as 0day's vm-scalability
issue.)

By some rough estimates there could be ~10 cgroup_subsys_sets per 10 MiB
of workload, so the 128B padding gives 1e-4 relative overhead (but
presumably less in most cases). I also think it acceptable (size-wise).

Out of curiosity, have you measured impact of reshuffling the refcnt
member into the middle of the cgroup_subsys_state (keeping it distant
both from .cgroup and .parent)?

Thanks,
Michal
--===============4857042518931183291==--

