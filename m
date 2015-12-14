Content-Type: multipart/mixed; boundary="===============0085955910748731818=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 3f5d849cb0: page dumped because: VM_BUG_ON_PAGE(!PageLocked(page))
Date: Mon, 14 Dec 2015 10:26:53 -0500
Message-ID: <20151214152653.GB13289@cmpxchg.org>
In-Reply-To: <87a8pdecv1.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0085955910748731818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 02:57:38PM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 3f5d849cb0b7e177c363f0c36732326f184b495b ("mm: memcontrol: switch =
to the updated jump-label API")
> =

> =

> +------------------------------------------------+------------+----------=
--+
> |                                                | bf344f1f72 | 3f5d849cb=
0 |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 4          | 3        =
  |
> | boot_failures                                  | 50         | 53       =
  |
> | IP-Config:Auto-configuration_of_network_failed | 50         | 52       =
  |
> | BUG:kernel_test_crashed                        | 0          | 1        =
  |
> | kernel_BUG_at_mm/filemap.c                     | 0          | 1        =
  |
> | invalid_opcode:#[##]SMP                        | 0          | 1        =
  |
> | RIP:unlock_page                                | 0          | 1        =
  |
> | Kernel_panic-not_syncing:Fatal_exception       | 0          | 1        =
  |
> +------------------------------------------------+------------+----------=
--+
> =

> It is possible that this is a false positive, because the reproduction
> is too low 1/48.
> =

> =

> [   13.114169] page:ffff8800135f1780 count:18 mapcount:10 mapping:ffff880=
015b25e71 index:0x7f08a73a0
> [   13.115380] flags: 0x40068(uptodate|lruudevd[203]: worker [224] did no=
t accept message -1 (Connection refused), kill it
> |active|swapbacked)
> [   13.117074] page dumped because: VM_BUG_ON_PAGE(!PageLocked(page))

I'm fairly certain this is this unlocked page issue:
http://www.spinics.net/lists/kernel/msg2142719.html

The fix went into Linus's tree only yesterday:
dfd01f0 ("sched/wait: Fix the signal handling fix")

--===============0085955910748731818==--

