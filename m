Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C5F2585
	for <oe-lkp@lists.linux.dev>; Thu,  3 Aug 2023 06:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 1608880FE;
	Thu,  3 Aug 2023 06:52:51 +0000 (UTC)
Date: Thu, 3 Aug 2023 09:52:49 +0300
From: Tony Lindgren <tony@atomide.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v5 3/3] serial: core: Fix serial core controller port
 name to show controller id
Message-ID: <20230803065249.GF14799@atomide.com>
References: <20230725054216.45696-4-tony@atomide.com>
 <202308021529.35b3ad6c-oliver.sang@intel.com>
 <ca09d15f-50ab-452c-a3d5-f2b4cde6426f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ca09d15f-50ab-452c-a3d5-f2b4cde6426f@sirena.org.uk>

* Mark Brown <broonie@kernel.org> [230802 18:20]:
> On Wed, Aug 02, 2023 at 04:15:28PM +0800, kernel test robot wrote:
>=20
> > kernel test robot noticed machine hang on:
>=20
> > commit: 4de64f4800a581e7eeba6392b3b2ce2131195145 ("[PATCH v5 3/3] seria=
l: core: Fix serial core controller port name to show controller id")
> > url: https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/seria=
l-core-Controller-id-cannot-be-negative/20230725-134452
> > base: https://git.kernel.org/cgit/linux/kernel/git/gregkh/tty.git tty-t=
esting
> > patch link: https://lore.kernel.org/all/20230725054216.45696-4-tony@ato=
mide.com/
> > patch subject: [PATCH v5 3/3] serial: core: Fix serial core controller =
port name to show controller id
> >=20
> > in testcase: boot
> >=20
> > compiler: gcc-12
> > test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.1=
0GHz (Cascade Lake) with 512G memory
>=20
> I've also bisected this commit as causing boot hangs on at least the
> i.MX8MP-EVK, though most of the boards in my lab and a huge swathe of
> those in KernelCI are out:
>=20
>    https://linux.kernelci.org/test/job/next/branch/master/kernel/next-202=
30802/plan/baseline/
>=20
> which is having a pretty devastating effect on -next testing.

Yes sorry about that, I should have noticed it right away. I thought I
still had my test machine set to use the console=3DDEVNAME:0.0 style
naming and I mostly test over ssh and was just looking at the DEVNAME.

Regards,

Tony
