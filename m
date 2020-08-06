Content-Type: multipart/mixed; boundary="===============4934817796243776856=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/copy_mc] a0ac629ebe: fio.read_iops -43.3% regression
Date: Thu, 06 Aug 2020 15:34:52 +0200
Message-ID: <20200806133452.GA2077191@gmail.com>
In-Reply-To: <20200803094257.GA23458@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4934817796243776856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <rong.a.chen@intel.com> wrote:

> Greeting,
> =

> FYI, we noticed a -43.3% regression of fio.read_iops due to commit:
> =

> =

> commit: a0ac629ebe7b3d248cb93807782a00d9142fdb98 ("x86/copy_mc: Introduce=
 copy_mc_generic()")
> url: https://github.com/0day-ci/linux/commits/Dan-Williams/Renovate-memcp=
y_mcsafe-with-copy_mc_to_-user-kernel/20200802-014046
> =

> =

> in testcase: fio-basic
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 256G memory
> with following parameters:

So this performance regression, if it isn't a spurious result, looks =

concerning. Is this expected?

Thanks,

	Ingo
--===============4934817796243776856==--

