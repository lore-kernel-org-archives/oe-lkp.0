Content-Type: multipart/mixed; boundary="===============0169507243394556998=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] dae7bf275f: last_state.incomplete
Date: Tue, 15 Feb 2022 13:51:32 +0100
Message-ID: <20220215125132.GM12643@twin.jikos.cz>
In-Reply-To: <37c59b99-bd45-c017-6d2b-ff9b7a7fc1af@gmx.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0169507243394556998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 08:32:20PM +0800, Qu Wenruo wrote:
> =

> =

> On 2022/2/15 20:25, Qu Wenruo wrote:
> >
> >
> > On 2022/2/15 20:05, David Sterba wrote:
> >> On Tue, Feb 15, 2022 at 03:20:54PM +0800, kernel test robot wrote:
> >>> If you fix the issue, kindly add following tag
> >>> Reported-by: kernel test robot <oliver.sang@intel.com>
> >>>
> >>>
> >>> the test's last state 'incomplete' seems be caused by below error
> >>> (detail
> >>> in attached dmesg.xz)
> >>>
> >>> [=C2=A0=C2=A0 49.293458][ T3822] BTRFS info (device sdb3): flagging f=
s with big
> >>> metadata feature
> >>> [=C2=A0=C2=A0 49.301630][ T3822] BTRFS info (device sdb3): disk space=
 caching
> >>> is enabled
> >>> [=C2=A0=C2=A0 49.309039][ T3822] BTRFS info (device sdb3): has skinny=
 extents
> >>> [=C2=A0=C2=A0 49.320312][ T3822] BTRFS error (device sdb3): invalid n=
umber of
> >>> stripes 0 in sys_array at offset 17
> >
> > The offset is just one key, so we're reading the first chunk item in sys
> > chunk array.
> >
> > If you guys can reproduce the situation, please provide the dump of sdb3
> > by:
> >
> > # btrfs ins dump-super -fFa /dev/sdb3
> =

> No need, your fs should be completely sane.
> =

> >
> >
> > A quick glance gives me some concern, as for super block sys chunk
> > array, we're not doing the proper extent buffer thing, but a dummy/fake
> > extent buffer just to get the extent buffer accessors.
> >
> > Thus some get_**bits function may return false 0 and cause the problem.
> >
> > I'll try to reproduce and hopefully fix it.
> =

> It's the condition, completely opposite:
> =

> -       ASSERT(check_setget_bounds(token->eb, ptr, off, size));         \
> +       if (check_setget_bounds(token->eb, ptr, off, size))             \
> +               return 0;
> =

> check_setget_bounds() return true if nothing is wrong.

Right, the condition needs to be flipped.
--===============0169507243394556998==--

