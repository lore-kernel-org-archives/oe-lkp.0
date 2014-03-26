Content-Type: multipart/mixed; boundary="===============4812749378632501924=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] BUG: unable to handle kernel NULL pointer dereference at 00000000000002b0
Date: Wed, 26 Mar 2014 16:46:48 +0100
Message-ID: <5332F668.8080601@redhat.com>
In-Reply-To: <20140326145701.GA27938@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4812749378632501924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Il 26/03/2014 15:57, Fengguang Wu ha scritto:
>>> > >
>>> > >git://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
>>> > >commit 93c4adc7afedf9b0ec190066d45b6d67db5270da ("KVM: x86: handle m=
issing MPX in nested virtualization")
>> >
>> > Ouch.  Out of curiosity is this on Skylake prototypes, or is it also
>> > visible on some released silicon?
> Paolo, the problem shows up in a Sandybridge-EX and an Ivybridge-EX.

What does that mean in terms of commercial names?  I tested on Sandy =

Bridge Xeon E5.

Paolo

--===============4812749378632501924==--

