Content-Type: multipart/mixed; boundary="===============4366740181902193310=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Mon, 05 Aug 2019 15:02:21 +0200
Message-ID: <20190805130221.GA18887@zn.tnic>
In-Reply-To: <0f817336-2d87-2110-13c0-e0a417d70e90@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4366740181902193310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 07:49:54PM +0800, Chen, Rong A wrote:
> We use the following command to boot a new kernel:
> kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_64-rhel-7.6/gcc-7/5b51ae96=
9e3d8ab0134ee3c98a769ad6d2cc2e24/vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a
> --initrd=3D/opt/rootfs/tmp/initrd-concatenated

And this "concatenated" initrd, how do you generate that?

FWIW, trying this in a vm doesn't seem to work because of EFI even though
--noefi is supplied on the cmdline:

$ kexec --noefi -l /mnt/tmp/bzImage
Unknown type (Reserved) while parsing /sys/firmware/memmap/5/type. Please r=
eport this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/1/type. Please r=
eport this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/6/type. Please r=
eport this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/4/type. Please r=
eport this as bug. Using RANGE_RESERVED now.
Unknown type (Reserved) while parsing /sys/firmware/memmap/2/type. Please r=
eport this as bug. Using RANGE_RESERVED now.

I need to try it on a real box.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah, HRB =
21284 (AG N=C3=BCrnberg)

--===============4366740181902193310==--

