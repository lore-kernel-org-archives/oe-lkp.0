Content-Type: multipart/mixed; boundary="===============6065145826865298030=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [page cache] eb797a8ee0: vm-scalability.throughput -16.5% regression
Date: Tue, 26 Feb 2019 09:30:30 -0800
Message-ID: <CAHk-=whn+F+vFgCR0a04atTQuBmXhq0oU1Y1f0YqMiUFHj28JQ@mail.gmail.com>
In-Reply-To: <875zt7t14h.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6065145826865298030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2019 at 12:17 AM Huang, Ying <ying.huang@intel.com> wrote:
>
> As for fixing.  Should we care about the cache line alignment of struct
> inode?  Or its size is considered more important because there may be a
> huge number of struct inode in the system?

Thanks for the great analysis.

I suspect we _would_ like to make sure inodes are as small as
possible, since they are everywhere. Also, they are usually embedded
in other structures (ie "struct inode" is embedded into "struct
ext4_inode_info"), and unless we force alignment (and thus possibly
lots of padding), the actual alignment of 'struct inode' will vary
depending on filesystem.

So I would suggest we *not* do cacheline alignment, because it will
result in random padding.

But it sounds like maybe the solution is to make sure that the
different fields of the inode can and should be packed differently?

So one thing to look at is to see what fields in 'struct inode' might
be best moved together, to minimize cache accesses.

And in particular, if this is *only* an issue of "struct
rw_semaphore", maybe we should look at the layout of *that*. In
particular, I'm getting the feeling that we should put the "owner"
field right next to the "count" field, because the normal
non-contended path only touches those two fields.

Right now those two fields are pretty far from each other in 'struct
rw_semaphore', which then makes the "oops they got allocated in
different cachelines" much more likely.

So even if 'struct inode' layout itself isn't changed, maybe just
optimizing the layout of 'struct rw_semaphore' a bit for the common
case might fix it all up.

Waiman, I didn't check if your rewrite already possibly fixes this?

                   Linus

--===============6065145826865298030==--

