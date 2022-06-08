Content-Type: multipart/mixed; boundary="===============0243371254639730519=="
MIME-Version: 1.0
From: Jakub Kicinski <kuba@kernel.org>
To: lkp@lists.01.org
Subject: Re: [net] 6922110d15: suspend-stress.fail
Date: Tue, 07 Jun 2022 17:47:30 -0700
Message-ID: <20220607174730.018fe58e@kernel.org>
In-Reply-To: <20220605143935.GA27576@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0243371254639730519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 5 Jun 2022 22:39:35 +0800 kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 6922110d152e56d7569616b45a1f02876cf3eb9f ("net: linkwatch: fix fa=
ilure to restore device state across suspend/resume")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: suspend-stress
> version: =

> with following parameters:
> =

> 	mode: freeze
> 	iterations: 10
> =

> =

> =

> on test machine: 4 threads Ivy Bridge with 4G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> Suspend to freeze 1/10:
> Done
> Suspend to freeze 2/10:
> network not ready
> network not ready
> network not ready
> network not ready
> network not ready
> network not ready
> network not ready
> network not ready
> network not ready
> network not ready
> network not ready
> Done

What's the failure? I'm looking at this script:

https://github.com/intel/lkp-tests/blob/master/tests/suspend-stress

And it seems that we are not actually hitting any "exit 1" paths here.
--===============0243371254639730519==--

