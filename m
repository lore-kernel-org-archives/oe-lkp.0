Content-Type: multipart/mixed; boundary="===============3227209264619576417=="
MIME-Version: 1.0
From: ying.huang@intel.com
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Wed, 11 May 2022 09:58:23 +0800
Message-ID: <41c08a5371957acac5310a2e608b2e42bd231558.camel@intel.com>
In-Reply-To: <CAHk-=wjguW5nxjagV99GHvc_-E_7mSg+LMvGtFjJ9LUSx4Skig@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3227209264619576417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-05-10 at 11:05 -0700, Linus Torvalds wrote:
> [ Adding locking people in case they have any input ]
> =

> On Mon, May 9, 2022 at 11:23 PM ying.huang(a)intel.com
> <ying.huang@intel.com> wrote:
> > =

> > > =

> > > Can you point me to the regression report? I would like to take a loo=
k,
> > > thanks.
> > =

> > https://lore.kernel.org/all/1425108604.10337.84.camel(a)linux.intel.com/
> =

> Hmm.
> =

> That explanation looks believable, except that our qspinlocks
> shouldn't be spinning on the lock itself, but spinning on the mcs node
> it inserts into the lock.

The referenced regression report is very old (in Feb 2015 for 3.16-
3.17).  The ticket spinlock was still used at that time.  I believe that
things become much better after we used qspinlock.  We can test that.

Best Regards,
Huang, Ying

--===============3227209264619576417==--

