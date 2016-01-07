Content-Type: multipart/mixed; boundary="===============7435615739409677321=="
MIME-Version: 1.0
From: Heiko Carstens <heiko.carstens@de.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm/vmstat] 6cdb18ad98: -8.5% will-it-scale.per_thread_ops
Date: Thu, 07 Jan 2016 12:23:01 +0100
Message-ID: <20160107112301.GE4062@osiris>
In-Reply-To: <8760z7fl60.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7435615739409677321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2016 at 11:20:55AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 6cdb18ad98a49f7e9b95d538a0614cde827404b8 ("mm/vmstat: fix overflow=
 in mod_zone_page_state()")
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb42/prea=
d1/will-it-scale
> =

> commit: =

>   cc28d6d80f6ab494b10f0e2ec949eacd610f66e3
>   6cdb18ad98a49f7e9b95d538a0614cde827404b8
> =

> cc28d6d80f6ab494 6cdb18ad98a49f7e9b95d538a0 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    2733943 =C2=B1  0%      -8.5%    2502129 =C2=B1  0%  will-it-scale.per=
_thread_ops
>       3410 =C2=B1  0%      -2.0%       3343 =C2=B1  0%  will-it-scale.tim=
e.system_time
>     340.08 =C2=B1  0%     +19.7%     406.99 =C2=B1  0%  will-it-scale.tim=
e.user_time
>   69882822 =C2=B1  2%     -24.3%   52926191 =C2=B1  5%  cpuidle.C1-IVT.ti=
me
>     340.08 =C2=B1  0%     +19.7%     406.99 =C2=B1  0%  time.user_time
>     491.25 =C2=B1  6%     -17.7%     404.25 =C2=B1  7%  numa-vmstat.node0=
.nr_alloc_batch
>       2799 =C2=B1 20%     -36.6%       1776 =C2=B1  0%  numa-vmstat.node0=
.nr_mapped
>     630.00 =C2=B1140%    +244.4%       2169 =C2=B1  1%  numa-vmstat.node1=
.nr_inactive_anon

Hmm... this is odd. I did review all callers of mod_zone_page_state() and
couldn't find anything obvious that would go wrong after the int -> long
change.

I also tried the "pread1_threads" test case from
https://github.com/antonblanchard/will-it-scale.git

However the results seem to vary a lot after a reboot(!), at least on s390.

So I'm not sure if this is really a regression.


--===============7435615739409677321==--

