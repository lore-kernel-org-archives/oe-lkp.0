Content-Type: multipart/mixed; boundary="===============7336681906301831549=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/entry/64/compat] 8bb2610bc4: kernel_selftests.x86.test_syscall_vdso_32.fail
Date: Wed, 04 Jul 2018 14:14:51 -0700
Message-ID: <CA+55aFy2H-W5pW2tp75yhgBi0LPKn0gCjid9uw+n8GSd=b=ChQ@mail.gmail.com>
In-Reply-To: <E0E9D986-A638-4863-B49A-33B5B0B77352@amacapital.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7336681906301831549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 4, 2018 at 11:30 AM Andy Lutomirski <luto@amacapital.net> wro=
te:
>
> Nah, it=E2=80=99s a legit error.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/arch/x86/entry?id=3D22cd978e598618e82c3c3348d2069184f6884182

Ahh. I looked at the patch and it looked "obviously correct", but only
tested my current tree (which had the above fix), not that actual
tree.

> I blame git apply for being a bit overzealous.

Heh. git apply is actually very careful and refuses to apply with
fuzz, but yes, it will apply with a big offset if the original place
has changed and it can find another place that is an exact match (why?
Think "somebody moved code around").

But yeah, apparently that _right_ point had changed, and there was an
exact match at the wrong spot. Duplicate code is bad, hmm.

And I was then confused because I was looking at an *old* dmesg
report, and saw the old kernel version from there, rather than the
right one, so I incorrectly blamed "you're running the wrong kernel".

              Linus

--===============7336681906301831549==--

