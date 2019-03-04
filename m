Content-Type: multipart/mixed; boundary="===============8747878372387977822=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Mon, 04 Mar 2019 10:59:22 -0800
Message-ID: <CAHk-=wiQM84VsAiw92UWyQZTQxr+F032Gm5BiFBXk7tC+LQohQ@mail.gmail.com>
In-Reply-To: <20190304180610.2d4f6f08d9ad89d6abae3597@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8747878372387977822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2019 at 1:06 AM Masami Hiramatsu <mhiramat@kernel.org> wro=
te:
>
> On Sun, 3 Mar 2019 18:37:59 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > We've had this before. We've gotten rid of the actual "use system
> > calls", but we still have some of the init sequence in particular just
> > calling the wrappers instead.
>
> Are those safe if we are in init sequence?

Yes, they are, it runs with set_fs(KERNEL_DS).

But the patches made that now complain about copying from non-user
space, even though it's fine.

Basically, "strncpy_from_user()" shouldn't use "user_access_ok()",
since it actually can take a kernel address (with set_fs()).

Your "unsafe" version for tracing that actually sets "set_fs(USER_DS)"
is thje only thing that should use that helper.

> > And yes, ksys_mount() takes __user pointers.
> >
> > It would be a lot better to use "do_mount()", which is the interface
> > that takes actual "char *" pointers.
>
> Unfortunately, it still takes a __user pointer.

Ahh, yes, the name remains in user space.

Besides, I'm sure you'd just hit other cases instead where people use
set_fs() and copy strings.

> So what we need is
>
> long do_mount(const char *dev_name, struct path *dir_path,
>                 const char *type_page, unsigned long flags, void *data_pa=
ge)
>
> or introduce kern_do_mount()?

It's actually fairly painful. Particularly because of that "void *data_page=
".

Your second email with "Would this work?" helper function _wopuldn't_
work correctly, exactly because you passed in a regular string to the
data page.

Also, I don't want to see code that replaces the unconditional "copy
path from user space" with a conditional "do we have path in kernel
space".

So together with the whole "uyou'll hit other peoblems anyway", I
don't think this is a good approach.

I think you simply need to have a separate "unsafe_strncpy()"
function, and not change the existing "strncpy_from_user()".

                Linus

--===============8747878372387977822==--

