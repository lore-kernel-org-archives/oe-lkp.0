Content-Type: multipart/mixed; boundary="===============0191513246150683059=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] 0f80799866: WARNING:at_fs/sysfs/file.c:#sysfs_emit
Date: Thu, 21 Oct 2021 18:06:48 +0200
Message-ID: <20211021160648.GD20319@twin.jikos.cz>
In-Reply-To: <20211021133538.GA16330@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0191513246150683059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 09:35:38PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 0f807998661ecadb74638c18cbaff8785bb46f8d ("[PATCH 1/2] btrfs: sys=
fs convert scnprintf and snprintf to use sysfs_emit")
> url: https://github.com/0day-ci/linux/commits/Anand-Jain/provide-fsid-in-=
sysfs-devinfo/20211019-082356
> base: https://git.kernel.org/cgit/linux/kernel/git/kdave/linux.git for-ne=
xt
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G

I wonder if it's related to the 32bit host, I don't see any crash.
--===============0191513246150683059==--

