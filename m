Content-Type: multipart/mixed; boundary="===============6200921041770189447=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/slub] ad36bafb3b: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Tue, 18 May 2021 17:07:00 -0700
Message-ID: <20210518170700.0ffdcaeb55cf64607120d5be@linux-foundation.org>
In-Reply-To: <20210516144152.GA25903@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6200921041770189447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 16 May 2021 22:41:52 +0800 kernel test robot <oliver.sang@intel.c=
om> wrote:

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: ad36bafb3bcdfdb98ae3516285bbb3ecd51d1597 ("mm/slub: use stackdepo=
t to save stack trace in objects")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =


I expect
https://lkml.kernel.org/r/20210516195150.26740-1-vbabka(a)suse.cz will
fix this?

--===============6200921041770189447==--

