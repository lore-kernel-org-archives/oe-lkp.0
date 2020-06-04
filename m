Content-Type: multipart/mixed; boundary="===============8629433918691094342=="
MIME-Version: 1.0
From: Joerg, Roedel, <jroedel@suse.de>
To: lkp@lists.01.org
Subject: Re: 0604a4fd53 ("x86/mm: remove vmalloc faulting"): BUG: unable to handle page fault for address: f8001038
Date: Thu, 04 Jun 2020 09:57:28 +0200
Message-ID: <20200604075728.GM6857@suse.de>
In-Reply-To: <5ed869c7.3GpRlu0hrFzKB6an%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8629433918691094342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 04, 2020 at 11:25:59AM +0800, kernel test robot wrote:
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
> =

>     x86/mm: remove vmalloc faulting
>     =

>     Remove fault handling on vmalloc areas, as the vmalloc code now takes=
 care
>     of synchronizing changes to all page-tables in the system.

This report is a false positive as the tested commit history does not
contain the fixup for map_kernel_range_noflush() which adds the call to
arch_sync_kernel_mappings() there.


Regards,

	Joerg

--===============8629433918691094342==--

