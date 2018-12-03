Content-Type: multipart/mixed; boundary="===============1634622671919644128=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 10:45:35 -0800
Message-ID: <CAHk-=wgVL_sxXSbjYTiGhxp6+9wLQ9ZmSN+0R5PCF6_a9pQgWw@mail.gmail.com>
In-Reply-To: <20181203183050.GL31738@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1634622671919644128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2018 at 10:30 AM Michal Hocko <mhocko@kernel.org> wrote:
>
> I do not get it. 5265047ac301 which this patch effectively reverts has
> regressed kvm workloads. People started to notice only later because
> they were not running on kernels with that commit until later. We have
> 4.4 based kernels reports. What do you propose to do for those people?

We have at least two patches that others claim to fix things.

You dismissed them and said "can't be done".

As a result, I'm not really interested in this discussion.

                Linus

--===============1634622671919644128==--

