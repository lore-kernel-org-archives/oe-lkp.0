Content-Type: multipart/mixed; boundary="===============7880022148054659296=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] ed3ce2a917: BUG:unable_to_handle_kernel
Date: Thu, 09 Mar 2017 09:14:01 +0100
Message-ID: <20170309081401.7nk6ngcz4eznohi5@pd.tnic>
In-Reply-To: <20170309021310.GB11500@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7880022148054659296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 10:13:10AM +0800, Ye Xiaolong wrote:
> >Anyway, the diff is below, please try that ontop of tip's x86/asm branch
> >which already has the clear_page patch:
> >
> >http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/log/?h=3Dx86/asm
> >
> >Thanks!
> =

> Hmm, I've checkout the tip's x86/asm branch (HEAD is f25d38475 "x86/asm:
> Optimize clear_page()"), but I failed to apply your diff on top of it (er=
ror
> log as below).

Right, Ingo merged the diff I gave you already into the patch there
so that x86/asm already contains the fixed version. You could run the
current tip/x86/asm branch to confirm that it fixes the issue for you.

Thanks.

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============7880022148054659296==--

