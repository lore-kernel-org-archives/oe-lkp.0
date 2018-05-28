Content-Type: multipart/mixed; boundary="===============9216722471830525400=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, memcontrol] 309fe96bfc: vm-scalability.throughput +23.0% improvement
Date: Mon, 28 May 2018 14:03:18 +0200
Message-ID: <20180528120318.GB27180@dhcp22.suse.cz>
In-Reply-To: <20180528114019.GF9904@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============9216722471830525400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 28-05-18 19:40:19, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a +23.0% improvement of vm-scalability.throughput due to =
commit:
> =

> =

> commit: 309fe96bfc0ae387f53612927a8f0dc3eb056efd ("mm, memcontrol: implem=
ent memory.swap.events")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

This doesn't make any sense to me. The patch merely adds an accounting.
It doesn't optimize anything. So I strongly suspect the result is just
misleading or the test (environment) misconfigured. Not the first time
I am seeing something like that I am afraid.

-- =

Michal Hocko
SUSE Labs

--===============9216722471830525400==--

