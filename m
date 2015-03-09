Content-Type: multipart/mixed; boundary="===============1242142819240993662=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 09:12:48 -0700
Message-ID: <CA+55aFw05mSdtzDGBb12EHxZTpSa0LNy2LkkCnEo4N6M1D6aqw@mail.gmail.com>
In-Reply-To: <CAK1hOcNU+8BtCN2TR6ZBh3KTTJtFKdoTe36UfVb91AYxEmeqTg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1242142819240993662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2015 at 5:04 AM, Denys Vlasenko <vda.linux@googlemail.com>=
 wrote:
>
> IIRC task gates weren't used in Linux at first, and now they are
> only used for double fault handler -

Actually, historical note: the TSS was very much used for task
switching originally. Not only was it a "play with how 386 works" test
vehicle, we used pretty much every part of the task switching features
(ie all the ioperm bits etc).

I forget when it was then rewritten to just do everything by hand, but
task gates very much were used.

                       Linus

--===============1242142819240993662==--

