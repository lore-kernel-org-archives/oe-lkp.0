Content-Type: multipart/mixed; boundary="===============0602127578599563178=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Mon, 04 Mar 2019 18:06:10 +0900
Message-ID: <20190304180610.2d4f6f08d9ad89d6abae3597@kernel.org>
In-Reply-To: <CAHk-=whYMvevgF4yh7uhQug=Wt1A1Eg7abyM=RCi=bQiqiMBvQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0602127578599563178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 3 Mar 2019 18:37:59 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, Mar 3, 2019 at 5:14 PM Masami Hiramatsu <mhiramat@kernel.org> w=
rote:
> >
> > I think it comes from WARN_ON_ONCE(!segment_eq(get_fs(), USER_DS)) in
> > user_access_ok(). The call trace shows that strndup_user might be called
> > from kernel daemon context.
> =

> Ahh, yes.
> =

> We've had this before. We've gotten rid of the actual "use system
> calls", but we still have some of the init sequence in particular just
> calling the wrappers instead.

Are those safe if we are in init sequence?

> =

> And yes, ksys_mount() takes __user pointers.
> =

> It would be a lot better to use "do_mount()", which is the interface
> that takes actual "char *" pointers.

Unfortunately, it still takes a __user pointer.

long do_mount(const char *dev_name, const char __user *dir_name,
                const char *type_page, unsigned long flags, void *data_page)

So what we need is

long do_mount(const char *dev_name, struct path *dir_path,
                const char *type_page, unsigned long flags, void *data_page)

or introduce kern_do_mount()?

Since devtmpfsd calls ksys_chdir() and ksys_chroot(), we need to replace
those too. Fortunately, it seems that the last part which we have to fix.

Thank you,

> =

>                     Linus


-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============0602127578599563178==--

