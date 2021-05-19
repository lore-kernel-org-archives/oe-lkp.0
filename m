Content-Type: multipart/mixed; boundary="===============4775134119472410958=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [i915] b12d691ea5: kernel_BUG_at_mm/memory.c
Date: Wed, 19 May 2021 15:33:30 +0200
Message-ID: <20210519133330.GA14452@lst.de>
In-Reply-To: <CAHk-=whcr5M=4Mz2ydu4XtxTL_34WkXPnmFmA4f8r+ELXDC6hg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4775134119472410958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 04:58:31PM -1000, Linus Torvalds wrote:
> On Tue, May 18, 2021 at 4:26 PM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> > commit: b12d691ea5e01db42ccf3b4207e57cb3ce7cfe91 ("i915: fix remap_io_s=
g to verify the pgprot")
> > [...]
> > [  778.550996] kernel BUG at mm/memory.c:2183!
> > [  778.559015] RIP: 0010:remap_pfn_range_notrack (kbuild/src/consumer/m=
m/memory.c:2183 kbuild/src/consumer/mm/memory.c:2211 kbuild/src/consumer/mm=
/memory.c:2233 kbuild/src/consumer/mm/memory.c:2255 kbuild/src/consumer/mm/=
memory.c:2311)
> > [  778.688951] remap_pfn_range (kbuild/src/consumer/mm/memory.c:2342)
> > [  778.692700] remap_io_sg (kbuild/src/consumer/drivers/gpu/drm/i915/i9=
15_mm.c:71) i915
> =

> Yeah, so that BUG_ON() checks that theer isn't any old mapping there.
> =

> You can't just remap over an old one, but it does seem like that is
> exactly what commit b12d691ea5e0 ("i915: fix remap_io_sg to verify the
> pgprot") ends up doing.
> =

> So the code used to just do "apply_to_page_range()", which admittedly
> was odd too. But it didn't mind having old mappings and re-applying
> something over them.
> =

> Converting it to use remap_pfn_range() does look better, but it kind
> of depends on it ever being done *once*. But the caller seems to very
> much remap the whole vmsa at fault time, so...
> =

> I don't know what the right thing to do here is, because I don't know
> the invalidation logic and when faults happen.
> =

> I see that there is another thread about different issues on the
> intel-gfx list. Adding a few people to this kernel test robot thread
> too.
> =

> I'd be inclined to revert the commits as "not ready yet", but it would
> be better if somebody can go "yeah, this should be done properly like
> X".

I think reverting just this commit for now is the best thing.
--===============4775134119472410958==--

