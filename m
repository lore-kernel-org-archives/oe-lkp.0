Content-Type: multipart/mixed; boundary="===============1107482936526779311=="
MIME-Version: 1.0
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: lkp@lists.01.org
Subject: Re: [tools] 6534770d6f: kernel_selftests.bpf.test_lwt_seg6local.fail
Date: Thu, 01 Nov 2018 11:18:49 -0700
Message-ID: <20181101111849.183d4383@cakuba.netronome.com>
In-Reply-To: <20181101032643.GB24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1107482936526779311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Nov 2018 11:26:44 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 6534770d6f176093b50896961107b2d545ef38f0 ("tools: bpf: fix BTF co=
de added twice to different trees")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

That's a fix to a merge commit, perhaps something before broke it?

> in testcase: kernel_selftests
> with following parameters:
> =

> 	group: kselftests-00
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 80 threads Skylake with 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> commit:
>   6b431d50d2a8acd1c418b998b856a055252ebc3a
>   6534770d6f176093b50896961107b2d545ef38f0
> =

> 6b431d50d2a8acd1 6534770d6f176093b508969611
> ---------------- --------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>         443:8        14689%        1618:8     dmesg.timestamp:last
>            :8          100%           8:8     kernel_selftests.bpf.test_l=
wt_seg6local.fail
>            :8          100%           8:8     kernel_selftests.bpf.test_l=
wt_seg6local.sh.fail
> =

> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Rong Chen


--===============1107482936526779311==--

