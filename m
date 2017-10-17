Content-Type: multipart/mixed; boundary="===============4541304882637044998=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] c4c3c3c2d0: will-it-scale.per_process_ops -61.0% regression
Date: Tue, 17 Oct 2017 10:00:37 +0200
Message-ID: <20171017080037.fmgovp53nbvuukzh@pd.tnic>
In-Reply-To: <20171017045743.GA237@x4>
List-Id: <oe-lkp.lists.linux.dev>

--===============4541304882637044998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 06:57:43AM +0200, Markus Trippelsdorf wrote:
> On 2017.10.16 at 18:06 -0700, Andy Lutomirski wrote:
> > On Mon, Oct 16, 2017 at 3:15 AM, Borislav Petkov <bp@alien8.de> wrote:
> > > On Mon, Oct 16, 2017 at 10:39:17AM +0800, kernel test robot wrote:
> > >>
> > >> Greeting,
> > >>
> > >> FYI, we noticed a -61.0% regression of will-it-scale.per_process_ops=
 due to commit:
> =

> I think you are reading this wrong:
> -61.0% regression means 61.0% improvement.

Well, it has this:

5b8809deb4b0a77f  c4c3c3c2d00826c88b5c02c20e
----------------  --------------------------
         %stddev      change         %stddev
             \          |                \
    448554             -61%     174892        will-it-scale.per_process_ops

Xiaolong, can you first explain what those numbers mean? And how do you
compute those 61%?

Thx.

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============4541304882637044998==--

