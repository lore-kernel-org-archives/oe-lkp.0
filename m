Content-Type: multipart/mixed; boundary="===============2258922925716613922=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86, kvm] WARNING: at arch/x86/kernel/pvclock.c:182 pvclock_init_vsyscall()
Date: Tue, 30 Sep 2014 14:04:17 +0200
Message-ID: <542A9C41.1060706@redhat.com>
In-Reply-To: <542A84FD.6000702@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2258922925716613922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Il 30/09/2014 12:25, Chen, Tiejun ha scritto:
>>
>> [    0.000000] Pid: 0, comm: swapper Not tainted
>> 3.7.0-rc3-00112-g3dc4f7c #1
> =

> Looks you're working with old kernel, so its worth trying the latest agai=
n.

That's just the commit where the bisection ended, and the first one that
introduced the problem.

Paolo

--===============2258922925716613922==--

