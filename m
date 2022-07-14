Content-Type: multipart/mixed; boundary="===============0887488117849161468=="
MIME-Version: 1.0
From: Jiri Slaby <jirislaby@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] can: slcan: do not sleep with a spin lock held
Date: Thu, 14 Jul 2022 12:38:03 +0200
Message-ID: <78cd3375-e95e-51b2-bf89-bad645e16ea4@kernel.org>
In-Reply-To: <20220713154458.253076-1-dario.binacchi@amarulasolutions.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0887488117849161468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 13. 07. 22, 17:44, Dario Binacchi wrote:
> We can't call close_candev() with a spin lock held, so release the lock
> before calling it.
> =

> Fixes: c4e54b063f42f ("can: slcan: use CAN network device driver API")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Link: https://lore.kernel.org/linux-kernel/Ysrf1Yc5DaRGN1WE(a)xsang-OptiP=
lex-9020/
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> =

> ---
> =

> Changes in v2:
> - Release the lock just before calling the close_candev().
> =

>   drivers/net/can/slcan/slcan-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/net/can/slcan/slcan-core.c b/drivers/net/can/slcan/s=
lcan-core.c
> index 54d29a410ad5..5214421dedf3 100644
> --- a/drivers/net/can/slcan/slcan-core.c
> +++ b/drivers/net/can/slcan/slcan-core.c
> @@ -689,6 +689,7 @@ static int slc_close(struct net_device *dev)
>   		clear_bit(TTY_DO_WRITE_WAKEUP, &sl->tty->flags);
>   	}
>   	netif_stop_queue(dev);
> +	spin_unlock_bh(&sl->lock);
>   	close_candev(dev);
>   	sl->can.state =3D CAN_STATE_STOPPED;
>   	if (sl->can.bittiming.bitrate =3D=3D CAN_BITRATE_UNKNOWN)
> @@ -696,7 +697,6 @@ static int slc_close(struct net_device *dev)
>   =

>   	sl->rcount   =3D 0;
>   	sl->xleft    =3D 0;

So all these sets need not be under the spinlock?

If so, you should explain why in the commit message.

> -	spin_unlock_bh(&sl->lock);
>   =

>   	return 0;
>   }

thanks,
-- =

js
suse labs
--===============0887488117849161468==--

