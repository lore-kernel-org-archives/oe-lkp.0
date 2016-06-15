Content-Type: multipart/mixed; boundary="===============0386085775825858368=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 19:07:43 +0200
Message-ID: <20160615170743.GB30309@pd.tnic>
In-Reply-To: <20160615145150.GH18662@thinpad.lan.raisama.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0386085775825858368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 11:51:50AM -0300, Eduardo Habkost wrote:
> We have that: it is "-feature" (or "feature=3Doff"). Features that
> can't be configured in the command-line should never appear to
> the guest unless you use "-cpu host,migratable=3Doff".
> =

> Something that allows disabling feature flags that still don't
> have a name in QEMU would be useful for "-cpu
> host,migratable=3Doff" only (and that's an interesting suggestion).
> But that's not the case here, I guess.

Right, and I'm wondering whether something like that would be useful for
testing purposes. For example, I want to enable a CPUID feature on the
command line and see how the kernel I'm booting in the guest reacts. And
that feature bit is not necessarily known to qemu/kvm.

Can we, say, pass whole CPUID leafs to qemu to report to the guest?
I.e., something like:

 ... -cpuid=3D0x5,eax=3D0x40,ebx=3D0xdeadbeef,ecx=3D0xcaffee ...

and so on.

Would that be interesting to add to qemu? I'd find something like that
very useful for testing kernels...

Thanks.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

--===============0386085775825858368==--

