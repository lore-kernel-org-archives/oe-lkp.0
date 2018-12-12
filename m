Content-Type: multipart/mixed; boundary="===============7520913307064869426=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [tty] c96cf923a9: WARNING:possible_circular_locking_dependency_detected
Date: Wed, 12 Dec 2018 10:07:51 +0100
Message-ID: <20181212090751.GU5289@hirez.programming.kicks-ass.net>
In-Reply-To: <20181212034252.GD431@jagdpanzerIV>
List-Id: <oe-lkp.lists.linux.dev>

--===============7520913307064869426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2018 at 12:42:52PM +0900, Sergey Senozhatsky wrote:
> Something like this (not tested):
> =

> ---
> =

>  drivers/tty/serial/serial_core.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial=
_core.c
> index c439a5a1e6c0..64050f506348 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -268,6 +268,7 @@ static void uart_shutdown(struct tty_struct *tty, str=
uct uart_state *state)
>  	struct uart_port *uport =3D uart_port_check(state);
>  	struct tty_port *port =3D &state->port;
>  	unsigned long flags =3D 0;
> +	char *xmit_buf =3D NULL;
>  =

>  	/*
>  	 * Set the TTY IO error marker
> @@ -297,15 +298,16 @@ static void uart_shutdown(struct tty_struct *tty, s=
truct uart_state *state)
>  	 */
>  	tty_port_set_suspended(port, 0);
>  =

> +	uart_port_lock(state, flags);
> +	xmit_buf =3D state->xmit.buf;
> +	state->xmit.buf =3D NULL;
> +	uart_port_unlock(uport, flags);
> +
>  	/*
>  	 * Free the transmit buffer page.
>  	 */
> -	uart_port_lock(state, flags);
> -	if (state->xmit.buf) {
> -		free_page((unsigned long)state->xmit.buf);
> -		state->xmit.buf =3D NULL;
> -	}
> -	uart_port_unlock(uport, flags);
> +	if (xmit_buf)
> +		free_page((unsigned long)xmit_buf);
>  }

That looks sensible anyhow. One should strive to not do alloc or free
under locks as much as possible anyway.

--===============7520913307064869426==--

