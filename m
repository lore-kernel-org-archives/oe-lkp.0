Content-Type: multipart/mixed; boundary="===============8826823891970556990=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [fortify] 728833277d: WARNING:at_net/netlink/af_netlink.c:#netlink_ack
Date: Wed, 07 Sep 2022 15:49:14 +0800
Message-ID: <YxhM+kszs2mCFVyV@xsang-OptiPlex-9020>
In-Reply-To: <YxhKp4n7K4h3aMQt@work>
List-Id: <oe-lkp.lists.linux.dev>

--===============8826823891970556990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Wed, Sep 07, 2022 at 08:39:19AM +0100, Gustavo A. R. Silva wrote:
> On Wed, Sep 07, 2022 at 01:42:16PM +0800, kernel test robot wrote:
> =

> Hi!
> =

> > =

> > Hi Kees Cook,
> > =

> > the patch "[PATCH 1/2] fortify: Add run-time WARN for cross-field memcp=
y()"
> > raises a persistent WARNING as below report in our tests.
> > =

> > according to commit message, we understand this is kind of expected. but
> > we don't have enough knowledge if it reveals a real issue in kernel sou=
rce
> > code and what the next step could be.
> > =

> > so we still report FYI.
> > =

> > if you think it's unnecessary for us to make out this kind of report, p=
lease
> > let us know. we will consider how to refine our report rules. Thanks a =
lot!
> > =

> > below is the full report.
> =

> It seems that the idea is to continue reporting these warnings, as they
> help us identify the places that need to be audited and determine how to
> refactor the code (in case it's a false positive), or how to properly fix
> it (in case it's an actual bug).

thanks a lot! very glad our report is helpful :)

> =

> In this case, it seems that the issue was already addressed by this patch:
> =

> https://lore.kernel.org/linux-hardening/20220903043749.3102675-1-keescook=
(a)chromium.org/
> =

> Thanks
> --
> Gustavo
--===============8826823891970556990==--

