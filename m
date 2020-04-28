Content-Type: multipart/mixed; boundary="===============0390248992090475557=="
MIME-Version: 1.0
From: wenhuan.huang@intel.com
To: lkp@lists.01.org
Subject: Re: [drm/i915/gen9] 53b9bd37af: phoronix-test-suite.clpeak.KernelLatency.us 22.5% regression
Date: Tue, 28 Apr 2020 02:44:09 +0000
Message-ID: <20200428024409.2763.17501@ml01.vlan13.01.org>
In-Reply-To: <20200319023752.GN11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0390248992090475557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Akeem,

We also noticed a 20%  regression of phoronix-test-suite.clpeak.KernelLaten=
cy.us due to
commit:

commit: 53b9bd37af59d1def99b20707536105857eb9bd0 ("drm/i915/gen9: Clear res=
idual
context state on context switch")

in testcase: phoronix-test-suite
on test machine: =

1. Intel Core i9-9900K @ 5.00GHz with 512GB memory
2. Intel Core i7-8700 @ 4.60GHz with 8GB memory

Could you please help take a look?

Thanks,
Wenhuan
--===============0390248992090475557==--

