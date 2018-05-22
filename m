Content-Type: multipart/mixed; boundary="===============5748958686364559571=="
MIME-Version: 1.0
From: Roopa Prabhu <roopa@cumulusnetworks.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [selftests] 3f45449746: kernel_selftests.net.fib_rule_tests.sh.fail
Date: Tue, 22 May 2018 09:01:56 -0700
Message-ID: <CAJieiUin2KX5-4qxT1jObpb-vMwH6azfEdgQj5i98T3JLz9r-A@mail.gmail.com>
In-Reply-To: <20180522051541.GF7714@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5748958686364559571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2018 at 10:15 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 3f454497465bb6b1533772900bb35fab1324e35e ("selftests: net: initia=
l fib rule tests")
> url: https://github.com/0day-ci/linux/commits/Roopa-Prabhu/ipv4-support-s=
port-dport-and-ip_proto-in-RTM_GETROUTE/20180518-051740
>
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
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> selftests: fib_rule_tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> selftests: Warning: file fib_rule_tests.sh is not executable, correct thi=
s.
> not ok 1..16 selftests: fib_rule_tests.sh [FAIL]
> make: Leaving directory '/usr/src/linux-selftests-x86_64-rhel-7.2-3f45449=
7465bb6b1533772900bb35fab1324e35e/tools/testing/selftests/net'
>
>

Thanks for the report. will fix

--===============5748958686364559571==--

