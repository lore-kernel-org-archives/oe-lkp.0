Content-Type: multipart/mixed; boundary="===============7269392767237530234=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm/vmalloc] 5c1f4e690e: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Tue, 13 Jul 2021 22:54:47 +0100
Message-ID: <20210713215447.GA3741@suse.de>
In-Reply-To: <CAHk-=wiDif7SvA5DOWj9ssDuYHC4ujUFPd7ad-ydhY-WMLb-kQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7269392767237530234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 11:19:29AM -0700, Linus Torvalds wrote:
> On Tue, Jul 13, 2021 at 7:06 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> > [  131.014885] BUG: sleeping function called from invalid context at mm=
/page_alloc.c:4992
> =

> Strange. The call chain doesn't actually seem to be anything off: it's
> writev -> sock_write_iter -> sock_sendmsg -> netlink_sendmsg ->
> vmalloc.
> =

> All good to sleep as far as I can tell. The warning itself seems to be ju=
st
> =

>         might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
> =

> in prepare_alloc_pages().
> =

> I don't see what's wrong with that commit, but it does seem to be very
> consistent, in that the parent doesn't have it:
> =


It's almost certainly going to be fixed by
https://lore.kernel.org/r/20210713152100.10381-2-mgorman(a)techsingularity.=
net
whenever it hits your tree as part of this series
https://lore.kernel.org/lkml/20210713152100.10381-1-mgorman(a)techsingulari=
ty.net/.
It should make its way through Andrew's tree before RC2 but if he is busy
I'll create a git pull request.

> which means that the might_sleep_if() happens _after_
> __alloc_pages_bulk() has disabled interrupts. That would explain it,
> but the stack_depot_save() thing actually makes that call chain really
> hard to read because it duplicates the addresses on the stack.
> =

> I don't see the nesting there, but that's what it kind of smells like to =
me.
> =

> Anybody?
> =


The problem is that PAGE_OWNER can recurse allocate from bulk allocation
context to store the caller stack. When I wrote the patch, I missed that
prep_new_page can allocate if PAGE_OWNER is active. The most relevant
part of the trace is

[  131.092667]  stack_depot_save+0x390/0x4c0

-- =

Mel Gorman
SUSE Labs
--===============7269392767237530234==--

