Content-Type: multipart/mixed; boundary="===============6094677451217938671=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sunrpc] 6a7da2a288: kernel_BUG_at_lib/iov_iter.c
Date: Fri, 02 Nov 2018 00:50:12 +0000
Message-ID: <7958.1541119812@warthog.procyon.org.uk>
In-Reply-To: <20181102001633.GD24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6094677451217938671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> wrote:

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 6a7da2a288ce412d7ac117a2912a7b0d9104ee6d ("[RFC] sunrpc: Fix floo=
d of warnings from iov_iter_kvec in linux-next")
> url: https://github.com/0day-ci/linux/commits/Leonard-Crestez/sunrpc-Fix-=
flood-of-warnings-from-iov_iter_kvec-in-linux-next/20181101-070713
> base: git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu kvm64,+ssse3 -smp 2 =
-m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Ummm...  You can't just apply that commit to Trond's linux-next branch unle=
ss
that branch also includes the iov_iter changes from my afs-next branch.

Before those changes, ITER_KVEC is required:

	BUG_ON(!(direction & ITER_KVEC));

and after, it will be prohibited:

	WARN_ON(direction & ~(READ | WRITE));

The reason for this is that have yet more patches that split the direction
from the iov_iter::type member into their own member and turn the types int=
o a
simple integer sequence instead of a bit mask.

David

--===============6094677451217938671==--

