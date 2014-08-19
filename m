Content-Type: multipart/mixed; boundary="===============7391660118116112054=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] f7b5d647946: -3.0% dbench.throughput-MB/sec
Date: Tue, 19 Aug 2014 15:34:28 +0100
Message-ID: <20140819143428.GC10146@suse.de>
In-Reply-To: <20140819044134.GB8798@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7391660118116112054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 12:41:34PM +0800, Fengguang Wu wrote:
> Hi Mel,
> =

> We noticed a minor dbench throughput regression on commit
> f7b5d647946aae1647bf5cd26c16b3a793c1ac49 ("mm: page_alloc: abort fair
> zone allocation policy when remotes nodes are encountered").
> =

> testcase: ivb44/dbench/100%
> =

> bb0b6dffa2ccfbd  f7b5d647946aae1647bf5cd26
> ---------------  -------------------------
>      25692 =C2=B1 0%      -3.0%      24913 =C2=B1 0%  dbench.throughput-M=
B/sec
>    6974259 =C2=B1 6%     -12.1%    6127616 =C2=B1 0%  meminfo.DirectMap2M
>      18.43 =C2=B1 0%      -4.6%      17.59 =C2=B1 0%  turbostat.RAM_W
>       9302 =C2=B1 0%      -3.6%       8965 =C2=B1 1%  time.user_time
>    1425791 =C2=B1 1%      -2.0%    1396598 =C2=B1 0%  time.involuntary_co=
ntext_switches
> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =


DirectMap2M changing is a major surprise and doesn't make sense for this
machine. Did the amount of memory in the machine change between two
tests?

-- =

Mel Gorman
SUSE Labs

--===============7391660118116112054==--

