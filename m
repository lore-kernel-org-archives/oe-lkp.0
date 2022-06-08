Content-Type: multipart/mixed; boundary="===============4622932657307935951=="
MIME-Version: 1.0
From: Willy Tarreau <w@1wt.eu>
To: lkp@lists.01.org
Subject: Re: [net] 6922110d15: suspend-stress.fail
Date: Wed, 08 Jun 2022 07:45:53 +0200
Message-ID: <20220608054553.GA7499@1wt.eu>
In-Reply-To: <20220607174730.018fe58e@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4622932657307935951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2022 at 05:47:30PM -0700, Jakub Kicinski wrote:
> On Sun, 5 Jun 2022 22:39:35 +0800 kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-11):
> > =

> > commit: 6922110d152e56d7569616b45a1f02876cf3eb9f ("net: linkwatch: fix =
failure to restore device state across suspend/resume")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: suspend-stress
> > version: =

> > with following parameters:
> > =

> > 	mode: freeze
> > 	iterations: 10
> > =

> > =

> > =

> > on test machine: 4 threads Ivy Bridge with 4G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > Suspend to freeze 1/10:
> > Done
> > Suspend to freeze 2/10:
> > network not ready
> > network not ready
> > network not ready
> > network not ready
> > network not ready
> > network not ready
> > network not ready
> > network not ready
> > network not ready
> > network not ready
> > network not ready
> > Done
> =

> What's the failure? I'm looking at this script:
> =

> https://github.com/intel/lkp-tests/blob/master/tests/suspend-stress
> =

> And it seems that we are not actually hitting any "exit 1" paths here.

I'm not sure how the test has to be interpreted but one possible
interpretation is that the link really takes time to re-appear and
that prior to the fix, the link was believed to still be up since
the event was silently lost during suspend, while now the link is
correctly being reported as being down and something is waiting for
it to be up again, as it possibly should. Thus it could be possible
that the fix revealed an incorrect expectation in that test.

Willy
--===============4622932657307935951==--

