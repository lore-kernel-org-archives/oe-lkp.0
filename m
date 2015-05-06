Content-Type: multipart/mixed; boundary="===============0250818786741841190=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [GRE] c5441932145: IP-Config: Failed to open gretap0
Date: Wed, 06 May 2015 10:00:36 -0400
Message-ID: <20150506.100036.1263633520950199131.davem@davemloft.net>
In-Reply-To: <1430881593.5148.0.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0250818786741841190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Huang Ying <ying.huang@intel.com>
Date: Wed, 06 May 2015 11:06:33 +0800

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit c54419321455631079c7d6e60bc732dd0c5914c5 ("GRE: Refactor GRE tunne=
ling code.")
> =

> After the commit, we found the following message in kernel log:
> =

> [    1.935578] IP-Config: Failed to open gretap0
> =

> I think that may make some user confused.

I would be careful about analyzing the state of the tree specifically
at the commit, because there have been many, many, bug fixes applied
to the tree since then specifically to deal with fallout from that
change.

--===============0250818786741841190==--

