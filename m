Content-Type: multipart/mixed; boundary="===============6230071117890711400=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 755d6edc1a: will-it-scale.per_process_ops -4.1% regression
Date: Tue, 06 Aug 2019 20:00:24 +0900
Message-ID: <20190806110024.GA32615@google.com>
In-Reply-To: <20190806080415.GG11812@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6230071117890711400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2019 at 10:04:15AM +0200, Michal Hocko wrote:
> On Tue 06-08-19 15:05:47, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed a -4.1% regression of will-it-scale.per_process_ops due=
 to commit:
> =

> I have to confess I cannot make much sense from numbers because they
> seem to be too volatile and the main contributor doesn't stand up for
> me. Anyway, regressions on microbenchmarks like this are not all that
> surprising when a locking is slightly changed and the critical section
> made shorter. I have seen that in the past already.

I guess if it's multi process workload. The patch will give more chance
to be scheduled out so TLB miss ratio would be bigger than old.
I see it's natural trade-off for latency vs. performance so only thing
I could think is just increase threshold from 32 to 64 or 128?

> =

> That being said I would still love to get to bottom of this bug rather
> than play with the lock duration by a magic. In other words
> http://lkml.kernel.org/r/20190730125751.GS9330(a)dhcp22.suse.cz

Yes, if we could remove mark_page_accessed there, it would be best.
I added a commen in the thread.

--===============6230071117890711400==--

