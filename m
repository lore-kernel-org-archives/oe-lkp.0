Content-Type: multipart/mixed; boundary="===============6515643596729007045=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Sat, 25 Apr 2020 15:01:36 +0200
Message-ID: <20200425130136.GA28245@zn.tnic>
In-Reply-To: <20200425114414.GU26573@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6515643596729007045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2020 at 07:44:14PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -14.1% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 1de08dccd383482a3e88845d3554094d338f5ff9 ("x86/mce: Add a struct =
mce.kflags field")

I don't see how a struct mce member addition will cause any performance
regression. Please check your test case.

Thx.

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 36809=
, AG N=C3=BCrnberg
--===============6515643596729007045==--

