Content-Type: multipart/mixed; boundary="===============8294546731259688504=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage - clang KCOV?
Date: Tue, 21 Dec 2021 16:22:19 +0100
Message-ID: <YcHxKzB3WPurKlZ9@zn.tnic>
In-Reply-To: <CANpmjNO4hs1B9eDY9edGGOXY45a8smdtYfYfbDRnGWSYch4wGg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8294546731259688504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 04:10:31PM +0100, Marco Elver wrote:
> Also double-check the Makefile-based solution: the Makefiles in both
> directories already contain various KCOV_INSTRUMENT/K*SAN_SANITIZE :=3D
> n, so perhaps adding GCOV_PROFILE or GCOV_PROFILE_whicheverfile.o :=3D n
> may be more appropriate should the functions that should not be
> instrumented be a moving target, and prone to breakage again in
> future.

Yeah, I asked whether we should exclude the whole ...cpu/common.c from
profiling - it has mostly init code so it probably doesn't matter
for coverage but no one said anything so I left it to the function
annotation.

And also, I'm still waiting on clang folks to chime in on the New Pass
Manager and whether there's a bug in clang there so that we won't need
the __no_profile annotation at all. I mean, gcc is fine with that config
so unless clang is doing more profiling gunk than gcc and requires that
__llvm_gcov_init constructor... see Nathan's mail upthread.

Thx.

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Ivo Totev, HRB 36809, AG N=C3=BCr=
nberg
--===============8294546731259688504==--

