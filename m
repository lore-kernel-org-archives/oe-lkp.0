Content-Type: multipart/mixed; boundary="===============0505901785205840079=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [waitid()] 75f64d68f9: Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=
Date: Sun, 21 May 2017 12:04:38 -0700
Message-ID: <CA+55aFzDP03pKyhFtpLE1jTJESP2usOPsu562aQ3jyY7aRFtGA@mail.gmail.com>
In-Reply-To: <20170521073405.GX390@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0505901785205840079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2017 at 12:34 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> -       __put_user_size((x), (ptr), sizeof(*(ptr)), __pu_err, -EFAULT);  =
       \
> +       __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), _=
_pu_err, -EFAULT);             \

Hmm. Looking more at this, the "unsafe_get_user()" case is wrong too -
for types larger than "long".

But I see you have a pull request pending, and I'll take this fix as-is.

I *think* the right thing to do is to just do

   register __inttype(*(ptr)) __val_gu;

for unsafe_get_user.

I think the error crept in because I copied the "get_user_ex()" code,
which has the same type confusion (ie it doesn't handle values larger
then long, so "long long" on x86-32 wouldn't work).

That type limitation was ok'ish simply because get_user_ex() was
x86-only and of very limited use (and clearly never saw the 64-bit
value on a 32-bit arch case).

But for unsafe_get_user() we obviously want to make it generic enough
and just be able to replace existing get_user() calls.

                  Linus

--===============0505901785205840079==--

