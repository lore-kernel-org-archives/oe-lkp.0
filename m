Content-Type: multipart/mixed; boundary="===============6618220293589840304=="
MIME-Version: 1.0
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [rcu] [ INFO: suspicious RCU usage. ]
Date: Wed, 04 Feb 2015 15:16:24 +0000
Message-ID: <20150204151624.GI8656@n2100.arm.linux.org.uk>
In-Reply-To: <20150204151028.GD5370@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6618220293589840304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2015 at 07:10:28AM -0800, Paul E. McKenney wrote:
> You know, this situation is giving me a bad case of nostalgia for the
> old Sequent Symmetry and NUMA-Q hardware.  On those platforms, the
> outgoing CPU could turn itself off, and thus didn't need to tell some
> other CPU when it was ready to be turned off.  Seems to me that this
> self-turn-off capability would be a great feature for future systems!

Unfortunately, some briliant people decided that secure firmware on
their platforms (which is sometimes needed to turn the secondary CPUs
off) can only be called by CPU0...

Other people decide that they can power down the secondary CPU when it
hits a WFI (wait for interrupt) instruction after arming that state
change, which is far saner - but we still need to know on the requesting
CPU when the dying CPU has completed the time-expensive parts of the
offlining process.

-- =

FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.

--===============6618220293589840304==--

