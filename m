Content-Type: multipart/mixed; boundary="===============7357098093540720093=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Thu, 26 Jan 2017 10:13:18 +0100
Message-ID: <20170126091317.GB6590@dhcp22.suse.cz>
In-Reply-To: <20170125042706.GL17561@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7357098093540720093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 25-01-17 12:27:06, Ye Xiaolong wrote:
> On 01/24, Michal Hocko wrote:
> >On Mon 23-01-17 09:26:44, kernel test robot wrote:
> >> =

> >> Greeting,
> >> =

> >> FYI, we noticed a -11.1% regression of fsmark.files_per_sec due to com=
mit:
> >> =

> >> =

> >> commit: 5e56dfbd837421b7fa3c6c06018c6701e2704917 ("mm, vmscan: conside=
r eligible zones in get_scan_count")
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ma=
ster
> >
> >This is more than unexpected. This patch should be basically noop for
> >anything but CONFIG_HIGHMEM systems. And your config says this is 64b
> >kernel. Are those results reproducible? And could you try to compare
> =

> Yes, the results are well reproducible, both the commit in question and i=
ts
> parent have ran for 4 times.
> =

> >perf profiles before and after the patch.
> =

> Here is the perf profiles, =


I do not see any reclaim path in the profile... Could you take a
snapshot of /proc/vmstat and /proc/zoneinfo before and after the test
please?

-- =

Michal Hocko
SUSE Labs

--===============7357098093540720093==--

