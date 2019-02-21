Content-Type: multipart/mixed; boundary="===============6446019431299134767=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [bpf] 568f196756: BUG:assuming_atomic_context_at_kernel/seccomp.c
Date: Thu, 21 Feb 2019 14:39:27 +0100
Message-ID: <cdd8143b-7719-b51e-5a6a-6bdc065cc773@iogearbox.net>
In-Reply-To: <20190221133556.eqzclahgngq53s64@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6446019431299134767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/21/2019 02:35 PM, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 568f196756ad9fe2b49c46bbf6a9de1b190438b4 ("bpf: check that BPF pr=
ograms run with preemption disabled")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 2G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Fyi, false positive and already fixed in bpf-next.

(https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?i=
d=3D435b3ff5b08a99a15647be32735abf8db66cea9a)

--===============6446019431299134767==--

