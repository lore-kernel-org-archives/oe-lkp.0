Content-Type: multipart/mixed; boundary="===============7255160390757575731=="
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: lkp@lists.01.org
Subject: Re: [tty] 761ed4a945: BUG: unable to handle kernel NULL pointer dereference at 000000000000046c
Date: Wed, 07 Sep 2016 15:47:53 -0500
Message-ID: <CAL_JsqKLvATxsOJzkk_bm8az8t8akmGpV=92buvMgFkbzCSBMw@mail.gmail.com>
In-Reply-To: <20160906063313.GF1687@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7255160390757575731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 6, 2016 at 1:33 AM, kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 761ed4a94582ab291aa24dcbea4e01e8936488c8 ("tty: serial_core: conve=
rt uart_close to use tty_port_close")
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G

Is the rootfs used in this test available to help me reproduce?

Rob

--===============7255160390757575731==--

