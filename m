Content-Type: multipart/mixed; boundary="===============3760133422742625825=="
MIME-Version: 1.0
From: Andrew Lunn <andrew@lunn.ch>
To: lkp@lists.01.org
Subject: Re: [net] 9dd6d07682: kernel_BUG_at_drivers/net/phy/mdio_bus.c
Date: Thu, 30 May 2019 01:03:32 +0200
Message-ID: <20190529230332.GC18059@lunn.ch>
In-Reply-To: <VI1PR0402MB28000F3C6A070321299AA57EE01F0@VI1PR0402MB2800.eurprd04.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3760133422742625825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>     phydev =3D dsa_port_get_phy_device(dp);
>     if (!phydev)
>           return 0;
> =

> I don't see how this method is sane either.

If i remember correctly, the thinking was, you can get away without
the PHY, at least during bring up of a new switch/board. So don't
consider this a fatal error. Now that it is fatal, in the sense of an
Opps, maybe we should change this.

      Andrew

--===============3760133422742625825==--

