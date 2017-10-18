Content-Type: multipart/mixed; boundary="===============5616499578140721373=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] c4c3c3c2d0: will-it-scale.per_process_ops -61.0% regression
Date: Wed, 18 Oct 2017 16:26:04 +0200
Message-ID: <20171018142603.jf247xiyxolab5ie@pd.tnic>
In-Reply-To: <CALCETrWc1EMGihfKJMqZarbAhrOOjdhgsmpNtPHOrXndTyw19w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5616499578140721373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 03:06:33PM -0700, Andy Lutomirski wrote:
> This kind of issue is why I like having the debugfs knob there, at
> least until the dust settles.

Sure, but removing it later is harder than simply giving people the knob
patch separately and asking them "run this". If it turns out that we
need it really often, we can always add it.

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============5616499578140721373==--

