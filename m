Content-Type: multipart/mixed; boundary="===============5544053382112623868=="
MIME-Version: 1.0
From: Dave Young <dyoung@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Tue, 06 Aug 2019 16:45:43 +0800
Message-ID: <20190806084543.GA2164@dhcp-128-65.nay.redhat.com>
In-Reply-To: <0f817336-2d87-2110-13c0-e0a417d70e90@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5544053382112623868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/05/19 at 07:49pm, Chen, Rong A wrote:
> Hi,
> =

> On 8/2/2019 5:30 PM, Borislav Petkov wrote:
> > On Fri, Aug 02, 2019 at 03:48:53PM +0800, kernel test robot wrote:
> > > FYI, we noticed the following commit (built with gcc-7):
> > > =

> > > commit: 5b51ae969e3d8ab0134ee3c98a769ad6d2cc2e24 ("x86/boot: Call get=
_rsdp_addr() after console_init()")
> > > https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/lin=
ux.git  master
> > > =

> > > in testcase: boot
> > > =

> > > on test machine: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memo=
ry
> > > =

> > > The commit broke kexec boot on physical machines, We have to set "nok=
aslr" to kernel cmdline to avoid the issue.
> > How exactly do you trigger it? Details?
> > =

> =

> We use the following command to boot a new kernel:
> kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_64-rhel-7.6/gcc-7/5b51ae96=
9e3d8ab0134ee3c98a769ad6d2cc2e24/vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a
> --initrd=3D/opt/rootfs/tmp/initrd-concatenated
> =


--noefi is a corner case as kexec now supports efi, it is expected not
work with old kexec-tools in case you do not use acpi_rsdp=3D cmdline
explicitly.
 =

I suspect it is still the rsdp getting failed instead of the moving
chunk after console_init.
 =

Can you do more testing?
  =

1.  test latest kexec-tools
git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git
 =

2. still use your old kexec-tools:
  a. test without --noefi
  b. test with --noefi but with some appending acpi_rsdp=3D cmdline, for
example (enable serial to capture console log):
kexec --noefi -l .../vmlinuz-... --reuse-cmdline --append
"acpi_rsdp=3D0xaabbccdd earlyprintk=3Dserial"
 =

Note: get the acpi pointer by:
cat /sys/firmware/efi/systab
for example on my laptop the acpi cmdline should be acpi_rsdp=3D0x7b5fe014:
[root(a)dhcp-*-* dyoung]# cat /sys/firmware/efi/systab
ACPI20=3D0x7b5fe014
ACPI=3D0x7b5fe000
SMBIOS3=3D0x7a671000
SMBIOS=3D0x7a674000

--===============5544053382112623868==--

