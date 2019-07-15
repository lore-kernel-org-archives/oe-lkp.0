Content-Type: multipart/mixed; boundary="===============5524406523742117829=="
MIME-Version: 1.0
From: Mahesh Bandewar (महेश बंडेवार) <maheshb@google.com>
To: lkp@lists.01.org
Subject: Re: [blackhole_dev] 509e56b37c: kernel_selftests.net.test_blackhole_dev.sh.fail
Date: Sun, 14 Jul 2019 22:01:12 -0700
Message-ID: <CAF2d9jheTrhh2e_PBqWOTy6gy-vVVZMyj3_dM1hkV1NP+-7r6Q@mail.gmail.com>
In-Reply-To: <20190712064850.GC20848@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5524406523742117829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2019 at 11:48 PM kernel test robot
<rong.a.chen@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 509e56b37cc32c9b5fc2be585c25d1e60d6a1d73 ("blackhole_dev: add a s=
elftest")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.=
git master
>
> in testcase: kernel_selftests
> with following parameters:
>
>         group: kselftests-02
>
> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
>
> # selftests: net: test_blackhole_dev.sh
> # test_blackhole_dev: [FAIL]
> not ok 13 selftests: net: test_blackhole_dev.sh
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.2.0-rc6-01701-g509e56b37cc32c .config
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare=
 modules_prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
unfortunately, I could not get this to work as my qemu instance just
hangs. Will spend some more time on this later.
However, If you have identified config related issue, please state
that so that it would be helpful to fix it faster.

thanks,
--mahesh..
>
>
> Thanks,
> Rong Chen
>

--===============5524406523742117829==--

