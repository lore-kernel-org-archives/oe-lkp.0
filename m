Content-Type: multipart/mixed; boundary="===============8239315329083792931=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Tue, 10 May 2022 11:05:01 -0700
Message-ID: <CAHk-=wjguW5nxjagV99GHvc_-E_7mSg+LMvGtFjJ9LUSx4Skig@mail.gmail.com>
In-Reply-To: <37dac785a08e3a341bf05d9ee35f19718ce83d26.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8239315329083792931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Adding locking people in case they have any input ]

On Mon, May 9, 2022 at 11:23 PM ying.huang(a)intel.com
<ying.huang@intel.com> wrote:
>
> >
> > Can you point me to the regression report? I would like to take a look,
> > thanks.
>
> https://lore.kernel.org/all/1425108604.10337.84.camel(a)linux.intel.com/

Hmm.

That explanation looks believable, except that our qspinlocks
shouldn't be spinning on the lock itself, but spinning on the mcs node
it inserts into the lock.

Or so I believed before I looked closer at the code again (it's been years).

It turns out we spin on the lock itself if we're the "head waiter". So
somebody is always spinning.

That's a bit unfortunate for this workload, I guess.

I think from a pure lock standpoint, it's the right thing to do (no
unnecessary bouncing, with the lock releaser doing just one write, and
the head waiter spinning on it is doing the right thing).

But I think this is an example of where you end up having that
spinning on the lock possibly then being a disturbance on the other
fields around the lock.

I wonder if Waiman / PeterZ / Will have any comments on that. Maybe
that "spin on the lock itself" is just fundamentally the only correct
thing, but since my initial reaction was "no, we're spinning on the
mcs node", maybe that would be _possible_?

We do have a lot of those spinlocks embedded in other data structures
cases. And if "somebody else is waiting for the lock" contends badly
with "the lock holder is doing a lot of writes close to the lock",
then that's not great.

                  Linus
--===============8239315329083792931==--

