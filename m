Content-Type: multipart/mixed; boundary="===============6485958209213866113=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] bae58218d8: WARNING:at_mm/page_alloc.c:#drain_all_pages
Date: Thu, 16 Mar 2017 09:28:38 +0100
Message-ID: <20170316082836.GD30501@dhcp22.suse.cz>
In-Reply-To: <20170316023849.GE4477@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6485958209213866113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 16-03-17 10:38:49, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: bae58218d80c6beffd5c96c0fcae372a0e63ca32 ("mm: move pcp and lru-p=
cp draining into single wq")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

Could you test with
http://lkml.kernel.org/r/20170315164021.28532-1-mhocko(a)kernel.org
applied?
-- =

Michal Hocko
SUSE Labs

--===============6485958209213866113==--

