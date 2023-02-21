Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB418C0B
	for <oe-lkp@lists.linux.dev>; Tue, 21 Feb 2023 19:50:46 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1pUYes-00078k-Rx; Tue, 21 Feb 2023 20:50:38 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1pUYep-0006nq-Dg; Tue, 21 Feb 2023 20:50:35 +0100
Date: Tue, 21 Feb 2023 20:50:35 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Linux Memory Management List <linux-mm@kvack.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org
Subject: Re: [linux-next:master] [net] 9b01c885be:
 WARNING:at_drivers/net/phy/phy.c:#phy_state_machine
Message-ID: <20230221195035.GG19238@pengutronix.de>
References: <202302211644.c12d19de-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202302211644.c12d19de-yujie.liu@intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-lkp@lists.linux.dev

On Wed, Feb 22, 2023 at 12:56:26AM +0800, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed WARNING:at_drivers/net/phy/phy.c:#phy_state_machine due to commit (built with clang-14):
> 
> commit: 9b01c885be364526d8c05794f8358b3e563b7ff8 ("net: phy: c22: migrate to genphy_c45_write_eee_adv()")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master d2af0fa4bfa4ec29d03b449ccd43fee39501112d]

This issue should be fixed by following patch:
https://lore.kernel.org/all/20230221050334.578012-2-o.rempel@pengutronix.de/

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
