Content-Type: multipart/mixed; boundary="===============0802333686345616134=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: d7be102f29 ("cfg80211: initialize regulatory keys/database later"): kernel BUG at crypto/asymmetric_keys/public_key.c:80!
Date: Mon, 27 Nov 2017 15:30:27 -0800
Message-ID: <CAGXu5jJGsqXda7qviDpdMEo1moJDMJ8UMhC8VZh6Mkg6bsW+_A@mail.gmail.com>
In-Reply-To: <23794.1511825150@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0802333686345616134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 3:25 PM, David Howells <dhowells@redhat.com> wrot=
e:
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
>> I'm not seeing why it would ever be ok to do BUG_ON() instead of just
>> returning an error, though.
>
> This function has a list of requisite parameters for the caller:
>
>         BUG_ON(!pkey);          <-- You need the public key to use,
>         BUG_ON(!sig);
>         BUG_ON(!sig->digest);   <-- the message digest to check
>         BUG_ON(!sig->s);        <-- and you need the signature.
>
> If you fail to obtain any one of these parameters, you can't use this fun=
ction
> and you should have errored out before calling this function.  It seems
> reasonable for the function to assume that you've provided them - they're=
 kind
> of essential to the operation.  If you want, I can just remove the checks
> entirely.  Many of the kernel's functions don't perform argument checking=
, but
> just assume you've done it right and will oops if you haven't.
>
> I could just return -EINVAL, yes, but I'm not sure that's really the right
> thing to do, at least not without printing an error message, since it's a
> kernel programming error not a userspace error or data error.

The preference even in these cases has been to keep things recoverable
unless there is a very good reason to immediately stop the kernel's
thread of execution. If all callers already check for return values,
replacing BUG_ON() with WARN() and returning -EINVAL would be best.

-Kees

-- =

Kees Cook
Pixel Security

--===============0802333686345616134==--

