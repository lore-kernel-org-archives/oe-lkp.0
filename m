Content-Type: multipart/mixed; boundary="===============5504723361862469118=="
MIME-Version: 1.0
From: Steffen Klassert <steffen.klassert@secunet.com>
To: lkp@lists.01.org
Subject: Re: [ip_tunnel] WARNING: CPU: 0 PID: 1 at net/batman-adv/hard-interface.c:92 batadv_is_on_batman_iface()
Date: Thu, 27 Nov 2014 07:32:33 +0100
Message-ID: <20141127063232.GB6390@secunet.com>
In-Reply-To: <20141126195745.GB22400@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5504723361862469118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi.

On Wed, Nov 26, 2014 at 11:57:45AM -0800, Fengguang Wu wrote:
> HI Steffen,
> =

> We detected this warning in the stable tree. I wonder if it's known
> issue and if there are fixes in mainline.
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git lin=
ux-3.14.y
> =

> commit 49da0655e28b5bf9d869e1c50c15c990c5db5f94
> Author:     Steffen Klassert <steffen.klassert@secunet.com>
> AuthorDate: Mon May 19 11:36:56 2014 +0200
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Sat May 31 13:20:39 2014 -0700
> =

>     ip_tunnel: Initialize the fallback device properly
>     =

>     [ Upstream commit 78ff4be45a4c51d8fb21ad92e4fabb467c6c3eeb ]
>     =

>     We need to initialize the fallback device to have a correct mtu
>     set on this device. Otherwise the mtu is set to null and the device
>     is unusable.
>     =

>     Fixes: fd58156e456d ("IPIP: Use ip-tunneling code.")
>     Cc: Pravin B Shelar <pshelar@nicira.com>
>     Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> =


This patch spotted a bug in batman-adv. Discussion is here:

https://lkml.org/lkml/2014/5/22/27

Mainline fix is:

commit b6ed5498601df40489606dbc14a9c7011c16630b
Author: Cong Wang <cwang@twopensource.com>
Date:   Thu May 22 11:57:17 2014 -0700

    batman: fix a bogus warning from batadv_is_on_batman_iface()
    =

    batman tries to search dev->iflink to check if it's a batman interface,
    but ->iflink could be 0, which is not a valid ifindex. It should just
    avoid iflink =3D=3D 0 case.
    =

    Reported-by: Jet Chen <jet.chen@intel.com>
    Tested-by: Jet Chen <jet.chen@intel.com>
    Cc: David S. Miller <davem@davemloft.net>
    Cc: Steffen Klassert <steffen.klassert@secunet.com>
    Cc: Antonio Quartulli <antonio@open-mesh.com>
    Cc: Marek Lindner <mareklindner@neomailbox.ch>
    Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
    Signed-off-by: Cong Wang <cwang@twopensource.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>

Apparently it did not make it into the linux-3.14.y stable tree.


--===============5504723361862469118==--

