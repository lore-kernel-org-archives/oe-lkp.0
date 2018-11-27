Content-Type: multipart/mixed; boundary="===============1961344779216194092=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Tue, 27 Nov 2018 19:17:27 +0100
Message-ID: <20181127181727.GD6923@dhcp22.suse.cz>
In-Reply-To: <CAHk-=wiq9eTzenOPh9srdB=Y8NcP6NJxh7o8Y5SfSjfqZ20-RA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1961344779216194092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 27-11-18 09:08:50, Linus Torvalds wrote:
> On Mon, Nov 26, 2018 at 10:24 PM kernel test robot
> <rong.a.chen@intel.com> wrote:
> >
> > FYI, we noticed a -61.3% regression of vm-scalability.throughput due
> > to commit ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for
> > MADV_HUGEPAGE mappings")
> =

> Well, that's certainly noticeable and not good.
> =

> Andrea, I suspect it might be causing fights with auto numa migration..
> =

> Lots more system time, but also look at this:
> =

> >    1122389 =C2=B1  9%     +17.2%    1315380 =C2=B1  4%  proc-vmstat.num=
a_hit
> >     214722 =C2=B1  5%     +21.6%     261076 =C2=B1  3%  proc-vmstat.num=
a_huge_pte_updates
> >    1108142 =C2=B1  9%     +17.4%    1300857 =C2=B1  4%  proc-vmstat.num=
a_local
> >     145368 =C2=B1 48%     +63.1%     237050 =C2=B1 17%  proc-vmstat.num=
a_miss
> >     159615 =C2=B1 44%     +57.6%     251573 =C2=B1 16%  proc-vmstat.num=
a_other
> >     185.50 =C2=B1 81%   +8278.6%      15542 =C2=B1 40%  proc-vmstat.num=
a_pages_migrated
> =

> Should the commit be reverted? Or perhaps at least modified?

Well, the commit is trying to revert to the behavior before
5265047ac301 because there are real usecases that suffered from that
change and bug reports as a result of that.

will-it-scale is certainly worth considering but it is an artificial
testcase. A higher NUMA miss rate is an expected side effect of the
patch because the fallback to a different NUMA node is more likely. The
__GFP_THISNODE side effect is basically introducing node-reclaim
behavior for THPages. Another thing is that there is no good behavior
for everybody. Reclaim locally vs. THP on a remote node is hard to
tell by default. We have discussed that at length and there were some
conclusions. One of them is that we need a numa policy to tell whether
a expensive localility is preferred over remote allocation.  Also we
definitely need a better pro-active defragmentation to allow larger
pages on a local node. This is a work in progress and this patch is a
stop gap fix.

-- =

Michal Hocko
SUSE Labs

--===============1961344779216194092==--

