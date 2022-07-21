Content-Type: multipart/mixed; boundary="===============3367639353005315192=="
MIME-Version: 1.0
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] can: slcan: do not sleep with a spin lock held
Date: Thu, 21 Jul 2022 08:30:41 +0200
Message-ID: <CABGWkvqonbDuSXk_iaxV4a-uBtHqeSUqAufj+LZULAVqb+u07Q@mail.gmail.com>
In-Reply-To: <CAFqt6zaMnfGhwxnnJrbW1eoiGy46-WNUe8H-iqztRmZW5Z8jfQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3367639353005315192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Souptick,

On Thu, Jul 21, 2022 at 3:58 AM Souptick Joarder <jrdr.linux@gmail.com> w=
rote:
>
> On Fri, Jul 15, 2022 at 1:00 PM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
> >
> > We can't call close_candev() with a spin lock held, so release the lock
> > before calling it. After calling close_candev(), we can update the
> > fields of the private `struct can_priv' without having to acquire the
> > lock.
>
> But here we are updating private 'struct can_priv' before close_candev() =
while
> taking the lock.  If we go by change logs, then spin_unlock_bh() need to =
called
> before close_candev() and we can update the private 'struct can_priv'
> in existing place.

sl-> rcount and sl-> xleft are not part of 'struct can_priv' and can
be reset after
calling netif_stop_queu() because it inhibits any serial reception/transmis=
sion.

Thanks and regards,
Dario

>
> >
> > Fixes: c4e54b063f42f ("can: slcan: use CAN network device driver API")
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Link: https://lore.kernel.org/linux-kernel/Ysrf1Yc5DaRGN1WE(a)xsang-Opt=
iPlex-9020/
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v3:
> > - Update the commit message.
> > - Reset sl->rcount and sl->xleft before releasing the spin lock.
> >
> > Changes in v2:
> > - Release the lock just before calling the close_candev().
> >
> >  drivers/net/can/slcan/slcan-core.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/net/can/slcan/slcan-core.c b/drivers/net/can/slcan=
/slcan-core.c
> > index 54d29a410ad5..d40ddc596596 100644
> > --- a/drivers/net/can/slcan/slcan-core.c
> > +++ b/drivers/net/can/slcan/slcan-core.c
> > @@ -689,15 +689,14 @@ static int slc_close(struct net_device *dev)
> >                 clear_bit(TTY_DO_WRITE_WAKEUP, &sl->tty->flags);
> >         }
> >         netif_stop_queue(dev);
> > +       sl->rcount   =3D 0;
> > +       sl->xleft    =3D 0;
> > +       spin_unlock_bh(&sl->lock);
> >         close_candev(dev);
> >         sl->can.state =3D CAN_STATE_STOPPED;
> >         if (sl->can.bittiming.bitrate =3D=3D CAN_BITRATE_UNKNOWN)
> >                 sl->can.bittiming.bitrate =3D CAN_BITRATE_UNSET;
> >
> > -       sl->rcount   =3D 0;
> > -       sl->xleft    =3D 0;
> > -       spin_unlock_bh(&sl->lock);
> > -
> >         return 0;
> >  }
> >
> > --
> > 2.32.0
> >
> >



-- =


Dario Binacchi

Embedded Linux Developer

dario.binacchi(a)amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info(a)amarulasolutions.com

www.amarulasolutions.com
--===============3367639353005315192==--

