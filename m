Content-Type: multipart/mixed; boundary="===============0995961198309002047=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm, memcg] 849400b8b0: WARNING: CPU: 0 PID: 1 at mm/memcontrol.c:998 mem_cgroup_update_lru_size+0x220/0x297
Date: Fri, 15 Jul 2016 08:50:06 +0100
Message-ID: <20160715075006.GN9806@techsingularity.net>
In-Reply-To: <20160715014918.GA6978@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0995961198309002047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 09:49:18AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 849400b8b0dfec6b7a681d62f45ade0a85858e46 ("mm, memcg: move memcg l=
imit enforcement from zones to nodes")
> =


Thanks. This one is known and a candidate patch has been tested by
Minchan. A follow-up series is in progress.

-- =

Mel Gorman
SUSE Labs

--===============0995961198309002047==--

