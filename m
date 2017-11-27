Content-Type: multipart/mixed; boundary="===============0464354410133350965=="
MIME-Version: 1.0
From: Dave Jones <davej@codemonkey.org.uk>
To: lkp@lists.01.org
Subject: Re: [trinity] WARNING: CPU: 0 PID: 515 at drivers/pci/pci-sysfs.c:1224 pci_mmap_resource+0xd6/0x10e
Date: Mon, 27 Nov 2017 16:30:01 -0500
Message-ID: <20171127213001.GA12537@codemonkey.org.uk>
In-Reply-To: <20171124001139.bmuq6dkj63wuqzls@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0464354410133350965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2017 at 08:11:39AM +0800, Fengguang Wu wrote:
 > Hello,
 > =

 > FYI this happens in mainline kernel 4.14.0-12995-g0c86a6b.
 > It at least dates back to v4.9 .
 > =

 > I wonder where can we avoid this warning, by improving trinity (or how
 > we use it), or the pci subsystem?
 > =

 > [main] Added 42 filenames from /dev
 > [main] Added 13651 filenames from /proc
 > [main] Added 11163 filenames from /sys
 > [   19.452176] ------------[ cut here ]------------
 > [   19.452938] process "trinity-main" tried to map 0x00004000 bytes at p=
age 0x00000001 on 0000:00:06.0 BAR 4 (start 0x        fe008000, size 0x    =
        4000)
 > [   19.454804] WARNING: CPU: 0 PID: 515 at drivers/pci/pci-sysfs.c:1224 =
pci_mmap_resource+0xd6/0x10e

That's a root-only operation, where we allow the user to shoot
themselves in the foot afaik.   What you could do now that you're
running an up to date trinity in 0day, is pass the --dropprivs flag
to setuid to nobody in the child processes.

	Dave


--===============0464354410133350965==--

