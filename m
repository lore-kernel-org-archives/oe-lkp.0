Content-Type: multipart/mixed; boundary="===============4573305283516768680=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: 8d35f08793 ("vfs: Allow cloning of a mount tree with .."): kernel BUG at include/linux/fs.h:2806!
Date: Sat, 02 Jun 2018 18:55:01 +0100
Message-ID: <20180602175501.GY30522@ZenIV.linux.org.uk>
In-Reply-To: <5b12cb38.g1NXFXqcreB4lqSl%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4573305283516768680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 03, 2018 at 12:52:08AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git mount-fixes2
> =

> commit 8d35f08793e9ed71b5a4a17778081e5dd8c7cabc
> Author:     David Howells <dhowells@redhat.com>
> AuthorDate: Thu May 31 22:53:50 2018 +0100
> Commit:     Al Viro <viro@zeniv.linux.org.uk>
> CommitDate: Sat Jun 2 01:48:45 2018 -0400
> =

>     vfs: Allow cloning of a mount tree with open(O_PATH|O_CLONE_MOUNT)
>     =

>     Make it possible to clone a mount tree with a new pair of open flags =
that
>     are used in conjunction with O_PATH:
>     =

>      (1) O_CLONE_MOUNT - Clone the mount or mount tree at the path.
>     =

>      (2) O_NON_RECURSIVE - Don't clone recursively.
>     =

>     Note that it's not a good idea to reuse other flags (such as O_CREAT)
>     because the open routine for O_PATH does not give an error if any oth=
er
>     flags are used in conjunction with O_PATH, but rather just masks off =
any it
>     doesn't use.
>     =

>     The resultant file struct is marked FMODE_NEED_UNMOUNT; the mount it
>     points to is *not* attached to the mount tree - it's a private copy.
>     In case when O_NON_RECURSIVE has not been given there might be
>     a copy of an entire subtree; at final close it will be dissolved.
>     =

>     Signed-off-by: David Howells <dhowells@redhat.com>
> =

> 91b40218db  Merge tag 'afs-fixes-20180514' into for-next
> 8d35f08793  vfs: Allow cloning of a mount tree with open(O_PATH|O_CLONE_M=
OUNT)
> d950dedd5d  afs: Add fsinfo support
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> |                                                                  | 91b4=
0218db | 8d35f08793 | d950dedd5d |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> | boot_successes                                                   | 36  =
       | 4          | 0          |
> | boot_failures                                                    | 0   =
       | 10         | 7          |
> | BUG:unable_to_handle_kernel                                      | 0   =
       | 1          |            |
> | Oops:#[##]                                                       | 0   =
       | 1          |            |
> | RIP:umount_tree                                                  | 0   =
       | 1          |            |
> | Kernel_panic-not_syncing:Fatal_exception                         | 0   =
       | 10         | 3          |
> | kernel_BUG_at_include/linux/fs.h                                 | 0   =
       | 9          | 3          |
> | invalid_opcode:#[##]                                             | 0   =
       | 9          | 3          |
> | RIP:__fput                                                       | 0   =
       | 9          | 3          |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 0 =
         | 0          | 4          |
> | Mem-Info                                                         | 0   =
       | 0          | 4          |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 0   =
       | 0          | 4          |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> =

> [   61.066705] _warn_unseeded_randomness: 11 callbacks suppressed
> [   61.073204] random: get_random_bytes called from __prandom_timer+0x13/=
0x60 with crng_init=3D1
> [   72.970768] random: get_random_bytes called from key_alloc+0x253/0x560=
 with crng_init=3D1
> [child0:1266] uselib (134) returned ENOSYS, marking as inactive.
> [   74.193751] ------------[ cut here ]------------
> [   74.195105] kernel BUG at include/linux/fs.h:2806!

IMA shite triggered on close, which would imply FMODE_READ in
file->f_mode...  Aha.  It's

-               f->f_mode =3D FMODE_PATH;
+               f->f_mode |=3D FMODE_PATH;

in do_dentry_open() in that commit.  Braino, AFAICS...

--===============4573305283516768680==--

