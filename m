Content-Type: multipart/mixed; boundary="===============0087982440236849357=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] BUG: unable to handle kernel NULL pointer dereference at 00000000000002b0
Date: Mon, 28 Apr 2014 21:52:23 +0800
Message-ID: <535E5D17.9040901@intel.com>
In-Reply-To: <535E3CB9.9070709@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0087982440236849357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/28/2014 07:34 PM, Paolo Bonzini wrote:
> Il 28/04/2014 11:54, Jet Chen ha scritto:
>>>>>> We noticed the below kernel BUG on
>>>>>>
>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mas=
ter
>>>>
>>>> What commit?
>>>>
>> This one,
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> commit 93c4adc7afedf9b0ec190066d45b6d67db5270da
>> Author:     Paolo Bonzini <pbonzini@redhat.com>
>> AuthorDate: Wed Mar 5 23:19:52 2014 +0100
>> Commit:     Paolo Bonzini <pbonzini@redhat.com>
>> CommitDate: Mon Mar 17 12:21:39 2014 +0100
>>
>>       KVM: x86: handle missing MPX in nested virtualization
>>
>>
>> BTW, the same issue has been reported by Fengguang last month.
>>
>> https://lkml.org/lkml/2014/3/26/200
> =

> It should have been fixed already by commit 920c83778569 (KVM: vmx: fix =

> MPX detection, 2014-03-26).  That's why I was confused, I thought it was =

> for a recent commit on Linus's master branch.

You're right, Paolo. It have been fixed already by commit 920c83778569. Sor=
ry for this noisy duplicated report.
We found this issued commit on git://git.kernel.org/pub/scm/virt/kvm/kvm.gi=
t tree at first. When that commit entered mainline, we tested it again and =
I reported by mistake.

> =

> Paolo
>=20

--===============0087982440236849357==--

