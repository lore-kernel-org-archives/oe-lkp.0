Content-Type: multipart/mixed; boundary="===============5541893845665311560=="
MIME-Version: 1.0
From: Artem Savkov <asavkov@redhat.com>
To: lkp@lists.01.org
Subject: Re: [net] 6ef3f95797: UBSAN:shift-out-of-bounds_in_kernel/time/timer.c
Date: Sat, 02 Apr 2022 09:11:09 +0200
Message-ID: <Ykf3DZ4VJQ0yLJss@sparkplug.usersys.redhat.com>
In-Reply-To: <20220402030939.GA19395@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5541893845665311560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 02, 2022 at 11:09:40AM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 6ef3f95797546781829db3bb6228c9990ba1d49f ("[PATCH v3 2/2] net: ma=
ke tcp keepalive timer upper bound")
> url: https://github.com/intel-lab-lkp/linux/commits/Artem-Savkov/timer-ad=
d-a-function-to-adjust-timeouts-to-be-upper-bound/20220330-172140
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git b166e52541=
f2357ce126a92ce1d9a580fdca719d
> patch link: https://lore.kernel.org/netdev/20220330082046.3512424-3-asavk=
ov(a)redhat.com
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-a17aac1b-1_20220328
> with following parameters:
> =

> 	group: tc-testing
> 	ucode: 0xec
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

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [  158.913672][    C1] UBSAN: shift-out-of-bounds in kernel/time/timer.c:=
584:32
> [  158.922603][    C1] shift exponent -3 is negative

This is caused by LVL_START(0). Levels 0 and 1 need to be handled
separately to insure we don't end up with negative values.

-- =

 Artem

--===============5541893845665311560==--

