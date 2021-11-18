Content-Type: multipart/mixed; boundary="===============6430211947614634827=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net, neigh] 7482e3841d: BUG:unable_to_handle_page_fault_for_address
Date: Thu, 18 Nov 2021 14:23:16 +0800
Message-ID: <20211118062316.GB12388@xsang-OptiPlex-9020>
In-Reply-To: <d70dcff2-e7c7-d909-b718-0b7f970b3c17@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6430211947614634827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, Nov 05, 2021 at 12:21:20PM +0100, Daniel Borkmann wrote:
> Hey Oliver,
> =

> > > =

> > > To reproduce:
> > > =

> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build kernel
> > > =C2=A0=C2=A0=C2=A0=C2=A0cd linux
> > > =C2=A0=C2=A0=C2=A0=C2=A0cp config-5.15.0-rc4-01167-g7482e3841d52 .con=
fig
> > > =C2=A0=C2=A0=C2=A0=C2=A0make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 ol=
ddefconfig prepare modules_prepare bzImage
> > > =

> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://gi=
thub.com/intel/lkp-tests.git
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzI=
mage> job-script # job-script is attached in this email
> > > =

> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any=
 failure that blocks the test,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.l=
kp and /lkp dir to run from a clean state.
> =

> I ran the test multiple times, but it seems I cannot reproduce. Would be =
good if you could
> double check below whether it looks / passes as expected or if I'm doing =
something wrong:

sorry about this, we tried above reproducer locally but failed to reproduce
either. we are under investigation of this issue.

at the same time, we double confirmed by queuing more jobs to our auto-test
framework, it still reproduced in a persistent way. Just FYI
2c611ad97a82b512 7482e3841d520a368426ac19672
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :59          98%          58:58    dmesg.BUG:unable_to_handle_pa=
ge_fault_for_address
           :59          98%          58:58    dmesg.Kernel_panic-not_syncin=
g:Fatal_exception_in_interrupt
           :59          98%          58:58    dmesg.Oops:#[##]

--===============6430211947614634827==--

