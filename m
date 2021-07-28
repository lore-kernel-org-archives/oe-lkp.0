Content-Type: multipart/mixed; boundary="===============2696130016249216272=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 44042b4498: WARNING:possible_recursive_locking_detected
Date: Wed, 28 Jul 2021 13:14:21 +0800
Message-ID: <20210728051420.GA8616@xsang-OptiPlex-9020>
In-Reply-To: <20210727143538.GB3809@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2696130016249216272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Mel Gorman,

On Tue, Jul 27, 2021 at 03:35:38PM +0100, Mel Gorman wrote:
> On Tue, Jul 27, 2021 at 10:31:36PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 44042b4498728f4376e84bae1ac8016d146d850b ("mm/page_alloc: allow=
 high-order pages to be stored on the per-cpu lists")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> =

> Does this warning happen after 187ad460b841 ("mm/page_alloc: avoid page
> allocator recursion with pagesets.lock held")? I ask because I see the
> stack_depot_save in the warning.

from our tests, this warning cannot be reproduced upon 187ad460b841.
Thanks for information!

> =

> -- =

> Mel Gorman
> SUSE Labs
--===============2696130016249216272==--

