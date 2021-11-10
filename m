Content-Type: multipart/mixed; boundary="===============4242722203275373663=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] powercap/drivers/dtpm_cpu: Fix suspend failure and kernel warning
Date: Wed, 10 Nov 2021 21:19:15 +0100
Message-ID: <CAJZ5v0hYFiGa4MwiEx6czRPdEZmxWS7Wom5DKD2VueoDn+r3oA@mail.gmail.com>
In-Reply-To: <20211108062345.273855-1-daniel.lezcano@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4242722203275373663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 8, 2021 at 7:24 AM Daniel Lezcano <daniel.lezcano@linaro.org>=
 wrote:
>
> When the ENERGY_MODEL and DTPM_CPU are enabled but actually without
> any energy model, at cpu hotplug time, the dead cpuhp callback fails
> leading to the warning.
>
> Actually, the check could be simplified and we only do an action if
> the dtpm cpu is enabled, otherwise we bail out without error.
>
> Fixes: 7a89d7eacf8e ("powercap/drivers/dtpm: Simplify the dtpm table")
> Reported-by: Kenneth R. Crudup <kenny@panix.com>
> Tested-by: Kenneth R. Crudup <kenny@panix.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Cc: lkp(a)lists.01.org
> Cc: lkp(a)intel.com
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/powercap/dtpm_cpu.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index 69eb5101b5c7..477042199d90 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -166,16 +166,13 @@ static struct dtpm_ops dtpm_ops =3D {
>
>  static int cpuhp_dtpm_cpu_offline(unsigned int cpu)
>  {
> -       struct em_perf_domain *pd;
>         struct dtpm_cpu *dtpm_cpu;
>
> -       pd =3D em_cpu_get(cpu);
> -       if (!pd)
> -               return -EINVAL;
> -
>         dtpm_cpu =3D per_cpu(dtpm_per_cpu, cpu);
> +       if (dtpm_cpu)
> +               dtpm_update_power(&dtpm_cpu->dtpm);
>
> -       return dtpm_update_power(&dtpm_cpu->dtpm);
> +       return 0;
>  }
>
>  static int cpuhp_dtpm_cpu_online(unsigned int cpu)
> --

Applied as 5.16-rc material, thanks!
--===============4242722203275373663==--

