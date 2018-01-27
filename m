Content-Type: multipart/mixed; boundary="===============6996456627129030573=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kasan] def0e7b54d: Kernel_panic-not_syncing:memblock_virt_alloc_try_nid:Failed_to_allocate#by tes_align=#nid=#from=#max_addr=
Date: Sat, 27 Jan 2018 09:30:37 +0100
Message-ID: <alpine.DEB.2.20.1801270928570.2126@nanos>
In-Reply-To: <20180127080359.GA10097@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6996456627129030573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2018, kernel test robot wrote:

> Hi, Andrey
> =

> Is this panic log expected with your commit?

Yes it is. It says that there is not enough memroy to run with KASAN. If
you revert it the machine will die with a NULL pointer dereference at some
other place w/o telling you what the reason is.

> [    0.000000] Kernel panic - not syncing: memblock_virt_alloc_try_nid: F=
ailed to allocate 4096 bytes align=3D0x1000 nid=3D0 from=3D0x1000000 max_ad=
dr=3D0x0

Thanks,

	tglx

--===============6996456627129030573==--

