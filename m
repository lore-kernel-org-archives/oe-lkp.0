Content-Type: multipart/mixed; boundary="===============2714934892758658373=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d7be102f29 ("cfg80211: initialize regulatory keys/database later"): kernel BUG at crypto/asymmetric_keys/public_key.c:80!
Date: Mon, 27 Nov 2017 15:31:52 -0800
Message-ID: <CA+55aFxPvLGcs0bfhhYiUe0F2Ur8Lstz889or2ZsGYPir1K0_A@mail.gmail.com>
In-Reply-To: <23794.1511825150@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2714934892758658373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 3:25 PM, David Howells <dhowells@redhat.com> wrot=
e:
>
> This function has a list of requisite parameters for the caller:

.. and so what?

When you call "free()", that has a requisite parameter: the data to
free. If you don't supply it, we should BUG_ON(), right?

No. Instead we do the sane thing and just do

        if (unlikely(ZERO_OR_NULL_PTR(x)))
                return;

and it's all good.

> If you fail to obtain any one of these parameters, you can't use this fun=
ction
> and you should have errored out before calling this function.

Again, what is the *advantage* of being a complete ass-wipe and saying
"f*ck you", when it's less code to just say "that didn't work"?

Because one of those BUG_ON's clearly did happen.

So exactly what is your excuse for killing the machine instead of just
saying "yeah, can't validate that"?

                  Linus

--===============2714934892758658373==--

