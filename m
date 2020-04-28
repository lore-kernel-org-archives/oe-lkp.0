Content-Type: multipart/mixed; boundary="===============1807362166195722286=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/gen9] 53b9bd37af: phoronix-test-suite.clpeak.KernelLatency.us 22.5% regression
Date: Tue, 28 Apr 2020 16:16:45 +0800
Message-ID: <03889b08-9fab-429f-b2ae-142ed1e46f35@intel.com>
In-Reply-To: <20200428024409.2763.17501@ml01.vlan13.01.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1807362166195722286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

cc Akeem:

On 4/28/20 10:44 AM, wenhuan.huang(a)intel.com wrote:
> Hi Akeem,
>
> We also noticed a 20%  regression of phoronix-test-suite.clpeak.KernelLat=
ency.us due to
> commit:
>
> commit: 53b9bd37af59d1def99b20707536105857eb9bd0 ("drm/i915/gen9: Clear r=
esidual
> context state on context switch")
>
> in testcase: phoronix-test-suite
> on test machine:
> 1. Intel Core i9-9900K @ 5.00GHz with 512GB memory
> 2. Intel Core i7-8700 @ 4.60GHz with 8GB memory
>
> Could you please help take a look?
>
> Thanks,
> Wenhuan
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============1807362166195722286==--

