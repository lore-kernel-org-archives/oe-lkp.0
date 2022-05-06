Content-Type: multipart/mixed; boundary="===============9211182037105296312=="
MIME-Version: 1.0
From: Jason A. Donenfeld <Jason@zx2c4.com>
To: lkp@lists.01.org
Subject: Re: [timekeeping] 3aeaac747d: PANIC:early_exception
Date: Fri, 06 May 2022 12:12:04 +0200
Message-ID: <YnT0dDFtq7HnRC7n@zx2c4.com>
In-Reply-To: <8735hnhz1q.ffs@tglx>
List-Id: <oe-lkp.lists.linux.dev>

--===============9211182037105296312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, May 06, 2022 at 09:59:13AM +0200, Thomas Gleixner wrote:
> +/**
> + * random_get_entropy_fallback - Returns the raw clock source value,
> + * used by random.c for platforms with no valid random_get_entropy().
> + */
> +unsigned long random_get_entropy_fallback(void)
> +{
> +	struct tk_read_base *tkr =3D &tk_core.timekeeper.tkr_mono;
> +	struct clocksource *clock =3D READ_ONCE(tkr->clock);
> +
> +	if (!timekeeping_suspended && clock)
> +		return clock->read(clock);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(random_get_entropy_fallback);

I tried to address this already in
<https://lore.kernel.org/lkml/20220505002910.IAcnpEOE2zR2ibERl4Lh3Y_PMmtb0R=
f43lVevgztJiM@z/>,
though yours looks better with the READ_ONCE() around clock, and I'll
send a v8 doing it that way. I didn't realize that clock could become
NULL again after becoming non-NULL.

I'm not quite sure I understand the purpose of !timekeeping_suspended
there, though. I'm not seeing the path where reading with it suspended
negatively affects things. I'll take your word for it though.

Jason
--===============9211182037105296312==--

