Content-Type: multipart/mixed; boundary="===============8115252952468819458=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 19:30:50 +0100
Message-ID: <20181203183050.GL31738@dhcp22.suse.cz>
In-Reply-To: <CAHk-=whrfDw4yV4h2ijbX3vpXf5m4hzJ5pGX7_v6pU31RGib-g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8115252952468819458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 03-12-18 10:19:55, Linus Torvalds wrote:
> On Mon, Dec 3, 2018 at 10:15 AM Michal Hocko <mhocko@kernel.org> wrote:
> >
> > The thing is that there is no universal win here. There are two
> > different types of workloads and we cannot satisfy both.
> =

> Ok, if that's the case, then I'll just revert the commit.
> =

> Michal, our rules are very simple: we don't generate regressions. It's
> better to have old reliable behavior than to start creating *new*
> problems.

I do not get it. 5265047ac301 which this patch effectively reverts has
regressed kvm workloads. People started to notice only later because
they were not running on kernels with that commit until later. We have
4.4 based kernels reports. What do you propose to do for those people?
Let me remind that it was David who introduced 5265047ac301, presumably
because his workload benefits from it.
-- =

Michal Hocko
SUSE Labs

--===============8115252952468819458==--

