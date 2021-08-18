Content-Type: multipart/mixed; boundary="===============2273740789617159538=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Wed, 18 Aug 2021 10:30:04 +0800
Message-ID: <20210818023004.GA17956@shbuild999.sh.intel.com>
In-Reply-To: <20210817164737.GA23342@blackbody.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2273740789617159538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Tue, Aug 17, 2021 at 06:47:37PM +0200, Michal Koutn?? wrote:
> On Tue, Aug 17, 2021 at 10:45:00AM +0800, Feng Tang <feng.tang@intel.co=
m> wrote:
> > Initially from the perf-c2c data, the in-cacheline hotspots are only
> > 0x0, and 0x10, and if we extends to 2 cachelines, there is one more
> > offset 0x54 (css.flags), but still I can't figure out which member
> > inside the 128 bytes range is written frequenty.
> =

> Is it certain that perf-c2c reported offsets are the cacheline of the
> first bytes of struct cgroup_subsys_state? (Yeah, it looks to me so,
> given what code accesses those and your padding fixing it. I'm just
> raising it in case there was anything non-obvious.)

Thanks for checking.

Yes, they are. 'struct cgroup_subsys_state' is the first member of
'mem_cgoup' whose address are alwasy cacheline aligned (debug info
shows it's even 2KB or 4KB aligned)

> > =

> > /* pah info for cgroup_subsys_state */
> > struct cgroup_subsys_state {
> > 	struct cgroup *            cgroup;               /*     0     8 */
> > 	struct cgroup_subsys *     ss;                   /*     8     8 */
> > 	struct percpu_ref          refcnt;               /*    16    16 */
> > 	struct list_head           sibling;              /*    32    16 */
> > 	struct list_head           children;             /*    48    16 */
> > 	/* --- cacheline 1 boundary (64 bytes) --- */
> > 	struct list_head           rstat_css_node;       /*    64    16 */
> > 	int                        id;                   /*    80     4 */
> > 	unsigned int               flags;                /*    84     4 */
> > 	u64                        serial_nr;            /*    88     8 */
> > 	atomic_t                   online_cnt;           /*    96     4 */
> > =

> > 	/* XXX 4 bytes hole, try to pack */
> > =

> > 	struct work_struct         destroy_work;         /*   104    32 */
> > 	/* --- cacheline 2 boundary (128 bytes) was 8 bytes ago --- */
> > =

> > Since the test run implies this is cacheline related, and I'm not very
> > familiar with the mem_cgroup code, the original perf-c2c log is attached
> > which may give more hints.
> =

> As noted by Johannes, even in atomic mode, the refcnt would have the
> atomic part elsewhere. The other members shouldn't be written frequently
> unless there are some intense modifications of the cgroup tree in
> parallel.
> Does the benchmark create lots of memory cgroups in such a fashion?

As Shakeel also mentioned, this 0day's vm-scalability doesn't involve
any explicit mem_cgroup configurations. And it's running on a simplified
debian 10 rootfs which has some systemd boottime cgroup setup.

Thanks,
Feng

> Regards,
> Michal
--===============2273740789617159538==--

