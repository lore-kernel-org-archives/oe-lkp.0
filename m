Content-Type: multipart/mixed; boundary="===============2819541838258560422=="
MIME-Version: 1.0
From: Souptick Joarder <jrdr.linux@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] can: slcan: do not sleep with a spin lock held
Date: Thu, 21 Jul 2022 07:28:03 +0530
Message-ID: <CAFqt6zaMnfGhwxnnJrbW1eoiGy46-WNUe8H-iqztRmZW5Z8jfQ@mail.gmail.com>
In-Reply-To: <20220715072951.859586-1-dario.binacchi@amarulasolutions.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2819541838258560422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2022 at 1:00 PM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> We can't call close_candev() with a spin lock held, so release the lock
> before calling it. After calling close_candev(), we can update the
> fields of the private `struct can_priv' without having to acquire the
> lock.

But here we are updating private 'struct can_priv' before close_candev() wh=
ile
taking the lock.  If we go by change logs, then spin_unlock_bh() need to ca=
lled
before close_candev() and we can update the private 'struct can_priv'
in existing place.

>
> Fixes: c4e54b063f42f ("can: slcan: use CAN network device driver API")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Link: https://lore.kernel.org/linux-kernel/Ysrf1Yc5DaRGN1WE(a)xsang-OptiP=
lex-9020/
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v3:
> - Update the commit message.
> - Reset sl->rcount and sl->xleft before releasing the spin lock.
>
> Changes in v2:
> - Release the lock just before calling the close_candev().
>
>  drivers/net/can/slcan/slcan-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/can/slcan/slcan-core.c b/drivers/net/can/slcan/s=
lcan-core.c
> index 54d29a410ad5..d40ddc596596 100644
> --- a/drivers/net/can/slcan/slcan-core.c
> +++ b/drivers/net/can/slcan/slcan-core.c
> @@ -689,15 +689,14 @@ static int slc_close(struct net_device *dev)
>                 clear_bit(TTY_DO_WRITE_WAKEUP, &sl->tty->flags);
>         }
>         netif_stop_queue(dev);
> +       sl->rcount   =3D 0;
> +       sl->xleft    =3D 0;
> +       spin_unlock_bh(&sl->lock);
>         close_candev(dev);
>         sl->can.state =3D CAN_STATE_STOPPED;
>         if (sl->can.bittiming.bitrate =3D=3D CAN_BITRATE_UNKNOWN)
>                 sl->can.bittiming.bitrate =3D CAN_BITRATE_UNSET;
>
> -       sl->rcount   =3D 0;
> -       sl->xleft    =3D 0;
> -       spin_unlock_bh(&sl->lock);
> -
>         return 0;
>  }
>
> --
> 2.32.0
>
>
--===============2819541838258560422==--

