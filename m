Content-Type: multipart/mixed; boundary="===============5648675608202649135=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm, compaction] e332f741a8: BUG:unable_to_handle_kernel
Date: Wed, 03 Apr 2019 08:09:29 +0100
Message-ID: <20190403070929.GR3189@techsingularity.net>
In-Reply-To: <20190403064200.GI20952@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5648675608202649135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2019 at 02:42:00PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: e332f741a8dd1ec9a6dc8aa997296ecbfe64323e ("mm, compaction: be sel=
ective about what pageblocks to clear skip hints")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: ltp
> with following parameters:
> =

> 	disk: 1HDD
> 	fs: xfs
> 	test: syscalls_part4
> =

> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =


There are fixes queued in Andrew's tree that should cover this.

-- =

Mel Gorman
SUSE Labs

--===============5648675608202649135==--

