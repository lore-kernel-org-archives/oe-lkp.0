Content-Type: multipart/mixed; boundary="===============0895226667438550193=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Tue, 27 Nov 2018 09:08:50 -0800
Message-ID: <CAHk-=wiq9eTzenOPh9srdB=Y8NcP6NJxh7o8Y5SfSjfqZ20-RA@mail.gmail.com>
In-Reply-To: <20181127062503.GH6163@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0895226667438550193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2018 at 10:24 PM kernel test robot
<rong.a.chen@intel.com> wrote:
>
> FYI, we noticed a -61.3% regression of vm-scalability.throughput due
> to commit ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for
> MADV_HUGEPAGE mappings")

Well, that's certainly noticeable and not good.

Andrea, I suspect it might be causing fights with auto numa migration..

Lots more system time, but also look at this:

>    1122389 =C2=B1  9%     +17.2%    1315380 =C2=B1  4%  proc-vmstat.numa_=
hit
>     214722 =C2=B1  5%     +21.6%     261076 =C2=B1  3%  proc-vmstat.numa_=
huge_pte_updates
>    1108142 =C2=B1  9%     +17.4%    1300857 =C2=B1  4%  proc-vmstat.numa_=
local
>     145368 =C2=B1 48%     +63.1%     237050 =C2=B1 17%  proc-vmstat.numa_=
miss
>     159615 =C2=B1 44%     +57.6%     251573 =C2=B1 16%  proc-vmstat.numa_=
other
>     185.50 =C2=B1 81%   +8278.6%      15542 =C2=B1 40%  proc-vmstat.numa_=
pages_migrated

Should the commit be reverted? Or perhaps at least modified?

                     Linus

--===============0895226667438550193==--

