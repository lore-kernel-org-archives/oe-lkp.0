Content-Type: multipart/mixed; boundary="===============0603655762008294011=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/fpu] d91cab7813: CPU feature '(null)' is not supported.
Date: Thu, 08 Oct 2015 15:04:59 -0700
Message-ID: <5616E88B.1010004@linux.intel.com>
In-Reply-To: <87io6hx5r2.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0603655762008294011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/07/2015 10:56 PM, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
> commit d91cab78133d33b1dfd3d3fa7167fcbf74fb5f99 ("x86/fpu: Rename XSAVE m=
acros")
> =

> The following new message is in kernel log with your commit.
> =

> [    6.237440] CPU feature '(null)' is not supported.

I think this is fixed by:

> http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?h=3Dx86/f=
pu&id=3D158ecc39185b885420e5136b803b29be2bbec7fb


--===============0603655762008294011==--

