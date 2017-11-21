Content-Type: multipart/mixed; boundary="===============4505660740648415328=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [tracer_init_tracefs] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:1]
Date: Tue, 21 Nov 2017 14:55:07 +0100
Message-ID: <alpine.DEB.2.20.1711211454240.1782@nanos>
In-Reply-To: <20171121122745.uaot43rwpv2qqdvq@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4505660740648415328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Nov 2017, Fengguang Wu wrote:

> On Tue, Nov 21, 2017 at 07:07:36PM +0800, Fengguang Wu wrote:
> > Hello,
> > =

> > FYI this happens in mainline kernel 4.14.0-03308-g670ffcc.
> > It looks like a new regression after 4.14.
> =

> Sorry it actually shows up since 4.12.

tracer_init_tracefs is probably a red herring. That's just a victim of some
sorts.

Thanks,

	tglx

--===============4505660740648415328==--

