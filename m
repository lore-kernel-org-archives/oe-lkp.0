Content-Type: multipart/mixed; boundary="===============3625822724224726854=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: Adding Xen to the kbuild bot?
Date: Fri, 05 Feb 2016 11:11:16 +0800
Message-ID: <20160205031116.GB30154@wfg-t540p.sh.intel.com>
In-Reply-To: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3625822724224726854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy,

CC more people on Xen testing -- in case OSStest already (or plans to)
cover such test case.

On Tue, Feb 02, 2016 at 07:31:30PM -0800, Andy Lutomirski wrote:
> Hi all-
> =

> Would it make sense to add some basic Xen PV testing to the kbuild bot?

Do you mean to run basic Xen testing on the various kernel trees that
0day robot covers? That is, to catch kernel regressions when running
under Xen.

If the intention is to catch Xen regressions, the OSStest
infrastructure may be a better option:

        git://xenbits.xen.org/osstest.git

> qemu can boot Xen like this:
> =

> qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage
> kernelarg otherkernelarg=3Dvalue" -append 'xenarg other_xen_arg'
> =

> This should work with any kernel image for x86 or x86_64 with CONFIG_XEN=
=3Dy.

Got it. If you have simple working test scripts to illustrate test
details, it'd be a great help for integrating into OSStest or 0day.

> Linux has never been been able to do virtio under Xen, which will
> screw up your scripts, but I'm cautiously optimistic that virtio will
> work as expected on a Xen guest starting with Linux 4.6.  If you want
> to play around, it should work in this tree:
> =

> https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git/log/?h=3Dvirt=
io_dma
> =

> I'm hoping to get that queued up for real in the next couple of days.

Thanks,
Fengguang

--===============3625822724224726854==--

