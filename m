Content-Type: multipart/mixed; boundary="===============6210593709127945363=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Thu, 20 Jul 2017 11:41:38 -0700
Message-ID: <CA+55aFyeM9+1mQyyS8GN-b2JMVkdMxzyVG_8ajvHYm_W3XwV=w@mail.gmail.com>
In-Reply-To: <20170721005140.ebf6d119bb30cc6cfe12ae61@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6210593709127945363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 8:51 AM, Masami Hiramatsu <mhiramat@kernel.org> w=
rote:
>
> Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
> Tested-by: Masami Hiramatsu <mhiramat@kernel.org>

Ok, I committed that patch as-is.

Other architectures may end up with the same issue, unless they really
happen to have just a single instruction that fits in their
kprobe_opcode_t type in their templates. But I didn't touch any of
their (similar) code, since it will need testing.

                  Linus

--===============6210593709127945363==--

