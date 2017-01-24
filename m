Content-Type: multipart/mixed; boundary="===============8357987216108717287=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Tue, 24 Jan 2017 14:44:25 +0100
Message-ID: <20170124134424.GL6867@dhcp22.suse.cz>
In-Reply-To: <20170123012644.GD17561@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8357987216108717287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 23-01-17 09:26:44, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -11.1% regression of fsmark.files_per_sec due to commit:
> =

> =

> commit: 5e56dfbd837421b7fa3c6c06018c6701e2704917 ("mm, vmscan: consider e=
ligible zones in get_scan_count")
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

This is more than unexpected. This patch should be basically noop for
anything but CONFIG_HIGHMEM systems. And your config says this is 64b
kernel. Are those results reproducible? And could you try to compare
perf profiles before and after the patch.
-- =

Michal Hocko
SUSE Labs

--===============8357987216108717287==--

