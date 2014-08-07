Content-Type: multipart/mixed; boundary="===============1050921635804886066=="
MIME-Version: 1.0
From: Brian Norris <computersforpeace@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sbc_gxx] kernel BUG at include/linux/mtd/map.h:148!
Date: Thu, 07 Aug 2014 15:46:18 -0700
Message-ID: <20140807224618.GQ3711@ld-irv-0074>
In-Reply-To: <CAPDOMVgN=tc_o7E19ss4j5FAG4vpgUSzuUXYLSNGfpWCvPsAwA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1050921635804886066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 05, 2014 at 08:08:57PM -0400, Nick Krause wrote:
> On Tue, Aug 5, 2014 at 9:59 AM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
> > Hello,
> >
> > This is an old BUG that still lives in linux-next.
> >
> > [    4.284620] device id =3D 2670
> > [    4.286157] SBC-GXx flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
> > [    4.287060] ------------[ cut here ]------------
> > [    4.287722] kernel BUG at include/linux/mtd/map.h:148!
> > [    4.288048] invalid opcode: 0000 [#1] PREEMPT SMP
>
> I am new , here and will try to trace your issue on linus's tree
> unless there is a major difference between Linus's tree and
> linux-next.
> If there is please let me known before I start tracing this.

This is a known issue, and Fengguang has reported this before:

  http://lists.infradead.org/pipermail/linux-mtd/2014-March/053019.html

I'm still not quite sure how to solve this one. It seems to be a
limitation of the kconfig language.

Brian

--===============1050921635804886066==--

