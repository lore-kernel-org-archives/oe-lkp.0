Content-Type: multipart/mixed; boundary="===============5011520123364993657=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/2] Disable turbostat monitoring if no MSR in cpu
Date: Mon, 01 Jun 2015 19:22:36 +0800
Message-ID: <20150601112236.GA9412@wfg-t540p.sh.intel.com>
In-Reply-To: <1433155565-24724-1-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5011520123364993657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Applied both patches, thank you!

On Mon, Jun 01, 2015 at 01:46:04PM +0300, riku.voipio(a)linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> =

> turbostat depends on MSR, which is X86 specific.
> Avoid building and running on other architectures,
> by checking for the presence of MSR bit for cpuinfo.
> A check against RAPL support would be even better,
> but unfortunely there doesn't seem to be flag for
> rapl in cpuinfo
> =

> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  monitors/turbostat | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/monitors/turbostat b/monitors/turbostat
> index b9d22c9..b3b4bf1 100755
> --- a/monitors/turbostat
> +++ b/monitors/turbostat
> @@ -1,5 +1,8 @@
>  #!/bin/sh
>  =

> +# skip if cpu doesn't have msr
> +grep flags /proc/cpuinfo|grep -q ' msr ' || exit 0
> +
>  # skip unreliable machines
>  [ "${HOSTNAME#*lkp-a0[1-9]}"	!=3D "$HOSTNAME" ] && exit 0
>  [ "${HOSTNAME#*snb-drag}"	!=3D "$HOSTNAME" ] && exit 0
> -- =

> 2.1.4

--===============5011520123364993657==--

