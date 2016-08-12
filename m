Content-Type: multipart/mixed; boundary="===============6851779110876836676=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 14:16:22 +1000
Message-ID: <20160812041622.GR19025@dastard>
In-Reply-To: <CA+55aFyhrDXK00mkAdLiXZVy-8=2U2WtRMwPYFF8z-JDwzuodQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6851779110876836676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 08:20:53PM -0700, Linus Torvalds wrote:
> On Thu, Aug 11, 2016 at 7:52 PM, Christoph Hellwig <hch@lst.de> wrote:
> >
> > I can look at that, but indeed optimizing this patch seems a bit
> > stupid.
> =

> The "write less than a full block to the end of the file" is actually
> a reasonably common case.
> =

> It may not make for a great filesystem benchmark, but it also isn't
> actually insane. People who do logging in user space do this all the
> time, for example. And it is *not* stupid in that context. Not at all.
> =

> It's never going to be the *main* thing you do (unless you're AIM),
> but I do think it's worth fixing.
> =

> And AIM7 remains one of those odd benchmarks that people use. I'm not
> quite sure why, but I really do think that the normal "append smaller
> chunks to the end of the file" should absolutely not be dismissed as
> stupid.

Yes, I agree that there are reasons for making sub-block IO work
well (which is why I'm looking to try to fix it), but that does't
mean the benchmark is sane. aim7 is, technically, a "scalability
benchmark". As such, expecting tiny writes to scale to moving large
amounts of data is the "stupid" thing it does. If you scale up the
amount of data you need to move, tehn you ned to scale up the
efficiency of moving that data. Case in point - writing 1GB of data
in 1kb chunks to XFs on a local /dev/pmem1 runs at ~600MB/s, whilst
moving it it in 1MB chunks runs at 1.9GB/s. aim7 doesn't actually
stress the scalability of the hardware, because inefficiencies in
it's implementation prevent it from getting to those limits.

That's what aim7 misses - as speeds and capabilities go up, the way
code needs to be written to make efficient use of the hardware also
changes. e.g. High throughput logging solutions don't write every
incoming log event immediately - they aggregate them into larger
buffers and then write those, knowing that they can support much
higher logging rates by doing this....

That's why running aim7 as your "does the filesystem scale"
benchmark is somewhat irrelevant to scaling applications on high
performance systems these days - users with fast storage will be
expecting to see that 1.9GB/s throughput from their app, not
600MB/s....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============6851779110876836676==--

