Content-Type: multipart/mixed; boundary="===============5218479661316993700=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86: fix rdmsr MSR_PLATFORM_INFO unsafe warning in kvm guest
Date: Wed, 22 Jun 2016 19:43:15 +0200
Message-ID: <aab33eba-e2d7-ff60-6a63-abee2a47cac8@redhat.com>
In-Reply-To: <1466558908-3524-1-git-send-email-wanpeng.li@hotmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5218479661316993700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 22/06/2016 03:28, Wanpeng Li wrote:
>  =

>  get_ratio:
> -	rdmsr(MSR_PLATFORM_INFO, lo, hi);
> -	ratio =3D (lo >> 8) & 0xff;
> +	if (!rdmsr_safe(MSR_PLATFORM_INFO, &lo, &hi))
> +		ratio =3D (lo >> 8) & 0xff;

This looks good, thanks.

Paolo

--===============5218479661316993700==--

