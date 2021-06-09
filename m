Content-Type: multipart/mixed; boundary="===============9061197102748096928=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] ad36bafb3b: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Wed, 09 Jun 2021 16:59:38 +0800
Message-ID: <20210609085938.GD15555@xsang-OptiPlex-9020>
In-Reply-To: <20210518170700.0ffdcaeb55cf64607120d5be@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============9061197102748096928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Andrew,

On Tue, May 18, 2021 at 05:07:00PM -0700, Andrew Morton wrote:
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


we tested the patch, and it can fix the issue. thanks
--===============9061197102748096928==--

