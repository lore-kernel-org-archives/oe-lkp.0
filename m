Content-Type: multipart/mixed; boundary="===============1480595682492085927=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Thu, 22 Jun 2017 17:16:23 +0200
Message-ID: <20170622151623.GB762@redhat.com>
In-Reply-To: <alpine.LSU.2.11.1706211725260.18020@eggly.anvils>
List-Id: <oe-lkp.lists.linux.dev>

--===============1480595682492085927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/21, Hugh Dickins wrote:
>
> On Wed, 21 Jun 2017, Linus Torvalds wrote:
> > On Wed, Jun 21, 2017 at 1:56 PM, Oleg Nesterov <oleg@redhat.com> wrot=
e:
> > >
> > > I understand. My point is that this check was invalidated by stack-gu=
ard-page
> > > a long ago, and this means that we add the user-visible change now.
> >
> > Yeah. I guess we could consider it an *old* regression that got fixed,
> > but if people started relying on the regression...
> >
> > >> Do you have a pointer to the report for this regression? I must have=
 missed it.
> > >
> > > See http://marc.info/?t=3D149794523000001&r=3D1&w=3D2
> >
> > Ok.
> >
> > And thinking about it, while that is a silly test-case, the notion of
> > "create top-down segment, then start populating it _before_ moving the
> > stack pointer into it" is actually perfectly valid.
> >
> > So I guess checking against the stack pointer is wrong in that case -
> > at least if the stack pointer isn't inside that vma to begin with.
> >
> > So yes, removing that check looks like the right thing to do for now.
> >
> > Do you want to send me the patch if you already have a commit message e=
tc?
>
> I have a bit of a bad feeling about this.
>
> Perhaps it's just sentimental attachment to all those weird
> and ancient stack pointer checks in arch/<some>/fault.c.
>
> We have been inconsistent: cris frv m32r m68k microblaze mn10300
> openrisc powerpc tile um x86 have such checks, the others don't.
> So that's a good reason to delete them.

OK, I didn't bother to check other acrhitectures, thanks...

> But at least at the moment those checks impose some sanity:
> just a page less than we had imagined for several years.
> Once we remove them, they cannot go back.  Should we now
> complicate them with an extra page of slop?

Something like the patch below? Yes, I thought about this too.

I simply do not know. Honestly, I do not even know why MAP_GROWSDOWN
exists. I mean, I do not understand how user-space can actually use it
to get auto-growing, the usage of MAP_GROWSDOWN in (say) criu is clear.
The main thread's stack can grow, but this is only because it is placed
at the right place, above mm->mmap_base in case of top-down layout.

> I'm not entirely persuaded by your pre-population argument:
> it's perfectly possible to prepare a MAP_GROWSDOWN area with
> an initial size, that's populated in a normal way, before handing
> off for stack expansion - isn't it?

Exactly.

> I'd be interested to hear more about that (redhat internal) bug
> report that Oleg mentions: whether it gives stronger grounds for
> making this sudden change than the CRIU testcase.

Probably not. Well, the customer reported multiple problems, but most
of them were caused by rhel-specific bugs. As for "MAP_GROWSDOWN does
not grow", most probably this was another test-case, not the real
application. I will ask and report back if this is not true.

In short, I agree with any decision. Even with "we do not care if we
break some artificial test-cases".

Oleg.
---

--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1409,7 +1409,7 @@ __do_page_fault(struct pt_regs *regs, unsigned long e=
rror_code,
 		bad_area(regs, error_code, address);
 		return;
 	}
-	if (error_code & PF_USER) {
+	if ((error_code & PF_USER) && (address + PAGE_SIZE < vma->vm_start)) {
 		/*
 		 * Accessing the stack below %sp is always a bug.
 		 * The large cushion allows instructions like enter


--===============1480595682492085927==--

