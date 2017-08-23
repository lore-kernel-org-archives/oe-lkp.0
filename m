Content-Type: multipart/mixed; boundary="===============6631960694164380315=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [kvm] ae1e2d1082: kvm-unit-tests.vmx_EPT_AD_enabled.fail
Date: Wed, 23 Aug 2017 08:49:41 +0200
Message-ID: <4c2eb1d2-8ccd-3996-1c71-3ebb95d39f7f@redhat.com>
In-Reply-To: <20170823060900.GD578@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6631960694164380315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 23/08/2017 08:09, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: ae1e2d1082ae6969ff8c626ef80804d950bf256b ("kvm: nVMX: support EPT=
 accessed/dirty bits")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: kvm-unit-tests
> with following parameters:
> =

> =

> =

> =

> on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz wit=
h 128G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

This was a known issue in the first implementation and was fixed later.

Paolo

--===============6631960694164380315==--

