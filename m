Content-Type: multipart/mixed; boundary="===============8285225811381528897=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/2] detect-system: add arm and arm64
Date: Fri, 29 May 2015 19:28:22 +0800
Message-ID: <20150529112822.GA23463@wfg-t540p.sh.intel.com>
In-Reply-To: <1432897290-7364-1-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8285225811381528897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Applied both patches, thank you!

On Fri, May 29, 2015 at 02:01:29PM +0300, riku.voipio(a)linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> =

> Add the architectures to allow running LKP on
> arm based architectures. The actual information
> doesn't seem to be used (no use on _system_arch
> or systemArch found with grep), so alternative
> could be the entire detection logic.
> =

> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  lib/detect-system.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/lib/detect-system.sh b/lib/detect-system.sh
> index 65de2ee..7460c15 100755
> --- a/lib/detect-system.sh
> +++ b/lib/detect-system.sh
> @@ -25,6 +25,10 @@ parse_executable_arch()
>  			_system_arch=3Dx86_64;;
>  		*80[3456]86)
>  			_system_arch=3Di386;;
> +		*AArch64)
> +			_system_arch=3Daarch64;;
> +		*ARM)
> +			_system_arch=3Darm;;
>  		*)
>  			_system_arch=3Dunknown
>  			return 1;;
> -- =

> 2.1.4

--===============8285225811381528897==--

