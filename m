Content-Type: multipart/mixed; boundary="===============3142625677211653073=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] b191f9b106e: -8.8% netperf.time.minor_page_faults
Date: Wed, 01 Apr 2015 08:35:57 +0100
Message-ID: <20150401073557.GB3921@suse.de>
In-Reply-To: <1427858614.17170.102.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3142625677211653073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2015 at 11:23:34AM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit b191f9b106ea1a24a711dbebb2925d3313da5852 ("mm: numa: preserve PTE =
write permissions across a NUMA hinting fault")
> =

> =

> testbox/testcase/testparams: lkp-ne02/netperf/performance-300s-200%-TCP_S=
ENDFILE
> =

> bea66fbd11af1ca9  b191f9b106ea1a24a711dbebb2  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>      13115 =C2=B1  0%      -8.8%      11968 =C2=B1  0%  netperf.time.mino=
r_page_faults
>      65.63 =C2=B1  6%     -14.6%      56.05 =C2=B1  7%  netperf.time.user=
_time
>      65.63 =C2=B1  6%     -14.6%      56.05 =C2=B1  7%  time.user_time

Hmmm, is this a positive report? It looks like it -- fewer faults at
least. Lower user_time is ambiguous because the elapsed time is not
included in the report and netperf has variable time depending on
whether it can get a confident result or not.

--===============3142625677211653073==--

