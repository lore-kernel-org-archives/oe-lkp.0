Content-Type: multipart/mixed; boundary="===============0160092832635427528=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Mon, 05 Aug 2019 15:32:10 +0200
Message-ID: <20190805133210.GB18887@zn.tnic>
In-Reply-To: <20190805130221.GA18887@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0160092832635427528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 03:02:21PM +0200, Borislav Petkov wrote:
> On Mon, Aug 05, 2019 at 07:49:54PM +0800, Chen, Rong A wrote:
> > We use the following command to boot a new kernel:
> > kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_64-rhel-7.6/gcc-7/5b51ae=
969e3d8ab0134ee3c98a769ad6d2cc2e24/vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a
> > --initrd=3D/opt/rootfs/tmp/initrd-concatenated
> =

> And this "concatenated" initrd, how do you generate that?

And the "-l" thing is just the kexec load command to load the second
kernel. I need you to give me a step-by-step, exact command-by-command
list of things you do to trigger.

Also, pls send me dmesg from the first kernel. Privately is fine too.

Thx.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah, HRB =
21284 (AG N=C3=BCrnberg)

--===============0160092832635427528==--

