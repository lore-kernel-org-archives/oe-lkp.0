Content-Type: multipart/mixed; boundary="===============6452177338676749672=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Sun, 03 Mar 2019 18:37:59 -0800
Message-ID: <CAHk-=whYMvevgF4yh7uhQug=Wt1A1Eg7abyM=RCi=bQiqiMBvQ@mail.gmail.com>
In-Reply-To: <20190304101434.8429ffffb17813c0e7930130@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6452177338676749672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2019 at 5:14 PM Masami Hiramatsu <mhiramat@kernel.org> wro=
te:
>
> I think it comes from WARN_ON_ONCE(!segment_eq(get_fs(), USER_DS)) in
> user_access_ok(). The call trace shows that strndup_user might be called
> from kernel daemon context.

Ahh, yes.

We've had this before. We've gotten rid of the actual "use system
calls", but we still have some of the init sequence in particular just
calling the wrappers instead.

And yes, ksys_mount() takes __user pointers.

It would be a lot better to use "do_mount()", which is the interface
that takes actual "char *" pointers.

                    Linus

--===============6452177338676749672==--

