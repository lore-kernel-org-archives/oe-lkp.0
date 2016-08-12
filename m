Content-Type: multipart/mixed; boundary="===============3363389603746454871=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 13:56:45 +1000
Message-ID: <20160812035645.GQ19025@dastard>
In-Reply-To: <CA+55aFxx5sU=y1ec4NjTqH61qwKVWd4oRu1tMZovQRKENBBsmA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3363389603746454871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 07:27:52PM -0700, Linus Torvalds wrote:
> On Thu, Aug 11, 2016 at 5:54 PM, Dave Chinner <david@fromorbit.com> wro=
te:
> >
> > So, removing mark_page_accessed() made the spinlock contention
> > *worse*.
> >
> >   36.51%  [kernel]  [k] _raw_spin_unlock_irqrestore
> >    6.27%  [kernel]  [k] copy_user_generic_string
> >    3.73%  [kernel]  [k] _raw_spin_unlock_irq
> >    3.55%  [kernel]  [k] get_page_from_freelist
> >    1.97%  [kernel]  [k] do_raw_spin_lock
> >    1.72%  [kernel]  [k] __block_commit_write.isra.30
> =

> I don't recall having ever seen the mapping tree_lock as a contention
> point before, but it's not like I've tried that load either. So it
> might be a regression (going back long, I suspect), or just an unusual
> load that nobody has traditionally tested much.
> =

> Single-threaded big file write one page at a time, was it?

Yup. On a 4 node NUMA system.

So when memory reclaim kicks in, there's a write process, a
writeback kworker and 4 kswapd kthreads all banging on the
mapping->tree_lock. There's an awful lot of concurrency happening
behind the scenes of that single user process writing to a file...

> The mapping tree lock has been around forever (it used to be a rw-lock
> long long ago), but I wonder if we might have moved more stuff into it
> (memory accounting comes to mind) causing much worse contention or
> something.

Yeah, there is now a crapton of accounting updated in
account_page_dirtied under the tree lock - memcg, writeback, node,
zone, task, etc. And there's a *lot* of code that
__delete_from_page_cache() can execute under the tree lock.

> Hmm. Just for fun, I googled "tree_lock contention". It's shown up
> before - back in 2006, and it was you hitting it back then too.

Of course! That, however, would have been when I was playing with
real big SGI machines, not a tiddly little 16p VM.... :P

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============3363389603746454871==--

