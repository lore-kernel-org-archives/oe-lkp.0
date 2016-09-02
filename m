Content-Type: multipart/mixed; boundary="===============5005089855034165199=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [writeback] 8bc4ad9498: INFO: suspicious RCU usage. ]
Date: Fri, 02 Sep 2016 10:00:56 -0700
Message-ID: <20160902170056.GN16261@linux.vnet.ibm.com>
In-Reply-To: <1a774b3f-9fdc-b620-9a35-d3e7ff18177a@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5005089855034165199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2016 at 09:49:25AM -0600, Jens Axboe wrote:
> On 09/02/2016 09:36 AM, Paul E. McKenney wrote:
> >On Fri, Sep 02, 2016 at 10:56:22AM -0400, Tejun Heo wrote:
> >>(cc'ing Paul, hi!)
> >>
> >>Hello,
> >>
> >>On Thu, Sep 01, 2016 at 02:13:34PM -0600, Jens Axboe wrote:
> >>>On 09/01/2016 04:21 AM, kernel test robot wrote:
> >>>>[    7.323356] cdrom: Uniform CD-ROM driver Revision: 3.20
> >>>>[    7.334239]
> >>>>[    7.337256] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>[    7.340532] [ INFO: suspicious RCU usage. ]
> >>>>[    7.342419] 4.8.0-rc4-00008-g8bc4ad9 #1 Not tainted
> >>>>[    7.347065] -------------------------------
> >>>>[    7.350132] include/linux/cgroup.h:435 suspicious rcu_dereference_=
check() usage!
> >
> >Lockdep does not believe that any locks are held, correct?
> =

> Which is correct, the queue lock has been dropped at this point.

Note that lockdep believes that the rcu_read_lock() has also been
dropped, otherwise it would have listed it.

> >>>>[    7.410074] Call Trace:
> >>>>[    7.411328]  [<ffffffff8178ed3b>] dump_stack+0x82/0xb8
> >>>>[    7.413982]  [<ffffffff81123472>] lockdep_rcu_suspicious+0xf7/0x100
> >>>>[    7.415828]  [<ffffffff817873f4>] bio_blkcg+0x89/0x93
> >>>>[    7.417336]  [<ffffffff817891f0>] check_blkcg_changed+0x58/0x1b8
> >>>>[    7.428722]  [<ffffffff81789b90>] cfq_set_request+0xd1/0x2a3
> >>>>[    7.439690]  [<ffffffff81763fe3>] elv_set_request+0x1f/0x24
> >>>>[    7.442157]  [<ffffffff8176856d>] get_request+0x38f/0x77f
> >>>>[    7.447449]  [<ffffffff817689c2>] blk_get_request+0x65/0xa8
> >>>>[    7.449868]  [<ffffffff81c692df>] ide_cd_queue_pc+0x76/0x19d
> >>>>[    7.453757]  [<ffffffff81c695ee>] cdrom_check_status+0x51/0x53
> >>>>[    7.455372]  [<ffffffff81c6a27e>] ide_cdrom_check_events_real+0x20=
/0x3f
> >>>>[    7.457294]  [<ffffffff82579f94>] cdrom_update_events+0x18/0x21
> >>>>[    7.458987]  [<ffffffff82579faf>] cdrom_check_events+0x12/0x1f
> >>>>[    7.460713]  [<ffffffff81c68317>] idecd_check_events+0x1c/0x1e
> >>>>[    7.462393]  [<ffffffff81778d12>] disk_check_events+0x47/0x103
> >>>>[    7.464129]  [<ffffffff81778dea>] disk_events_workfn+0x1c/0x1e
> >>>>[    7.465844]  [<ffffffff810fcafa>] process_one_work+0x272/0x4ee
> >>>>[    7.467462]  [<ffffffff810fd247>] worker_thread+0x1eb/0x2c9
> >>
> >>The warning is from
> >>
> >>#define task_css_set_check(task, __c)					\
> >>	rcu_dereference_check((task)->cgroups,				\
> >>		lockdep_is_held(&cgroup_mutex) ||			\
> >>		lockdep_is_held(&css_set_lock) ||			\
> >>		((task)->flags & PF_EXITING) || (__c))
> >>
> >>which is used by bio_blkcg() which is called by the following code in
> >>check_blkcg_changed().
> >>
> >>	rcu_read_lock();
> >>	serial_nr =3D bio_blkcg(bio)->css.serial_nr;
> >>	rcu_read_unlock();
> >>
> >>So, I have no idea.  It looks like rcu_dereference_check() is being
> >>called with rcu read locked but still triggering suspicious RCU usage
> >>warning.
> >
> >Perhaps there is an rcu_read_unlock() somewhere on the code path?
> >
> >>The code hasn't changed for quite a while now, so it's also really
> >>weird that it's triggering now.  Paul, does anything ring a bell?
> >
> >I have not see something like this recently.
> =

> The question is if it's really new, or just re-triggering because the
> writeback branch changes that function? It's further down though, so
> can't impact the RCU section. And the writeback changes don't have any
> RCU code in them...

At this point, I have to suggest "git bisect"...

							Thanx, Paul


--===============5005089855034165199==--

