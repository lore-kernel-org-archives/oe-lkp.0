Content-Type: multipart/mixed; boundary="===============3442137438717639212=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [iov_iter] 2418c34937: Initiating_system_reboot
Date: Wed, 28 Apr 2021 03:18:18 +0000
Message-ID: <YIjT+lZNn46VgscR@zeniv-ca.linux.org.uk>
In-Reply-To: <20210428023747.GA13086@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3442137438717639212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 10:37:47AM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 2418c34937c42a30ef4bccd923ad664a89e1fbd4 ("iov_iter: optimize iov=
_iter_advance() for iovec and kvec")
> https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git untested.iov_it=
er
> =

> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------+------------+------------+
> |                          | c5f070c68e | 2418c34937 |
> +--------------------------+------------+------------+
> | boot_failures            | 0          | 11         |
> | Initiating_system_reboot | 0          | 11         |
> +--------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
 =

Could you run it with soft_panic=3D1 in command line?  Alternatively, some
information about how to reproduce that without running hell knows what
as root on host would be very welcome; I can't imagine a single reason
for needing root to run qemu, to be honest...
--===============3442137438717639212==--

