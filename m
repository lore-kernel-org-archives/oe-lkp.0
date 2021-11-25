Content-Type: multipart/mixed; boundary="===============1672789090522627244=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [gcov] 1391efa952: BUG:KASAN:slab-out-of-bounds_in_gcov_info_add
Date: Thu, 25 Nov 2021 09:48:17 -0800
Message-ID: <CAHk-=wj7OZQcHPdcTz1cAXN1fdRJ4kqqeQHqOTP8CChHHS=bjQ@mail.gmail.com>
In-Reply-To: <a5274ba1922d5eaf9568886191e0a05bdfc55506.camel@sipsolutions.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1672789090522627244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 7:45 AM Johannes Berg <johannes@sipsolutions.net>=
 wrote:
>
> In any case, reviewing my commit again I see nothing wrong there, and I
> don't understand the code/clang well enough to see what might be the
> issue.

Yeah, looks like the kvmalloc() conversion simply tightened the
checking boundaries, now that it might be using kmalloc() instead of
full pages.

The report isn't wonderful (the KASAN report is garbled, and the "code
disassembly" is not from the actual KASAN report, it's from the return
to user space code), but it blames a 8-byte read at

    gcov_info_add (kernel/gcov/clang.c:328)

which in that kernel version (1391efa952e8) is that

        for (i =3D 0; i < sfn_ptr->num_counters; i++)
->              dfn_ptr->counters[i] +=3D sfn_ptr->counters[i];

and so it looks like that 'sfn_ptr->counters[i]' access is the problem case.

The allocation was

    gcov_info_dup (include/linux/mm.h:804 kernel/gcov/clang.c:371
kernel/gcov/clang.c:404)

and in particular, it's the inlined gcov_fn_info_dup() at line 371:

        cv_size =3D fn->num_counters * sizeof(fn->counters[0]);
        fn_dup->counters =3D kvmalloc(cv_size, GFP_KERNEL);

but I'm not seeing how that could fail.

Sure, that code doesn't explicitly ever set "fn_dup->num_counters",
but it should get set thanks to the

        fn_dup =3D kmemdup(fn, sizeof(*fn), GFP_KERNEL);

so I don't see anything wrong there, but I'm adding some of the
involved people to the participants in case they see what's going on..

                  Linus
--===============1672789090522627244==--

