Content-Type: multipart/mixed; boundary="===============5003300865077585989=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [smp] b2a02fc43a: suspend-stress.fail
Date: Wed, 10 Jun 2020 11:50:54 +0200
Message-ID: <20200610095054.GF2531@hirez.programming.kicks-ass.net>
In-Reply-To: <20200610083502.GF12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5003300865077585989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 04:35:02PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: b2a02fc43a1f40ef4eb2fb2b06357382608d4d84 ("smp: Optimize send_cal=
l_function_single_ipi()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: suspend-stress
> with following parameters:
> =

> 	mode: freeze
> 	iterations: 10
> =

> =

> =

> on test machine: 2 threads Broxton with 4G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> the result of this commit:
> =

> test started

No dmesg output? No splat?
--===============5003300865077585989==--

