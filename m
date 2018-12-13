Content-Type: multipart/mixed; boundary="===============5906935359436131418=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [tty] c96cf923a9: WARNING:possible_circular_locking_dependency_detected
Date: Thu, 13 Dec 2018 14:38:34 +0900
Message-ID: <20181213053834.GH4860@jagdpanzerIV>
In-Reply-To: <20181212090751.GU5289@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5906935359436131418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/12/18 10:07), Peter Zijlstra wrote:
> > +	uart_port_lock(state, flags);
> > +	xmit_buf =3D state->xmit.buf;
> > +	state->xmit.buf =3D NULL;
> > +	uart_port_unlock(uport, flags);
> > +
> >  	/*
> >  	 * Free the transmit buffer page.
> >  	 */
> > -	uart_port_lock(state, flags);
> > -	if (state->xmit.buf) {
> > -		free_page((unsigned long)state->xmit.buf);
> > -		state->xmit.buf =3D NULL;
> > -	}
> > -	uart_port_unlock(uport, flags);
> > +	if (xmit_buf)
> > +		free_page((unsigned long)xmit_buf);
> >  }
> =

> That looks sensible anyhow. One should strive to not do alloc or free
> under locks as much as possible anyway.

Right, good point.

	-ss

--===============5906935359436131418==--

