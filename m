Content-Type: multipart/mixed; boundary="===============5313487532874651218=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [tty] c96cf923a9: WARNING:possible_circular_locking_dependency_detected
Date: Thu, 13 Dec 2018 11:19:26 +0900
Message-ID: <20181213021926.GC4860@jagdpanzerIV>
In-Reply-To: <137479ad-d38e-7d26-dae4-a4e721d69928@arista.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5313487532874651218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/12/18 14:54), Dmitry Safonov wrote:
> > In this particular case we probably can just move free_page()
> > out of uart_port lock scope. Note that free_page()->MM can printk()
> > on its own.
> > =

> > =

> > Something like this (not tested):
> =

> Looks good to me.
> Probably, it's worth to update comment about freeing just to make sure
> no one will "refactor"/"simplify" it some day.
> =

> Does it make sense to add this to your patch?

Makes perfect sense, thanks! I'll send a patch a bit later.

	-ss

--===============5313487532874651218==--

