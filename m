Content-Type: multipart/mixed; boundary="===============5238884757422962633=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [btrfs] beeeccca9b: WARNING:at_mm/util.c:#kvmalloc_node
Date: Wed, 31 May 2017 08:51:28 +0200
Message-ID: <20170531065128.GB3853@dhcp22.suse.cz>
In-Reply-To: <20170531063033.GC1795@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5238884757422962633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 31-05-17 14:30:33, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: beeeccca9bebcec386cc31c250cff8a06cf27034 ("btrfs: Use kvzalloc in=
stead of kzalloc/vmalloc in alloc_bitmap")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

I have intentionally skipped alloc_bitmap because it relies on GFP_NOFS.
This doesn't work properly when falling back to vmalloc and that is what
the warning reported here says. I believe the right approach is to check
whether the GFP_NOFS is _really_ needed and document why if yes.
Otherwise drop the NOFS part in one patch with the explanation and
convert it to kvmalloc in a separate patch.

-- =

Michal Hocko
SUSE Labs

--===============5238884757422962633==--

