Content-Type: multipart/mixed; boundary="===============3216416289392149852=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm/pat, drivers/media/ivtv] WARNING: CPU: 0 PID: 1 at drivers/media/pci/ivtv/ivtvfb.c:1270 ivtvfb_init()
Date: Mon, 22 Jun 2015 08:36:47 +0200
Message-ID: <20150622063647.GA24434@gmail.com>
In-Reply-To: <20150621204120.GA11833@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3216416289392149852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Borislav Petkov <bp@suse.de> wrote:

> On Sun, Jun 21, 2015 at 10:23:48PM +0200, Luis R. Rodriguez wrote:

> > Nope, well the driver requires huge amounts of work to work with PAT, t=
hat =

> > work will likely never be done, so hence the warning. Its our compromis=
e as =

> > only 2 drivers will live on Linux like this and they are both old and r=
are.
> =

> Hmm, so wasn't the possibility discussed to fail loading instead and issu=
e a =

> single-line pr_warn() when PAT is enabled? Those big WARN() splats will o=
nly =

> confuse people...

Absolutely - they are a regression.

Thanks,

	Ingo

--===============3216416289392149852==--

