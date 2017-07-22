Content-Type: multipart/mixed; boundary="===============0283087034957581559=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ksm] ef2271279c: kernel_BUG_at_mm/mmap.c
Date: Sat, 22 Jul 2017 15:20:38 +0200
Message-ID: <20170722132038.GH29716@redhat.com>
In-Reply-To: <20170721022446.GC4273@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0283087034957581559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2017 at 10:24:46AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: ef2271279c8ddc7a1ae688168b120a2b0bf3b463 ("ksm: introduce ksm_max=
_page_sharing per page deduplication limit")
> https://git.kernel.org/cgit/linux/kernel/git/andrea/aa.git master
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

> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 16bcd858c4 | ef2271279c |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 46         | 21         |
> | boot_failures                            | 0          | 23         |
> | kernel_BUG_at_mm/mmap.c                  | 0          | 23         |
> | invalid_opcode:#[##]                     | 0          | 23         |
> | EIP:unmapped_area_topdown                | 0          | 23         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 23         |
> +------------------------------------------+------------+------------+
> =

> =

> =

> [   36.299632] kernel BUG at mm/mmap.c:1968!
> [   36.299632] kernel BUG at mm/mmap.c:1968!

This one is unrelated to the commit above, it's a bug in upstream code
fixed by f4cb767d76cf7ee72f97dd76f6cfa6c76a5edc89.

Thanks,
Andrea

--===============0283087034957581559==--

