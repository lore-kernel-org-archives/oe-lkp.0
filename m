Content-Type: multipart/mixed; boundary="===============3066256225811690519=="
MIME-Version: 1.0
From: ying.huang@intel.com
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Thu, 12 May 2022 11:17:04 +0800
Message-ID: <dfc98503b11e2e54a5a82c21b8ef6afa10eda9b7.camel@intel.com>
In-Reply-To: <YnuYV3J2ljY88DyQ@ziqianlu-desk1>
List-Id: <oe-lkp.lists.linux.dev>

--===============3066256225811690519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-05-11 at 19:04 +0800, Aaron Lu wrote:
> On Wed, May 11, 2022 at 09:58:23AM +0800, ying.huang(a)intel.com wrote:
> > On Tue, 2022-05-10 at 11:05 -0700, Linus Torvalds wrote:
> > > [ Adding locking people in case they have any input ]
> > > =

> > > On Mon, May 9, 2022 at 11:23 PM ying.huang(a)intel.com
> > > <ying.huang@intel.com> wrote:
> > > > =

> > > > > =

> > > > > Can you point me to the regression report? I would like to take a=
 look,
> > > > > thanks.
> > > > =

> > > > https://lore.kernel.org/all/1425108604.10337.84.camel(a)linux.intel=
.com/
> > > =

> > > Hmm.
> > > =

> > > That explanation looks believable, except that our qspinlocks
> > > shouldn't be spinning on the lock itself, but spinning on the mcs node
> > > it inserts into the lock.
> > =

> > The referenced regression report is very old (in Feb 2015 for 3.16-
> > 3.17).  The ticket spinlock was still used at that time.  I believe that
> > things become much better after we used qspinlock.  We can test that.
> =

> 'will-it-scale/page_fault1 process mode' can greatly stress both zone
> lock and LRU lock when nr_process =3D nr_cpu with thp disabled. So I run
> it to see if it still makes a difference with qspinlock.
> https://github.com/antonblanchard/will-it-scale/blob/master/tests/page_fa=
ult1.c
> =

> The result on an Icelake 2 sockets server with a total of 48cores/96cpus:
> =

> tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/thp_enabled=
/cpufreq_governor/ucode:
> =C2=A0=C2=A0lkp-icl-2sp4/will-it-scale/debian-10.4-x86_64-20200603.cgz/x8=
6_64-rhel-8.3/gcc-11/100%/process/page_fault1/never/performance/0xd000331
> =

> commit:
> =C2=A0=C2=A0v5.18-rc4
> =C2=A0=C2=A0731a704c0d8760cfd641af4bf57167d8c68f9b99
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v5.18-rc4 731a704c0d8760cfd641a=
f4bf57
> ---------------- ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0%stddev     %change=
         %stddev
> 	     \          |                \
> =C2=A0=C2=A012323894           -26.0%    9125299        will-it-scale.128=
.processes
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A022.33 =C2=B1  4%     -22.3        0.00     =
   perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_s=
pin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.tlb_flush_mmu
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A09.80            -9.2        0.57 =C2=
=B1  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.=
_raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__pagevec_lru_add.folio_ad=
d_lru
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A036.25            +6.7       42.94        pe=
rf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_l=
ock.rmqueue_bulk.rmqueue.get_page_from_freelist
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04.28 =C2=B1 10%     +34.6       38.93=
        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._=
raw_spin_lock.free_pcppages_bulk.free_unref_page_list.release_pages
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A075.05            +7.8       82.83        pe=
rf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
> =

> commit 731a704c0d8760cfd641af4bf57 moves zone's lock back to above
> free_area by reverting commit a368ab67aa55("mm: move zone lock to a
> different cache line than order-0 free page lists") on top of v5.18-rc4.
> =

> The interpretation of the above result is: after the revert, performance
> dropped 26%, zone lock increased 41% from 40% to 81%, the overall lock
> contention increased 7.8% from 75% to 82.83%. So it appears it still
> makes a difference with qspinlock.

The performance impact is larger than what I have thought before.  The
test may be too stressing to be realistic?  Can you run the test with
less process number to check?

Best Regards,
Huang, Ying


--===============3066256225811690519==--

