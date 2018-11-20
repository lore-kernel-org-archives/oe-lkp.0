Content-Type: multipart/mixed; boundary="===============1152465610268611783=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill@shutemov.name>
To: lkp@lists.01.org
Subject: Re: dd2283f260 [ 97.263072] WARNING:at_kernel/locking/lockdep.c:#lock_downgrade
Date: Tue, 20 Nov 2018 16:42:16 +0300
Message-ID: <20181120134216.s5derazwpay5gkfk@kshutemo-mobl1>
In-Reply-To: <9dec33d0-f408-8428-b004-fa63fc2e9091@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1152465610268611783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 20, 2018 at 08:10:51PM +0800, Yang Shi wrote:
> =

> =

> On 11/20/18 4:57 PM, Kirill A. Shutemov wrote:
> > On Fri, Nov 16, 2018 at 08:56:04AM -0800, Yang Shi wrote:
> > > > a8dda165ec  vfree: add debug might_sleep()
> > > > dd2283f260  mm: mmap: zap pages with read mmap_sem in munmap
> > > > 5929a1f0ff  Merge tag 'riscv-for-linus-4.20-rc2' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/palmer/riscv-linux
> > > > 0bc80e3cb0  Add linux-next specific files for 20181114
> > > > +-----------------------------------------------------+------------=
+------------+------------+---------------+
> > > > |                                                     | a8dda165ec =
| dd2283f260 | 5929a1f0ff | next-20181114 |
> > > > +-----------------------------------------------------+------------=
+------------+------------+---------------+
> > > > | boot_successes                                      | 314        =
| 178        | 190        | 168           |
> > > > | boot_failures                                       | 393        =
| 27         | 21         | 40            |
> > > > | WARNING:held_lock_freed                             | 383        =
| 23         | 17         | 39            |
> > > > | is_freeing_memory#-#,with_a_lock_still_held_there   | 383        =
| 23         | 17         | 39            |
> > > > | BUG:unable_to_handle_kernel                         | 5          =
| 2          | 4          | 1             |
> > > > | Oops:#[##]                                          | 9          =
| 3          | 4          | 1             |
> > > > | EIP:debug_check_no_locks_freed                      | 9          =
| 3          | 4          | 1             |
> > > > | Kernel_panic-not_syncing:Fatal_exception            | 9          =
| 3          | 4          | 1             |
> > > > | Mem-Info                                            | 4          =
| 1          |            |               |
> > > > | invoked_oom-killer:gfp_mask=3D0x                      | 1        =
  | 1          |            |               |
> > > > | WARNING:at_kernel/locking/lockdep.c:#lock_downgrade | 0          =
| 6          | 4          | 7             |
> > > > | EIP:lock_downgrade                                  | 0          =
| 6          | 4          | 7             |
> > > > +-----------------------------------------------------+------------=
+------------+------------+---------------+
> > > > =

> > > > [   96.288009] random: get_random_u32 called from arch_rnd+0x3c/0x7=
0 with crng_init=3D0
> > > > [   96.359626] input_id (331) used greatest stack depth: 6360 bytes=
 left
> > > > [   96.749228] grep (358) used greatest stack depth: 6336 bytes left
> > > > [   96.921470] network.sh (341) used greatest stack depth: 6212 byt=
es left
> > > > [   97.262340]
> > > > [   97.262587] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [   97.263072] WARNING: held lock freed!
> > > > [   97.263536] 4.19.0-06969-gdd2283f #1 Not tainted
> > > > [   97.264110] -------------------------
> > > > [   97.264575] udevd/198 is freeing memory 9c16c930-9c16c99b, with =
a lock still held there!
> > > > [   97.265542] (ptrval) (&anon_vma->rwsem){....}, at: unlink_anon_v=
mas+0x14e/0x420
> > > > [   97.266450] 1 lock held by udevd/198:
> > > > [   97.266924]  #0: (ptrval) (&mm->mmap_sem){....}, at: __do_munmap=
+0x531/0x730
> > > I have not figured out what this is caused by. But, the below warning=
 looks
> > > more confusing. This might be caused by the below one.
> > I *think* we need to understand more about what detached VMAs mean for
> > rmap. The anon_vma for these VMAs still reachable for the rmap and
> > therefore VMA too. I don't quite grasp what is implications of this, but
> > it doesn't look good.
> =

> I'm supposed before accessing anon_vma, VMA need to be found by find_vma()
> first, right? But, finding VMA need hold mmap_sem, once detach VMAs is
> called, others should not be able to find the VMAs anymore. So, the anon_=
vma
> should not be reachable except the munmap caller.

No. anon_vma can be reached from page->mapping. The page can be reached
during physcal memory scan or if the page is shared (across fork()). None
of these accesses require mmap_sem.

-- =

 Kirill A. Shutemov

--===============1152465610268611783==--

