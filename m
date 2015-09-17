Content-Type: multipart/mixed; boundary="===============7682691826758055641=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/kconfig/32] 2bdc727abf: BUG kmalloc-256 (Not tainted): Object already free
Date: Thu, 17 Sep 2015 15:29:52 -0700
Message-ID: <CALCETrXupx1cAsGb_YXz_h9X5WNVvPgNNYJmuQCfA_aEDD6Ahw@mail.gmail.com>
In-Reply-To: <876139g1u9.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7682691826758055641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2015 at 8:29 PM, kernel test robot <ying.huang@intel.com>=
 wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/sigcon=
text
> commit 2bdc727abf3a90a0e53849c88c48607e152166b2 ("Revert "x86/kconfig/32:=
 Rename CONFIG_VM86 and default it to 'n'"")
>

I think the bug is attributed to the wrong commit, although the issue
might be that your config scripts aren't picking up CONFIG_VM86=3Dy
without this patch.

Brian, I think this is your bug.  Shouldn't arch_dup_task_struct or
similar have dst->thread.vm86 =3D NULL?

--Andy

>
> +-----------------------------------------------------+------------+-----=
-------+
> |                                                     | 7e01ebffff | 2bdc=
727abf |
> +-----------------------------------------------------+------------+-----=
-------+
> | boot_successes                                      | 33         | 20  =
       |
> | boot_failures                                       | 0          | 15  =
       |
> | BUG_kmalloc-#(Not_tainted):Object_already_free      | 0          | 14  =
       |
> | INFO:Allocated_in_alloc_fdmem_age=3D#cpu=3D#pid=3D        | 0          =
| 11         |
> | INFO:Freed_in_kvfree_age=3D#cpu=3D#pid=3D                 | 0          =
| 10         |
> | INFO:Slab#objects=3D#used=3D#fp=3D#flags=3D                 | 0        =
  | 15         |
> | INFO:Object#@offset=3D#fp=3D                            | 0          | =
15         |
> | BUG_kmalloc-#(Tainted:G_B):Object_already_free      | 0          | 11  =
       |
> | INFO:Allocated_in_do_execveat_common_age=3D#cpu=3D#pid=3D | 0          =
| 10         |
> | INFO:Freed_in_free_bprm_age=3D#cpu=3D#pid=3D              | 0          =
| 10         |
> | backtrace:do_group_exit                             | 0          | 12  =
       |
> | backtrace:SyS_exit_group                            | 0          | 12  =
       |
> | BUG:unable_to_handle_kernel                         | 0          | 2   =
       |
> | Oops                                                | 0          | 2   =
       |
> | EIP_is_at_strrchr                                   | 0          | 1   =
       |
> | Kernel_panic-not_syncing:Fatal_exception            | 0          | 2   =
       |
> | backtrace:do_execve                                 | 0          | 3   =
       |
> | backtrace:SyS_execve                                | 0          | 3   =
       |
> | BUG_kmalloc-#(Not_tainted):Poison_overwritten       | 0          | 1   =
       |
> | INFO:#-#.First_byte#instead_of                      | 0          | 1   =
       |
> | INFO:Freed_in_load_elf_binary_age=3D#cpu=3D#pid=3D        | 0          =
| 3          |
> | INFO:Slab#objects=3D#used=3D#fp=3D0x(null)flags=3D          | 0        =
  | 1          |
> | BUG_kmalloc-#(Tainted:G_B):Redzone_overwritten      | 0          | 1   =
       |
> | INFO:Allocated_in_do_sys_vm86_age=3D#cpu=3D#pid=3D        | 0          =
| 2          |
> | INFO:Freed_in_exit_thread_age=3D#cpu=3D#pid=3D            | 0          =
| 2          |
> | invoked_oom-killer:gfp_mask=3D0x                      | 0          | 1 =
         |
> | Mem-Info                                            | 0          | 1   =
       |
> | Out_of_memory:Kill_process                          | 0          | 1   =
       |
> | backtrace:vfs_writev                                | 0          | 1   =
       |
> | backtrace:SyS_writev                                | 0          | 1   =
       |
> | EIP_is_at_commit_creds                              | 0          | 1   =
       |
> | INFO:Allocated_in_load_elf_phdrs_age=3D#cpu=3D#pid=3D     | 0          =
| 2          |
> +-----------------------------------------------------+------------+-----=
-------+
>
>
> [  158.004783] mmap: trinity-c0 (11572) uses deprecated remap_file_pages(=
) syscall. See Documentation/vm/remap_file_pages.txt.
> [  158.066462] VFS: Warning: trinity-c0 using old stat() call. Recompile =
your binary.
> [  158.141967] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [  158.143697] BUG kmalloc-256 (Not tainted): Object already free
> [  158.155727] ----------------------------------------------------------=
-------------------
> [  158.155727]
> [  158.158045] Disabling lock debugging due to kernel taint
> [  158.159123] INFO: Allocated in do_sys_vm86+0x44f/0x4b0 age=3D60 cpu=3D=
0 pid=3D11572
> [  158.164703] INFO: Freed in exit_thread+0x89/0xb0 age=3D27 cpu=3D0 pid=
=3D11586
> [  158.194498] INFO: Slab 0xcbc5f180 objects=3D9 used=3D6 fp=3D0xc818c6c0=
 flags=3D0x40000080
> [  158.196060] INFO: Object 0xc818c6c0 @offset=3D1728 fp=3D0xc818c1b0
> [  158.196060]
> [  158.197539] Bytes b4 c818c6b0: 33 2d 00 00 bc 56 ff ff 5a 5a 5a 5a 5a =
5a 5a 5a  3-...V..ZZZZZZZZ
> [  158.199193] Object c818c6c0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b 6b  kkkkkkkkkkkkkkkk
>
>
>
>
>
> Thanks,
> Ying Huang



-- =

Andy Lutomirski
AMA Capital Management, LLC

--===============7682691826758055641==--

