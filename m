Content-Type: multipart/mixed; boundary="===============2173992321510851725=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool: Detect assembly code falling through to INT3 padding
Date: Fri, 18 May 2018 18:06:38 +0200
Message-ID: <20180518160638.GG17285@pd.tnic>
In-Reply-To: <ce49ca7a-c5fd-6e93-9578-c91290f819d8@zytor.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2173992321510851725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 12:27:15AM -0700, H. Peter Anvin wrote:
> On 05/18/18 00:18, Ingo Molnar wrote:
> > =

> > Ok, this is cool, it addresses the robustness problem that INT3 padding=
 introduced =

> > very nicely.
> > =

> > The concept of built-in kernel tooling working at the machine code leve=
l is just =

> > so powerful - we should have added our own KCC compiler 20 years ago.
> > =

> =

> How many times has this been suggested? ;)

Goes to show we still really need it. Imagine the simplifications and
improvements we'll be able to do. Oh myyy....

/me has a wet dream.

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============2173992321510851725==--

