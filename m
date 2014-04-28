Content-Type: multipart/mixed; boundary="===============1467928234737529529=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] BUG: unable to handle kernel NULL pointer dereference at 00000000000002b0
Date: Mon, 28 Apr 2014 17:54:18 +0800
Message-ID: <535E254A.4020500@intel.com>
In-Reply-To: <535E2054.8050805@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1467928234737529529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/28/2014 05:33 PM, Paolo Bonzini wrote:
> Il 14/04/2014 09:49, Jet Chen ha scritto:
>> Hi Paolo,
>>
>> We noticed the below kernel BUG on
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> What commit?
> =


This one,

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

commit 93c4adc7afedf9b0ec190066d45b6d67db5270da
Author:     Paolo Bonzini <pbonzini@redhat.com>
AuthorDate: Wed Mar 5 23:19:52 2014 +0100
Commit:     Paolo Bonzini <pbonzini@redhat.com>
CommitDate: Mon Mar 17 12:21:39 2014 +0100

      KVM: x86: handle missing MPX in nested virtualization


BTW, the same issue has been reported by Fengguang last month.

https://lkml.org/lkml/2014/3/26/200

Thanks,
Jet

> Paolo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>=20

--===============1467928234737529529==--

