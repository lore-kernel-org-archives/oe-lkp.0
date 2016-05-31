Content-Type: multipart/mixed; boundary="===============8107016172685604560=="
MIME-Version: 1.0
From: Alan <gnomes@lxorguk.ukuu.org.uk>
To: lkp@lists.01.org
Subject: Re: [Revert "ppdev] 1701f68040: genirq: Flags mismatch irq 4. 00000000 (serial) vs. 00000080 (goldfish_pdev_bus)
Date: Tue, 31 May 2016 11:11:55 +0100
Message-ID: <20160531111155.5f909038@lxorguk.ukuu.orguk>
In-Reply-To: <574b0aa9.uByHhFFKGUV1AySn%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8107016172685604560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 29 May 2016 23:28:41 +0800
kernel test robot <fengguang.wu@intel.com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad
> commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

No.. it just happens to look different. It's an ancient ancient clash
between Goldfish and standard PC over IRQ4. Unfortunately Goldfish
doesn't provide a sane detection mechanism.

Alan

--===============8107016172685604560==--

