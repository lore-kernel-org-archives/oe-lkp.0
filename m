Content-Type: multipart/mixed; boundary="===============4517119408763016878=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: ffbe758dbb [ 0.052456] Kernel panic - not syncing: Can't create rootfs
Date: Mon, 06 Aug 2018 08:23:00 +0800
Message-ID: <33324432-64e8-2349-a3d5-ec7592d3693b@intel.com>
In-Reply-To: <23713.1533200075@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4517119408763016878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 08/02/2018 04:54 PM, David Howells wrote:
> kernel test robot <rong.a.chen@intel.com> wrote:
>
>> [    0.052449] smack: Unknown parameter 'source'
> That is the actual problem.  I think this should be fixed by the attached
> patch.  I can replicate it with SELinux by removing the equivalent line f=
rom
> there.
results of the attached patch:
boot_successes: 0
boot_failures: 118
BUG:kernel_hang_in_boot_stage: 118

Thanks,
Rong, Chen

>
> David
> ---
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 339ac4d42785..c325c89be68e 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -678,6 +678,7 @@ static const struct fs_parameter_description smack_fs=
_parameters =3D {
>   	.nr_keys	=3D ARRAY_SIZE(smack_param_keys),
>   	.keys		=3D smack_param_keys,
>   	.specs		=3D smack_param_specs,
> +	.ignore_unknown	=3D true,
>   };
>   =

>   /**
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============4517119408763016878==--

