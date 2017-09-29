Content-Type: multipart/mixed; boundary="===============7346635531845149481=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/asm: Fix inline asm call constraints for GCC 4.4
Date: Fri, 29 Sep 2017 08:29:35 -0700
Message-ID: <CAK8P3a3=WNB2GCZfqNWUFpYf6M9gOZRGJhW0UViQueVNyp5JSg@mail.gmail.com>
In-Reply-To: <20170929075130.unemx3lbusjd6f6q@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7346635531845149481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 12:51 AM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
>> On Thu, Sep 28, 2017 at 2:58 PM, Josh Poimboeuf <jpoimboe@redhat.com> =
wrote:
>> The kernel test robot report looked to be ignored as a "gcc-4.4 is too
>> old to worry about" thing. [...]
>
> No, and sorry if my first reply grumbling about how old GCC 4.4 is sounde=
d that
> way! We have to live with compiler bugs no matter how old the compiler is=
, the
> release cycles are decoupled to such a degree and external tooling propag=
ates with
> such high latencies that that's the only sane thing to do.
>
> We also officially support GCC 3.2 and later compilers. Had this regressi=
on not
> been resolved within a week or so I was fully ready to queue up a revert =
commit,
> no questions asked.

FWIW, we had a discussion about which compiler versions actually still work
earlier this year: We concluded that gcc-4.0 and earlier have been broken
for a while without anyone caring. gcc-4.1 support is kept working in certa=
in
configurations primarily due to Geert using it for build testing, but my te=
sts
across multiple architectures showed that gcc-4.3 is needed on most
other architectures already. Some architectures need  even newer ones, and
some features need compiler support that was added much later of course.

         Arnd

--===============7346635531845149481==--

