Content-Type: multipart/mixed; boundary="===============6201520655448199653=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@suse.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/pat, drivers/media/ivtv] WARNING: CPU: 0 PID: 1 at drivers/media/pci/ivtv/ivtvfb.c:1270 ivtvfb_init()
Date: Mon, 22 Jun 2015 19:19:39 +0200
Message-ID: <20150622171939.GR11147@wotan.suse.de>
In-Reply-To: <20150622070641.GA19872@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============6201520655448199653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2015 at 09:06:41AM +0200, Borislav Petkov wrote:
> On Mon, Jun 22, 2015 at 03:01:38AM +0200, Luis R. Rodriguez wrote:
> > We can certainly replace the WARN() with pr_warn(), I don't see
> > how its confusing though as its a run time real issue. Either
> > way whatever you recommend is fine by me.
> =

> Yeah, it confused the 0day robot at least. :-)
> =

> But maybe because it cannot really read. But I've experienced cases
> where people don't read too, see *a* splat and raise the alarm. So yeah,
> I think a simple pr_warn would be much better.

OK I'll submit a follow up fix and say the robot reported it :)

 Luis

--===============6201520655448199653==--

