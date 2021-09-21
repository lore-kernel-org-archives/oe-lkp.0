Content-Type: multipart/mixed; boundary="===============7159825511372441179=="
MIME-Version: 1.0
From: Sean Christopherson <seanjc@google.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 816be9e9be: kernel-selftests.kvm.smm_test.fail
Date: Tue, 21 Sep 2021 22:56:56 +0000
Message-ID: <YUpjOO3bq/SMFN7A@google.com>
In-Reply-To: <20210912155933.GI25450@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7159825511372441179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 816be9e9be8d2e19dcea35fbec06f00cd5749fed ("KVM: nVMX: Don't evalu=
ate "emulation required" on nested VM-Exit")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-d0cba0d1-1_20210907
> with following parameters:
> =

> 	group: kvm
> 	ucode: 0xe2
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 2=
8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

Maxim has a fix in the works.
--===============7159825511372441179==--

