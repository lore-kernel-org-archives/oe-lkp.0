Content-Type: multipart/mixed; boundary="===============5909814883409091456=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [page cache] eb797a8ee0: vm-scalability.throughput -16.5% regression
Date: Wed, 27 Feb 2019 17:32:57 -0800
Message-ID: <CAHk-=wiXgigVGwumT0y_N64LjCiB5tR0snjCAm3u4YyhDB+dwQ@mail.gmail.com>
In-Reply-To: <87imx4pv5q.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5909814883409091456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2019 at 5:19 PM Huang, Ying <ying.huang@intel.com> wrote:
>
> So I think in the heavily contended situation, we should put the fields
> accessed by rwsem holder in a different cache line of rwsem.  But in
> un-contended situation, we should put the fields accessed in rwsem
> holder and rwsem in the same cache line to reduce the cache footprint.
> The requirement of un-contended and heavily contended situation is
> contradicted.

Generally, we should strive to optimize for the uncontended state.

The performance profile of a contended state tends to be very
different, and the actual solution tends to be to try really hard to
just avoid contention to begin with.

I think we've gotten to the point where we have very few real loads
that show lock contention on a kernel level. And when people do find
loads that cause contention, we should try really hard to fix the
locking rather than try to then treat the symptom of contention.

So on the whole, aim to make the uncontended case go fast, at least to
a first approximation.

               Linus

--===============5909814883409091456==--

