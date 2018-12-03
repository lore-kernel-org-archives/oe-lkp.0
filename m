Content-Type: multipart/mixed; boundary="===============3564588892558581620=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 19:59:54 +0100
Message-ID: <20181203185954.GM31738@dhcp22.suse.cz>
In-Reply-To: <CAHk-=wgVL_sxXSbjYTiGhxp6+9wLQ9ZmSN+0R5PCF6_a9pQgWw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3564588892558581620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 03-12-18 10:45:35, Linus Torvalds wrote:
> On Mon, Dec 3, 2018 at 10:30 AM Michal Hocko <mhocko@kernel.org> wrote:
> >
> > I do not get it. 5265047ac301 which this patch effectively reverts has
> > regressed kvm workloads. People started to notice only later because
> > they were not running on kernels with that commit until later. We have
> > 4.4 based kernels reports. What do you propose to do for those people?
> =

> We have at least two patches that others claim to fix things.
> =

> You dismissed them and said "can't be done".

You are misinterpreting my words. I haven't dismissed anything. I do
recognize both usecases under discussion.

I have merely said that a better THP locality needs more work and during
the review discussion I have even volunteered to work on that. There
are other reclaim related fixes under work right now. All I am saying
is that MADV_TRANSHUGE having numa locality implications cannot satisfy
all the usecases and it is particurarly KVM that suffers from it.
-- =

Michal Hocko
SUSE Labs

--===============3564588892558581620==--

