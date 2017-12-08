Content-Type: multipart/mixed; boundary="===============5333003894497149798=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, hugetlb] 2072949204: netperf.Throughput_tps -3.0% regression
Date: Fri, 08 Dec 2017 08:59:17 +0100
Message-ID: <20171208075917.GO20234@dhcp22.suse.cz>
In-Reply-To: <20171208031836.GN21779@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5333003894497149798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 08-12-17 11:18:36, kernel test robot wrote:
> =

> Greeting,
> =

> We noticed a -3.0% regression of netperf.Throughput_tps due to commit:
> =

> commit: 2072949204d67559cc591caec75124decdf1e4bc ("mm, hugetlb: remove hu=
gepages_treat_as_movable sysctl")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

This looks really like a false possitive. I fail to see how hugetlb can
have anything to do with netperf in general. Are there any hugetlb pages
allocated for this test?

-- =

Michal Hocko
SUSE Labs

--===============5333003894497149798==--

