Content-Type: multipart/mixed; boundary="===============3563520407416016783=="
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: lkp@lists.01.org
Subject: Re: [tty] 761ed4a945: BUG: unable to handle kernel NULL pointer dereference at 000000000000046c
Date: Fri, 09 Sep 2016 11:40:47 -0500
Message-ID: <CAL_Jsq+_8UpHoGCOtWFOQMmb0Vbew3e3ZXR=8sKpUesTdJh8aA@mail.gmail.com>
In-Reply-To: <CAL_JsqKLvATxsOJzkk_bm8az8t8akmGpV=92buvMgFkbzCSBMw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3563520407416016783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 7, 2016 at 3:47 PM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Sep 6, 2016 at 1:33 AM, kernel test robot <xiaolong.ye@intel.co=
m> wrote:
>>
>> FYI, we noticed the following commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>> commit 761ed4a94582ab291aa24dcbea4e01e8936488c8 ("tty: serial_core: conv=
ert uart_close to use tty_port_close")
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
>
> Is the rootfs used in this test available to help me reproduce?

I reproduced this now. There's a couple of ways to fix this, so I'm
looking for some advice. The problem is tty_port->ops.shutdown()
doesn't get called for a port marked as a console. So interrupts can
still fire and then uart_tx_stopped() called after tty_struct becomes
NULL. I can add a NULL check in uart_tx_stopped to fix that. There are
possibly other spots that need a similar fix. That's going to be
needed anyway as I remove dependencies on tty_struct. The 2nd
possibility is just not marking the tty_port as a console. That seems
wrong, but is what we had before this change. A third option is move
the console handling in tty_port_shutdown into the tty_port drivers.
That seems the wrong direction too. Thoughts?

Rob

--===============3563520407416016783==--

