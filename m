Content-Type: multipart/mixed; boundary="===============1981335024559622750=="
MIME-Version: 1.0
From: Dave Young <dyoung@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Tue, 06 Aug 2019 16:56:11 +0800
Message-ID: <20190806085611.GA2671@dhcp-128-65.nay.redhat.com>
In-Reply-To: <20190805130221.GA18887@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============1981335024559622750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/05/19 at 03:02pm, Borislav Petkov wrote:
> On Mon, Aug 05, 2019 at 07:49:54PM +0800, Chen, Rong A wrote:
> > We use the following command to boot a new kernel:
> > kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_64-rhel-7.6/gcc-7/5b51ae=
969e3d8ab0134ee3c98a769ad6d2cc2e24/vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a
> > --initrd=3D/opt/rootfs/tmp/initrd-concatenated
> =

> And this "concatenated" initrd, how do you generate that?
> =

> FWIW, trying this in a vm doesn't seem to work because of EFI even though
> --noefi is supplied on the cmdline:
> =

> $ kexec --noefi -l /mnt/tmp/bzImage
> Unknown type (Reserved) while parsing /sys/firmware/memmap/5/type. Please=
 report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/1/type. Please=
 report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/6/type. Please=
 report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/4/type. Please=
 report this as bug. Using RANGE_RESERVED now.
> Unknown type (Reserved) while parsing /sys/firmware/memmap/2/type. Please=
 report this as bug. Using RANGE_RESERVED now.

These warning messages should have been fixed in latest kexec-tools
since 2017.  e820 (/proc/iomem) previously used "reserved", later
changed to "Reserved" thus kexec-tools can not recognize.

I would suggest you also upgrade to latest kexec-tools, but this should
be not harmful since it is still using those ranges as reserved..

Thanks
Dave

--===============1981335024559622750==--

