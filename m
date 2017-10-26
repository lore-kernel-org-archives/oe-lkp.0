Content-Type: multipart/mixed; boundary="===============3975396855671561658=="
MIME-Version: 1.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: lkp@lists.01.org
Subject: Re: [Xen-devel] ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Thu, 26 Oct 2017 21:01:00 +0100
Message-ID: <19584771-c653-5327-b126-3f494ad5717f@citrix.com>
In-Reply-To: <207b6a75-2eff-8e92-d50c-ec2022fddbf9@eikelenboom.it>
List-Id: <oe-lkp.lists.linux.dev>

--===============3975396855671561658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 26/10/17 20:29, Sander Eikelenboom wrote:
> On 26/10/17 19:49, Craig Bergstrom wrote:
>> Sander, thanks for the details, they've been very useful.
>>
>> I suspect that your host system's mem=3D2048M parameter is causing the
>> problem.  Any chance you can confirm by removing the parameter and
>> running the guest code path?
> I removed it, but kept the hypervisor limiting dom0 memory to 2046M intac=
t (in grub using the xen bootcmd: =

> "multiboot       /xen-4.10.gz  dom0_mem=3D2048M,max:2048M ....."
>
> Unfortunately that doesn't change anything, the guest still fails to star=
t with the same errors.
>
>> More specifically, since you're telling the kernel that it's high
>> memory address is at 2048M and your device is at 0xfe1fe000 (~4G), the
>> new mmap() limits are preventing you from mapping addresses that are
>> explicitly disallowed by the parameter.
>>
> Which would probably mean the current patch prohibits hard limiting the d=
om0 memory to a certain value (below 4G)
> at least in combination with PCI-passthrough. So the only thing left woul=
d be to have no hard memory restriction on dom0
> and rely on auto-ballooning, but I'm not a great fan of that.
>
> I don't know how KVM handles setting memory limits for the host system, b=
ut perhaps it suffers from the same issue.
>
> I also tried the patch from one of your last mails to make the check "les=
s strict", =

> but still get the same errors (when using the hard memory limits).

dom0_mem=3D2048M,max:2048M is used to describe how much RAM the guest has,
not its maximum address.=C2=A0 (Whether this is how PVops actually interpre=
ts
the information and passes it into Linux is a different matter.=C2=A0 I will
have to defer to Boris/Juergen on that side of things.)

For RAM, PV guests will get a scattering of frames wherever Xen chooses
to allocate them, and are likely to not be contiguous or adjacent.

For devices, PV guests do get mappings to the real system BARs, which
will be the real low and high MMIO holes.

~Andrew

--===============3975396855671561658==--

