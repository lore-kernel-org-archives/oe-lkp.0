Content-Type: multipart/mixed; boundary="===============2259829550139203452=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Adding Xen to the kbuild bot?
Date: Tue, 02 Feb 2016 19:31:30 -0800
Message-ID: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2259829550139203452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all-

Would it make sense to add some basic Xen PV testing to the kbuild bot?

qemu can boot Xen like this:

qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage
kernelarg otherkernelarg=3Dvalue" -append 'xenarg other_xen_arg'

This should work with any kernel image for x86 or x86_64 with CONFIG_XEN=3D=
y.

Linux has never been been able to do virtio under Xen, which will
screw up your scripts, but I'm cautiously optimistic that virtio will
work as expected on a Xen guest starting with Linux 4.6.  If you want
to play around, it should work in this tree:

https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git/log/?h=3Dvirtio=
_dma

I'm hoping to get that queued up for real in the next couple of days.

--Andy

--===============2259829550139203452==--

