Content-Type: multipart/mixed; boundary="===============6063820873960403402=="
MIME-Version: 1.0
From: Roopa Prabhu <roopa@cumulusnetworks.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [net] 69d73ea95c: kernel_selftests.net.fib-onlink-tests.sh.fail
Date: Wed, 09 May 2018 10:46:35 -0700
Message-ID: <CAJieiUhOJ+VW=rfbQwvL3jsgnsu9-b8ECi2vF-oicyfPBur9wQ@mail.gmail.com>
In-Reply-To: <20180508052909.GJ22317@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6063820873960403402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 7, 2018 at 10:29 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 69d73ea95c7cf323f92234e7c4aca2fbfa9a2208 ("net: fib_rules: add ex=
tack support")
> url: https://github.com/0day-ci/linux/commits/Roopa-Prabhu/fib-rules-exta=
ck-support/20180423-115437
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
> on test machine: 8 threads Intel(R) Core(TM) i7-2600K CPU @ 3.40GHz with =
8G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> selftests: fib-onlink-tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> ########################################
> Configuring interfaces
> RTNETLINK answers: Invalid argument
> not ok 1..12 selftests:  fib-onlink-tests.sh [FAIL]
>
>


Thanks for reporting.

This should be fixed by
9c20b9372fba "net: fib_rules: fix l3mdev netlink attr processing"

--===============6063820873960403402==--

