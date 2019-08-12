Content-Type: multipart/mixed; boundary="===============0445328369311930813=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Mon, 12 Aug 2019 15:49:18 +0800
Message-ID: <44d5e337-ac6a-46f1-41d4-a963f820391b@intel.com>
In-Reply-To: <20190806084543.GA2164@dhcp-128-65.nay.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0445328369311930813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 8/6/19 4:45 PM, Dave Young wrote:
> On 08/05/19 at 07:49pm, Chen, Rong A wrote:
>> Hi,
>>
>> On 8/2/2019 5:30 PM, Borislav Petkov wrote:
>>> On Fri, Aug 02, 2019 at 03:48:53PM +0800, kernel test robot wrote:
>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>
>>>> commit: 5b51ae969e3d8ab0134ee3c98a769ad6d2cc2e24 ("x86/boot: Call get_=
rsdp_addr() after console_init()")
>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linu=
x.git  master
>>>>
>>>> in testcase: boot
>>>>
>>>> on test machine: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory
>>>>
>>>> The commit broke kexec boot on physical machines, We have to set "noka=
slr" to kernel cmdline to avoid the issue.
>>> How exactly do you trigger it? Details?
>>>
>> We use the following command to boot a new kernel:
>> kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_64-rhel-7.6/gcc-7/5b51ae9=
69e3d8ab0134ee3c98a769ad6d2cc2e24/vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a
>> --initrd=3D/opt/rootfs/tmp/initrd-concatenated
>>
> --noefi is a corner case as kexec now supports efi, it is expected not
> work with old kexec-tools in case you do not use acpi_rsdp=3D cmdline
> explicitly.
>   =

> I suspect it is still the rsdp getting failed instead of the moving
> chunk after console_init.
>   =

> Can you do more testing?
>    =

> 1.  test latest kexec-tools
> git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git

There's no problem if using the latest kexec-tools
root(a)lkp-bdw-de1 ~# ./kexec --version
kexec-tools 2.0.20
root(a)lkp-bdw-de1 ~# ./kexec --noefi -l =

vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a --initrd final_initrd-borrow =

--reuse-cmdline
root(a)lkp-bdw-de1 ~# ./kexec -e

>   =

> 2. still use your old kexec-tools:
>    a. test without --noefi

root(a)lkp-bdw-de1 ~# kexec vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a =

--initrd final_initrd-borrow --reuse-cmdline
Unknown type (Reserved) while parsing /sys/firmware/memmap/7/type. =

Please report this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/13/type. =

Please report this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/11/type. =

Please report this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/1/type. =

Please report this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/4/type. =

Please report this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/12/type. =

Please report this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/2/type. =

Please report this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/9/type. =

Please report this as bug. Using RANGE_RESERVED now.
Connection to lkp-bdw-de1 closed by remote host.
Connection to lkp-bdw-de1 closed.


>    b. test with --noefi but with some appending acpi_rsdp=3D cmdline, for
> example (enable serial to capture console log):
> kexec --noefi -l .../vmlinuz-... --reuse-cmdline --append
> "acpi_rsdp=3D0xaabbccdd earlyprintk=3Dserial"

Sorry, I can't get console log from this machine.

Best Regards,
Rong Chen

>   =

> Note: get the acpi pointer by:
> cat /sys/firmware/efi/systab
> for example on my laptop the acpi cmdline should be acpi_rsdp=3D0x7b5fe01=
4:
> [root(a)dhcp-*-* dyoung]# cat /sys/firmware/efi/systab
> ACPI20=3D0x7b5fe014
> ACPI=3D0x7b5fe000
> SMBIOS3=3D0x7a671000
> SMBIOS=3D0x7a674000


--===============0445328369311930813==--

