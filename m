Content-Type: multipart/mixed; boundary="===============3508737236102299486=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/vmalloc] 5c1f4e690e: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Tue, 13 Jul 2021 11:19:29 -0700
Message-ID: <CAHk-=wiDif7SvA5DOWj9ssDuYHC4ujUFPd7ad-ydhY-WMLb-kQ@mail.gmail.com>
In-Reply-To: <20210713142414.GA28943@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3508737236102299486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 7:06 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
> [  131.014885] BUG: sleeping function called from invalid context at mm/p=
age_alloc.c:4992

Strange. The call chain doesn't actually seem to be anything off: it's
writev -> sock_write_iter -> sock_sendmsg -> netlink_sendmsg ->
vmalloc.

All good to sleep as far as I can tell. The warning itself seems to be just

        might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);

in prepare_alloc_pages().

I don't see what's wrong with that commit, but it does seem to be very
consistent, in that the parent doesn't have it:

 > +----------------------------------------------------------------------+=
------------+------------+
> |                                                                      | =
a2afc59fb2 | 5c1f4e690e |
> +----------------------------------------------------------------------+-=
-----------+------------+
> | BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c | =
0          | 54         |
> +----------------------------------------------------------------------+-=
-----------+------------+

Does anybody see what the problem is there?

There's an odd report _after_ the warning:

[  131.345319] raw_local_irq_restore() called with IRQs enabled
[  131.366561] RIP: 0010:warn_bogus_irq_restore+0x1d/0x20
[  131.433334]  __alloc_pages_bulk+0xbb8/0xf20

but I think that's might be a result of the BUG(). Maybe. But it might
also be indicative of some context confusion - do we end up nesting?
Because the BUG() has

[  131.036625] hardirqs last disabled at (283042):
[<ffffffff81656d71>] __alloc_pages_bulk+0xae1/0xf20

which means that the might_sleep_if() happens _after_
__alloc_pages_bulk() has disabled interrupts. That would explain it,
but the stack_depot_save() thing actually makes that call chain really
hard to read because it duplicates the addresses on the stack.

I don't see the nesting there, but that's what it kind of smells like to me.

Anybody?

               Linus
--===============3508737236102299486==--

