Content-Type: multipart/mixed; boundary="===============4860779793006234981=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] c4c3c3c2d0: will-it-scale.per_process_ops -61.0% regression
Date: Mon, 16 Oct 2017 12:15:48 +0200
Message-ID: <20171016101548.v3l3jgcbdogrvbvh@pd.tnic>
In-Reply-To: <20171016023917.GG26196@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4860779793006234981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 10:39:17AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -61.0% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: c4c3c3c2d00826c88b5c02c20e80704664424b9b ("x86/mm: Flush more agg=
ressively in lazy TLB mode")
> url: https://github.com/0day-ci/linux/commits/Borislav-Petkov/x86-mm-Flus=
h-more-aggressively-in-lazy-TLB-mode/20171011-115901
> =

> =

> in testcase: will-it-scale
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory

Say what now?

This is actually what got applied upstream:

b956575bed91 ("x86/mm: Flush more aggressively in lazy TLB mode")

and AFAICT, that machine is BDW and it should have PCID, right?

Or wait, that's a guest so PCID is probably not even usable for guests.
Or should we disable it in VMs?

I'm confused. Andy?

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============4860779793006234981==--

