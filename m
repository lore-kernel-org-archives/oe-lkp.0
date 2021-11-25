Content-Type: multipart/mixed; boundary="===============1372523654186132977=="
MIME-Version: 1.0
From: Johannes Berg <johannes@sipsolutions.net>
To: lkp@lists.01.org
Subject: Re: [gcov] 1391efa952: BUG:KASAN:slab-out-of-bounds_in_gcov_info_add
Date: Thu, 25 Nov 2021 21:42:47 +0100
Message-ID: <d4e9d61034eb6dd3afccc3d30e995ff89701e3b4.camel@sipsolutions.net>
In-Reply-To: <CAHk-=wj7OZQcHPdcTz1cAXN1fdRJ4kqqeQHqOTP8CChHHS=bjQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1372523654186132977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-11-25 at 09:48 -0800, Linus Torvalds wrote:
> =

> The report isn't wonderful (the KASAN report is garbled, and the "code
> disassembly" is not from the actual KASAN report, it's from the return
> to user space code), but it blames a 8-byte read at
> =

>     gcov_info_add (kernel/gcov/clang.c:328)
> =

> which in that kernel version (1391efa952e8) is that
> =

>         for (i =3D 0; i < sfn_ptr->num_counters; i++)
> ->              dfn_ptr->counters[i] +=3D sfn_ptr->counters[i];
> =

> and so it looks like that 'sfn_ptr->counters[i]' access is the problem ca=
se.
> =


Not sure. Note the +=3D, so it has to read both sides first. Would KASAN
report the follow-up write as well?

The loop is going to sfn_ptr->num_counters, so that seems less likely to
get confused, unless clang has a bug, which is where the original
counters and num_counters comes from, afaict?

I mean, we seem to always consistently allocate counters from
num_counters for these things, but here we use sfn_ptr and dfn_ptr, and
the loop checks only dfn_ptr. Just being suspicious I guess, but I
really don't know anything about this. All I know that vmalloc made this
really slow on ARCH=3Dum and so I converted all of this ... :)

johannes
--===============1372523654186132977==--

