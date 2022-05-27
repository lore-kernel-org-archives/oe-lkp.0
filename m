Content-Type: multipart/mixed; boundary="===============6505321794708584055=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [cpufreq] a6cb305191: kernel_BUG_at_drivers/cpufreq/cpufreq.c
Date: Fri, 27 May 2022 09:24:42 +0530
Message-ID: <20220527035442.su7hridojtvik5x7@vireshk-i7>
In-Reply-To: <20220527031320.GA10419@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6505321794708584055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 27-05-22, 11:13, kernel test robot wrote:
> [ 10.349308][ T200] cpufreq_online (drivers/cpufreq/cpufreq.c:1562) =

> [ 10.349314][ T200] cpufreq_add_dev (drivers/cpufreq/cpufreq.c:1578) =

> [ 10.349318][ T200] subsys_interface_register (drivers/base/bus.c:1036) =


Thanks. I have updated the patch now to fix this.

-- =

viresh
--===============6505321794708584055==--

