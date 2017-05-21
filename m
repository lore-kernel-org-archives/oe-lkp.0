Content-Type: multipart/mixed; boundary="===============2107430769231842488=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [waitid()] 75f64d68f9: Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=
Date: Sun, 21 May 2017 14:37:15 -0700
Message-ID: <CA+55aFzeNvdu1E0VrmZ=p8eJL-vZ4no-qJ=PaBaBg0JLAMSsFg@mail.gmail.com>
In-Reply-To: <20170521211443.GA390@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2107430769231842488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2017 at 2:14 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Umm...  get_user() for anything larger than long is simply not supported =
on
> a lot of architectures[1].  Do we really want to do that for unsafe_get_u=
ser()?

I'm pretty sure there's a reason we added support for it on x86-32,
because there are structures that use __u64 and fill things one entry
at a time.

It's entirely possible that that code then fails (maybe it compiles,
but doesn't work) on various other architectures. There's a lot of
drivers that are disabled on non-x86.

                  Linus

--===============2107430769231842488==--

