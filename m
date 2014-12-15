Content-Type: multipart/mixed; boundary="===============1654646306159396393=="
MIME-Version: 1.0
From: Gu Zheng <guz.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [aio] 6098b45b32e: 2200.00% xfstests.generic.239.seconds
Date: Mon, 15 Dec 2014 10:57:53 +0800
Message-ID: <548E4E31.6050405@cn.fujitsu.com>
In-Reply-To: <1418605329.5745.141.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1654646306159396393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Huang,
On 12/15/2014 09:02 AM, Huang Ying wrote:

> FYI, we noticed the below changes on
> =

> commit 6098b45b32e6baeacc04790773ced9340601d511 ("aio: block exit_aio() u=
ntil all context requests are completed")

This patch added a wait step (which is lacked before) for all submitted aio
missions (iocbs) to complete in exit_aio(), so the cost-time increasing is
expected.

Thanks,
Gu

> =

> =

> testbox/testcase/testparams: vm-vp-2G/xfstests/4HDD-btrfs-generic-quick
> =

> 2ff396be602f10b5  6098b45b32e6baeacc04790773  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>      26352 =C2=B1  9%     -13.6%      22774 =C2=B1  1%  vmstat.system.cs
>      10342 =C2=B1  6%     -12.3%       9066 =C2=B1  0%  vmstat.system.in
>         37 =C2=B1  4%     -12.1%         32 =C2=B1  3%  time.percent_of_c=
pu_this_job_got
>       1197 =C2=B1  2%     -14.2%       1028 =C2=B1  0%  vmstat.io.bi
>      18470 =C2=B1  2%     -10.1%      16609 =C2=B1  1%  vmstat.io.bo
>        157 =C2=B1  3%     +13.7%        179 =C2=B1  0%  time.elapsed_time
> =

> vm-vp-2G: qemu-system-x86_64 -enable-kvm -cpu Penryn
> Memory: 2G
> =

>                           xfstests.generic.239.seconds
> =

>   30 ++-----------O------------------------------------------------------=
---+
>      |              O         O            O         O                   =
   |
>   25 ++                O                                                 =
   |
>      |  O O  O O            O    O O  O  O    O O  O                     =
   |
>      |                   O                                               =
   |
>   20 O+                                                                  =
   |
>      |                                                                   =
   |
>   15 ++                                                                  =
   |
>      |                                                                   =
   |
>   10 ++                                                                  =
   |
>      |                                                                   =
   |
>      |                                                                   =
   |
>    5 ++                                                                  =
   |
>      |                                                                   =
   |
>    0 *+-*-*--*-*--*-*--*-*--*-*--*-*--*--*-*--*-*--*-*--*-*--*-*--*-*--*-=
*--*
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

> 	apt-get install ruby ruby-oj
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Fengguang
> =

> =

> =

> =

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =




--===============1654646306159396393==--

