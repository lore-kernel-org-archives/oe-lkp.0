Content-Type: multipart/mixed; boundary="===============9129435694366963775=="
MIME-Version: 1.0
From: Shuah Khan <skhan@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] selftests/ir: fix build with ancient kernel headers
Date: Fri, 04 Feb 2022 13:45:20 -0700
Message-ID: <2d0da794-6fbd-1b82-eca2-68d9451fff46@linuxfoundation.org>
In-Reply-To: <Yfl+LOPk+KQdc0Us@gofer.mess.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============9129435694366963775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/1/22 11:38 AM, Sean Young wrote:
> Since commit e2bcbd7769ee ("tools headers UAPI: remove stale lirc.h"),
> the build of the selftests fails on rhel 8 since its version of
> /usr/include/linux/lirc.h has no definition of RC_PROTO_RCMM32, etc [1].
> =

> [1] https://lkml.org/lkml/2022/1/28/275
> =

> Fixes: e2bcbd7769ee ("tools headers UAPI: remove stale lirc.h")
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---

Applied now to linux-kselftest fixes branch - decided to take
it through since there is no real dependency on previous patch
as far as the change goes.

Fixes: e2bcbd7769ee ("tools headers UAPI: remove stale lirc.h")

thanks,
-- Shuah
--===============9129435694366963775==--

