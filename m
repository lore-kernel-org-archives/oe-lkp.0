Content-Type: multipart/mixed; boundary="===============5326642018591138885=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 44042b4498: WARNING:possible_recursive_locking_detected
Date: Tue, 27 Jul 2021 15:35:38 +0100
Message-ID: <20210727143538.GB3809@techsingularity.net>
In-Reply-To: <20210727143136.GA27400@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5326642018591138885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 10:31:36PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 44042b4498728f4376e84bae1ac8016d146d850b ("mm/page_alloc: allow h=
igh-order pages to be stored on the per-cpu lists")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =


Does this warning happen after 187ad460b841 ("mm/page_alloc: avoid page
allocator recursion with pagesets.lock held")? I ask because I see the
stack_depot_save in the warning.

-- =

Mel Gorman
SUSE Labs
--===============5326642018591138885==--

