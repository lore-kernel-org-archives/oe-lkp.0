Content-Type: multipart/mixed; boundary="===============7331834281094563133=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/pat, drivers/media/ivtv] WARNING: CPU: 0 PID: 1 at drivers/media/pci/ivtv/ivtvfb.c:1270 ivtvfb_init()
Date: Mon, 22 Jun 2015 09:06:41 +0200
Message-ID: <20150622070641.GA19872@pd.tnic>
In-Reply-To: <20150622010138.GQ11147@wotan.suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7331834281094563133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2015 at 03:01:38AM +0200, Luis R. Rodriguez wrote:
> We can certainly replace the WARN() with pr_warn(), I don't see
> how its confusing though as its a run time real issue. Either
> way whatever you recommend is fine by me.

Yeah, it confused the 0day robot at least. :-)

But maybe because it cannot really read. But I've experienced cases
where people don't read too, see *a* splat and raise the alarm. So yeah,
I think a simple pr_warn would be much better.

Thanks.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--

--===============7331834281094563133==--

