Content-Type: multipart/mixed; boundary="===============3138692036683310485=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [Revert "ppdev] 1701f68040: genirq: Flags mismatch irq 4. 00000000 (serial) vs. 00000080 (goldfish_pdev_bus)
Date: Tue, 31 May 2016 18:51:09 +0800
Message-ID: <20160531105109.GA28289@wfg-t540p.sh.intel.com>
In-Reply-To: <20160531111155.5f909038@lxorguk.ukuu.orguk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3138692036683310485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Tue, May 31, 2016 at 11:11:55AM +0100, Alan wrote:
> On Sun, 29 May 2016 23:28:41 +0800
> kernel test robot <fengguang.wu@intel.com> wrote:
> =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad
> > commit is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> =

> No.. it just happens to look different. It's an ancient ancient clash
> between Goldfish and standard PC over IRQ4. Unfortunately Goldfish
> doesn't provide a sane detection mechanism.

Got it, I'll blacklist this error, thank you for the info!

Thanks,
Fengguang

--===============3138692036683310485==--

