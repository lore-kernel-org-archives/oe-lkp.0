Content-Type: multipart/mixed; boundary="===============7972678649516780180=="
MIME-Version: 1.0
From: Richard Palethorpe <rpalethorpe@suse.de>
To: lkp@lists.01.org
Subject: Re: [LTP] [can] c4e54b063f: BUG:sleeping_function_called_from_invalid_context_at_kernel/workqueue.c
Date: Wed, 13 Jul 2022 09:23:28 +0100
Message-ID: <87v8s1l8a3.fsf@suse.de>
In-Reply-To: <CABGWkvqF9f4vOYUQeYuaDGT7yuB=8=h=yPpuG04VwicNP=wgMA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7972678649516780180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

> Hello,
>
> On Mon, Jul 11, 2022 at 10:05 AM Richard Palethorpe <rpalethorpe@suse.d=
e> wrote:
>>
>> Hello,
>>
>> kernel test robot <oliver.sang@intel.com> writes:
>>
>> > Greeting,
>> >
>> > FYI, we noticed the following commit (built with gcc-11):
>> >
>> > commit: c4e54b063f42f20a6b3ad1ffa61c574e631e0216 ("can: slcan: use CAN=
 network device driver API")
>> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
>> > master
>>
>> I guess the problem is this may sleep with soft irqs disabled.
>>
>> static int slc_close(struct net_device *dev)
>> {
>>         struct slcan *sl =3D netdev_priv(dev);
>>         int err;
>>
>>         spin_lock_bh(&sl->lock); <-- takes lock
>>         if (sl->tty) {
>>                 if (sl->can.bittiming.bitrate &&
>>                     sl->can.bittiming.bitrate !=3D CAN_BITRATE_UNKNOWN) {
>>                         spin_unlock_bh(&sl->lock);
>>                         err =3D slcan_transmit_cmd(sl, "C\r");
>>                         spin_lock_bh(&sl->lock);
>>                         if (err)
>>                                 netdev_warn(dev,
>>                                             "failed to send close comman=
d 'C\\r'\n");
>>                 }
>>
>>                 /* TTY discipline is running. */
>>                 clear_bit(TTY_DO_WRITE_WAKEUP, &sl->tty->flags);
>>         }
>>         netif_stop_queue(dev);
>>         close_candev(dev); <-- calls cancel_delayed_work_sync()
>>
>
> I would try (since I am unable to replicate the test) to move the
> spin_unlock_bh()
> before calling close_candev().

I haven't tried, but I think it should replicate every time with
lockdep/lock debugging enabled.

> Can the patch be sent now or do I have to wait until the code is in
> mainline?

IMO it *has* to be fixed before going into mainline :-p. I can't comment on
the correctness of the proposed fix though.

-- =

Thank you,
Richard.
--===============7972678649516780180==--

