Content-Type: multipart/mixed; boundary="===============4424199820676680047=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] dbbee9d5cd: WARNING:possible_circular_locking_dependency_detected
Date: Tue, 13 Jul 2021 15:59:41 +0100
Message-ID: <20210713145941.GG3809@techsingularity.net>
In-Reply-To: <20210713144057.GB28943@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4424199820676680047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 10:40:57PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: dbbee9d5cd83f9d0a29639e260516907ceb2ac3d ("mm/page_alloc: convert=
 per-cpu list protection to local_lock")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =


Thanks, this will ultimately be fixed by https://lore.kernel.org/r/20210713=
135625.7615-1-mgorman(a)techsingularity.net

-- =

Mel Gorman
SUSE Labs
--===============4424199820676680047==--

