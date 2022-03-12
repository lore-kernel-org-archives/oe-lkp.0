Content-Type: multipart/mixed; boundary="===============2167200404852377739=="
MIME-Version: 1.0
From: Mike Rapoport <rppt@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm/slub] ae107fa919: BUG:unable_to_handle_page_fault_for_address
Date: Sat, 12 Mar 2022 14:06:20 +0200
Message-ID: <YiyMvBouXGLk/xWP@kernel.org>
In-Reply-To: <Yix+Pn9a9yKIiXC4@ip-172-31-19-208.ap-northeast-1.compute.internal>
List-Id: <oe-lkp.lists.linux.dev>

--===============2167200404852377739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 12, 2022 at 11:04:30AM +0000, Hyeonggon Yoo wrote:
> On Sat, Mar 12, 2022 at 10:21:25AM +0100, Vlastimil Babka wrote:
> > On 3/12/22 02:10, Hyeonggon Yoo wrote:
> > > On Fri, Mar 11, 2022 at 04:46:00PM +0000, Hyeonggon Yoo wrote:
> > >> On Fri, Mar 11, 2022 at 04:36:47PM +0100, Vlastimil Babka wrote:
> > >>> On 3/11/22 15:54, Hyeonggon Yoo wrote:
> > >>>> On Wed, Mar 09, 2022 at 10:15:31AM +0800, kernel test robot wrote:
> > >>>>>
> > >>>>>
> > >>>>> Greeting,
> > >>>>>
> > >>>>> FYI, we noticed the following commit (built with gcc-9):
> > >>>>>
> > >>>>> commit: ae107fa91914f098cd54ab77e68f83dd6259e901 ("mm/slub: use s=
tackdepot to save stack trace in objects")
> > >>>>> https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slu=
b-stackdepot-v3r0
> > >>>>>
> > >>>>> in testcase: boot
> > >>>>>
> > >>>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge =
-smp 2 -m 16G
> > >>>>>
> > >>>>> caused below changes (please refer to attached dmesg/kmsg for ent=
ire log/backtrace):
> > >>>>>
> > >>>>
> > >>>> [+Cc Vlastimil and linux-mm]
> > >>>
> > >>> Thanks.
> > >>> lkp folks: it would be nice if I was CC'd automatically on this, it=
's a
> > >>> commit from my git tree and with by s-o-b :)
> > >>>
> > >>>> I _strongly_ suspect that this is because we don't initialize
> > >>>> stack_table[i] =3D NULL when we allocate it from memblock_alloc().
> > >>>
> > >>> No, Mike (CC'd) suggested to drop the array init cycle, because
> > >>> memblock_alloc would zero the area anyway.
> > >>
> > >> Ah, you are right. My mistake.
> > >>
> > >>> There has to be a different
> > >>> reason. Wondering if dmesg contains the stack depot initialization =
message
> > >>> at all...
> > >>
> > >> I think I found the reason.
> > >> This is because of CONFIG_SLUB_DEBUG_ON.
> > >> It can enable debugging without passing boot parameter.
> > >>
> > >> if CONFIG_SLUB_DEBUG_ON=3Dy && slub_debug is not passed, we do not c=
all
> > >> stack_depot_want_early_init(), but the debugging flags are set.
> > >>
> > >> And we only call stack_depot_init() later in kmem_cache_create_userc=
opy().
> > >>
> > >> so it crashed while creating boot cache.
> > > =

> > > I tested this, and this was the reason.
> > > It crashed on CONFIG_SLUB_DEBUG_ON=3Dy because stackdepot always assu=
me
> > > that it was initialized in boot step, or failed
> > > (stack_depot_disable=3Dtrue).
> > > =

> > > But as it didn't even tried to initialize it, stack_table =3D=3D NULL=
 &&
> > > stack_depot_disable =3D=3D false. So accessing *(NULL + <hash value>)
> > =

> > Thanks for finding the cause!
> > =

> =

> ;)
> =

> > > Ideas? implementing something like kmem_cache_init_early() again?
> > =

> > I think we could simply make CONFIG_SLUB_DEBUG_ON select/depend on
> > STACKDEPOT_ALWAYS_INIT?
> =

> Oh, sounds better.
> =

> If we make CONFIG_SLUB_DEBUG_ON select STACK_DEPOT_ALWAYS_INIT,
> that is simple solution. but stackdepot will be initialized on
> slub_debug=3D- too.
>
> But I think no one will set CONFIG_SLUB_DEBUG_ON=3Dy if not debugging...

If memory wasted by stack_table is a real concern, we may free it after
parsing slub_debug or add a condition taking into account
CONFIG_SLUB_DEBUG_ON and slub_debug=3D- to the =


	if (slub_debug & SLAB_STORE_USER)
		stack_depot_want_early_init();

But I agree that if somebody runs a kernel with CONFIG_SLUB_DEBUG_ON=3Dy, t=
he
goal is to have slub debugging on, so making CONFIG_SLUB_DEBUG_ON select
STACK_DEPOT_ALWAYS_INIT totally makes sense to me.
 =

> I don't think making CONFIG_SLUB_DEBUG_ON depend on
> CONFIG_STACKDEPOT_ALWAYS_INIT is good solution. only KASAN selects it.
> =

> -- =

> Thank you, You are awesome!
> Hyeonggon :-)

-- =

Sincerely yours,
Mike.
--===============2167200404852377739==--

