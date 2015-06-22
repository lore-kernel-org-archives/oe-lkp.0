Content-Type: multipart/mixed; boundary="===============1971500590412029550=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@suse.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/pat, drivers/media/ivtv] WARNING: CPU: 0 PID: 1 at drivers/media/pci/ivtv/ivtvfb.c:1270 ivtvfb_init()
Date: Mon, 22 Jun 2015 03:01:38 +0200
Message-ID: <20150622010138.GQ11147@wotan.suse.de>
In-Reply-To: <20150621204120.GA11833@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============1971500590412029550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 21, 2015 at 10:41:20PM +0200, Borislav Petkov wrote:
> On Sun, Jun 21, 2015 at 10:23:48PM +0200, Luis R. Rodriguez wrote:
> > Nope, well the driver requires huge amounts of work to work with PAT,
> > that work will likely never be done, so hence the warning. Its our
> > compromise as only 2 drivers will live on Linux like this and they are
> > both old and rare.
> =

> Hmm, so wasn't the possibility discussed to fail loading =


It will fail load.

> instead and
> issue a single-line pr_warn() when PAT is enabled? =


During review no one opposed the idea of having the warn
as its a load thing, not a compile thing, and a user
that does not get their driver loaded should know why,
otherwise its not clear.

> Those big WARN() splats will only confuse people...

We can certainly replace the WARN() with pr_warn(), I don't see
how its confusing though as its a run time real issue. Either
way whatever you recommend is fine by me.

 Luis

--===============1971500590412029550==--

