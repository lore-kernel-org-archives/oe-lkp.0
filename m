Content-Type: multipart/mixed; boundary="===============6288077267924099406=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] ad36bafb3b: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Sun, 23 May 2021 22:25:11 -0700
Message-ID: <7b54b481-a7b-f06e-aef2-ed529af3aaf5@google.com>
In-Reply-To: <20210518170700.0ffdcaeb55cf64607120d5be@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6288077267924099406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 18 May 2021, Andrew Morton wrote:

> On Sun, 16 May 2021 22:41:52 +0800 kernel test robot <oliver.sang@intel=
.com> wrote:
> =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: ad36bafb3bcdfdb98ae3516285bbb3ecd51d1597 ("mm/slub: use stackde=
pot to save stack trace in objects")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > =

> =

> I expect
> https://lkml.kernel.org/r/20210516195150.26740-1-vbabka(a)suse.cz will
> fix this?
> =


Yes, that should do it.
--===============6288077267924099406==--

