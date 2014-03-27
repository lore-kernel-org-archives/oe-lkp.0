Content-Type: multipart/mixed; boundary="===============5993040264749412240=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] BUG: unable to handle kernel NULL pointer dereference at 00000000000002b0
Date: Thu, 27 Mar 2014 10:56:41 +0800
Message-ID: <20140327025641.GA12099@localhost>
In-Reply-To: <5332F668.8080601@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5993040264749412240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 04:46:48PM +0100, Paolo Bonzini wrote:
> Il 26/03/2014 15:57, Fengguang Wu ha scritto:
> >>>> >
> >>>> >git://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> >>>> >commit 93c4adc7afedf9b0ec190066d45b6d67db5270da ("KVM: x86: handle =
missing MPX in nested virtualization")
> >>>
> >>> Ouch.  Out of curiosity is this on Skylake prototypes, or is it also
> >>> visible on some released silicon?
> >Paolo, the problem shows up in a Sandybridge-EX and an Ivybridge-EX.
> =

> What does that mean in terms of commercial names?  I tested on Sandy
> Bridge Xeon E5.

Sorry I don't know the exact commercial names listed in

http://en.wikipedia.org/wiki/Sandy_Bridge
http://en.wikipedia.org/wiki/Ivy_Bridge_%28microarchitecture%29

Thanks,
Fengguang

--===============5993040264749412240==--

