Content-Type: multipart/mixed; boundary="===============1702844505987508839=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm/pat] 8d04a5f97a: phoronix-test-suite.glmark2.0.score -23.7% regression
Date: Sun, 01 Dec 2019 11:46:24 +0100
Message-ID: <20191201104624.GA51279@gmail.com>
In-Reply-To: <CAHk-=wh--xwpatv_Rcp3WtCPQtg-RVoXYQj8O+1TSw8os7Jtvw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1702844505987508839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, Nov 30, 2019 at 2:09 PM Mariusz Ceier <mceier@gmail.com> wrote:
> >
> > Contents of /sys/kernel/debug/x86/pat_memtype_list on master
> > (32ef9553635ab1236c33951a8bd9b5af1c3b1646) where performance is
> > degraded:
> =

> Diff between good and bad case:
> =

>     @@ -1,8 +1,8 @@
>      PAT memtype list:
>      write-back @ 0x55ba4000-0x55ba5000
>      write-back @ 0x5e88c000-0x5e8b5000
>     -write-back @ 0x5e8b4000-0x5e8b8000
>      write-back @ 0x5e8b4000-0x5e8b5000
>     +write-back @ 0x5e8b4000-0x5e8b8000
>      write-back @ 0x5e8b7000-0x5e8bb000
>      write-back @ 0x5e8ba000-0x5e8bc000
>      write-back @ 0x5e8bb000-0x5e8be000
>     @@ -21,15 +21,15 @@
>      uncached-minus @ 0xec260000-0xec264000
>      uncached-minus @ 0xec300000-0xec320000
>      uncached-minus @ 0xec326000-0xec327000
>     -uncached-minus @ 0xf0000000-0xf0001000
>      uncached-minus @ 0xf0000000-0xf8000000
>     +uncached-minus @ 0xf0000000-0xf0001000
>      uncached-minus @ 0xfdc43000-0xfdc44000
>      uncached-minus @ 0xfe000000-0xfe001000
>      uncached-minus @ 0xfed00000-0xfed01000
>      uncached-minus @ 0xfed10000-0xfed16000
>      uncached-minus @ 0xfed90000-0xfed91000
>     -write-combining @ 0x2000000000-0x2100000000
>     -write-combining @ 0x2000000000-0x2100000000
>     +uncached-minus @ 0x2000000000-0x2100000000
>     +uncached-minus @ 0x2000000000-0x2100000000
>      uncached-minus @ 0x2100000000-0x2100001000
>      uncached-minus @ 0x2100001000-0x2100002000
>      uncached-minus @ 0x2ffff10000-0x2ffff20000
> =

> the first two differences are just trivial ordering differences for
> overlapping ranges (starting at 0x5e8b4000 and 0xf0000000)
> respectively.
> =

> But the final difference is a real difference where it used to be WC,
> and is now UC-:
> =

>     -write-combining @ 0x2000000000-0x2100000000
>     -write-combining @ 0x2000000000-0x2100000000
>     +uncached-minus @ 0x2000000000-0x2100000000
>     +uncached-minus @ 0x2000000000-0x2100000000
> =

> which certainly could easily explain the huge performance degradation.

Indeed, as two days ago I speculated to Kenneth R. Crudup who reported a =

similar slowdown on i915:

> * Ingo Molnar <mingo@kernel.org> wrote:
> > > * Kenneth R. Crudup <kenny@panix.com> wrote:
> > >
> > > > As soon as the i915 driver module is loaded, it takes over the =

> > > > EFI framebuffer on my machine (HP Spectre X360 with Intel UHD620 =

> > > > Graphics) and the subsequent text (as well as any VTs) is =

> > > > rendered much more slowly. I don't know if the i915/DRM guys need =

> > > > to do anything to their code to take advantage of this change to =

> > > > the PATs, but reverting this change (after the associated =

> > > > subseqent commits) has fixed that issue for me.
> > > >
> > > > Let me know if you need any further info.
> > >
> > > This is almost certainly the PAT bits being wrong in the =

> > > pagetables, i.e. an x86 bug, not a GPU driver bug.
> > >
> > >
> > > Davidlohr, any idea what's going on? The interval tree conversion went
> > > bad. The slowdown symptoms are consistent with perhaps the framebuffer
> > > not getting WC mapped, but uncacheable mapped:
> > >
> > >                ptr =3D io_mapping_map_wc(&i915_vm_to_ggtt(vma->vm)->i=
omap,
> > >                                         vma->node.start,
> > >                                         vma->node.size);
> > > =

> > > Which is a wrapper around ioremap_wc().
> > > =

> > > To debug this it would be useful to do a before/after comparison of t=
he
> > > kernel pagetables:
> > > =

> > >  - before: git checkout 8d04a5f97a^1
> > >  - after:  git checkout 8d04a5f97a

And yesterday:

> [...]
>
> There's another similar bugreport of a -20% GL performance drop, from =

> the ktest automated benchmark suite:
>
>     https://lkml.kernel.org/r/20191127005312.GD20422(a)shao2-debian
>
> My shot-in-the-dark hypothesis is that perhaps we somehow fail to find =

> a newly mapped memtype and leave a key ioremap_wc() area uncached, =

> instead of write-combining?
>
> The order of magnitude of the slowdown would be roughly consistent with =

> that, in GPU limited workloads - it would be more marked in 3D scenes =

> with a lot of vertices or perhaps a lot of texture changes.
>
> But this is really just a random guess.

It's not an unconditional regression, as both Boris and me tried to =

reproduce it on different systems that do ioremap_wc() as well and didn't =

measure a slowdown, but something about the memory layout probably =

triggers the tree management bug.

Thanks,

	Ingo
--===============1702844505987508839==--

