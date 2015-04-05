Content-Type: multipart/mixed; boundary="===============1116854105365708825=="
MIME-Version: 1.0
From: Peer, Ilan <ilan.peer@intel.com>
To: lkp@lists.01.org
Subject: Re: [cfg80211] eeca9fce1d7: BUG: kernel boot oversize
Date: Sun, 05 Apr 2015 05:43:28 +0000
Message-ID: <CB3B3D4774441E42AA3EA0E1BA8230A04D097E29@HASMSX106.ger.corp.intel.com>
In-Reply-To: <CAAObsKA-fzNSPrkyK7=DQ0wYzfLcvhNNgtf+oye52Rfba__rGw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1116854105365708825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

> -----Original Message-----
> From: Tomeu Vizoso [mailto:tomeu.vizoso(a)gmail.com]
> Sent: Thursday, April 02, 2015 17:49
> To: Peer, Ilan
> Cc: Huang, Ying; Berg, Johannes; LKML; lkp(a)01.org
> Subject: Re: [LKP] [cfg80211] eeca9fce1d7: BUG: kernel boot oversize
> =

> On 24 March 2015 at 09:34, Peer, Ilan <ilan.peer@intel.com> wrote:
> > Hi,
> >
> > This mean u probably do not have crda installed, or it is not properly
> configured. These are debug prints so the simplest would be to disable
> CONFIG_CFG80211_REG_DEBUG .. unless you are debugging wireless
> regulatory flows.
> =

> Are you sure? I see lots (one every ~3 seconds) of this after rebasing on=
 latest
> linux-next and CONFIG_CFG80211_REG_DEBUG isn't enabled:
> =

> [   19.382847] cfg80211: Calling CRDA to update world regulatory domain
> =


These are printed directly using pr_info regardless of the configuration op=
tion.

> Reverting this patch brings back the old behavior.
>

This fixes the issue you reported (sorry I forgot to CC u).

https://kernel.googlesource.com/pub/scm/linux/kernel/git/jberg/mac80211-nex=
t/+/c37722bd1972118142ee54c0e1a727142d944068

Regards,

Ilan.




--===============1116854105365708825==--

