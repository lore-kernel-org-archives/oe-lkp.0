Content-Type: multipart/mixed; boundary="===============3344352001747988536=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@suse.com>
To: lkp@lists.01.org
Subject: Re: 885b89de99 ("fs: distinguish between user initiated freeze and kernel initiated freeze"): WARNING:at_kernel/locking/lockdep.c:#__lockdep_init_map
Date: Thu, 30 Nov 2017 03:07:42 +0100
Message-ID: <20171130020742.GB729@wotan.suse.de>
In-Reply-To: <20171130015833.j5efmsu7pmgbrutb@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3344352001747988536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 09:58:33AM +0800, Fengguang Wu wrote:
> =

> Hi Luis,
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 885b89de99e4ebb34b0bfabf1e2e941fb80ff702 ("fs: distinguish betwee=
n user initiated freeze and kernel initiated freeze")
> https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git 201711=
28-fs-freeze
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Fixed, thanks!

  Luis

--===============3344352001747988536==--

