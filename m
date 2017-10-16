Content-Type: multipart/mixed; boundary="===============0118536063768074536=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/topology] 379a4bb988: dmesg.WARNING:at_arch/x86/events/intel/uncore.c:#uncore_change_type_ctx
Date: Mon, 16 Oct 2017 09:50:08 +0200
Message-ID: <20171016075008.n4v5z3qsxpcg6g3c@gmail.com>
In-Reply-To: <20171012064439.GN26196@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0118536063768074536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <xiaolong.ye@intel.com> wrote:

> =

> FYI, we noticed the following commit (built with gcc-6):
> =

> commit: 379a4bb9880608931642e1b4208380468d347b84 ("x86/topology: Avoid wa=
sting 128k for package id array")
> url: https://github.com/0day-ci/linux/commits/Prarit-Bhargava/x86-smpboot=
-Cleanup-logical-package-ID/20170929-202113
> =

> =

> in testcase: ltp
> with following parameters:
> =

> 	test: cpuhotplug
> =

> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> =

> =

> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> kern  :warn  : [  119.686133] ------------[ cut here ]------------
> kern  :warn  : [  119.692171] WARNING: CPU: 0 PID: 13 at arch/x86/events/=
intel/uncore.c:1058 uncore_change_type_ctx+0xf0/0x100

If this warning is caused by these patches then the warning should be fixed=
 too, =

before we can apply the patches.

Thanks,

	Ingo

--===============0118536063768074536==--

