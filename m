Content-Type: multipart/mixed; boundary="===============1126962325572135946=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] f5caf621ee: PANIC:double_fault
Date: Thu, 28 Sep 2017 09:59:07 +0200
Message-ID: <20170928075907.bpxlop6bq4bn54sk@gmail.com>
In-Reply-To: <20170928074758.GS17200@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1126962325572135946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <xiaolong.ye@intel.com> wrote:

> =

> FYI, we noticed the following commit:
> =

> commit: f5caf621ee357279e759c0911daf6d55c7d36f03 ("x86/asm: Fix inline as=
m call constraints for Clang")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-----------------------------------------+------------+------------+
> |                                         | 0d0970eef3 | f5caf621ee |
> +-----------------------------------------+------------+------------+
> | boot_successes                          | 9          | 4          |
> | boot_failures                           | 0          | 4          |
> | PANIC:double_fault                      | 0          | 4          |
> | Kernel_panic-not_syncing:Machine_halted | 0          | 4          |
> +-----------------------------------------+------------+------------+

I think a key piece of information is that the test is using GCC 4.4:

        export compiler=3D'gcc-4.4'

... which is pretty old compared to what gets tested typically.

GCC 4.4 was released in 2009 (!), the last minor update of 4.4.7 was 5 year=
s ago.

Thanks,

	Ingo

--===============1126962325572135946==--

