Content-Type: multipart/mixed; boundary="===============3320193571228145740=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] 43993977ba: +88% OOM possibility
Date: Thu, 29 Oct 2015 15:24:40 +0100
Message-ID: <20151029142440.GE23598@dhcp22.suse.cz>
In-Reply-To: <87oafjpnb1.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3320193571228145740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 28-10-15 13:36:02, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 43993977baecd838d66ccabc7f682342fc6ff635 ("mm, page_alloc: disting=
uish between being unable to sleep, unwilling to sleep and avoiding waking =
kswapd")
> =

> We found the OOM possibility increased 88% in a virtual machine with 1G m=
emory.

Could you provide dmesg output from this test?

Thanks!
-- =

Michal Hocko
SUSE Labs

--===============3320193571228145740==--

