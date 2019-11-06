Content-Type: multipart/mixed; boundary="===============3553833457903332207=="
MIME-Version: 1.0
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 671ddc700f: kvm-unit-tests.vmx.fail
Date: Wed, 06 Nov 2019 07:18:22 -0800
Message-ID: <20191106151822.GC16249@linux.intel.com>
In-Reply-To: <20191106144548.GA32541@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3553833457903332207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 10:45:48PM +0800, Oliver Sang wrote:
> On Wed, Oct 30, 2019 at 09:56:16AM -0700, Jim Mattson wrote:
> > It's unclear to me what the delta is, but I do see that the 'vmx'
> > suite has failed. That is to be expected if you're getting your
> > kvm-unit-tests from the 'master' branch of the kvm-unit-tests repo.
> > You will need commit 591b5b54bba1 ("x86: Skip APIC-access address
> > tests beyond mapped RAM"), which is in the 'next' branch of the
> > kvm-unit-tests repo, but which has not yet made it to the 'master'
> > branch.
> =

> Thanks for information! We will wait for master upgrade to update our test
> binary.

This reminds me, are we still planning on creating "stable" branches for
kvm-unit-tests[*]?  This topic of came up in a discussion at KVM Forum as
well, though I can't remember any of the details.

Paolo?

[*] https://lkml.kernel.org/r/dc5ff4ed-c6dd-74ea-03ae-4f65c5d58073(a)redhat=
.com
--===============3553833457903332207==--

