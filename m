Content-Type: multipart/mixed; boundary="===============7294771023883400554=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Fri, 21 Jul 2017 07:20:04 +0900
Message-ID: <20170721072004.3909f2c7c74bb43b65220cc1@kernel.org>
In-Reply-To: <CA+55aFyeM9+1mQyyS8GN-b2JMVkdMxzyVG_8ajvHYm_W3XwV=w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7294771023883400554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Jul 2017 11:41:38 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, Jul 20, 2017 at 8:51 AM, Masami Hiramatsu <mhiramat@kernel.org>=
 wrote:
> >
> > Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
> > Tested-by: Masami Hiramatsu <mhiramat@kernel.org>
> =

> Ok, I committed that patch as-is.
> =

> Other architectures may end up with the same issue, unless they really
> happen to have just a single instruction that fits in their
> kprobe_opcode_t type in their templates. But I didn't touch any of
> their (similar) code, since it will need testing.

OK, I'll check and fix those.

Thank you!

-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============7294771023883400554==--

