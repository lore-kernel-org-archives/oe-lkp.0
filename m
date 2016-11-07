Content-Type: multipart/mixed; boundary="===============3768404555732193735=="
MIME-Version: 1.0
From: Andrew Lunn <andrew@lunn.ch>
To: lkp@lists.01.org
Subject: Re: [net] af1fee9821: BUG:spinlock_trylock_failure_on_UP_on_CPU
Date: Mon, 07 Nov 2016 10:31:48 +0100
Message-ID: <20161107093148.GA27001@lunn.ch>
In-Reply-To: <20161107022628.GA21529@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3768404555732193735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 10:26:28AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master
> commit af1fee98219992ba2c12441a447719652ed7e983 ("net: phy: Add support f=
or Microsemi VSC 8530/40 Fast Ethernet PHY")

Humm, interesting. I've no idea how this patch can trigger such a
warning. The USB gadget does not have an Ethernet PHY, let alone a
Microsemi 8530/40 Fast Ethernet PHY this patch adds.

However, it seems nicely documented how to reproduce this. Allan, can
you setup such a system? Reproduce it, then revert the change and see
if it still happens.

   Andrew

--===============3768404555732193735==--

