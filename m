Content-Type: multipart/mixed; boundary="===============1302981660066300328=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: [mm] BUG: unable to handle kernel paging request at c2446ffc
Date: Wed, 03 Dec 2014 10:13:53 +0900
Message-ID: <20141203011353.GA10084@js1304-P5Q-DELUXE>
In-Reply-To: <20141202050417.GA10296@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1302981660066300328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2014 at 09:04:17PM -0800, Fengguang Wu wrote:
> > Hello, Fengguang.
> > =

> > First of all, thanks for reporting!
> > It always helps me a lot.
> > =

> > But, in this time, I can't reproduce this failure with your attached
> =

> Judging from the bisect log, it showed up once per 26 boots, so may
> not be easy to reproduce. The other bisect below looks easier to
> reproduce.
> =

> > configuration. Instead of this failure, sometimes, OOM happens in my
> > testing with your configuration. I don't know why it happens. :)
> =

> Yes, it's not really obvious how the change will be related to this BUG. =

> =

> > Could you have another configuration to trigger this bug?
> =

> Sure. Below is another bisect result.

Hello, Fengguang.

Great! I can reproduce the problem with you another bisect result.
Thanks a lot!
Will send the fix to Andrew.

Thanks.


--===============1302981660066300328==--

