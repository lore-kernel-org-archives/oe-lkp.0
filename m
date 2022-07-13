Content-Type: multipart/mixed; boundary="===============4747486485335499670=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] can: slcan: do not sleep with a spin lock held
Date: Wed, 13 Jul 2022 17:35:54 +0200
Message-ID: <Ys7mWmIfuJy+1ax7@kroah.com>
In-Reply-To: <20220713151947.56379-1-dario.binacchi@amarulasolutions.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4747486485335499670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 05:19:47PM +0200, Dario Binacchi wrote:
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

>  drivers/net/can/slcan/slcan-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/net/can/slcan/slcan-core.c b/drivers/net/can/slcan/s=
lcan-core.c
> index 54d29a410ad5..6aaf2986effc 100644
> --- a/drivers/net/can/slcan/slcan-core.c
> +++ b/drivers/net/can/slcan/slcan-core.c
> @@ -688,6 +688,7 @@ static int slc_close(struct net_device *dev)
>  		/* TTY discipline is running. */
>  		clear_bit(TTY_DO_WRITE_WAKEUP, &sl->tty->flags);
>  	}
> +	spin_unlock_bh(&sl->lock);
>  	netif_stop_queue(dev);

Can you have a lock held when calling netif_stop_queue()?  You don't
mention this in your changelog text :(

thanks,

greg k-h
--===============4747486485335499670==--

