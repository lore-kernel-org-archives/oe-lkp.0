Content-Type: multipart/mixed; boundary="===============6519838713614670770=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/hweight] 65ea11ec6a: will-it-scale.per_process_ops 9.3% improvement
Date: Wed, 17 Aug 2016 07:46:05 +0200
Message-ID: <20160817054605.GA6728@nazgul.tnic>
In-Reply-To: <796A2A72-06B7-4B3D-AA38-DF558FC75857@zytor.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6519838713614670770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 04:09:19PM -0700, H. Peter Anvin wrote:
> On August 16, 2016 10:16:35 AM PDT, Borislav Petkov <bp@suse.de> wrote:
> >On Tue, Aug 16, 2016 at 09:59:00AM -0700, H. Peter Anvin wrote:
> >> Dang...
> >
> >Isn't 9.3% improvement a good thing(tm) ?
> =

> Yes, it's huge.  The only explanation I could imagine is that scrambling =
%rdi caused the scheduler to do completely the wrong thing.

I'm questioning the validity, actually. Report says test machine was
Sandy Bridge-EP and I'd bet good money this one has POPCNT support so
how are we even hitting that __sw_hweight64() path, at all?

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--

--===============6519838713614670770==--

