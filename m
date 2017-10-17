Content-Type: multipart/mixed; boundary="===============8836073003297065292=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Tue, 17 Oct 2017 16:33:26 +0900
Message-ID: <20171017073326.GA23865@js1304-P5Q-DELUXE>
In-Reply-To: <20171011170120.7flnk6r77dords7a@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============8836073003297065292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 12:01:20PM -0500, Josh Poimboeuf wrote:
> I failed to add the slab maintainers to CC on the last attempt.  Trying
> again.
> =

> On Tue, Oct 10, 2017 at 09:31:06PM -0500, Josh Poimboeuf wrote:
> > On Tue, Oct 10, 2017 at 08:15:13PM +0800, kernel test robot wrote:
> > > =

> > > FYI, we noticed the following commit (built with gcc-4.8):
> > > =

> > > commit: 81d387190039c14edac8de2b3ec789beb899afd9 ("x86/kconfig: Conso=
lidate unwinders into multiple choice selection")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > > in testcase: boot
> > > =

> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -m 5=
12M
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > +------------------------------------------+------------+------------+
> > > |                                          | a34a766ff9 | 81d3871900 |
> > > +------------------------------------------+------------+------------+
> > > | boot_successes                           | 24         | 5          |
> > > | boot_failures                            | 12         | 31         |
> > > | BUG:kernel_hang_in_test_stage            | 12         | 1          |
> > > | BUG:unable_to_handle_kernel              | 0          | 30         |
> > > | Oops:#[##]                               | 0          | 30         |
> > > | Kernel_panic-not_syncing:Fatal_exception | 0          | 30         |
> > > +------------------------------------------+------------+------------+
> > > =

> > > =

> > > =

> > > [    5.324797] BUG: unable to handle kernel paging request at ffff880=
01c4b0000
> > > [    5.326126] IP: slob_free+0x2bf/0x3d7
> > > [    5.328023] PGD 17d9c067 =

> > > [    5.328023] P4D 17d9c067 =

> > > [    5.328023] PUD 17d9d067 =

> > > [    5.328023] PMD 1f91e067 =

> > > [    5.328023] PTE 800000001c4b0060
> > > [    5.328023] =

> > > [    5.328023] Oops: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
> > > [    5.328023] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.13.0-rc1-0=
0044-g81d3871 #1
> > > [    5.328023] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS 1.10.2-1 04/01/2014
> > > [    5.328023] task: ffff8800002fa000 task.stack: ffffc900000d0000
> > > [    5.328023] RIP: 0010:slob_free+0x2bf/0x3d7
> > > [    5.328023] RSP: 0000:ffffc900000d3d58 EFLAGS: 00010002
> > > [    5.328023] RAX: 0000000000000027 RBX: ffff88001c4affb0 RCX: 00000=
00000000000
> > > [    5.328023] RDX: ffff88001c4af000 RSI: 0000000000000000 RDI: ffff8=
8001c4afffe
> > > [    5.328023] RBP: ffff88001c4afffe R08: 0000000000000001 R09: 00000=
00000000000
> > > [    5.328023] R10: ffffea000069a420 R11: ffff88001ffdb000 R12: ffff8=
8001c4aff5c
> > > [    5.328023] R13: 0000000000000027 R14: 0000000000000027 R15: 00000=
00000000027
> > > [    5.328023] FS:  0000000000000000(0000) GS:ffff88001f600000(0000) =
knlGS:0000000000000000
> > > [    5.328023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [    5.328023] CR2: ffff88001c4b0000 CR3: 0000000016211000 CR4: 00000=
000000406b0
> > > [    5.328023] Call Trace:
> > > [    5.328023]  ? link_target+0xb2/0xc7
> > > [    5.328023]  kfree+0x158/0x1b6
> > > [    5.328023]  link_target+0xb2/0xc7
> > > [    5.328023]  new_node+0x32b/0x4d1
> > > [    5.328023]  gcov_event+0x33e/0x546
> > > [    5.328023]  ? gcov_persist_setup+0xbb/0xbb
> > > [    5.328023]  gcov_enable_events+0x3c/0x89
> > > [    5.328023]  gcov_fs_init+0x134/0x191
> > > [    5.328023]  do_one_initcall+0x10e/0x2df
> > > [    5.328023]  kernel_init_freeable+0x3ec/0x559
> > > [    5.328023]  ? rest_init+0x145/0x145
> > > [    5.328023]  kernel_init+0xc/0x1a8
> > > [    5.328023]  ret_from_fork+0x2a/0x40
> > > [    5.328023] Code: e8 8d f7 ff ff 48 ff 05 c9 8c 91 02 85 c0 75 51 =
49 0f bf c5 48 ff 05 c2 8c 91 02 48 8d 3c 43 48 39 ef 75 3d 48 ff 05 ba 8c =
91 02 <8b> 6d 00 66 85 ed 7e 09 48 ff 05 b3 8c 91 02 eb 05 bd 01 00 00 =

> > > [    5.328023] RIP: slob_free+0x2bf/0x3d7 RSP: ffffc900000d3d58
> > > [    5.328023] CR2: ffff88001c4b0000
> > > [    5.328023] ---[ end trace f8ee1579929b04f0 ]---
> > =

> > Adding the slub maintainers.  Is slob still supposed to work?
> > =

> > The bisection is blaming the ORC unwinder, but I'm having trouble
> > finding anything ORC specific about it.  I wonder if the disabling of
> > frame pointers changed the code generation enough to trigger this bug
> > somehow.
> > =

> > Looking at the panic, the code in slob_free() was:
> > =

> >    0:	e8 8d f7 ff ff       	callq  0xfffffffffffff792
> >    5:	48 ff 05 c9 8c 91 02 	incq   0x2918cc9(%rip)        # 0x2918cd5
> >    c:	85 c0                	test   %eax,%eax
> >    e:	75 51                	jne    0x61
> >   10:	49 0f bf c5          	movswq %r13w,%rax
> >   14:	48 ff 05 c2 8c 91 02 	incq   0x2918cc2(%rip)        # 0x2918cdd
> >   1b:	48 8d 3c 43          	lea    (%rbx,%rax,2),%rdi
> >   1f:	48 39 ef             	cmp    %rbp,%rdi
> >   22:	75 3d                	jne    0x61
> >   24:	48 ff 05 ba 8c 91 02 	incq   0x2918cba(%rip)        # 0x2918ce5
> >   2b:*	8b 6d 00             	mov    0x0(%rbp),%ebp		<-- trapping instru=
ction
> >   2e:	66 85 ed             	test   %bp,%bp
> >   31:	7e 09                	jle    0x3c
> >   33:	48 ff 05 b3 8c 91 02 	incq   0x2918cb3(%rip)        # 0x2918ced
> >   3a:	eb 05                	jmp    0x41
> >   3c:	bd                   	.byte 0xbd
> >   3d:	01 00                	add    %eax,(%rax)
> > =

> > The slob_free() code tried to read four bytes at ffff88001c4afffe, and
> > ended up reading past the page into a bad area.  I think the bad address
> > (ffff88001c4afffe) was returned from slob_next() and it panicked trying
> > to read s->units in slob_units().

Hello,

It looks like a compiler bug. The code of slob_units() try to read two
bytes at ffff88001c4afffe. It's valid. But the compiler generates
wrong code that try to read four bytes.

static slobidx_t slob_units(slob_t *s) =

{
  if (s->units > 0)
    return s->units;
  return 1;
}

s->units is defined as two bytes in this setup.

Wrongly generated code for this part.

'mov 0x0(%rbp), %ebp'

%ebp is four bytes.

I guess that this wrong four bytes read cross over the valid memory
boundary and this issue happend.

Proper code (two bytes read) is generated if different version of gcc
is used.

If someone knows related compiler people, please Ccing.

Thanks.


--===============8836073003297065292==--

