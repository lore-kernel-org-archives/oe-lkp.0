Content-Type: multipart/mixed; boundary="===============4300486393779511787=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [EDAC] general protection fault: 0000 [#1] SMP
Date: Sun, 15 Feb 2015 11:16:24 +0100
Message-ID: <20150215101624.GA3669@pd.tnic>
In-Reply-To: <s5hbnkvy3fc.wl-tiwai@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4300486393779511787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2015 at 09:39:03AM +0100, Takashi Iwai wrote:
> At Sun, 15 Feb 2015 15:52:58 +0800,
> Huang Ying wrote:
> > =

> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp edac-for-3.21
> > commit 7d4e4cb735b7f746c27571b6dd43ba5572a1eef4 ("EDAC: i7core: Use sta=
tic attribute groups for sysfs entries")
> =

> My bad, I must have forgotten refreshing the patch after rebasing and
> testing.  Please put the additional patch below.
> =

> =

> thanks,
> =

> Takashi
> =

> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] EDAC: i7core: Add missing NULL terminator to i7core_dev_=
attrs[]
> =

> ... forgotten in the commit 'EDAC: i7core: Use static attribute groups
> for sysfs entries'.
> =

> Reported-by: Huang Ying <ying.huang@intel.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/edac/i7core_edac.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
> index 90f6ba57f0d3..01087a38da22 100644
> --- a/drivers/edac/i7core_edac.c
> +++ b/drivers/edac/i7core_edac.c
> @@ -1162,6 +1162,7 @@ static struct attribute *i7core_dev_attrs[] =3D {
>  	&dev_attr_inject_type.attr,
>  	&dev_attr_inject_eccmask.attr,
>  	&dev_attr_inject_enable.attr,
> +	NULL
>  };
>  =

>  ATTRIBUTE_GROUPS(i7core_dev);

As the edac-for-3.21 branch is not frozen yet, I'll merge this hunk with
the commit mentioned above.

Thanks guys!

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--

--===============4300486393779511787==--

