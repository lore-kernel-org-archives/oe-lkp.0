Content-Type: multipart/mixed; boundary="===============6055647803906869755=="
MIME-Version: 1.0
From: Eduardo Habkost <ehabkost@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 11:51:50 -0300
Message-ID: <20160615145150.GH18662@thinpad.lan.raisama.net>
In-Reply-To: <20160615142532.GE32588@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============6055647803906869755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 04:25:32PM +0200, Borislav Petkov wrote:
[...]
> =

> As to the error message, dear LKP friends, it happens because -cpu kvm64
> on native Intel hands in CPUID bits of the host, i.e., if you do this in
> the guest:
> =

> $ grep epb /proc/cpuinfo
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx lm constant_tsc nopl =
eagerfpu pni cx16 x2apic hypervisor epb
> 					  ^^^
> =

> you should have "epb" there too which is among those bits.

It shouldn't. -cpu kvm64 should give exactly the same set of
CPUID bits on every host (unless you see "missing feature"
warnings. "-cpu kvm64,enforce" would be even more strict and
refuse to start if any feature is missing).

> =

> I can reproduce the same issue on an AMD host too by booting my guest
> with
> =

> "-cpu kvm64,vendor=3DGenuineIntel"
> =

> Paolo, Eduardo, question: can we hide certain CPUID bits from the guest
> when booting with -cpu kvm64?
> =

> In general, is there a way I can set or clear arbitrary CPUID bits so
> that the guest sees what I want it to see?
> =

> And I don't mean the predefined CPUID flags which you toggle with "+" or
> "-" followed by flag name. Because -cpu kvm64,-epb doesn't work.

If -cpu kvm64,-epb doesn't work, -cpu kvm64 is not supposed to
expose ebp to the guest in the first place.

CPUID[6].ECX, specifically, is hardcoded to 0 in QEMU.

> =

> Is there a way to make this work or should we hack it into qemu so that
> we are able to do that? I.e., something like
> =

> -cpu=3Dkvm64,cpuid=3Dleaf6_ecx_bit3=3D0,...
> =

> or something smarter. But you get the idea...

We have that: it is "-feature" (or "feature=3Doff"). Features that
can't be configured in the command-line should never appear to
the guest unless you use "-cpu host,migratable=3Doff".

Something that allows disabling feature flags that still don't
have a name in QEMU would be useful for "-cpu
host,migratable=3Doff" only (and that's an interesting suggestion).
But that's not the case here, I guess.

-- =

Eduardo

--===============6055647803906869755==--

