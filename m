Content-Type: multipart/mixed; boundary="===============2469087290912550257=="
MIME-Version: 1.0
From: Joerg Roedel <jroedel@suse.de>
To: lkp@lists.01.org
Subject: Re: 0604a4fd53 ("x86/mm: remove vmalloc faulting"): [ 80.661587] BUG: unable to handle page fault for address: fb40c000
Date: Thu, 28 May 2020 20:48:57 +0200
Message-ID: <20200528184857.GE6857@suse.de>
In-Reply-To: <20200528084208.GV12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2469087290912550257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 28, 2020 at 04:42:09PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 0604a4fd53020a98f029e7fd56d896a136ff2357
> Author:     Joerg Roedel <jroedel@suse.de>
> AuthorDate: Sat May 16 15:19:37 2020 +1000
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Sat May 16 15:19:37 2020 +1000


Tried to reproduce this today and found another bug in KVM along the
way. But anyway, I wasn't able to reproduce this on latest linux-next.
By looking at the exact commit-id reported above, I found that this
report is a false-positive.

Above commit-id refers to an old version of the patch-set which does not
call arch_sync_kernel_mappings() in map_kernel_range_noflush(). So the
oops comes from missing synchronization there. But that is fixed already
in latest next/master.

Regards,

	Joerg
--===============2469087290912550257==--

