Content-Type: multipart/mixed; boundary="===============2321399400250934612=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [net] 34fad54c25: kernel BUG at include/linux/skbuff.h:1935!
Date: Tue, 22 Nov 2016 15:30:31 -0800
Message-ID: <CA+55aFycaFHqncv1TQLSxXiy9k8n7phe=OWAuv_mKEKAkVfNNQ@mail.gmail.com>
In-Reply-To: <CANn89i+B8F8thJRCdNPHA=BddTTxHCHz+xkvT_wuZ+b8osoTVQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2321399400250934612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 2:28 PM, Eric Dumazet <edumazet@google.com> wrote:
>
> This is fixed by :
> https://git.kernel.org/cgit/linux/kernel/git/davem/net.git/commit/?id=3Dc=
9b8af1330198ae241cd545e1f040019010d44d9

Thanks guys. This was one of the less esoteric-looking regressions, so
I'm happy to hear it's solved.

             Linus

--===============2321399400250934612==--

