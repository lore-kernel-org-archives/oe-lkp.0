Content-Type: multipart/mixed; boundary="===============6251000957373301179=="
MIME-Version: 1.0
From: Dave Young <dyoung@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Wed, 14 Aug 2019 10:43:23 +0800
Message-ID: <20190814024323.GA7008@dhcp-128-65.nay.redhat.com>
In-Reply-To: <44d5e337-ac6a-46f1-41d4-a963f820391b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6251000957373301179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/12/19 at 03:49pm, Rong Chen wrote:
> Hi,
> =

> On 8/6/19 4:45 PM, Dave Young wrote:
> > On 08/05/19 at 07:49pm, Chen, Rong A wrote:
> > > Hi,
> > > =

> > > On 8/2/2019 5:30 PM, Borislav Petkov wrote:
> > > > On Fri, Aug 02, 2019 at 03:48:53PM +0800, kernel test robot wrote:
> > > > > FYI, we noticed the following commit (built with gcc-7):
> > > > > =

> > > > > commit: 5b51ae969e3d8ab0134ee3c98a769ad6d2cc2e24 ("x86/boot: Call=
 get_rsdp_addr() after console_init()")
> > > > > https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds=
/linux.git  master
> > > > > =

> > > > > in testcase: boot
> > > > > =

> > > > > on test machine: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G =
memory
> > > > > =

> > > > > The commit broke kexec boot on physical machines, We have to set =
"nokaslr" to kernel cmdline to avoid the issue.
> > > > How exactly do you trigger it? Details?
> > > > =

> > > We use the following command to boot a new kernel:
> > > kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_64-rhel-7.6/gcc-7/5b51=
ae969e3d8ab0134ee3c98a769ad6d2cc2e24/vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a
> > > --initrd=3D/opt/rootfs/tmp/initrd-concatenated
> > > =

> > --noefi is a corner case as kexec now supports efi, it is expected not
> > work with old kexec-tools in case you do not use acpi_rsdp=3D cmdline
> > explicitly.
> > I suspect it is still the rsdp getting failed instead of the moving
> > chunk after console_init.
> > Can you do more testing?
> > 1.  test latest kexec-tools
> > git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git
> =

> There's no problem if using the latest kexec-tools
> root(a)lkp-bdw-de1 ~# ./kexec --version
> kexec-tools 2.0.20
> root(a)lkp-bdw-de1 ~# ./kexec --noefi -l
> vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a --initrd final_initrd-borrow
> --reuse-cmdline
> root(a)lkp-bdw-de1 ~# ./kexec -e

Glad to know new kexec-tools works.

> =

> > 2. still use your old kexec-tools:
> >    a. test without --noefi
> =

> root(a)lkp-bdw-de1 ~# kexec vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a --ini=
trd
> final_initrd-borrow --reuse-cmdline
> Unknown type (Reserved) while parsing /sys/firmware/memmap/7/type. Please
> report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/13/type. Please
> report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/11/type. Please
> report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/1/type. Please
> report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/4/type. Please
> report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/12/type. Please
> report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/2/type. Please
> report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/9/type. Please
> report this as bug. Using RANGE_RESERVED now.
> Connection to lkp-bdw-de1 closed by remote host.
> Connection to lkp-bdw-de1 closed.

The system just reset?

What is your kexec-tools version?  As for kexec the userspace tool
version matters.

I never used kexec vmlinuz directly, usually kexec -l first then run
"reboot" command.  kexec -e also be fine but it will skip the
filesystem unmount etc.

> =

> =

> >    b. test with --noefi but with some appending acpi_rsdp=3D cmdline, f=
or
> > example (enable serial to capture console log):
> > kexec --noefi -l .../vmlinuz-... --reuse-cmdline --append
> > "acpi_rsdp=3D0xaabbccdd earlyprintk=3Dserial"
> =

> Sorry, I can't get console log from this machine.

Ok, but can you still try appeding acpi_rsdp test?  If this works then I
think from kexec perspective it is good enough.

Thanks
Dave

--===============6251000957373301179==--

