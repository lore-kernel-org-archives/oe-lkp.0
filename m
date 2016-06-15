Content-Type: multipart/mixed; boundary="===============3405155752630718992=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 16:53:01 +0200
Message-ID: <0cab2e01-6345-387d-d5ca-cafc62bc3b2e@redhat.com>
In-Reply-To: <20160615142532.GE32588@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3405155752630718992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 15/06/2016 16:25, Borislav Petkov wrote:
> As to the error message, dear LKP friends, it happens because -cpu kvm64
> on native Intel hands in CPUID bits of the host, i.e., if you do this in
> the guest:
> =

> $ grep epb /proc/cpuinfo
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx lm constant_tsc nopl =
eagerfpu pni cx16 x2apic hypervisor epb
> =

> you should have "epb" there too which is among those bits.

Hmm, no, it doesn't work like that.

EPB is bit 3 of CPUID[6].ECX.  Under KVM you should only ever see bit 2
of EAX set in that leaf (ARAT).

> I can reproduce the same issue on an AMD host too by booting my guest
> with
> =

> "-cpu kvm64,vendor=3DGenuineIntel"

I cannot reproduce it with 4.6.0-rc3 in the (Fedora 22 AMD) host and
4.7.0-rc2 in the (Fedora 21) guest.  QEMU is 2.4.1.

> Paolo, Eduardo, question: can we hide certain CPUID bits from the guest
> when booting with -cpu kvm64?
> =

> In general, is there a way I can set or clear arbitrary CPUID bits so
> that the guest sees what I want it to see?
> =

> And I don't mean the predefined CPUID flags which you toggle with "+" or
> "-" followed by flag name. Because -cpu kvm64,-epb doesn't work.

It doesn't work because QEMU has no idea of what EPB even is.  That bit
really shouldn't be set.

Can you bounce me the original report?

Paolo

--===============3405155752630718992==--

