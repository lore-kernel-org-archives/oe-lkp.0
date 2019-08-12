Content-Type: multipart/mixed; boundary="===============0504277505026644350=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Mon, 12 Aug 2019 16:17:29 +0800
Message-ID: <669b2392-e9ce-76f7-638c-4b32878c53b5@intel.com>
In-Reply-To: <c83ef145-83ef-d1b8-8a41-4957f20039e8@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0504277505026644350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 8/12/19 3:43 PM, Rong Chen wrote:
> Hi,
>
> On 8/5/19 9:32 PM, Borislav Petkov wrote:
>> On Mon, Aug 05, 2019 at 03:02:21PM +0200, Borislav Petkov wrote:
>>> On Mon, Aug 05, 2019 at 07:49:54PM +0800, Chen, Rong A wrote:
>>>> We use the following command to boot a new kernel:
>>>> kexec --noefi -l =

>>>> /opt/rootfs/tmp/pkg/linux/x86_64-rhel-7.6/gcc-7/5b51ae969e3d8ab0134ee3=
c98a769ad6d2cc2e24/vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a
>>>> --initrd=3D/opt/rootfs/tmp/initrd-concatenated
>>> And this "concatenated" initrd, how do you generate that?
>> And the "-l" thing is just the kexec load command to load the second
>> kernel. I need you to give me a step-by-step, exact command-by-command
>> list of things you do to trigger.
>>
>> Also, pls send me dmesg from the first kernel. Privately is fine too.
>>
>> Thx.
>
> Sorry for the delay, I've found a machine which can reproduce the =

> issue at last.
>
> root(a)lkp-bdw-de1 ~# kexec --version
> kexec-tools 2.0.14
>
> kexec reboots the system without "-e option"
> root(a)lkp-bdw-de1 ~# kexec --noefi =

> vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a --initrd final_initrd-borrow =

> --reuse-cmdline
> Unknown type (Reserved) while parsing /sys/firmware/memmap/7/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/13/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/11/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/1/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/4/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/12/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/2/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/9/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Connection to lkp-bdw-de1 closed by remote host.
> Connection to lkp-bdw-de1 closed.
>
> The behavior is as usual if using "nokaslr"
> root(a)lkp-bdw-de1 ~# kexec -l vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a =

> --initrd final_initrd-borrow --reuse-cmdline --append "nokaslr"
> Unknown type (Reserved) while parsing /sys/firmware/memmap/7/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/13/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/11/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/1/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/4/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/12/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/2/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/9/type. =

> Please report this as bug. Using RANGE_RESERVED now.
> root(a)lkp-bdw-de1 ~# kexec -e
>
> And please find the pre-dmesg in the attachment.

I've uploaded the vmlinuz and initrd files to =

https://download.01.org/0day-ci/lkp-qemu/fbc/5b51ae969e3d8ab0134ee3c98a769a=
d6d2cc2e24

Best Regards,
Rong Chen

--===============0504277505026644350==--

