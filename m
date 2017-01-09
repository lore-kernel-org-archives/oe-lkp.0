Content-Type: multipart/mixed; boundary="===============8899102924630851082=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/4] lkp: add initial opensuse support
Date: Mon, 09 Jan 2017 15:26:08 +0100
Message-ID: <20170109142608.GZ13946@wotan.suse.de>
In-Reply-To: <20170109074914.GU690@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8899102924630851082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2017 at 03:49:14PM +0800, Ye Xiaolong wrote:
> Hi, Luis
> =

> On 01/06, Luis R. Rodriguez wrote:
> >I received a failed test results notice from 0-day LKP test suite
> >using trinity, however it was pretty hard to get reproduce given
> >the LKP did not have OpenSUSE support to start off with, but the
> >second issue I've stubmled upon is beyond me -- running either:
> >
> >./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage job-script
> >
> >or
> >
> >lkp qemu jobs/trinity.yaml =

> >
> >ends up creating calling a few subroutines or files which are
> >clearly not present, then tries to create a cpio archive but
> >clearly there are a few files which LKP tree expects you to have
> >and are not present such as lkp and lkp/scheduled.
> >
> >This is a run on OpenSUSE, first we install the dependencies for
> >trinity.yaml deps:
> >
> > # lkp install jobs/trinity.yaml =

> >
> >Then we try to run it:
> >
> > # lkp qemu jobs/trinity.yaml =

> =

> Actually we don't use yaml file for lkp qemu, you could try "lkp run jobs=
/trinity.yaml"
> instead.

OK that runs, but that beats my actual machine with trinity, which is not
desirable. I am trying to reproduce a reported error caught by lpk tests
with trinity on my tree and that was with qemu. I have the job-script but
that produces the same error with missing files. Can you help me with that?

  Luis

--===============8899102924630851082==--

