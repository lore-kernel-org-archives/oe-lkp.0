Content-Type: multipart/mixed; boundary="===============7977524553950633702=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 34fad54c25: kernel BUG at include/linux/skbuff.h:1935!
Date: Tue, 22 Nov 2016 14:28:53 -0800
Message-ID: <CANn89i+B8F8thJRCdNPHA=BddTTxHCHz+xkvT_wuZ+b8osoTVQ@mail.gmail.com>
In-Reply-To: <CA+55aFxV7Bq583QOdYauuo2jY9EkAmgnceBukrN27ArjzFszYg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7977524553950633702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 2:04 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> David, Eric,
>
>  what's the situation on this issue? The bisection looks a bit odd,
> but the commit in question does end up changing the key_control->thoff
> value for the failure case, so maybe that in turn ends up screwing up
> a later skb_pull.
>
> I'm not seeing anything that might fix this in the last networking
> pull, but I may have missed something.
>
> I also noticed that the kernel test robot had screwed up the
> participants list for some reason, and had
>
>   "Acked-by: Alexander Duyck <alexander.h.duyck@intel.com>, David S.
> Miller" <davem@davemloft.net>
>
> as one of the participants. So there's some odd commit parsing issue
> there somewhere. But Alexander seems to have seen this report despite
> that, it just never went anywhere that I can tell.
>
>                 Linus
>

This is fixed by :
https://git.kernel.org/cgit/linux/kernel/git/davem/net.git/commit/?id=3Dc9b=
8af1330198ae241cd545e1f040019010d44d9

Thanks

--===============7977524553950633702==--

