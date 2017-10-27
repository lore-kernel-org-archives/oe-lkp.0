Content-Type: multipart/mixed; boundary="===============5034366730698576877=="
MIME-Version: 1.0
From: Jan Beulich <JBeulich@suse.com>
To: lkp@lists.01.org
Subject: Re: [Xen-devel] ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Fri, 27 Oct 2017 01:07:41 -0600
Message-ID: <59F2F75D020000780018A7E6@prv-mh.provo.novell.com>
In-Reply-To: <207b6a75-2eff-8e92-d50c-ec2022fddbf9@eikelenboom.it>
List-Id: <oe-lkp.lists.linux.dev>

--===============5034366730698576877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>>> On 26.10.17 at 21:29, <linux@eikelenboom.it> wrote:
> On 26/10/17 19:49, Craig Bergstrom wrote:
>> Sander, thanks for the details, they've been very useful.
>> =

>> I suspect that your host system's mem=3D2048M parameter is causing the
>> problem.  Any chance you can confirm by removing the parameter and
>> running the guest code path?
> =

> I removed it, but kept the hypervisor limiting dom0 memory to 2046M intac=
t =

> (in grub using the xen bootcmd: =

> "multiboot       /xen-4.10.gz  dom0_mem=3D2048M,max:2048M ....."
> =

> Unfortunately that doesn't change anything, the guest still fails to star=
t =

> with the same errors.
> =

>> More specifically, since you're telling the kernel that it's high
>> memory address is at 2048M and your device is at 0xfe1fe000 (~4G), the
>> new mmap() limits are preventing you from mapping addresses that are
>> explicitly disallowed by the parameter.
>> =

> =

> Which would probably mean the current patch prohibits hard limiting the d=
om0 =

> memory to a certain value (below 4G)
> at least in combination with PCI-passthrough. So the only thing left woul=
d =

> be to have no hard memory restriction on dom0
> and rely on auto-ballooning, but I'm not a great fan of that.

Plus - how would things work with any RAM size if the PCI BAR was
a 64-bit one, pointing somewhere high up beyond 4Gb?

Jan


--===============5034366730698576877==--

