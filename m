Content-Type: multipart/mixed; boundary="===============3969009718562887363=="
MIME-Version: 1.0
From: Christian König <deathsimple@vodafone.de>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] drm/radeon: Init amdkfd only if it was compiled
Date: Mon, 29 Dec 2014 13:41:48 +0100
Message-ID: <54A14C0C.8090401@vodafone.de>
In-Reply-To: <1419843586-29864-1-git-send-email-oded.gabbay@amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3969009718562887363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am 29.12.2014 um 09:59 schrieb Oded Gabbay:
> This patch changes the radeon_kfd_init(), which is used to initialize the
> interface between radeon and amdkfd, so the interface will be initialized=
 only
> if amdkfd was build, either as module or inside the kernel image.
>
> In the modules case, the symbol_request() will be used (same as old code)=
. In
> the in-image compilation case, a direct call to kgd2kfd_init() will be do=
ne.
> For other cases, radeon_kfd_init() will just return false.
>
> This patch is necessary because in case of the following specific
> configuration: kernel 32-bit, no modules support, random kernel base and =
no
> hibernation, the symbol_request() doesn't work as expected - it doesn't r=
eturn
> NULL if the symbol doesn't exists - which makes the kernel panic.
>
> Signed-off-by: Oded Gabbay <oded.gabbay@amd.com>

Using symbol_request() in general doesn't seem to be such a good idea, =

because it breaks symbol versioning and as far as I can see is only very =

rarely used in drivers (AFAIK only V4L drivers).

But for the moment I don't have another idea either except for always =

loading the module which on most hardware is completely unnecessary. =

Maybe we should consider restructuring the module load dependencies in =

the next kernel release.

For now the patch is Reviewed-by: Christian K=C3=B6nig <christian.koenig@=
amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_kfd.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kfd.c b/drivers/gpu/drm/radeon=
/radeon_kfd.c
> index 242fd8b..d3e78b4 100644
> --- a/drivers/gpu/drm/radeon/radeon_kfd.c
> +++ b/drivers/gpu/drm/radeon/radeon_kfd.c
> @@ -101,6 +101,7 @@ static const struct kgd2kfd_calls *kgd2kfd;
>   =

>   bool radeon_kfd_init(void)
>   {
> +#if defined(CONFIG_HSA_AMD_MODULE)
>   	bool (*kgd2kfd_init_p)(unsigned, const struct kfd2kgd_calls*,
>   				const struct kgd2kfd_calls**);
>   =

> @@ -117,6 +118,17 @@ bool radeon_kfd_init(void)
>   	}
>   =

>   	return true;
> +#elif defined(CONFIG_HSA_AMD)
> +	if (!kgd2kfd_init(KFD_INTERFACE_VERSION, &kfd2kgd, &kgd2kfd)) {
> +		kgd2kfd =3D NULL;
> +
> +		return false;
> +	}
> +
> +	return true;
> +#else
> +	return false;
> +#endif
>   }
>   =

>   void radeon_kfd_fini(void)


--===============3969009718562887363==--

