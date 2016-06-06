Content-Type: multipart/mixed; boundary="===============2525993050357283243=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Mon, 06 Jun 2016 12:51:36 +0300
Message-ID: <20160606095136.GA79951@black.fi.intel.com>
In-Reply-To: <20160606022724.GA26227@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2525993050357283243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2016 at 10:27:24AM +0800, kernel test robot wrote:
> =

> FYI, we noticed a -6.3% regression of unixbench.score due to commit:
> =

> commit 5c0a85fad949212b3e059692deecdeed74ae7ec7 ("mm: make faultaround pr=
oduce old ptes")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: unixbench
> on test machine: lituya: 16 threads Haswell High-end Desktop (i7-5960X 3.=
0G) with 16G memory
> with following parameters: cpufreq_governor=3Dperformance/nr_task=3D1/tes=
t=3Dshell8
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lituya/s=
hell8/unixbench
> =

> commit: =

>   4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
>   5c0a85fad949212b3e059692deecdeed74ae7ec7
> =

> 4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           3:4          -75%            :4     kmsg.DHCP/BOOTP:Reply_not_f=
or_us,op[#]xid[#]
>          %stddev     %change         %stddev
>              \          |                \  =

>      14321 =C2=B1  0%      -6.3%      13425 =C2=B1  0%  unixbench.score
>    1996897 =C2=B1  0%      -6.1%    1874635 =C2=B1  0%  unixbench.time.in=
voluntary_context_switches
>  1.721e+08 =C2=B1  0%      -6.2%  1.613e+08 =C2=B1  0%  unixbench.time.mi=
nor_page_faults
>     758.65 =C2=B1  0%      -3.0%     735.86 =C2=B1  0%  unixbench.time.sy=
stem_time
>     387.66 =C2=B1  0%      +5.4%     408.49 =C2=B1  0%  unixbench.time.us=
er_time
>    5950278 =C2=B1  0%      -6.2%    5583456 =C2=B1  0%  unixbench.time.vo=
luntary_context_switches

That's weird.

I don't understand why the change would reduce number or minor faults.
It should stay the same on x86-64. Rise of user_time is puzzling too.

Hm. Is reproducible? Across reboot?

-- =

 Kirill A. Shutemov

--===============2525993050357283243==--

