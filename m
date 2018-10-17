Content-Type: multipart/mixed; boundary="===============6664271097996477218=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/memory.c] 6558038e45: general_protection_fault:#[##]
Date: Wed, 17 Oct 2018 15:26:21 -0700
Message-ID: <20181017152621.7e716f4906f81c52c67d59c3@linux-foundation.org>
In-Reply-To: <20181017013600.GA16117@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6664271097996477218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Oct 2018 09:36:00 +0800 kernel test robot <rong.a.chen@intel.c=
om> wrote:

> FYI, we noticed the following commit (built with gcc-6):
> =

> commit: 6558038e4540a22ee4f99a5def74791189102bc0 ("mm/memory.c: recheck p=
age table entry with page table lock held")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
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

> on test machine: qemu-system-x86_64 -enable-kvm -cpu qemu64,+ssse3 -smp 4=
 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

mm-recheck-page-table-entry-with-page-table-lock-held-fix.patch ("mm:
fix the crash observed with syzkaller run") will most likely fix this. =

Was it applied during this testing?

--===============6664271097996477218==--

