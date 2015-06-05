Content-Type: multipart/mixed; boundary="===============1762400358167073178=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/3] choose cgroup-bin over cgroup-tools
Date: Fri, 05 Jun 2015 20:10:56 +0800
Message-ID: <20150605121056.GA10764@wfg-t540p.sh.intel.com>
In-Reply-To: <1433505698-5883-1-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1762400358167073178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Applied all 3 patches, thank you!

On Fri, Jun 05, 2015 at 03:01:36PM +0300, riku.voipio(a)linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> =

> cgroup-tools is relatively new rename of
> cgroup-bin package. Use cgroup-bin for wider
> compatability (ubuntu and older debian)
> =

> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  distro/debian/autotest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/distro/debian/autotest b/distro/debian/autotest
> index f3ee0a4..a31a896 100644
> --- a/distro/debian/autotest
> +++ b/distro/debian/autotest
> @@ -1,6 +1,6 @@
>  build-essential
>  python-simplejson
> -cgroup-tools
> +cgroup-bin
>  libtool
>  apt-file
>  sg3-utils
> -- =

> 2.1.4

--===============1762400358167073178==--

