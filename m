Content-Type: multipart/mixed; boundary="===============8767301724826987721=="
MIME-Version: 1.0
From: Andrew Lunn <andrew@lunn.ch>
To: lkp@lists.01.org
Subject: Re: [net] b8154ef682: WARNING:at_drivers/net/phy/phy_device.c:#phy_driver_register
Date: Wed, 16 Jan 2019 14:40:58 +0100
Message-ID: <20190116134058.GA24229@lunn.ch>
In-Reply-To: <20190116085858.pfl4vuutel3b5kgb@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8767301724826987721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2019 at 04:58:58PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: b8154ef682a9a745880ecbb2ee26b16297c9bfd0 ("[PATCH net] net: phy: =
phy driver features are mandatory")
> url: https://github.com/0day-ci/linux/commits/Camelia-Groza/net-phy-phy-d=
river-features-are-mandatory/20190116-004308
> =

> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------------------------+---------=
---+------------+
> |                                                              | 2f960bd0=
56 | b8154ef682 |
> +--------------------------------------------------------------+---------=
---+------------+
> | boot_successes                                               | 45      =
   | 0          |
> | boot_failures                                                | 1       =
   | 4          |
> | BUG:kernel_timeout_in_torture_test_stage                     | 1       =
   |            |
> | WARNING:at_drivers/net/phy/phy_device.c:#phy_driver_register | 0       =
   | 4          |
> | EIP:phy_driver_register                                      | 0       =
   | 4          |
> +--------------------------------------------------------------+---------=
---+------------+
> =

> =

> =

> [  458.251512] WARNING: CPU: 0 PID: 1 at drivers/net/phy/phy_device.c:224=
6 phy_driver_register+0x90/0xe0
> [  458.260864] CPU: 0 PID: 1 Comm: swapper Tainted: G                T 4.=
20.0-11080-gb8154ef6 #158
> [  458.260864] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [  458.260864] EIP: phy_driver_register+0x90/0xe0
> [  458.260864] Code: 5d 89 7b 08 89 03 89 d8 c7 43 14 02 00 00 00 e8 06 d=
3 e1 ff 85 c0 89 c6 75 39 83 c4 0c 89 f0 5b 5e 5f 5d c3 8d b6 00 00 00 00 <=
0f> 0b b8 38 5b 2e 5e c7 04 24 00 00 00 00 31 c9 ba 01 00 00 00 be
> [  458.260864] EAX: 5e2e5b50 EBX: 5e1a8fe0 ECX: 00000000 EDX: 00000001
> [  458.260864] ESI: 00000000 EDI: 00000000 EBP: 4010defc ESP: 4010dee4
> [  458.260864] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210=
246
> [  458.260864] CR0: 80050033 CR2: 00000000 CR3: 1e43a000 CR4: 000006b0
> [  458.260864] Call Trace:
> [  458.260864]  ? phy_drivers_register+0x37/0x90
> [  458.260864]  ? phy_module_init+0x1b/0x1b
> [  458.260864]  ? phy_module_init+0x19/0x1b
> [  458.260864]  ? do_one_initcall+0xd9/0x24b

Hi Camelia

I think we need to extend your patch and print the name of the PHY
which is missing the features pointer. I don't see anything here which
allows me to determine which PHY caused the warning.

       Thanks
	Andrew

--===============8767301724826987721==--

