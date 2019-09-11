Content-Type: multipart/mixed; boundary="===============5209530017260744935=="
MIME-Version: 1.0
From: Ido Schimmel <idosch@mellanox.com>
To: lkp@lists.01.org
Subject: Re: [ipv6] d5382fef70: kernel_selftests.net.fib_tests.sh.fail
Date: Wed, 11 Sep 2019 11:09:24 +0000
Message-ID: <20190911110921.GA18429@splinter>
In-Reply-To: <20190911095121.GU15734@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5209530017260744935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2019 at 05:51:21PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: d5382fef70ce273608d6fc652c24f075de3737ef ("ipv6: Stop sending in-=
kernel notifications for each nexthop")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
> =

> in testcase: kernel_selftests
> with following parameters:
> =

> 	group: kselftests-02
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 1=
6G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> # selftests: net: fib_tests.sh

...

> # Tests passed: 137
> # Tests failed:  12
> not ok 13 selftests: net: fib_tests.sh

Thanks for the report, but I can't reproduce this. Used your attached
config and booted a kernel with the HEAD you mentioned:

$ uname -r
5.2.0-rc5-01201-gd5382fef70ce

$ ./fib_tests.sh
...
Tests passed: 150
Tests failed:   0

Also tested: net, net-next, master

All look fine. Plus, I'm pretty sure I ran this test before initially
submitting the patchset.

Can you reliably reproduce these failures on current kernels or is this
some random failure you noticed while testing the mentioned commit?

Thanks

--===============5209530017260744935==--

