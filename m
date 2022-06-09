Content-Type: multipart/mixed; boundary="===============8879801942045050125=="
MIME-Version: 1.0
From: Zhang Rui <rui.zhang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 6922110d15: suspend-stress.fail
Date: Thu, 09 Jun 2022 13:48:50 +0800
Message-ID: <ac80ed671fc2482524b9234c444d765e2f8d87f1.camel@intel.com>
In-Reply-To: <20220608054553.GA7499@1wt.eu>
List-Id: <oe-lkp.lists.linux.dev>

--===============8879801942045050125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2022-06-08 at 07:45 +0200, Willy Tarreau wrote:
> On Tue, Jun 07, 2022 at 05:47:30PM -0700, Jakub Kicinski wrote:
> > On Sun, 5 Jun 2022 22:39:35 +0800 kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-11):
> > > =

> > > commit: 6922110d152e56d7569616b45a1f02876cf3eb9f ("net:
> > > linkwatch: fix failure to restore device state across
> > > suspend/resume")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> > > master
> > > =

> > > in testcase: suspend-stress
> > > version: =

> > > with following parameters:
> > > =

> > > 	mode: freeze
> > > 	iterations: 10
> > > =

> > > =

> > > =

> > > on test machine: 4 threads Ivy Bridge with 4G memory
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for
> > > entire log/backtrace):
> > > =

> > > =

> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > =

> > > Suspend to freeze 1/10:
> > > Done
> > > Suspend to freeze 2/10:
> > > network not ready
> > > network not ready
> > > network not ready
> > > network not ready
> > > network not ready
> > > network not ready
> > > network not ready
> > > network not ready
> > > network not ready
> > > network not ready
> > > network not ready
> > > Done
> > =

> > What's the failure? I'm looking at this script:
> > =

> > https://github.com/intel/lkp-tests/blob/master/tests/suspend-stress
> > =

> > And it seems that we are not actually hitting any "exit 1" paths
> > here.


In our test, we do 10 back-to-back suspend iterations,

1. tell the server the machine is going to suspend
2. do suspend
3. resumed by rtc
4. check network availability
5. tell the server the machine is resumed, and update the local log to
the server
6. goto 1

As the test is done remotely, from server side, we only know that step
1 is done, the test machine may either hang in suspend, or lost network
connection after resume. The only way to bring it back on line is to do
a hard reset, but as we're using ramdisk, there is no log can tell us
which step the test stucks before reboot.

You can see the above log only when the network is already back.

The reason why we think it is a regression is that
after 10x10 suspend iterations (10 tests, each test is done after a
refresh boot, and each tests contains 10 suspend iterations)

With the first bad commit:
0/10 passed
with the head that contains the commit
1/10 passed
With the parent of the first bad commit or with the first bad commit
reverted,
10/10 passed

> =

> I'm not sure how the test has to be interpreted but one possible
> interpretation is that the link really takes time to re-appear and
> that prior to the fix, the link was believed to still be up since
> the event was silently lost during suspend, while now the link is
> correctly being reported as being down and something is waiting for
> it to be up again, as it possibly should. Thus it could be possible
> that the fix revealed an incorrect expectation in that test.

Just to be clear, the network is really up. That is why we can see this
log which is sent back from the test machine via network after resume.

thanks,
rui

--===============8879801942045050125==--

