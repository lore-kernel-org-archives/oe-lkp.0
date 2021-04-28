Content-Type: multipart/mixed; boundary="===============7519921028586385247=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [iov_iter] 2418c34937: Initiating_system_reboot
Date: Wed, 28 Apr 2021 04:32:44 +0000
Message-ID: <YIjlbF/F9Y/5YOzt@zeniv-ca.linux.org.uk>
In-Reply-To: <20210428023747.GA13086@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7519921028586385247==
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

Could you try https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git for=
-lkp
on the same test and see what (if anything) gets spewed into dmesg?
--===============7519921028586385247==--

