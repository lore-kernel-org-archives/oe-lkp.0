Content-Type: multipart/mixed; boundary="===============6867679540253469689=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: LKP Multi-machine setup
Date: Fri, 15 Feb 2019 09:47:59 +0800
Message-ID: <87y36hn7ow.fsf@yhuang-dev.intel.com>
In-Reply-To: <A430BCDA-9FBE-4C02-AE78-4CEB05C0CE2D@akamai.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6867679540253469689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Loch,

Now, the only supported way to run LKP is to run it on a single
machine.  So to run it on a cluster of machines, you need to setup the
network and coordinate multiple machines by yourself.

Best Regards,
Huang, Ying

"Macdonald, Loch" <lmacdona@akamai.com> writes:

> Good afternoon,
>
> I'm trying to run LKP on a cluster of machines, but I can't seem to find =
any documentation on how to set it up. I saw the part in the slideshow abou=
t defining jobfiles, but I'm not exactly sure how to coordinate multiple cl=
ients. Do you have a guideline on how to set it up?
>
> Thanks for your help!
>
> Loch Macdonald
> Platform Infrastructure Engineering, Akamai Technologies=EF=BB=BF

--===============6867679540253469689==--

