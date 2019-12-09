Content-Type: multipart/mixed; boundary="===============5127520353743768314=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [pipe] 3c0edea9b2: lmbench3.PIPE.bandwidth.MB/sec -17.0% regression
Date: Mon, 09 Dec 2019 09:55:59 +0100
Message-ID: <20191209085559.GA5868@dhcp22.suse.cz>
In-Reply-To: <20191208153949.GJ32275@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5127520353743768314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun 08-12-19 23:39:49, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -17.0% regression of lmbench3.PIPE.bandwidth.MB/sec due=
 to commit:
> =

> =

> commit: 3c0edea9b29f9be6c093f236f762202b30ac9431 ("pipe: Remove sync on w=
ake_ups")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Huh. How can something like that can even can get merged? No changelog,
no s-o-b?
-- =

Michal Hocko
SUSE Labs
--===============5127520353743768314==--

