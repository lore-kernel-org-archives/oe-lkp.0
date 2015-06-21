Content-Type: multipart/mixed; boundary="===============7355074812415721388=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/pat, drivers/media/ivtv] WARNING: CPU: 0 PID: 1 at drivers/media/pci/ivtv/ivtvfb.c:1270 ivtvfb_init()
Date: Sun, 21 Jun 2015 22:41:20 +0200
Message-ID: <20150621204120.GA11833@pd.tnic>
In-Reply-To: <20150621202348.GP11147@wotan.suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7355074812415721388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 21, 2015 at 10:23:48PM +0200, Luis R. Rodriguez wrote:
> Nope, well the driver requires huge amounts of work to work with PAT,
> that work will likely never be done, so hence the warning. Its our
> compromise as only 2 drivers will live on Linux like this and they are
> both old and rare.

Hmm, so wasn't the possibility discussed to fail loading instead and
issue a single-line pr_warn() when PAT is enabled? Those big WARN()
splats will only confuse people...

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--

--===============7355074812415721388==--

