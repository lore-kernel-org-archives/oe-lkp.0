Content-Type: multipart/mixed; boundary="===============2591306383355059078=="
MIME-Version: 1.0
From: Johannes Berg <johannes@sipsolutions.net>
To: lkp@lists.01.org
Subject: Re: [mac80211_hwsim] 8cafe19852: hwsim.fst_ap_config_default.fail
Date: Tue, 08 Sep 2020 20:41:08 +0200
Message-ID: <12f9c1c504053f9119a0965ce468aa1da195421b.camel@sipsolutions.net>
In-Reply-To: <4b20df478e8e9a1e36dfa92b3c510022@adapt-ip.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2591306383355059078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-09-08 at 11:00 -0700, Thomas Pedersen wrote:
> - LKML
> =

> On 2020-09-06 01:49, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 8cafe19852d95d6494cbd8c1ae24dbd621588a91 ("[PATCH v2 21/22]
> > mac80211_hwsim: indicate support for S1G")
> > url:
> > https://github.com/0day-ci/linux/commits/Thomas-Pedersen/add-support-fo=
r-S1G-association/20200901-045826
> > base:
> > https://git.kernel.org/cgit/linux/kernel/git/jberg/mac80211-next.git
> > master
> =

> This is really cool. Thanks Rong (?).
> =

> I'll move the "fix TSF timestamp write to S1G beacon" patch before the =

> one which actually exposes S1G to hwsim.

Yeah, I was thinking we should do that anyway.

If those two small things (ARRAY_SIZE & patch reordering) are the only
changes, I guess I can do that.

Unless you want to look at the reordering of the nl80211 bands, but you
seemed to say it won't really matter.

johannes

--===============2591306383355059078==--

