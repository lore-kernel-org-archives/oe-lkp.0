Content-Type: multipart/mixed; boundary="===============6999309360727832167=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] cca2ae2c00: aim7.jobs-per-min -35.9% regression
Date: Fri, 31 May 2019 12:42:40 +0200
Message-ID: <e9669b39-d8ca-a2cd-fc8a-237aac648501@arm.com>
In-Reply-To: <20190531055923.GD22325@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6999309360727832167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 5/31/19 7:59 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -35.9% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: cca2ae2c00b5fc7893f1a184d822812ee3425b7e ("sched/fair: Replace so=
urce_load() & target_load() w/ weighted_cpuload()")
> git://linux-arm.org/linux-de.git upstream/rem_rq_load
> =

> in testcase: aim7
> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz wit=
h 384G memory
> with following parameters:
> =

> 	disk: 1BRD_48G
> 	fs: xfs
> 	test: creat-clo
> 	load: 1500
> 	cpufreq_governor: performance

This patch had a bug which was discovered on LKML by Hillf Danton.

https://lore.kernel.org/lkml/63ee8775-f159-e172-15f4-2ddf941870ee(a)arm.com

I force pushed an updated linux-arm.org/linux-de.git upstream/rem_rq_load.

On LKML, the maintainer fixed this issue before taking this patch.

Many thanks for providing this test service!

-- Dietmar

[...]


--===============6999309360727832167==--

