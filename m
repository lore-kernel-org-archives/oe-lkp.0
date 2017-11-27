Content-Type: multipart/mixed; boundary="===============4296171074837934326=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 2f47e7e19f ("x86/mm/kaiser: Use PCID feature to make user and .."): WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:114 __early_ioremap
Date: Mon, 27 Nov 2017 10:28:35 -0800
Message-ID: <f5382aac-3714-e1e2-8ac9-94b23bd8fe6e@linux.intel.com>
In-Reply-To: <20171127180328.GA12661@u40b0340c692b58f6553c.ant.amazon.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4296171074837934326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/27/2017 10:03 AM, Eduardo Valentin wrote:
> On top of VM crashes, on your branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/daveh/x86-kaiser.git/log/=
?h=3Dkaiser-414-tipwip-20171123
> =

> I am also getting crashes in early userspace, during tlb flushes. When KA=
ISER is enabled and whenever userspace is loaded, I get a stack trace aroun=
d __do_page_fault() called from restore_regs_and_return_to_kernel(). I saw =
this very same behavior in your v3 branch (kaiser-414-tipwip-20171121) too.
> =

> The crashes are followed by a machine halt via NMI. They also get the fol=
lowing warning:
>  WARNING: can't dereference iret registers at fffffffffe198048 for ip pag=
e_fault+0x11/0x60

There was a known bug in my branch with not mapping some of the
interrupt entry routines.  Random alignment makes it break or work.

Ingo/Thomas, correct me if I'm wrong, but I think we need folks testing
here at the moment:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=3Dauto=
-latest

My tree from last week is ancient gunk at this point. :)

--===============4296171074837934326==--

