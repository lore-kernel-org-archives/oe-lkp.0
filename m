Content-Type: multipart/mixed; boundary="===============6270267337983239756=="
MIME-Version: 1.0
From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
To: lkp@lists.01.org
Subject: Re: [tty] 761ed4a945: BUG: unable to handle kernel NULL pointer dereference at 000000000000046c
Date: Fri, 09 Sep 2016 23:00:11 +0100
Message-ID: <20160909230011.6ccf02d3@lxorguk.ukuu.org.uk>
In-Reply-To: <CAL_Jsq+_8UpHoGCOtWFOQMmb0Vbew3e3ZXR=8sKpUesTdJh8aA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6270267337983239756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Sep 2016 11:40:47 -0500
Rob Herring <robh@kernel.org> wrote:

> On Wed, Sep 7, 2016 at 3:47 PM, Rob Herring <robh@kernel.org> wrote:
> > On Tue, Sep 6, 2016 at 1:33 AM, kernel test robot <xiaolong.ye@intel.=
com> wrote:  =

> >>
> >> FYI, we noticed the following commit:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ma=
ster
> >> commit 761ed4a94582ab291aa24dcbea4e01e8936488c8 ("tty: serial_core: co=
nvert uart_close to use tty_port_close")
> >>
> >> in testcase: boot
> >>
> >> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G=
  =

> >
> > Is the rootfs used in this test available to help me reproduce?  =

> =

> I reproduced this now. There's a couple of ways to fix this, so I'm
> looking for some advice. The problem is tty_port->ops.shutdown()
> doesn't get called for a port marked as a console. So interrupts can
> still fire and then uart_tx_stopped() called after tty_struct becomes
> NULL. I can add a NULL check in uart_tx_stopped to fix that. There are
> possibly other spots that need a similar fix. That's going to be
> needed anyway as I remove dependencies on tty_struct. The 2nd
> possibility is just not marking the tty_port as a console. That seems
> wrong, but is what we had before this change. A third option is move
> the console handling in tty_port_shutdown into the tty_port drivers.
> That seems the wrong direction too. Thoughts?

The uart layer handles console itself so I'd suggest the quick fix for
now. The other reason for that is that if we can open/close/write to a
tty port without a tty most of the existing magic crap for consoles goes
away because a console can just open and close the tty port directly.

Alan

--===============6270267337983239756==--

