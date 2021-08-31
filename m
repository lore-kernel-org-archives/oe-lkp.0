Content-Type: multipart/mixed; boundary="===============5618676307637950518=="
MIME-Version: 1.0
From: Michal Koutný <mkoutny@suse.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Tue, 31 Aug 2021 11:23:04 +0200
Message-ID: <20210831092304.GA17119@blackbody.suse.cz>
In-Reply-To: <20210831063036.GA46357@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5618676307637950518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 02:30:36PM +0800, Feng Tang <feng.tang@intel.com>=
 wrote:
> Yes, I tried many re-arrangement of the members of cgroup_subsys_state,
> and even close members of memcg, but there were no obvious changes.
> What can recover the regresion is adding 128 bytes padding in the css,
> no matter at the start, end or in the middle.

Do you mean the padding added outside the .cgroup--.refcnt members area
also restores the benchmark results? (Or you refer to paddings that move
.cgroup and .refcnt across a cacheline border ?) I'm asking to be sure
we have correct understanding of what members are contended (what's the
frequent writer).

Thanks,
Michal
--===============5618676307637950518==--

