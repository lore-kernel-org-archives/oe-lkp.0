Content-Type: multipart/mixed; boundary="===============8623183181721722202=="
MIME-Version: 1.0
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: lkp@lists.01.org
Subject: Re: [Input] 9290ec3cea: suspend_stress.fail
Date: Fri, 15 Nov 2019 11:29:40 -0800
Message-ID: <20191115192940.GT13374@dtor-ws>
In-Reply-To: <20191114094424.GF6910@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8623183181721722202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 05:44:25PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 9290ec3cea1dd9d312d1230825a75c798b670ea1 ("[PATCH v5 01/48] Input=
: introduce input_mt_report_slot_inactive")
> url: https://github.com/0day-ci/linux/commits/Jiada-Wang/atmel_mxt_ts-mis=
c/20191108-190609
> base: https://git.kernel.org/cgit/linux/kernel/git/xen/tip.git linux-next
> =

> in testcase: suspend_stress
> with following parameters:
> =

> 	mode: mem
> 	iterations: 10
> =

> =

> =

> on test machine: 8 threads KabyLake-r with 8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Is this reproducing reliably? I do not see dmesg attached so it is
unclear what input device(s) are connected to the system...

Thanks.

-- =

Dmitry
--===============8623183181721722202==--

